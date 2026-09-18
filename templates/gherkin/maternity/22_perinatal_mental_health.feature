# language: es
# Salud Mental Perinatal Completa
Característica: Salud Mental Perinatal (GHE Maternidad)
  Como psiquiatra perinatal
  Quiero workflows completos de salud mental en el ciclo perinatal
  Para prevenir y tratar trastornos mentales que afectan madre e hijo

  # ─────────────────────────────────────────────────────────────
  # 1. SCREENING PRECONCEPCIONAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Evaluación psiquiátrica preconcepcional
    Dado que la mujer consulta antes de embarazarse
    Cuando se evalúa salud mental
    Entonces el sistema verifica:
      | Criterio                   | Acción |
      | Antecedentes de depresión  | Optimizar antes de embarazo |
      | Antecedentes de ansiedad   | Evaluar necesidad de tratamiento continuo |
      | Tratamiento psiquiátrico actual | Ajustar a fármacos seguros |
      | Historial de autolesión    | Plan de seguridad |
      | Red de apoyo               | Evaluar fortaleza |

  # ─────────────────────────────────────────────────────────────
  # 2. SCREENING PERINATAL (1er-3er trimestre)
  # ─────────────────────────────────────────────────────────────

  Escenario: Screening en cada control prenatal
    Dado que la paciente acude a control prenatal
    Cuando se aplica PHQ-9
    Entonces el sistema evalúa:
      | Puntaje PHQ-9 | Clasificación | Acción |
      | 0-4           | Mínima        | Ninguna |
      | 5-9           | Leve          | Educación, reevaluar 4 semanas |
      | 10-14         | Moderada      | Considerar Sertralina |
      | 15-19         | Moderadamente severa | Sertralina + psicoterapia |
      | 20-27         | Severa        | Sertralina alta dosis + psiquiatría |

  Escenario: Screening de ansiedad perinatal
    Dado que se evalúa ansiedad
    Cuando se aplica GAD-7
    Entonces el sistema evalúa:
      | Puntaje GAD-7 | Clasificación | Acción |
      | 0-4           | Mínima        | Ninguna |
      | 5-9           | Leve          | Técnicas de relajación |
      | 10-14         | Moderada      | CBT + considerar SSRI |
      | ≥15           | Severa        | Tratamiento urgente |

  # ─────────────────────────────────────────────────────────────
  # 3. DEPRESIÓN PERINATAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Manejo de depresión perinatal
    Dado que se confirma depresión perinatal
    Cuando se inicia tratamiento
    Entonces el sistema guía:
      | Severidad | Tratamiento |
      | Leve | Psicoeducación + ejercicio + seguimiento |
      | Moderada | Sertralina 50-100mg + CBT |
      | Severa | Sertralina 100-200mg + psiquiatría |
      | Con ideación suicida | Referencia inmediata |

  Escenario: Seguimiento de depresión perinatal
    Dado que se inicia tratamiento para depresión
    Cuando se hace seguimiento
    Entonces el sistema verifica:
      | Momento                     | Evaluación |
      | 2 semanas post-inicio      | PHQ-9 + efectos adversos |
      | 1 mes                       | PHQ-9 + adherencia |
      | 3 meses                     | PHQ-9 + decisiones de continuation |
      | 6 meses posparto            | PHQ-9 + evaluación de alta |

  # ─────────────────────────────────────────────────────────────
  # 4. ANSIEDAD PERINATAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Manejo de ansiedad perinatal
    Dado que se detecta ansiedad significativa
    Cuando se maneja
    Entonces:
      | Tipo de ansiedad            | Tratamiento |
      | Ansiedad generalizada       | CBT + ejercicio + Considerar SSRI |
      | Fobia social               | CBT + exposición gradual |
      | TOC perinatal              | CBT + Sertralina |
      | TOC con ideación suicida    | Referencia psiquiátrica urgente |

  # ─────────────────────────────────────────────────────────────
  # 5. TRASTORNO BIPOLAR EN EMBARAZO
  # ─────────────────────────────────────────────────────────────

  Escenario: Manejo de trastorno bipolar en embarazo
    Dado que paciente con trastorno bipolar se embaraza
    Cuando se evalúa
    Entonces:
      | Paso | Acción |
      | 1 | Revisar medicación actual |
      | 2 | Suspender litio en 1er trimestre (riesgo cardíaco) |
      | 3 | Cambiar a Levetiracetam si convulsiones |
      | 4 | Mantener estabilizador si beneficio > riesgo |
      | 5 | Monitoreo estrecho de episodios |
      | 6 | Plan de parto con psiquiatría |

  # ─────────────────────────────────────────────────────────────
  # 6. PSICOSIS PERINATAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Detección de psicosis perinatal
    Dado que la paciente presenta síntomas psicóticos
    Cuando se evalúa
    Entonces:
      | Síntoma                     | Acción |
      | Alucinaciones               | Referencia psiquiátrica urgente |
      | Delirios                    | Referencia psiquiátrica urgente |
      | Confusión severa            | Evaluación neurológica |
      | Agitación                   | Seguridad + psiquiatría |
    Y el sistema genera ALARMA: "Psicosis perinatal — riesgo para madre e hijo"

  # ─────────────────────────────────────────────────────────────
  # 7. ESTRÉS Y APOYO SOCIAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Evaluación de estrés y apoyo
    Dado que se evalúa factor de estrés
    Cuando se verifica
    Entonces:
      | Factor                      | Riesgo |
      | Sin apoyo familiar         | Alto   |
      | Violencia doméstica        | Muy alto |
      | Pobreza                    | Alto   |
      | Embarazo no deseado        | Alto   |
      | Aislamiento social         | Alto   |
    Y el sistema sugiere intervenciones:
      | Intervención                |
      | Trabajo social             |
      | Grupo de apoyo             |
      | Asesoría legal (si violencia) |
      | Conexión con servicios     |
