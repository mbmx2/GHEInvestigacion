# language: es
# @id GHE-AGENDA-DDD-001
# @type acceptance
# @domain agenda
# @layer development
# @risk s2
# @owner dev-lead
# @status review
# @requirement REQ-AGENDA-006
# @regulation N/A
@domain:agenda @type:acceptance @risk:s2 @status:review
Característica: Data-Driven Development para la Agenda
  Como desarrollador del proyecto GHE
  Quiero que la agenda se defina como estructuras de datos puras
  Para que los agentes de IA puedan procesar el estado de forma funcional

  Regla: La agenda es un mapa de datos que se transforma, no se muta

    Escenario: La agenda es inmutable
      Dado que la agenda tiene un estado
      Cuando se aplica una transformación
      Entonces el estado original se preserva
      Y se crea un nuevo estado con el cambio
      Y el estado anterior queda accesible
      # @evidence EVID-AGENDA-080: Estado original preservado + nuevo creado
      # @invariante INV-AGENDA-011

    Escenario: Transformación de la agenda preserva integridad
      Dado que la agenda tiene 10 citas
      Cuando se modifica una cita
      Entonces las otras 9 citas permanecen sin cambios
      Y la cita modificada tiene nuevo estado
      # @evidence EVID-AGENDA-081: Integridad verificada

  Regla: Cada campo de la agenda tiene una especificación

    Escenario: Validación de estructura de cita
      Dado que se valida una cita
      Cuando se verifica contra la especificación
      Entonces se confirma:
        | Campo                      | Requisito |
        | ID                         | UUID único |
        | Estado                     | Keyword válido |
        | Hora inicio                | Antes de hora fin |
        | Recursos asignados        | Existentes en catálogo |
        | Paciente                   | Registrado en sistema |
      # @evidence EVID-AGENDA-082: Validación contra especificación

    Escenario: Rechazo de dato inválido
      Dado que se intenta crear una cita con hora fin antes de hora inicio
      Cuando se valida
      Entonces la creación es rechazada
      Y se informa la causa del rechazo
      # @evidence EVID-AGENDA-083: Rechazo + causa documentada

  Regla: Las reglas de comportamiento del agente son datos modificables

    Escenario: Cambio de regla sin modificar motor
      Dado que se tiene una regla "agente sugiere alternativas"
      Cuando se cambia a "agente rechaza automáticamente"
      Entonces el cambio se aplica sin modificar el motor del agente
      Y el comportamiento nuevo se observa inmediatamente
      # @evidence EVID-AGENDA-084: Cambio de comportamiento sin modificar motor

    Escenario: Regla inválida es rechazada
      Dado que se intenta definir una regla con estados inválidos
      Cuando se valida
      Entonces la regla es rechazada
      Y se informa qué campo tiene el error
      # @evidence EVID-AGENDA-085: Regla rechazada + causa documentada
