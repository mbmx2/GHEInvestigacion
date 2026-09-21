# language: es
# @id GHE-FW-COMPLETENESS-001
# @type contract
# @domain framework
# @layer process
# @risk s1
# @owner qa-lead
# @status proposed
@domain:framework @type:contract @risk:s1 @status:proposed
Característica: Validación de Completitud de la Respuesta
  Como qa-lead del proyecto GHE
  Quiero que cada respuesta contenga las 12 secciones con contenido mínimo
  Para que ninguna sección quede vacía o genérica

  Contexto:
    Dado que el agente ha generado una respuesta
    Y que el template de respuesta tiene 12 secciones

  Escenario Outline: Verificar contenido mínimo por sección
    Dado que se evalúa la sección "<sección>"
    Entonces debe contener al menos <mínimo> de contenido sustantivo

    Ejemplos:
      | sección                      | mínimo                              |
      | 1. Diagnóstico              | Problema + causa raíz + evidencia  |
      | 2. Valor entregado         | Beneficio + riesgo + impacto       |
      | 3. PMBOK                   | Al menos 3 dominios evaluados      |
      | 4. SWEBOK                  | Al menos 3 áreas + 1 trazabilidad |
      | 5. SOLID                   | Los 5 principios evaluados         |
      | 6. Antipatrones            | Al menos 1 antipatrón identificado |
      | 7. Cambios realizados      | Al menos 1 archivo documentado    |
      | 8. Validación              | Comando + resultado             |
      | 9. Riesgos residuales     | Al menos 1 riesgo identificado |
      | 10. Decisión recomendada   | Estado + siguiente acción     |

  Escenario: Respuesta rechazada por incompleta
    Dado que una respuesta no tiene todas las secciones
    Cuando se valida
    Entonces el sistema:
      | Acción                          |
      | Identifica secciones faltantes |
      | Rechaza la respuesta        |
      | Solicita completar faltantes |
      | No aprueba hasta tener todo |

  Escenario: Respuesta rechazada por genérica
    Dado que una respuesta tiene secciones pero sin contenido sustantivo
    Cuando se evalúa profundidad
    Entonces el sistema:
      | Acción                          |
      | Detecta contenido genérico   |
      | Solicita especificidad      |
      | Pide evidencia concreta     |

  Escenario: Respuesta aprobada
    Dado que una respuesta tiene todas las secciones con contenido sustantivo
    Cuando se valida
    Entonces el sistema aprueba
    Y genera evidencia de aprobación
