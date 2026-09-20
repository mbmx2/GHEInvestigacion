# language: es
# SWEBOK KA-12: Software Engineering Economics
@status:proposed
@type:acceptance
@domain:general
# ÁREA DE CONOCIMIENTO: Economía de la Ingeniería de Software
Característica: Economía de la Ingeniería de Software (SWEBOK KA-12)
  Como responsable económico del proyecto GHE
  Quiero tomar decisiones económicas informadas
  Para maximizar valor con recursos limitados

  # ─────────────────────────────────────────────────────────────
  # 1. ANÁLISIS ECONÓMICO
  # ─────────────────────────────────────────────────────────────

  Escenario: Análisis costo-beneficio
    Dado que se evalúa una funcionalidad nueva
    Cuando se realiza análisis económico
    Entonces se documenta:
      | Concepto                   | Valor              |
      | Costo de implementación    | Horas estimadas    |
      | Costo de mantenimiento     | Horas anuales      |
      | Beneficio esperado         | Ahorro de tiempo / vidas salvadas |
      | ROI estimado               | Beneficio / Costo  |
      | Payback                    | Tiempo de recuperación |
    Y se compara con alternativas

  Escenario: Priorización por valor económico
    Dado que hay múltiples features candidatos
    Cuando se priorizan por valor
    Entonces se usa matriz:
      | Feature                    | Esfuerzo | Valor  | Prioridad |
      | Expediente clínico         | Alto     | Crítico| 1         |
      | Receta electrónica         | Medio    | Alto   | 2         |
      | Farmacia integrada         | Medio    | Alto   | 3         |
      | Reportes automáticos       | Bajo     | Medio  | 4         |
      | Interoperabilidad FHIR     | Alto     | Medio  | 5         |
      | IA diagnóstica             | Muy alto | Bajo   | 10        |

  # ─────────────────────────────────────────────────────────────
  # 2. GESTIÓN DE COSTOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Seguimiento de costos
    Dado que se trackean costos del proyecto
    Cuando se genera reporte
    Entonces se incluye:
      | Categoría                  | Presupuesto | Real   | Variación |
      | Desarrollo                 | 100 hrs     | 85 hrs | -15%      |
      | Testing                    | 40 hrs      | 45 hrs | +12.5%    |
      | Documentación              | 20 hrs      | 18 hrs | -10%      |
      | Despliegue                 | 10 hrs      | 8 hrs  | -20%      |
      | **Total**                  | **170 hrs** |**156 hrs**| **-8.2%** |

  Escenario: Análisis de valor de negocio
    Dado que se evalúa el valor de GHE
    Cuando se compara con alternativas
    Entonces se documenta:
      | Alternativa                | Costo anual  | Beneficio     |
      | Software comercial (SaludTotal)| $2,200 MXN/mes | Estándar |
      | Desarrollo propio (GHE)   | $0 (open source)| Adaptado |
      | Papel (sin software)      | $0           | Limitado      |
    Y GHE tiene mejor valor por:
      | Factor                      |
      | Adaptado al contexto rural  |
      | Offline-first               |
      | Sin costo de licencia       |
      | Cumple normativas           |

  # ─────────────────────────────────────────────────────────────
  # 3. RIESGO ECONÓMICO
  # ─────────────────────────────────────────────────────────────

  Escenario: Evaluación de riesgos económicos
    Dado que se identifican riesgos económicos
    Cuando se evalúan
    Entonces se documentan:
      | Riesgo                     | Probabilidad | Impacto | Mitigación |
      | Sobrecosto de desarrollo   | Media        | Alto    | Estimaciones conservadoras |
      | Cambio de requisitos       | Alta         | Alto    | Control de cambios |
      | Pérdida de key developer   | Baja         | Alto    | Documentación + code review |
      | Cambio normativo           | Media        | Medio   | Monitoreo regulatorio |
      | Rechazo del usuario        | Baja         | Alto    | Involucrar usuarios desde inicio |
    