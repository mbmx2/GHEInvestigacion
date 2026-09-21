# language: es
# @id GHE-AGENDA-DATA-001
# @type business-rule
# @domain agenda
# @layer domain
# @risk s2
# @owner architect
# @status proposed
# @requirement REQ-AGENDA-004
# @risk-control CTRL-AGENDA-004
# @regulation NOM-024
@domain:agenda @type:business-rule @risk:s2 @status:proposed
Característica: Modelo de Datos de la Agenda
  Como arquitecto del sistema
  Quiero que la agenda tenga estados, transiciones e invariantes definidos
  Para que el comportamiento sea predecible y seguro

  # ─────────────────────────────────────────────────────────────
  # REGLA 1: Toda cita tiene estados permitidos y transiciones definidas
  # ─────────────────────────────────────────────────────────────

  Regla: Una cita solo puede transitar por estados válidos

    Escenario: Transiciones válidas de estado
      Dado que una cita tiene estado "programada"
      Cuando ocurre un evento válido
      Entonces transita a un estado permitido:
        | Estado actual    | Evento               | Estado siguiente |
        | programada       | Confirmación         | confirmada       |
        | programada       | Cancelación          | cancelada        |
        | confirmada       | Inicio               | en_progreso      |
        | confirmada       | Cancelación          | cancelada        |
        | en_progreso      | Finalización         | completada       |
        | completada      | —                    | — (terminal)     |
        | cancelada       | —                    | — (terminal)     |

    Escenario: Transición prohibida
      Dado que una cita tiene estado "completada"
      Cuando se intenta cambiar a "programada"
      Entonces la transición es rechazada
      Y la cita permanece en "completada"
      Y se registra el intento inválido
      # @invariante "Una cita completada no puede volver atrás"

  # ─────────────────────────────────────────────────────────────
  # REGLA 2: La agenda como mapa de datos
  # ─────────────────────────────────────────────────────────────

  Regla: La agenda se representa como estructura de datos inmutable

    Escenario: Modificación de la agenda preserva historial
      Dado que la agenda tiene 5 citas para el martes
      Cuando se modifica la hora de una cita
      Entonces el mapa original se preserva como versión anterior
      Y se crea un nuevo mapa con el cambio
      Y el timestamp se actualiza
      # @invariante "La agenda nunca pierde información anterior"

  # ─────────────────────────────────────────────────────────────
  # REGLA 3: Los datos tienen invariantes que nunca deben romperse
  # ─────────────────────────────────────────────────────────────

  Regla: Una misma sala no puede tener dos procedimientos simultáneos

    Escenario: Se rechaza asignación incompatible
      Dado que la sala 1 está ocupada de 10:00 a 12:00
      Cuando se intenta asignar otra cirugía en ese intervalo
      Entonces la asignación es rechazada
      Y la cirugía original permanece sin cambios
      Y se informa el conflicto
      # @invariante "Una sala no puede tener dos procedimientos simultáneos"

  Regla: Un paciente no puede tener dos registros activos incompatibles

    Escenario: Se rechaza duplicidad de registro
      Dado que el paciente "Juan Pérez" tiene una cirugía activa
      Cuando se intenta crear otra cirugía para el mismo paciente en el mismo momento
      Entonces la creación es rechazada
      Y se informa que el paciente ya tiene un procedimiento activo

  Regla: Toda modificación preserva el estado anterior

    Escenario: Modificación deja rastro
      Dado que se modifica la hora de una cita
      Cuando se verifica el historial
      Entonces se puede ver:
        | Campo                      |
        | Estado anterior           |
        | Estado nuevo              |
        | Quién modificó            |
        | Cuándo modificó           |
        | Motivo del cambio         |
      # @invariante "Ninguna modificación elimina el estado anterior"

  # ─────────────────────────────────────────────────────────────
  # REGLA 4: Los datos offline se sincronizan al reconectar
  # ─────────────────────────────────────────────────────────────

  Regla: Los cambios locales se sincronizan cuando hay conectividad

    Escenario: Sincronización automática
      Dado que hay 3 cambios locales pendientes
      Cuando se recupera la conexión
      Entonces los cambios se sincronizan automáticamente
      Y se verifica integridad de cada cambio
      Y si hay conflicto se resuelve según protocolo
      # @evidence EVID-AGENDA-030

    Escenario: Conflicto entre cambios locales y cloud
      Dado que una cita fue modificada localmente y en cloud
      Cuando se sincroniza
      Entonces se detecta el conflicto
      Y se aplica resolución de conflicto (última escritura gana)
      Y ambas versiones se conservan para auditoría
      # @evidence EVID-AGENDA-031
