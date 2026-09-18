# language: es
# PMBOK KA-04: Project Cost Management
# ÁREA DE CONOCIMIENTO: Gestión de Costos del Proyecto
Característica: Gestión de Costos (PMBOK KA-04)
  Como director del proyecto GHE
  Quiero gestionar costos de forma efectiva
  Para mantener el proyecto dentro de presupuesto

  # ─────────────────────────────────────────────────────────────
  # 1. ESTIMACIÓN DE COSTOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Estimación de costos del proyecto
    Dado que se estiman costos totales del proyecto
    Cuando se elabora presupuesto
    Entonces se documenta:
      | Categoría                  | Costo estimado  |
      | Desarrollo de software     | 400 hrs × $500  |
      | Testing y QA               | 120 hrs × $500  |
      | Documentación              | 60 hrs × $400   |
      | Despliegue y capacitación  | 40 hrs × $400   |
      | Hardware (servidor local)  | $15,000 MXN     |
      | Certificación NOM-024      | $50,000 MXN     |
      | Certificación IEC 62304    | $80,000 MXN     |
      | **Total estimado**         | **$475,000 MXN**|

  Escenario: Presupuesto por fases
    Dado que se distribuye presupuesto por fase
    Cuando se planifica
    Entonces se muestra:
      | Fase                       | Presupuesto | % Total |
      | Inception                  | $25,000     | 5%      |
      | Elaboración                | $75,000     | 16%     |
      | Construcción               | $200,000    | 42%     |
      | Transición                 | $100,000    | 21%     |
      | Mantenimiento (1 año)      | $75,000     | 16%     |
      | **Total**                  | **$475,000**| **100%**|

  # ─────────────────────────────────────────────────────────────
  # 2. CONTROL DE COSTOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Seguimiento de costos reales
    Dado que se comparan costos planeados vs. reales
    Cuando se genera reporte mensual
    Entonces se incluye:
      | Categoría                  | Presupuesto | Real    | Varianza |
      | Desarrollo                 | $200,000    | $185,000| -$15,000 |
      | Testing                    | $60,000     | $65,000 | +$5,000  |
      | Documentación              | $24,000     | $22,000 | -$2,000  |
      | Hardware                   | $15,000     | $15,000 | $0       |
      | **Total**                  | **$299,000**|**$287,000**|**-$12,000**|
    Y se calcula CPI y SPI
    Y se proyecta EAC

  Escenario: Análisis de valor ganado
    Dado que se ejecuta análisis de valor ganado
    Cuando se evalúa al mes 6
    Entonces se muestra:
      | Métrica                    | Valor    |
      | PV (Valor Planeado)        | $250,000 |
      | EV (Valor Ganado)          | $235,000 |
      | AC (Costo Real)            | $240,000 |
      | SV (Schedule Variance)     | -$15,000 |
      | CV (Cost Variance)         | -$5,000  |
      | SPI                        | 0.94     |
      | CPI                        | 0.98     |
      | EAC                        | $484,694 |
      | VAC (Variance at Completion)| -$9,694 |
    Y se determina estado: "Ligero retraso, dentro de presupuesto"
  