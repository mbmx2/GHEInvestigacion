# language: es
# @id GHE-CODE-REVIEW-CHECKLIST-001
# @type compliance
# @domain development
# @layer development
# @risk s2
# @owner tech-lead
# @status proposed
# @requirement REQ-CODE-REVIEW
# @risk-control CTRL-CODE-REVIEW
# @regulation N/A
@domain:development @type:compliance @risk:s2 @status:proposed
Característica: Code Review con Checklist Específico
  Como tech lead del proyecto GHE
  Quiero un checklist de code review específico para software médico
  Para que cada revisión sea completa y estandarizada

  Regla: Todo PR tiene checklist de review

    Escenario: Checklist de review
      Dado que se revisa un PR
      Cuando se evalúa
      Entonces se verifica:
        | Categoría | Criterio |
        | Funcionalidad | Cumple requisitos, maneja edge cases |
        | Seguridad | Sin injection, sin XSS, sin secrets |
        | Tests | Cobertura >85%, tests pasan |
        | Documentación | Docstrings, changelog |
        | Estándares | Clojure coding standards |
        | Riesgo clínico | Sin impacto negativo en pacientes |

  Regla: Todo PR de componente de seguridad requiere review por security lead

    Escenario: Review de seguridad
      Dado que PR modifica componente de seguridad
      Cuando se revisa
      Entonces: review por security-lead, análisis de impacto, tests de regresión

  Regla: PR sin review no se mergea

    Escenario: Merge bloqueado
      Dado que PR no tiene review
      Cuando se intenta merge
      Entonces: merge rechazado

  Regla: Metrics de code review

    Escenario: Métricas de review
      Dado que se miden métricas
      Cuando se evalúa
      Entonces: tiempo promedio <1 día, tasa de aprobación >80%, comments/promedio 3-5
