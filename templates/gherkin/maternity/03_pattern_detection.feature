# language: es
# FASE 3: Detección de Patrones Poblacionales - Módulo Maternidad
Característica: Detección de Patrones (GHE Maternidad)
  Como director médico de la maternidad
  Quiero que el sistema detecte patrones poblacionales
  Para tomar decisiones informadas sobre salud pública

  # ─────────────────────────────────────────────────────────────
  # 1. CLUSTERS
  # ─────────────────────────────────────────────────────────────

  Escenario: Detectar cluster de anemia
    Dado que el sistema analiza datos de todas las pacientes del trimestre
    Cuando detecta que >60% tienen Hb <11
    Entonces genera alerta:
      | Tipo: Cluster de anemia |
      | Pacientes afectadas: 18 de 28 (64%) |
      | Zona predominante: Centro |
      | Acción sugerida: Revisar suplementación de hierro en la comunidad |
      | Prioridad: Media |

  Escenario: Detectar cluster de hipertensión
    Dado que el sistema analiza tendencias de PA
    Cuando detecta incremento sostenido en población
    Entonces genera alerta:
      | Tipo: Tendencia ascendente de PA |
      | Mes anterior: 15% con PA >130 |
      | Mes actual: 35% con PA >130 |
      | Acción sugerida: Investigar causa (estrés, dieta, contaminación) |

  # ─────────────────────────────────────────────────────────────
  # 2. TENDENCIAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Detectar tendencia de partos prematuros
    Dado que el sistema compara partos prematuros por mes
    Cuando detecta incremento significativo
    Entonces genera alerta:
      | Tipo: Incremento de partos prematuros |
      | Mes anterior: 2 partos prematuros |
      | Mes actual: 6 partos prematuros |
      | Acción sugerida: Investigar infecciones,nutrición,estrés |

  # ─────────────────────────────────────────────────────────────
  # 3. CORRELACIONES
  # ─────────────────────────────────────────────────────────────

  Escenario: Detectar correlación hierro-anemia
    Dado que el sistema analiza correlaciones
    Cuando encuentra que pacientes sin suplemento de hierro tienen 3x más anemia
    Entonces genera alerta:
      | Tipo: Correlación detectada |
      | Correlación: Sin hierro → 3x más anemia |
      | Acción sugerida: Reforzar suplementación |

  # ─────────────────────────────────────────────────────────────
  # 4. ANOMALÍAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Detectar valor anómalo individual
    Dado que el sistema monitorea cada paciente
    Cuando detecta Hb 6.0 g/dL sin síntomas previos
    Entonces genera alerta:
      | Tipo: Anomalía individual |
      | Paciente: María García |
      | Hallazgo: Hb 6.0 sin tratamiento previo |
      | Acción: Notificar al médico inmediatamente |

  # ─────────────────────────────────────────────────────────────
  # 5. DASHBOARD POBLACIONAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Dashboard de indicadores obstétricos
    Dado que el administrador consulta dashboard
    Cuando se genera
    Entonces incluye:
      | Indicador                    | Período actual | Período anterior | Tendencia |
      | Total de controles prenatales | 45            | 38               | ↑         |
      | % control prenatal adecuado  | 78%           | 72%              | ↑         |
      | % anemia detectada           | 35%           | 42%              | ↓ (mejor) |
      | % hipertensión gestacional   | 12%           | 8%               | ↑         |
      | % diabetes gestacional       | 8%            | 7%               | →         |
      | Partos prematuros            | 3             | 2                | ↑         |
      | Cesáreas                     | 4             | 3                | →         |
