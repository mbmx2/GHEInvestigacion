# language: es
# Cálculos Médicos - Calculadoras de Salud
@status:proposed
@type:acceptance
@domain:general
# CALCULADORAS: Cálculos clínicos automáticos
Característica: Calculadoras de Salud (GHE)
  Como médico del proyecto GHE
  Quiero calculadoras clínicas automáticas
  Para obtener resultados rápidos y precisos

  # ─────────────────────────────────────────────────────────────
  # 1. BMI / IMC
  # ─────────────────────────────────────────────────────────────

  Escenario: Cálculo de BMI (IMC)
    Dado que se ingresa peso y talla
    Cuando se calcula BMI
    Entonces:
      | Fórmula                     |
      | BMI = peso (kg) / talla (m)² |
    Y clasifica:
      | BMI                         | Clasificación     |
      | <18.5                       | Bajo peso         |
      | 18.5-24.9                   | Normal            |
      | 25.0-29.9                   | Sobrepeso         |
      | 30.0-34.9                   | Obesidad grado I  |
      | 35.0-39.9                   | Obesidad grado II |
      | ≥40.0                       | Obesidad mórbida  |

  # ─────────────────────────────────────────────────────────────
  # 2. SUPERFICIE CORPORAL (SC)
  # ─────────────────────────────────────────────────────────────

  Escenario: Cálculo de superficie corporal
    Dado que se ingresa peso y talla
    Cuando se calcula SC
    Entonces:
      | Fórmula de Mosteller        |
      | SC (m²) = √(peso(kg) × talla(cm) / 3600) |
    Y se usa para dosis de quimioterapia, drogas, etc.

  # ─────────────────────────────────────────────────────────────
  # 3. EDAD GESTACIONAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Cálculo de edad gestacional desde FUR
    Dado que se ingresa fecha de última regla (FUR)
    Cuando se calcula edad gestacional
    Entonces:
      | Fórmula                     |
      | Edad gestacional (días) = (Fecha actual - FUR) |
      | Edad gestacional (semanas) = días / 7 |

  Escenario: Cálculo de Fecha Probable de Parto (FPP)
    Dado que se tiene FUR
    Cuando se calcula FPP
    Entonces:
      | Fórmula de Naegele          |
      | FPP = FUR + 280 días (40 semanas) |
      | O: FUR - 3 meses + 7 días + 1 año |

  # ─────────────────────────────────────────────────────────────
  # 4. APGAR SCORE
  # ─────────────────────────────────────────────────────────────

  Escenario: Cálculo de APGAR
    Dado que se evalúa recién nacido
    Cuando se puntúa APGAR
    Entonces:
      | Criterio                   | 0              | 1              | 2              |
      | Apariencia (color)         | Azul/pálido    | Cuerpo rosado | Todo rosado    |
      | Pulso (FC)                 | Ausente        | <100           | >100           |
      | Gesticulación (reflejos)   | Ausente        | Mueca          | Llanto activo  |
      | Actividad (tono)           | Flácido        | Flexión leve   | Movimiento activo|
      | Respiración                | Ausente        | Irregular      | Buena, llanto  |
    Y se puntúa a 1 y 5 minutos
    Y interpretación:
      | Puntaje APGAR              | Interpretación |
      | 7-10                       | Normal         |
      | 4-6                        | Depresión moderada |
      | 0-3                        | Depresión severa (emergencia) |

  # ─────────────────────────────────────────────────────────────
  # 5. GLASGOW COMA SCALE
  # ─────────────────────────────────────────────────────────────

  Escenario: Cálculo de Glasgow
    Dado que se evalúa nivel de conciencia
    Cuando se puntúa Glasgow
    Entonces:
      | Componente                 | 1              | 2              | 3              | 4     | 5     | 6     |
      | Apertura ocular            | Ninguna        | A dolor        | A voz          | Espontánea | | |
      | Respuesta verbal           | Ninguna        | Incomprensible| Inapropiada    | Confusa | Orientada | |
      | Respuesta motora           | Ninguna        | Extensión      | Flexión        | Retirada    | Localiza | Obedece |
    Y interpretación:
      | Glasgow Total              | Interpretación |
      | 15                         | Normal         |
      | 13-14                      | Traumatismo leve |
      | 9-12                       | Traumatismo moderado |
      | ≤8                         | Traumatismo severo (intubar) |

  # ─────────────────────────────────────────────────────────────
  # 6. BISHOP SCORE
  # ─────────────────────────────────────────────────────────────

  Escenario: Cálculo de Bishop Score
    Dado que se evalúa maduración cervical
    Cuando se puntúa
    Entonces:
      | Parámetro                  | 0              | 1              | 2              | 3     |
      | Dilatación cervical        | Cerrada        | 1-2 cm         | 3-4 cm         | ≥5 cm |
      | Borramiento                | Duro           | Medio          | Blando         | Total |
      | Posición                   | Posterior      | Medio          | Anterior       | |
      | Consistencia               | Duro           | Medio          | Blando         | |
      | Altitud fetal              | -3             | -2             | -1 a 0         | +1/+2 |
    Y interpretación:
      | Bishop Score               | Interpretación |
      | <6                         | No favorable   |
      | ≥6                         | Favorable para inducción |

  # ─────────────────────────────────────────────────────────────
  # 7. CALCULADORAS CARDIOVASCULARES
  # ─────────────────────────────────────────────────────────────

  Escenario: Cálculo de riesgo cardiovascular (Framingham)
    Dado que se calcula riesgo cardiovascular
    Cuando se ingresa factores
    Entonces:
      | Factor                      |
      | Edad                        |
      | Sexo                        |
      | Colesterol total            |
      | HDL                         |
      | Presión arterial sistólica  |
      | Tabaquismo                  |
      | Diabetes                    |
    Y retorna riesgo a 10 años:
      | Riesgo                      | Clasificación   |
      | <10%                        | Bajo            |
      | 10-20%                      | Moderado        |
      | >20%                        | Alto            |

  # ─────────────────────────────────────────────────────────────
  # 8. CALCULADORAS RENALES
  # ─────────────────────────────────────────────────────────────

  Escenario: Cálculo de TFG (MDRD)
    Dado que se calcula TFG
    Cuando se ingresa datos
    Entonces:
      | Fórmula MDRD abreviada      |
      | TFG = 186 × (Cr)^-1.154 × (Edad)^-0.203 × (0.742 si mujer) |
    Y clasifica según KDIGO

  Escenario: Cálculo de Clearence de Creatinina (Cockcroft-Gault)
    Dado que se calcula Clearence de Cr
    Cuando se ingresa datos
    Entonces:
      | Fórmula                     |
      | CrCl = ((140-edad) × peso) / (72 × Cr) × (0.85 si mujer) |
    Y se usa para ajuste de dosis de medicamentos renales

  # ─────────────────────────────────────────────────────────────
  # 9. CALCULADORAS DE DIABETES
  # ─────────────────────────────────────────────────────────────

  Escenario: Interpretación de HbA1c
    Dado que se interpreta HbA1c
    Cuando se evalúa
    Entonces:
      | HbA1c                       | Glucosa promedio  | Clasificación |
      | <5.7%                       | <114 mg/dL        | Normal        |
      | 5.7-6.4%                    | 114-137 mg/dL     | Prediabetes   |
      | ≥6.5%                       | ≥140 mg/dL        | Diabetes      |
    Ymeta terapéutica:
      | Paciente                    | Meta HbA1c        |
      | General                     | <7%               |
      | Embarazada                  | <6%               |
      | Anciano (>65 años)          | <8%               |
      | Enfermedad cardiovascular   | <7%               |

  # ─────────────────────────────────────────────────────────────
  # 10. CALCULADORAS DE TIROIDES
  # ─────────────────────────────────────────────────────────────

  Escenario: Interpretación de tiroides
    Dado que se interpreta perfil tiroideo
    Cuando se evalúa
    Entonces:
      | Parámetro | Normal        | Hipotiroidismo | Hipertiroidismo |
      | TSH       | 0.4-4.0 mUI/L | Elevada        | Baja            |
      | T4 libre  | 0.8-1.8 ng/dL | Baja           | Elevada         |
    Y algoritmo:
      | TSH | T4L    | Diagnóstico              |
      | ↑   | ↓      | Hipotiroidismo primario   |
      | ↓   | ↑      | Hipertiroidismo primario  |
      | ↑   | Normal | Hipotiroidismo subclínico |
      | ↓   | Normal | Hipertiroidismo subclínico|

  # ─────────────────────────────────────────────────────────────
  # 11. CALCULADORAS DE COAGULACIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Interpretación de coagulación
    Dado que se interpreta perfil de coagulación
    Cuando se evalúa
    Entonces:
      | Parámetro | Normal        | Elevado =               |
      | TP        | 11-13.5 seg   | Déficit factor, warfarina |
      | INR       | 0.8-1.2       | Riesgo de sangrado      |
      | TTP       | 25-35 seg     | Déficit factores IV, VIII, IX, XI |
      | Fibrinógeno| 200-400 mg/dL| Bajo = DIC, sangrado    |
      | D-dímero  | <500 ng/mL    | Elevado = TVP, TEP, DIC |
    Y alerta:
      | INR >3.0                    | Riesgo alto de sangrado |
      | INR >5.0                    | Emergencia             |

  # ─────────────────────────────────────────────────────────────
  # 12. CALCULADORAS NUTRICIONALES
  # ─────────────────────────────────────────────────────────────

  Escenario: Requerimiento calórico basal
    Dado que se calcula requerimiento calórico basal
    Cuando se ingresa peso, talla, edad, sexo
    Entonces:
      | Fórmula de Harris-Benedict  |
      | Hombre: 88.4 + (13.4 × peso) + (4.8 × talla) - (5.7 × edad) |
      | Mujer: 447.6 + (9.2 × peso) + (3.1 × talla) - (4.3 × edad) |

  Escenario: Necesidades proteicas
    Dado que se calculan necesidades proteicas
    Cuando se evalúa estado clínico
    Entonces:
      | Estado                      | g/kg/día        |
      | Normal                      | 0.8             |
      | Estrés moderado             | 1.2-1.5         |
      | Estrés severo               | 1.5-2.0         |
      | Quemados                    | 2.0-2.5         |
      | Embarazo                    | 1.1             |
      | Lactancia                   | 1.3             |
  