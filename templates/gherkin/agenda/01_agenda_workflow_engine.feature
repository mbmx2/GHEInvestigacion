# language: es
# @id GHE-AGENDA-WORKFLOW-001
# @type business-rule
# @domain agenda
# @layer operations
# @risk s1
# @owner medical-director
# @status review
# @requirement REQ-AGENDA-001
# @risk-control CTRL-AGENDA-001
# @regulation NOM-024
@domain:agenda @type:business-rule @risk:s1 @status:review
Característica: Gestión de la Agenda como Motor de Workflows
  Como director del hospital
  Quiero que cada evento médico detone automáticamente tareas administrativas
  Para que ningún paso se olvide en la atención al paciente

  # ─────────────────────────────────────────────────────────────
  # REGLA 1: Toda cirugía requiere verificación de recursos antes de confirmarse
  # ─────────────────────────────────────────────────────────────

  Regla: Una cirugía no puede confirmarse sin todos los recursos críticos

    Escenario: Confirmación exitosa con todos los recursos
      Dado que existe una cirugía programada de colecistectomía
      Y la cirugía tiene quirófano asignado (sala 1)
      Y la cirugía tiene personal asignado (cirujano, anestesiólogo, enfermera)
      Y todos los insumos críticos están disponibles
      Y existe preautorización de la aseguradora
      Cuando el personal autorizado confirma la cirugía
      Entonces la cirugía cambia a estado "confirmada"
      Y se registra quién realizó la confirmación
      Y se registra la fecha y hora de la decisión
      Y se notifica al paciente la confirmación
      # @evidence EVID-AGENDA-001: Cambio de estado + registro de auditoría + notificación

    Escenario: Confirmación rechazada por insumo faltante
      Dado que existe una cirugía programada
      Y falta el anestésico vial requerido
      Cuando el personal intenta confirmar la cirugía
      Entonces la cirugía permanece en estado "programada"
      Y se genera una alerta de insumo crítico
      Y no se notifica al paciente como cirugía confirmada
      Y se registra el motivo del rechazo
      # @evidence EVID-AGENDA-002: Sin cambio de estado + alerta + registro de rechazo

    Escenario: Confirmación rechazada por falta de quirófano
      Dado que la sala 1 está ocupada de 10:00 a 12:00
      Y se intenta confirmar otra cirugía en ese intervalo
      Cuando se verifica disponibilidad
      Entonces la asignación es rechazada
      Y la cirugía original permanece sin cambios
      Y se informa el conflicto de recursos
      # @evidence EVID-AGENDA-003: Sin cambio + conflicto documentado
      # @invariante INV-AGENDA-001

    Escenario: Intento de confirmación sin autorización
      Dado que una cirugía está programada
      Y el usuario no tiene permiso para confirmar cirugías
      Cuando intenta confirmar la cirugía
      Entonces la confirmación es rechazada
      Y la cirugía permanece en "programada"
      Y se registra el intento no autorizado
      # @evidence EVID-AGENDA-004: Rechazo + intento registrado

  # ─────────────────────────────────────────────────────────────
  # REGLA 2: Toda modificación de agenda debe ser auditable
  # ─────────────────────────────────────────────────────────────

  Regla: Cada cambio en la agenda genera registro de auditoría

    Escenario: Auditoría de confirmación
      Dado que se confirma una cirugía
      Cuando se registra la confirmación
      Entonces la auditoría incluye:
        | Campo                      |
        | Quién realizó la acción   |
        | Cuándo (timestamp)        |
        | Qué se modificó           |
        | Estado anterior           |
        | Estado posterior          |
        | Justificación si aplica   |
      # @evidence EVID-AGENDA-005: Registro completo de auditoría

    Escenario: Auditoría de cancelación
      Dado que se cancela una cita
      Cuando se registra la cancelación
      Entonces la auditoría incluye:
        | Campo                      |
        | Usuario que canceló       |
        | Motivo de cancelación     |
        | Recursos liberados        |
        | Pacientes notificados     |
      # @evidence EVID-AGENDA-006: Registro de cancelación con recursos liberados

    Escenario: Auditoría de consulta sin permisos
      Dado que un usuario accede a información sin permiso
      Cuando se detecta el acceso
      Entonces se registra:
        | Campo                      |
        | Usuario sin permisos      |
        | Información a la que intentó acceder |
        | Hora del intento          |
        | Resultado (denegado)      |
      # @evidence EVID-AGENDA-007: Intento denegado registrado

  # ─────────────────────────────────────────────────────────────
  # REGLA 3: La agenda es la fuente de verdad única
  # ─────────────────────────────────────────────────────────────

  Regla: Toda consulta al hospital debe responder desde la agenda

    Escenario: Múltiples áreas consultan la misma agenda
      Dado que hay una cirugía confirmada para mañana
      Cuando clínica, farmacia y facturación consultan
      Entonces todas ven el mismo estado de la cirugía
      Y no hay discrepancias entre áreas
      # @evidence EVID-AGENDA-008: Misma respuesta desde 3 áreas
      # @invariante INV-AGENDA-002

    Escenario: La agenda mantiene consistencia entre áreas
      Dado que farmacia registra dispensación de medicamento
      Cuando clínica consulta la misma cirugía
      Entonces ve la dispensación reflejada
      Y no hay datos contradictorios
      # @evidence EVID-AGENDA-009: Consistencia verificada entre áreas

  # ─────────────────────────────────────────────────────────────
  # REGLA 4: La agenda opera offline
  # ─────────────────────────────────────────────────────────────

  Regla: La agenda debe funcionar sin conectividad

    Escenario: Crear cita sin internet
      Dado que el sistema no tiene conexión a internet
      Cuando se crea una nueva cita
      Entonces la cita se guarda localmente
      Y se marca como "pendiente de sincronización"
      # @evidence EVID-AGENDA-010: Cita creada con estado pendiente_sync

    Escenario: Consultar agenda sin internet
      Dado que el sistema no tiene conexión
      Cuando se consulta la agenda del día
      Entonces se muestran las citas almacenadas localmente
      Y se indica si hay datos pendientes de sincronización
      # @evidence EVID-AGENDA-011: Agenda consultada, indicador de sync

    Escenario: Modificar cita sin internet
      Dado que no hay conexión y una cita está confirmada
      Cuando se modifica la hora de la cita
      Entonces el cambio se aplica localmente
      Y se marca como pendiente de sincronización
      # @evidence EVID-AGENDA-012: Cambio local + estado pendiente_sync

    Escenario: Sincronización exitosa tras reconexión
      Dado que hay 3 cambios locales pendientes
      Cuando se recupera la conexión
      Entonces los cambios se sincronizan automáticamente
      Y se verifica integridad de cada cambio
      # @evidence EVID-AGENDA-013: 3 cambios sincronizados + verificación

    Escenario: Conflicto durante sincronización
      Dado que una cita fue modificada localmente y en cloud
      Cuando se sincroniza
      Entonces se detecta el conflicto
      Y se aplica resolución de conflicto
      Y ambas versiones se conservan para auditoría
      # @evidence EVID-AGENDA-014: Conflicto detectado + ambas versiones preservadas

    Escenario: Fallo de sincronización
      Dado que la sincronización falla por timeout
      Cuando se detecta el fallo
      Entonces los cambios permanecen locales
      Y se reintenta automáticamente
      Y no se pierde ningún dato
      # @evidence EVID-AGENDA-015: Cambios preservados + reintento programado

    Escenario: Recuperación sin duplicación
      Dado que se sincronizó parcialmente y falló
      Cuando se reconecta
      Entonces solo se sincronizan los cambios pendientes
      Y no se duplican los ya sincronizados
      # @evidence EVID-AGENDA-016: Verificación de no duplicación

  # ─────────────────────────────────────────────────────────────
  # INVARIANTES
  # ─────────────────────────────────────────────────────────────

  # @invariante INV-AGENDA-001: Una sala no puede tener dos procedimientos simultáneos
  # @requirement REQ-AGENDA-001
  # @risk-control CTRL-AGENDA-001
  Escenario: Se rechaza asignación que rompe invariante de sala
    Dado que la sala 1 está ocupada de 10:00 a 12:00
    Cuando se intenta asignar otra cirugía en la sala 1 de 11:00 a 13:00
    Entonces la asignación es rechazada
    Y la cirugía original permanece sin cambios
    Y se informa el conflicto de sala
    # @evidence EVID-AGENDA-017: Rechazo + cirugía original intacta

  # @invariante INV-AGENDA-002: La agenda tiene una única versión de la verdad
  # @requirement REQ-AGENDA-001
  # @risk-control CTRL-AGENDA-001
  Escenario: Verificación de una sola fuente de verdad
    Dado que hay datos en la agenda
    Cuando múltiples usuarios acceden simultáneamente
    Entonces todos ven el mismo estado
    Y no hay discrepancias
    # @evidence EVID-AGENDA-018: Verificación de consistencia

  # @invariante INV-AGENDA-003: Ninguna modificación elimina el estado anterior
  # @requirement REQ-AGENDA-001
  # @risk-control CTRL-AGENDA-001
  Escenario: Verificación de preservación de historial
    Dado que una cita tiene 3 modificaciones previas
    Cuando se modifica la hora
    Entonces las 3 modificaciones previas permanecen accesibles
    Y se crea una cuarta entrada en el historial
    # @evidence EVID-AGENDA-019: Historial completo preservado
