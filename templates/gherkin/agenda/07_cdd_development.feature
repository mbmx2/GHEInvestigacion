# language: es
# @id GHE-AGENDA-CDD-001
# @type acceptance
# @domain agenda
# @layer development
# @risk s2
# @owner dev-lead
# @status proposed
# @requirement REQ-AGENDA-007
# @regulation N/A
@domain:agenda @type:acceptance @risk:s2 @status:proposed
Característica: Conversation-Driven Development para la Agenda
  Como desarrollador del proyecto GHE
  Quiero registrar y analizar conversaciones reales con la agenda
  Para mejorar el comportamiento de los agentes de IA

  # ─────────────────────────────────────────────────────────────
  # REGLA 1: Toda conversación con agente se registra
  # ─────────────────────────────────────────────────────────────

  Regla: Las interacciones con agentes quedan registradas

    Escenario: Registro de conversación con agente
      Dado que la recepcionista habla con el agente de agenda
      Cuando se procesa la interacción
      Entonces se registra:
        | Campo                      |
        | Input del usuario         |
        | Acción que intentó el agente |
        | Resultado                 |
        | Tiempo de respuesta       |
        | Datos sensibles filtrados |

  # ─────────────────────────────────────────────────────────────
  # REGLA 2: Las conversaciones fallidas generan aprendizaje
  # ─────────────────────────────────────────────────────────────

  Regla: Las fallas del agente se analizan para mejorar

    Escenario: Agente no procesa correctamente una solicitud
      Dado que el agente no pudo interpretar "reprograma todo el martes"
      Cuando se analiza la conversación
      Entonces se identifica:
        | Elemento                   |
        | Input que causó el fallo  |
        | Respuesta incorrecta      |
        | Causa probable del fallo  |
        | Mejora sugerida           |

  # ─────────────────────────────────────────────────────────────
  # REGLA 3: Las mejoras se prueban antes de implementarse
  # ─────────────────────────────────────────────────────────────

  Regla: Las mejoras de comportamiento se prueban con datos reales

    Escenario: Probar prompt mejorado
      Dado que se mejoró el prompt del agente
      Cuando se prueba con conversaciones anteriores
      Entonces se compara:
        | Métrica                    |
        | Tasa de éxito anterior    |
        | Tasa de éxito nueva       |
        | Errores que se resolvieron |
        | Nuevos errores introducidos |
    Y solo se aprueba la mejora si es superior

  # ─────────────────────────────────────────────────────────────
  # REGLA 4: Las conversaciones se protegen
  # ─────────────────────────────────────────────────────────────

  Regla: Las conversaciones no exponen datos sensibles

    Escenario: Registro de conversación filtra datos
      Dado que se registra una conversación con el agente
      Cuando se almacena
      Entonces los datos sensibles se filtran:
        | Dato                       | Tratamiento |
        | CURP                      | Ofuscada     |
        | Nombre del paciente       | Solo ID       |
        | Diagnósticos              | No incluidos  |
        | Medicamentos              | No incluidos  |
        | Contraseñas               | Nunca          |
