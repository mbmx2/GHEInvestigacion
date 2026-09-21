# language: es
# @id GHE-FW-TASK-001
# @type contract
# @domain framework
# @layer process
# @risk s2
# @owner tech-lead
# @status proposed
@domain:framework @type:contract @risk:s2 @status:proposed
Característica: Recepción y Estructuración de Tareas
  Como coordinator del sistema de agents
  Quiero recibir tareas estructuradas bajo un template estándar
  Para que cada interacción sea reproducible y trazable

  Contexto:
    Dado que el sistema de agents está activo
    Y que existen templates de gobernanza

  Escenario: Tarea con contexto completo
    Dado que el usuario envía una tarea
    Cuando la tarea incluye CONTEXTO, OBJETIVO, ALCANCE y BASE
    Entonces el sistema:
      | Acción                          |
      | Valida que todos los campos estén presentes |
      | Asigna ID único al cambio   |
      | Clasifica por dominio       |
      | Asigna owner según dominio |
      | Registra en cola de tareas  |
      | Notifica al agent asignado  |

  Escenario: Tarea con contexto incompleto
    Dado que el usuario envía una tarea
    Cuando falta algún campo obligatorio
    Entonces el sistema:
      | Acción                          |
      | Identifica campos faltantes  |
      | Solicita información adicional |
      | No procesa hasta tener todo |

  Escenario: Tarea con contradicciones
    Dado que el usuario envía una tarea
    Cuando hay contradicciones entre secciones
    Entonces el sistema:
      | Acción                          |
      | Señala las contradicciones  |
      | Pide resolución antes de procesar |
      | Documenta la contradicción |

  Escenario: Priorización de tareas
    Dado que hay múltiples tareas en cola
    Cuando se priorizan
    Entonces se usan criterios:
      | Criterio                    | Peso |
      | Riesgo clínico (s1)        | 40%  |
      | Riesgo de seguridad        | 30%  |
      | Impacto en usuarios        | 20%  |
      | Esfuerzo                   | 10%  |
