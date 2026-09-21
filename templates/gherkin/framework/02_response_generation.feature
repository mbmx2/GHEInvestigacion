# language: es
# @id GHE-FW-RESPONSE-001
# @type contract
# @domain framework
# @layer process
# @risk s1
# @owner tech-lead
# @status proposed
@domain:framework @type:contract @risk:s1 @status:proposed
Característica: Generación de Respuesta Estructurada
  Como coordinator del sistema de agents
  Quiero que cada respuesta siga las 12 secciones del framework
  Para que la documentación sea consistente y completa

  Contexto:
    Dado que se procesa una tarea
    Y que el agente ha analizado el problema

  Escenario: Respuesta completa con las 12 secciones
    Dado que el agente genera respuesta
    Cuando se verifica estructura
    Entonces la respuesta incluye:
      | Sección                     | Obligatoria |
      | 1. Diagnóstico            | Sí          |
      | 2. Valor entregado        | Sí          |
      | 3. PMBOK                  | Sí          |
      | 4. SWEBOK                 | Sí          |
      | 5. SOLID                  | Sí          |
      | 6. Antipatrones           | Sí          |
      | 7. Cambios realizados     | Sí          |
      | 8. Validación             | Sí          |
      | 9. Riesgos residuales     | Sí          |
      | 10. Decisión recomendada  | Sí          |

  Escenario: Respuesta con evidencia reproducible
    Dado que el agente completa respuesta
    Cuando se genera evidencia
    Entonces incluye:
      | Campo                      |
      | Archivos modificados       |
      | Comando de validación      |
      | Resultado del comando      |
      | Tests ejecutados           |
      | Cobertura de código        |

  Escenario: Respuesta con trazabilidad
    Dado que el agente genera respuesta
    Cuando se verifica trazabilidad
    Entonces incluye:
      | Relación                   |
      | Requisito → Diseño        |
      | Diseño → Código           |
      | Código → Test             |
      | Test → Evidencia          |

  Escenario: Respuesta que distingue hechos de inferencias
    Dado que el agente genera respuesta
    Cuando se verifica rigor
    Entonces cada afirmación está clasificada:
      | Tipo                       | Ejemplo |
      | Hecho                      | "El archivo X tiene Y líneas" |
      | Inferencia                | "Esto sugiere que..." |
      | Supuesto                   | "Asumiendo que..." |
      | Decisión pendiente         | "Requiere aprobación de..." |
