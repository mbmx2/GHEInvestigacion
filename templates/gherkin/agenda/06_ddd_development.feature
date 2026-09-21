# language: es
# @id GHE-AGENDA-DDD-001
# @type acceptance
# @domain agenda
# @layer development
# @risk s2
# @owner dev-lead
# @status proposed
# @requirement REQ-AGENDA-006
# @regulation N/A
@domain:agenda @type:acceptance @risk:s2 @status:proposed
Característica: Data-Driven Development para la Agenda
  Como desarrollador del proyecto GHE
  Quiero que la agenda se defina como estructuras de datos puras
  Para que los agentes de IA puedan procesar el estado de forma funcional

  # ─────────────────────────────────────────────────────────────
  # REGLA 1: La agenda se representa como datos inmutables
  # ─────────────────────────────────────────────────────────────

  Regla: La agenda es un mapa de datos que se transforma, no se muta

    Escenario: La agenda es inmutable
      Dado que la agenda tiene un estado
      Cuando se aplica una transformación
      Entonces el estado original se preserva
      Y se crea un nuevo estado con el cambio
      Y el estado anterior queda accesible
      # @invariante "El estado anterior de la agenda nunca se pierde"

  # ─────────────────────────────────────────────────────────────
  # REGLA 2: Los datos se validan con especificaciones formales
  # ─────────────────────────────────────────────────────────────

  Regla: Cada campo de la agenda tiene una especificación

    Escenario: Validación de estructura de cita
      Dado que se valida una cita
      Cuando se verifica contra la especificación
      Entonces se confirma:
        | Campo                      | Requisito |
        | ID                         | UUID único |
        | Estado                     | Keyword válido del conjunto permitido |
        | Hora inicio                | Antes de hora fin |
        | Recursos asignados        |-existentes en el catálogo |
        | Paciente                   | Registrado en el sistema |

    Escenario: Rechazo de dato inválido
      Dado que se intenta crear una cita con hora fin anterior a hora inicio
      Cuando se valida
      Entonces la creación es rechazada
      Y se informa: "La hora de fin debe ser posterior a la hora de inicio"

  # ─────────────────────────────────────────────────────────────
  # REGLA 3: El comportamiento del agente se define como datos
  # ─────────────────────────────────────────────────────────────

  Regla: Las reglas de comportamiento del agente son datos, no código

    Escenario: Regla de comportamiento modificable
      Dado que se tiene una regla "agente sugiere alternativas ante conflicto"
      Cuando se cambia la regla a "agente rechaza automáticamente conflictos"
      Entonces el cambio se aplica sin modificar el motor del agente
      Y el comportamiento nuevo se observa inmediatamente
