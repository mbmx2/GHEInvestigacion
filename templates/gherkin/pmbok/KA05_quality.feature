# language: es
# PMBOK KA-05: Project Quality Management
@status:proposed
@type:acceptance
@domain:general
# ÁREA DE CONOCIMIENTO: Gestión de Calidad del Proyecto
Característica: Gestión de Calidad (PMBOK KA-05)
  Como director del proyecto GHE
  Quiero garantizar calidad en cada entregable
  Para cumplir estándares de software médico

  # ─────────────────────────────────────────────────────────────
  # 1. PLANIFICACIÓN DE CALIDAD
  # ─────────────────────────────────────────────────────────────

  Escenario: Definición de estándares de calidad
    Dado que se definen estándares de calidad para GHE
    Cuando se documenta
    Entonces se establecen:
      | Estándar                    | Aplicación           |
      | IEC 62304                  | Lifecycle software médico |
      | ISO 25010                  | Modelo de calidad    |
      | NOM-004                    | Expediente clínico   |
      | NOM-024                    | Sistemas información |
      | ISO 14971                  | Gestión de riesgos   |
      | OWASP                      | Seguridad            |
      | SWEBOK                     | Ingeniería software  |
    Y cada estándar tiene verificación específica

  Escenario: Plan de aseguramiento de calidad (QA)
    Dado que se define plan de QA
    Cuando se documenta
    Entonces incluye:
      | Actividad                  | Frecuencia          |
      | Revisiones de código       | Continua (PR)       |
      | Revisiones de diseño       | Por sprint          |
      | Auditorías de proceso      | Trimestral          |
      | Análisis estático          | En cada commit      |
      | Métricas de calidad        | Semanal             |
      | Evaluación de riesgos      | Por release         |
      | Pruebas de seguridad       | Mensual             |

  # ─────────────────────────────────────────────────────────────
  # 2. CONTROL DE CALIDAD
  # ─────────────────────────────────────────────────────────────

  Escenario: Revisiones de calidad por entregable
    Dado que se completa un entregable
    Cuando se realiza review de calidad
    Entonces se verifica:
      | Criterio                   | Estado    |
      | Cumple requisitos          | ✅/❌     |
      | Cumple estándares de código| ✅/❌     |
      | Tiene tests asociados     | ✅/❌     |
      | Documentación actualizada| ✅/❌     |
      | Code review completado    | ✅/❌     |
      | Sin defectos críticos     | ✅/❌     |

  Escenario: Métricas de calidad del proyecto
    Dado que se miden métricas de calidad
    Cuando se genera dashboard
    Entonces se incluyen:
      | Métrica                    | Objetivo     | Actual |
      | Densidad de defectos       | <0.5/KLOC    | 0.3    |
      | Cobertura de tests         | >85%         | 92%    |
      | Tasa de rechazo en review  | <10%         | 8%     |
      | Satisfacción del usuario   | >85%         | 90%    |
      | Cumplimiento de cronograma| >90%         | 88%    |
      | Cumplimiento de presupuesto| >95%         | 97%    |
  