# language: es
# @id GHE-AGENDA-WORKFLOW-001
# @type business-rule
# @domain agenda
# @layer operations
# @risk s1
# @owner medical-director
# @status proposed
# @requirement REQ-AGENDA-001
# @risk-control CTRL-AGENDA-001
# @regulation NOM-024
@domain:agenda @type:business-rule @risk:s1 @status:proposed
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
      Y todos los insumos críticos están disponibles (anestésico, kit quirúrgico)
      Y existe preautorización de la aseguradora
      Cuando el personal autorizado confirma la cirugía
      Entonces la cirugía cambia a estado "confirmada"
      Y se registra quién realizó la confirmación
      Y se registra la fecha y hora de la decisión
      Y se notifica al paciente la confirmación
      Y se liberan los recursos como "comprometidos"
      # @evidence EVID-AGENDA-001

    Escenario: Confirmación rechazada por insumo faltante
      Dado que existe una cirugía programada
      Y falta el anestésico vial requerido
      Cuando el personal intenta confirmar la cirugía
      Entonces la cirugía permanece en estado "pendiente"
      Y se genera una alerta de insumo crítico
      Y no se notifica al paciente como cirugía confirmada
      Y se registra el motivo del rechazo
      # @evidence EVID-AGENDA-002

    Escenario: Confirmación rechazada por falta de quirófano
      Dado que la sala 1 está ocupada de 10:00 a 12:00
      Y se intenta confirmar otra cirugía en ese intervalo
      Cuando se verifica disponibilidad
      Entonces la asignación es rechazada
      Y la cirugía original permanece sin cambios
      Y se informa el conflicto de recursos
      # @evidence EVID-AGENDA-003

    Escenario: Intento de confirmación sin autorización
      Dado que una cirugía está programada
      Y el usuario no tiene permiso para confirmar cirugías
      Cuando intenta confirmar la cirugía
      Entonces la confirmación es rechazada
      Y la cirugía permanece en "pendiente"
      Y se registra el intento no autorizado
      # @evidence EVID-AGENDA-004

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

    Escenario: Auditoría de cancelación
      Dado que se cancela una cita
      Cuando se registra la cancelación
      Entonces la auditoría incluye:
        | Campo                      |
        | Usuario que canceló       |
        | Motivo de cancelación     |
        | Recursos liberados        |
        | Pacientes notificados     |

  # ─────────────────────────────────────────────────────────────
  # REGLA 3: La agenda es la fuente de verdad única
  # ─────────────────────────────────────────────────────────────

  Regla: Toda consulta al hospital debe responder desde la agenda

    Escenario: Múltiples áreas consultan la misma agenda
      Dado que hay una cirugía confirmada para mañana
      Cuando clínica, farmacia, cirugía, lab y facturación consultan
      Entonces todas ven el mismo estado de la cirugía
      Y no hay discrepancias entre áreas
      # @invariante "La agenda tiene una única versión de la verdad"

  # ─────────────────────────────────────────────────────────────
  # REGLA 4: La agenda opera offline
  # ─────────────────────────────────────────────────────────────

  Regla: La agenda debe funcionar sin conectividad

    Escenario: Crear cita sin internet
      Dado que el sistema no tiene conexión a internet
      Cuando se crea una nueva cita
      Entonces la cita se guarda localmente
      Y se marca como "pendiente de sincronización"
      Y cuando se recupera conexión se sincroniza automáticamente

    Escenario: Consultar agenda sin internet
      Dado que el sistema no tiene conexión
      Cuando se consulta la agenda del día
      Entonces se muestran las citas almacenadas localmente
      Y se indica si hay datos pendientes de sync

    Escenario: Modificar cita sin internet
      Dado que no hay conexión y una cita está confirmada
      Cuando se modifica la hora de la cita
      Entonces el cambio se aplica localmente
      Y se registra como pendiente de sincronización
      Y si hay conflicto con cloud al reconectar, se resuelve
