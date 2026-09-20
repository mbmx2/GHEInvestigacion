# language: es
# Deuda Técnica - Métricas y Tracking
@status:proposed
@type:acceptance
@domain:general
# MÉTRICAS: Medir deuda técnica objetivamente
Característica: Métricas y Tracking de Deuda Técnica (GHE)
  Como tech lead del proyecto GHE
  Quiero medir deuda técnica con métricas objetivas
  Para tomar decisiones informadas sobre cuándo y dónde reducirla

  # ─────────────────────────────────────────────────────────────
  # 1. MÉTRICAS DE CÓDIGO
  # ─────────────────────────────────────────────────────────────

  Escenario: Métricas de complejidad
    Dado que se miden métricas de complejidad
    Cuando se ejecuta análisis
    Entonces:
      | Métrica                    | Objetivo     | Actual |
      | Complejidad ciclomática promedio | <5     | 4.2    |
      | Complejidad ciclomática máxima  | <15    | 8      |
      | Funciones >50 líneas       | 0            | 3      |
      | Clases >7 métodos          | 0            | 1      |
      | Profundidad de anidamiento | <4           | 3      |
      | Líneas de código por función | <30        | 22     |

  Escenario: Métricas de duplicación
    Dado que se miden métricas de duplicación
    Cuando se ejecuta análisis
    Entonces:
      | Métrica                    | Objetivo     | Actual |
      | Duplicación de código      | <3%          | 2.1%   |
      | Bloques duplicados >5 líneas | 0          | 2      |
      | Funciones similares        | <5%          | 3%     |

  Escenario: Métricas de cobertura
    Dado que se miden métricas de cobertura
    Cuando se ejecuta cloverage
    Entonces:
      | Métrica                    | Objetivo     | Actual |
      | Cobertura total            | >85%         | 92%    |
      | Cobertura de dominio       | >95%         | 96%    |
      | Cobertura de API           | >85%         | 88%    |
      | Cobertura de UI            | >70%         | 72%    |

  # ─────────────────────────────────────────────────────────────
  # 2. MÉTRICAS DE DEPENDENCIAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Métricas de dependencias
    Dado que se miden métricas de dependencias
    Cuando se ejecuta análisis
    Entonces:
      | Métrica                    | Objetivo     | Actual |
      | Dependencias desactualizadas| 0           | 2      |
      | Dependencias con CVE       | 0            | 0      |
      | Dependencias sin maintainer| 0            | 0      |
      | Edad promedio de dependencias | <1 año    | 8 meses|

  # ─────────────────────────────────────────────────────────────
  # 3. MÉTRICAS DE VELOCIDAD
  # ─────────────────────────────────────────────────────────────

  Escenario: Impacto de deuda en velocidad
    Dado que se mide impacto de deuda en velocidad
    Cuando se compara con equipo sin deuda
    Entonces:
      | Métrica                    | Con deuda   | Sin deuda |
      | Tiempo para nueva feature  | +20%        | Base      |
      | Tiempo para fix de bug     | +30%        | Base      |
      | Tiempo de code review      | +15%        | Base      |
      | Tiempo de onboarding       | +25%        | Base      |

  Escenario: Velocidad de desarrollo
    Dado que se mide velocidad de desarrollo
    Cuando se compara sprints
    Entonces:
      | Métrica                    | Objetivo     |
      | Velocity estable           | ±10%         |
      | Lead time feature          | <2 semanas   |
      | Cycle time                 | <3 días      |
      | Deployment frequency       | Semanal      |

  # ─────────────────────────────────────────────────────────────
  # 4. TRACKING EN BACKLOG
  # ─────────────────────────────────────────────────────────────

  Escenario: Registrar deuda como backlog item
    Dado que se registra deuda técnica en backlog
    Cuando se crea ticket
    Entonces incluye:
      | Campo                      |
      | Título descriptivo         |
      | Tipo de deuda              |
      | Severidad                  |
      | Archivos afectados         |
      | Impacto estimado           |
      | Esfuerzo estimado          |
      | Fecha de identificación    |
      | Identificado por           |

  Escenario: Dashboard de deuda técnica
    Dado que se consulta dashboard de deuda
    Cuando se genera
    Entonces muestra:
      | Métrica                    |
      | Total items de deuda       |
      | Por severidad (crítica/alta/media/baja) |
      | Por tipo (deliberada/inadvertida/bitácora) |
      | Tendencia (mejora/empeora) |
      | Items cerrados este mes   |
      | Items nuevos este mes     |
      | Deuda total estimada (horas)|
  