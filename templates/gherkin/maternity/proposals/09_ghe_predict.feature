# language: es
# Propuesta 9: GHE Predict - Suite de IA
Característica: Suite de Modelos Predictivos (GHE Maternidad)
  Como director médico
  Quiero acceder a modelos predictivos de alta precisión
  Para tomar decisiones clínicas informadas

  # ─────────────────────────────────────────────────────────────
  # 1. MODELO DE PREECLAMPSIA
  # ─────────────────────────────────────────────────────────────

  Escenario: Predicción de preeclampsia
    Dado que se evalúa paciente de 20 semanas
    Cuando se ejecuta modelo
    Entonces genera:
      | Campo                      | Valor              |
      | Score de riesgo            | 23%                |
      | Clasificación              | Alto               |
      | Factores contribuyentes    | IMC 33, primigesta, PA 128/82 |
      | Recomendación              | ASA 100mg + control semanal |
      | Confianza del modelo       | 87%                |

  # ─────────────────────────────────────────────────────────────
  # 2. MODELO DE PARTO PREMATURO
  # ─────────────────────────────────────────────────────────────

  Escenario: Predicción de parto prematuro
    Dado que se evalúa paciente de 24 semanas
    Cuando se ejecuta modelo
    Entonces genera:
      | Campo                      | Valor              |
      | Score de riesgo            | 12%                |
      | Clasificación              | Moderado           |
      | Factores                   | Cervix 28mm, 1 ITU |
      | Recomendación              | Control quincenal  |
      | Confianza                  | 82%                |

  # ─────────────────────────────────────────────────────────────
  # 3. MODELO DE DIABETES GESTACIONAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Predicción de diabetes gestacional
    Dado que se evalúa paciente de 20 semanas
    Cuando se ejecuta modelo
    Entonces genera:
      | Campo                      | Valor              |
      | Score de riesgo            | 35%                |
      | Clasificación              | Alto               |
      | Factores                   | IMC 31, madre DM    |
      | Recomendación              | Curva tolerancia 24 sem |
      | Confianza                  | 81%                |

  # ─────────────────────────────────────────────────────────────
  # 4. MODELO DE MACROSOMÍA
  # ─────────────────────────────────────────────────────────────

  Escenario: Predicción de macrosomía
    Dado que se evalúa paciente con DG
    Cuando se ejecuta modelo
    Entonces genera:
      | Campo                      | Valor              |
      | Score de riesgo            | 40%                |
      | Peso fetal estimado        | 4,200g             |
      | Recomendación              | Planificar parto   |
      | Confianza                  | 80%                |

  # ─────────────────────────────────────────────────────────────
  # 5. MODELO DE DEPRESIÓN POSPARTO
  # ─────────────────────────────────────────────────────────────

  Escenario: Predicción de depresión posparto
    Dado que se evalúa paciente posparto
    Cuando se ejecuta modelo
    Entonces genera:
      | Campo                      | Valor              |
      | Score de riesgo            | 45%                |
      | Factores                   | PHQ-9=8, sin apoyo |
      | Recomendación              | Sertralina + seguimiento |
      | Confianza                  | 76%                |

  # ─────────────────────────────────────────────────────────────
  # 6. MODELO DE IUGR
  # ─────────────────────────────────────────────────────────────

  Escenario: Predicción de IUGR
    Dado que se evalúa paciente de 32 semanas
    Cuando se ejecuta modelo
    Entonces genera:
      | Campo                      | Valor              |
      | Score de riesgo            | 30%                |
      | Factores                   | AU 26cm (esperada 34)|
      | Recomendación              | Ecografía + doppler|
      | Confianza                  | 83%                |

  # ─────────────────────────────────────────────────────────────
  # 7. DASHBOARD DE PREDICCIONES
  # ─────────────────────────────────────────────────────────────

  Escenario: Dashboard agregado de predicciones
    Dado que se consulta dashboard
    Cuando se genera
    Entonces incluye:
      | Modelo | Pacientes | Riesgo alto | Confirmados | AUC |
      | Preeclampsia | 120 | 28 | 22 | 0.87 |
      | Parto prematuro | 95 | 15 | 11 | 0.82 |
      | Diabetes | 110 | 25 | 19 | 0.81 |
      | Depresión | 80 | 18 | 12 | 0.76 |
