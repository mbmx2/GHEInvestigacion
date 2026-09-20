# language: es
# Quality Improvement (CQI)
@status:proposed
@type:acceptance
@domain:clinical_safety
Característica: Mejora Continua de Calidad (GHE Maternidad)
  Como director de calidad de la maternidad
  Quiero herramientas de mejora continua
  Para mejorar indicadores de salud materna year tras year

  # ─────────────────────────────────────────────────────────────
  # 1. CICLO PDCA
  # ─────────────────────────────────────────────────────────────

  Escenario: Ejecutar ciclo PDCA
    Dado que se identifica un problema
    Cuando se ejecuta ciclo PDCA
    Entonces:
      | Fase    | Actividades |
      | Plan    | Definir problema, causas raíz, objetivo, plan de acción |
      | Do      | Implementar plan a pequeña escala |
      | Study   | Evaluar resultados vs. objetivo |
      | Act     | Estandarizar si funciona, ajustar si no |

  # ─────────────────────────────────────────────────────────────
  # 2. ANÁLISIS DE PARETO
  # ─────────────────────────────────────────────────────────────

  Escenario: Análisis de Pareto de complicaciones
    Dado que se analizan complicaciones del trimestre
    Cuando se aplica Pareto (80/20)
    Entonces:
      | Categoría                  | Frecuencia | % acumulado |
      | Anemia                     | 35         | 35%         |
      | HTA gestacional            | 20         | 55%         |
      | Diabetes gestacional       | 15         | 70%         |
      | Infección urinaria         | 10         | 80%         |
      | Otras                      | 20         | 100%        |
    Y se enfoca en: "Las 4 primeras categorías = 80% de complicaciones"

  # ─────────────────────────────────────────────────────────────
  # 3. DIAGRAMA DE ISHIKAWA
  # ─────────────────────────────────────────────────────────────

  Escenario: Análisis de Ishikawa post-evento
    Dado que ocurrió un evento adverso
    Cuando se usa diagrama de Ishikawa
    Entonces se evalúa:
      | Categoría                  | Posibles causas |
      | Personal                   | Capacitación, fatiga, experiencia |
      | Proceso                     | Protocolo, flujo, tiempos |
      | Equipamiento               | Disponibilidad, mantenimiento |
      | Material                    | Medicamentos, insumos |
      | Entorno                     | Infraestructura, conectividad |
      | Medición                    | Monitoreo, alertas |

  # ─────────────────────────────────────────────────────────────
  # 4. GRÁFICAS DE CONTROL
  # ─────────────────────────────────────────────────────────────

  Escenario: Monitoreo con gráficas de control
    Dado que se monitorea indicador mensual
    Cuando se genera gráfica
    Entonces incluye:
      | Elemento                    |
      | Línea central (promedio)   |
      | Límites de control superior/inferior |
      | Datos por mes             |
      | Tendencia                  |
      | Puntos fuera de control   |

  Escenario: Detección de tendencia
    Dado que se analiza gráfica de control
    Cuando se detecta tendencia
    Entonces:
      | Señal                       | Acción |
      | 7 puntos consecutivos del mismo lado de la media | Investigar causa |
      | Punto fuera de control     | Investigar causa especial |
      | Tendencia ascendente       | Acción preventiva |
      | Tendencia descendente      | Mantener mejora |

  # ─────────────────────────────────────────────────────────────
  # 5. BENCHMARKING
  # ─────────────────────────────────────────────────────────────

  Escenario: Comparación con estándares
    Dado que se comparan indicadores con estándares
    Cuando se evalúa
    Entonces:
      | Indicador                  | GHE   | Estándar | Gap  |
      | % control prenatal        | 78%   | >80%     | -2%  |
      | Mortalidad materna        | 0     | <50/100K | ✅   |
      | Tasa de cesáreas          | 25%   | 15-20%   | +5%  |
      | Infección posparto        | 3%    | <5%      | ✅   |
      | Satisfacción paciente     | 85%   | >80%     | ✅   |

  # ─────────────────────────────────────────────────────────────
  # 6. ENCUESTA DE SATISFACCIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Encuesta de satisfacción del paciente
    Dado que se aplica encuesta de satisfacción
    Cuando se recogen respuestas
    Entonces incluye:
      | Pregunta                    | Escala |
      | ¿Cómo calificaría la atención recibida? | 1-5 |
      | ¿Le explicaron su tratamiento? | 1-5 |
      | ¿Se sintió escuchada?    | 1-5 |
      | ¿Recomendaría la maternidad? | 1-5 |
      | ¿Qué mejorarían?        | Texto libre |

  # ─────────────────────────────────────────────────────────────
  # 7. AUDITORÍA CLÍNICA
  # ─────────────────────────────────────────────────────────────

  Escenario: Auditoría de expedientes
    Dado que se realiza auditoría de expedientes
    Cuando se evalúa
    Entonces se verifica:
      | Criterio                   | Muestra |
      | Nota SOAP completa         | 10%     |
      | Firma del médico           | 10%     |
      | Diagnóstico con CIE-10     | 10%     |
      | Receta completa            | 10%     |
      | Consentimiento informado   | 10%     |
      | Seguimiento documentado    | 10%     |
