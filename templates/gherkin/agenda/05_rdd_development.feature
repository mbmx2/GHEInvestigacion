# language: es
# @id GHE-AGENDA-RDD-001
# @type contract
# @domain agenda
# @layer development
# @risk s2
# @owner dev-lead
# @status proposed
@domain:agenda @type:contract @risk:s2 @status:proposed
Característica: REPL-Driven Development para la Agenda
  Como desarrollador Clojure del proyecto GHE
  Quiero iterar sobre la lógica de la agenda en el REPL
  Para probar comportamientos de agentes sin reiniciar el sistema

  Contexto:
    Dado que Clojure tiene REPL nativo
    Y que la agenda es un mapa de datos inmutable

  Escenario: Probar comportamiento de agente en REPL
    Dado que se tiene estado actual de la agenda en el REPL
    Cuando se escribe función para optimizar huecos
    Entonces se puede evaluar:
      | Paso                       |
      | 1. Cargar estado actual    |
      | 2. Escribir función        |
      | 3. Evaluar con eval        |
      | 4. Ver resultado inmediato |
      | 5. Modificar y re-evaluar  |
    Y no se necesita reiniciar el servidor

  Escenario: Simular escenario completo en REPL
    Dado que se simula un día completo de agenda
    Cuando se ejecuta en REPL
    Entonces se puede:
      | Acción                    |
      | Cargar agenda del día     |
      | Simular llegada de paciente|
      | Evaluar respuesta del agente |
      | Verificar cascada de tareas |
      | Modificar escenario       |
      | Re-evaluar                |

  Escenario: Probar edge cases en REPL
    Dado que se quiere probar qué pasa si dos cirugías se solapan
    Cuando se crea escenario en REPL
    Entonces se verifica:
      | Verificación              |
      | Detección del solapamiento |
      | Alerta generada           |
      | Sugerencia de resolución  |
      | Sin corrupción de datos   |

  Escenario: Probar integración con LLM en REPL
    Dado que se tiene un agente que llama a un LLM
    Cuando se prueba en REPL
    Entonces se puede:
      | Acción                    |
      | Llamar al LLM con prompt  |
      | Ver respuesta cruda       |
      | Modificar prompt          |
      | Re-evaluar                |
      | Sin reiniciar el sistema  |
