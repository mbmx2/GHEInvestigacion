# language: es
# Deuda Técnica - Reporting
@status:proposed
@type:acceptance
@domain:general
# REPORTING: Comunicar estado de deuda técnica a stakeholders
Característica: Reporting de Deuda Técnica (GHE)
  Como tech lead del proyecto GHE
  Quiero reportar estado de deuda técnica de forma clara
  Para que stakeholders tomen decisiones informadas

  # ─────────────────────────────────────────────────────────────
  # 1. REPORTES
  # ─────────────────────────────────────────────────────────────

  Escenario: Reporte semanal de deuda
    Dado que se genera reporte semanal
    Cuando se consulta
    Entonces incluye:
      | Sección                     |
      | Resumen ejecutivo           |
      | Deuda nueva identificada    |
      | Deuda reducida este semana  |
      | Deuda total pendiente       |
      | Tendencia (mejora/empeora)  |
      | Top 5 items más críticos    |
      | Acciones para próxima semana|

  Escenario: Reporte mensual para dirección
    Dado que se genera reporte mensual
    Cuando se presenta a dirección
    Entonces incluye:
      | Sección                     |
      | Dashboard visual            |
      | Impacto en velocidad        |
      | Costo estimado de deuda     |
      | ROI de reducción            |
      | Comparativa con meses anteriores |
      | Recomendaciones             |

  Escenario: Dashboard visual
    Dado que se muestra dashboard de deuda
    Cuando se consulta
    Entonces ve:
      | Métrica                    | Visualización        |
      | Total de items             | Número grande        |
      | Por severidad              | Gráfica de barras    |
      | Por tipo                   | Gráfica de pastel    |
      | Tendencia (12 meses)       | Gráfica de líneas    |
      | Cobertura de código        | Gauge                |
      | Complejidad promedio       | Gauge                |

  # ─────────────────────────────────────────────────────────────
  # 2. MÉTRICAS CLAVE PARA STAKEHOLDERS
  # ─────────────────────────────────────────────────────────────

  Escenario: Métricas de negocio
    Dado que se miden métricas de negocio
    Cuando se reporta
    Entonces:
      | Métrica                    | Impacto negocio      |
      | Deuda técnica total (horas)| Costo potencial      |
      | Impacto en velocidad       | Retraso de features  |
      | Riesgo de seguridad        | Riesgo regulatorio   |
      | Calidad del código         | Mantenibilidad       |

  Escenario: ROI de reducción de deuda
    Dado que se calcula ROI
    Cuando se reduce deuda
    Entonces:
      | Métrica                    | Cálculo              |
      | Horas ahorradas por mes    | Antes - Después      |
      | Costo de reducción         | Horas × costo/hora   |
      | Beneficio acumulado        | Ahorros × meses      |
      | ROI                        | Beneficio / Costo    |

  # ─────────────────────────────────────────────────────────────
  # 3. COMUNICACIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Comunicar deuda crítica
    Dado que se identifica deuda crítica
    Cuando se notifica
    Entonces:
      | Canal                      | Audiencia            |
      | Reunión inmediata          | Tech lead + devs     |
      | Ticket urgente             | Equipo técnico       |
      | Email a dirección          | Stakeholders         |
      | Actualización de roadmap   | Todos                |

  Escenario: Comunicar progreso de reducción
    Dado que se reduce deuda técnica
    Cuando se completa reducción
    Entonces:
      | Acción                      |
      | Actualizar dashboard        |
      | Documentar en changelog     |
      | Notificar en retrospectiva  |
      | Actualizar métricas         |
      | Celebrar con equipo         |
  