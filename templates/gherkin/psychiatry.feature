# language: es
Característica: Atención Psiquiátrica
@status:proposed
@type:acceptance
@domain:psychiatry
  Como psiquiatra
  Quiero evaluar y tratar trastornos mentales
  Para mejorar salud mental y calidad de vida

  Contexto:
    Dado que el sistema está activo
    Y que el usuario tiene rol de médico

  Escenario: Evaluación inicial
    Dado que paciente acude por primera vez a psiquiatría
    Cuando psiquiatra evalúa
    Entonces el sistema guía secciones:
      | Sección                   |
      | Motivo + historia actual  |
      | Antecedentes personales/familiares |
      | Historia social/farmacológica |
      | Ideación suicida/agresividad |
      | Estado mental + juicio    |

  Escenario: PHQ-9 (Depresión)
    Dado que paciente presenta síntomas depresivos
    Cuando psiquiatra aplica PHQ-9
    Entonces registra TOTAL: 12 → "Depresión moderada"
    Y evalúa riesgo suicida: ideación pasiva, sin plan, sin intentos previos
    Y sugiere: Sertralina 50-100mg + psicoterapia

  Escenario: GAD-7 (Ansiedad)
    Dado que paciente presenta ansiedad significativa
    Cuando psiquiatra aplica GAD-7
    Entonces registra TOTAL: 9 → "Ansiedad moderada"
    Y sugiere: CBT + considerar SSRI

  Escenario: Riesgo suicida alto
    Dado que paciente presenta ideación suicida con plan
    Cuando psiquiatra evalúa
    Entonces sistema genera ALARMA:
      | Campo                     |
      | ❌ ALTO RIESGO SUICIDA   |
      | Referencia psiquiátrica urgente |
      | Evaluación neurológica    |
      | Seguridad del paciente    |

  Escenario: Trastorno bipolar en embarazo
    Dado que paciente con bipolar se embaraza
    Cuando psiquiatra evalúa tratamiento
    Entonces:
      | Paso                       |
      | Revisar medicación actual  |
      | Suspender litio 1er trimestre |
      | Cambiar a levetiracetam si convulsiones |
      | Monitoreo estrecho        |

  Escenario: Psicosis perinatal
    Dado que paciente presenta síntomas psicóticos
    Cuando psiquiatra evalúa
    Entonces sistema genera ALARMA:
      | Campo                     |
      | ❌ PSICOSIS PERINATAL     |
      | Riesgo para madre e hijo  |
      | Referencia urgente        |
      | Seguridad inmediata       |

  Escenario: Evaluación de estrés y apoyo
    Dado que se evalúa factor de estrés
    Cuando se verifica apoyo social
    Entonces:
      | Factor                  | Riesgo |
      | Sin apoyo familiar     | Alto   |
      | Violencia doméstica    | Muy alto |
      | Pobreza                | Alto   |
      | Embarazo no deseado   | Alto   |
    Y sugiere: trabajo social, grupo de apoyo, asesoría legal
