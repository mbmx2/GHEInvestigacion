# language: es
# FASE 4: Predicción de Complicaciones - Módulo Maternidad
Característica: Predicción de Riesgo Obstétrico (GHE Maternidad)
  Como médico del proyecto GHE
  Quiero que el sistema prediga complicaciones antes de que ocurran
  Para intervenir preventivamente y salvar vidas

  # ─────────────────────────────────────────────────────────────
  # 1. PREDICCIÓN DE PREECLAMPSIA
  # ─────────────────────────────────────────────────────────────

  Escenario: Calcular riesgo de preeclampsia
    Dado que se evalúa paciente de 28 semanas
    Cuando se calcula score de riesgo
    Entonces el sistema usa factores:
      | Factor                      | Valor de la paciente | Contribución |
      | Edad                        | 32 años             | Baja         |
      | Primigesta                  | Sí                  | Media        |
      | IMC >30                     | Sí (IMC 33)         | Alta         |
      | PA basal                    | 128/82              | Media        |
      | Historia familiar preeclampsia | No               | Baja         |
      | Proteinuria                 | Negativa            | Baja         |
    Y retorna:
      | Score de riesgo             | 23%                 |
      | Clasificación               | Alto                |
      | Recomendación               | ASA 100mg profiláctico + control semanal |

  Escenario: Alerta de riesgo alto de preeclampsia
    Dado que el score de riesgo de preeclampsia >20%
    Cuando se muestra en UI
    Entonces:
      | Elemento                    | Visualización      |
      | Score                       | Naranja, grande    |
      | Factores contribuyentes     | Lista con iconos   |
      | Recomendación               | Acción concreta    |
      | Próxima evaluación          | Fecha sugerida     |

  # ─────────────────────────────────────────────────────────────
  # 2. PREDICCIÓN DE PARTO PREMATURO
  # ─────────────────────────────────────────────────────────────

  Escenario: Calcular riesgo de parto prematuro
    Dado que se evalúa paciente de 24 semanas
    Cuando se calcula score
    Entonces usa factores:
      | Factor                      | Valor             | Contribución |
      | Longitud cervical          | 28 mm             | Media        |
      | FFn                        | Negativa          | Baja         |
      | Historia de parto prematuro| No                | Baja         |
      | Infecciones urinarias      | 1 episodio        | Media        |
    Y retorna:
      | Score                       | 12%               |
      | Clasificación               | Moderado          |
      | Recomendación               | Control quincenal + education |

  # ─────────────────────────────────────────────────────────────
  # 3. PREDICCIÓN DE DIABETES GESTACIONAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Calcular riesgo de diabetes gestacional
    Dado que se evalúa paciente de 20 semanas
    Cuando se calcula score
    Entonces usa factores:
      | Factor                      | Valor             | Contribución |
      | IMC >30                     | Sí (IMC 31)       | Alta         |
      | Edad >25                    | Sí (28 años)      | Media        |
      | Historia familiar DM        | Sí (madre)        | Alta         |
      | Glucosa basal               | 92 mg/dL          | Media        |
    Y retorna:
      | Score                       | 35%               |
      | Clasificación               | Alto              |
      | Recomendación               | Curva de tolerancia a las 24 semanas |

  # ─────────────────────────────────────────────────────────────
  # 4. PREDICCIÓN DE MACROSOMÍA
  # ─────────────────────────────────────────────────────────────

  Escenario: Calcular riesgo de macrosomía
    Dado que se evalúa paciente con diabetes gestacional
    Cuando se calcula score
    Entonces usa factores:
      | Factor                      | Valor             | Contribución |
      | Glucosa postprandial        | 160 mg/dL         | Alta         |
      | Peso materno               | 95 kg             | Media        |
      | Altura uterina             | 34 cm (32 sem)    | Media        |
    Y retorna:
      | Score                       | 40%               |
      | Clasificación               | Alto              |
      | Peso fetal estimado         | 4,200 g           |
      | Recomendación               | Planificar parto, considerar cesárea |

  # ─────────────────────────────────────────────────────────────
  # 5. PREDICCIÓN DE DEPRESIÓN POSPARTO
  # ─────────────────────────────────────────────────────────────

  Escenario: Calcular riesgo de depresión posparto
    Dado que se evalúa paciente en control posparto
    Cuando se calcula score
    Entonces usa factores:
      | Factor                      | Valor             | Contribución |
      | PHQ-9                       | 8                 | Media        |
      | Historia de depresión       | Sí                | Alta         |
      | Apoyo social                | Bajo              | Alta         |
      | Complicaciones posparto     | Hemorragia        | Media        |
    Y retorna:
      | Score                       | 45%               |
      | Clasificación               | Alto              |
      | Recomendación               | Seguimiento semanal + Sertralina |

  # ─────────────────────────────────────────────────────────────
  # 6. PREDICCIÓN DE IUGR
  # ─────────────────────────────────────────────────────────────

  Escenario: Calcular riesgo de restricción del crecimiento
    Dado que se evalúa paciente de 32 semanas
    Cuando se calcula score
    Entonces usa factores:
      | Factor                      | Valor             | Contribución |
      | Altura uterina             | 26 cm (esperada 34)| Alta        |
      | PA                         | 138/88            | Media        |
      | Historia                   | Sin factores      | Baja         |
    Y retorna:
      | Score                       | 30%               |
      | Clasificación               | Alto              |
      | Recomendación               | Ecografía + doppler + referencia |

  # ─────────────────────────────────────────────────────────────
  # 7. VALIDACIÓN DE MODELOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Validar accuracy de modelos predictivos
    Dado que se comparan predicciones con resultados reales
    Cuando se calcula AUC
    Entonces:
      | Modelo                      | AUC objetivo | AUC mínima |
      | Preeclampsia                | >0.85        | >0.75      |
      | Parto prematuro             | >0.80        | >0.70      |
      | Diabetes gestacional        | >0.80        | >0.70      |
      | Depresión posparto          | >0.75        | >0.65      |
