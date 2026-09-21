# language: es
# @id GHE-AGENDA-DATA-001
# @type business-rule
# @domain agenda
# @layer domain
# @risk s2
# @owner architect
# @status review
# @requirement REQ-AGENDA-004
# @risk-control CTRL-AGENDA-004
# @regulation NOM-024
@domain:agenda @type:business-rule @risk:s2 @status:review
Característica: Modelo de Datos de la Agenda con Estados e Invariantes
  Como arquitecto del sistema
  Quiero que la agenda tenga estados, transiciones e invariantes definidos
  Para que el comportamiento sea predecible y seguro

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
      # @evidence EVID-AGENDA-020: Transiciones documentadas

    Escenario: Transición prohibida
      Dado que una cita tiene estado "completada"
      Cuando se intenta cambiar a "programada"
      Entonces la transición es rechazada
      Y la cita permanece en "completada"
      Y se registra el intento inválido
      # @evidence EVID-AGENDA-021: Rechazo + intento registrado

  Regla: La agenda se representa como estructura de datos inmutable

    Escenario: Modificación preserva historial
      Dado que la agenda tiene 5 citas para el martes
      Cuando se modifica la hora de una cita
      Entonces el estado anterior se preserva
      Y se crea un nuevo estado con el cambio
      Y el timestamp se actualiza
      # @evidence EVID-AGENDA-022: Estado anterior accesible + nuevo estado creado

  Regla: La agenda tiene invariantes que nunca deben romperse

    Escenario: Una sala no puede tener dos procedimientos simultáneos
      Dado que la sala 1 está ocupada de 10:00 a 12:00
      Cuando se intenta asignar otra cirugía en ese intervalo
      Entonces la asignación es rechazada
      Y la cirugía original permanece sin cambios
      # @evidence EVID-AGENDA-023: Rechazo + cirugía original intacta
      # @invariante INV-AGENDA-004

    Escenario: Un paciente no puede tener dos registros incompatibles
      Dado que el paciente "Juan Pérez" tiene una cirugía activa
      Cuando se intenta crear otra cirugía para el mismo paciente en el mismo momento
      Entonces la creación es rechazada
      Y se informa que el paciente ya tiene un procedimiento activo
      # @evidence EVID-AGENDA-024: Rechazo + información al usuario
      # @invariante INV-AGENDA-005

    Escenario: Toda modificación preserva estado anterior
      Dado que se modifica la hora de una cita
      Cuando se verifica el historial
      Entonces se puede ver:
        | Campo                      |
        | Estado anterior           |
        | Estado nuevo              |
        | Quién modificó            |
        | Cuándo modificó           |
        | Motivo del cambio         |
      # @evidence EVID-AGENDA-025: Historial completo visible
      # @invariante INV-AGENDA-006

  Regla: Los datos offline se sincronizan al reconectar

    Escenario: Sincronización automática
      Dado que hay 3 cambios locales pendientes
      Cuando se recupera la conexión
      Entonces los cambios se sincronizan automáticamente
      Y se verifica integridad de cada cambio
      # @evidence EVID-AGENDA-026: 3 cambios sincronizados

    Escenario: Conflicto entre cambios locales y cloud
      Dado que una cita fue modificada localmente y en cloud
      Cuando se sincroniza
      Entonces se detecta el conflicto
      Y se aplica resolución (última escritura gana)
      Y ambas versiones se conservan para auditoría
      # @evidence EVID-AGENDA-027: Conflicto detectado + ambas versiones

  Regla: Los estados de la agenda sonYPREDECIBLES

  Esquema del escenario: Transiciones de estado válidas
    Dado que una cita tiene estado "<estado_actual>"
    Y ocurre el evento "<evento>"
    Entonces el estado resultante es "<estado_resultado>"

    Ejemplos:
      | estado_actual | evento          | estado_resultado |
      | programada    | Confirmación    | confirmada       |
      | programada    | Cancelación     | cancelada        |
      | confirmada     | Inicio          | en_progreso      |
      | confirmada     | Cancelación     | cancelada        |
      | en_progreso    | Finalización    | completada       |
      | programada    | Recurso faltante | programada (sin cambio) |
      | completada     | Cualquier cosa  | completada (sin cambio) |
