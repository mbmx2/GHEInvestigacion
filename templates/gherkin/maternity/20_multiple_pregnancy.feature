# language: es
# Embarazo Múltiple
@status:proposed
@type:acceptance
@domain:maternity
Característica: Embarazo Múltiple (GHE Maternidad)
  Como médico de la maternidad
  Quiero workflows para embarazo múltiple (gemelos, trillizos)
  Para manejar los riesgos específicos de gestación múltiple

  # ─────────────────────────────────────────────────────────────
  # 1. IDENTIFICACIÓN Y CLASIFICACIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Identificación de embarazo múltiple
    Dado que se diagnostica embarazo múltiple
    Cuando se clasifica
    Entonces el sistema identifica:
      | Tipo                        | Riesgo  |
      | Gemelos dicigóticos (dos placas) | Medio |
      | Gemelos monocigóticos (una placenta) | Alto |
      | Trillizos                  | Muy alto |
      | Superior a trillizos       | Extremo  |

  # ─────────────────────────────────────────────────────────────
  # 2. SEGUIMIENTO ESPECÍFICO
  # ─────────────────────────────────────────────────────────────

  Escenario: Frecuencia de controles en gemelos
    Dado que la paciente tiene gemelos
    Cuando se planifica seguimiento
    Entonces:
      | Semana   | Frecuencia              |
      | 0-20     | Mensual                 |
      | 20-28    | Quincenal               |
      | 28-32    | Semanal                 |
      | 32-34    | 2 veces/semana          |
      | >34      | Considerar hospitalización |

  Escenario: Ecografías frecuentes en gemelos
    Dado que la paciente tiene gemelos
    Cuando se planifican ecografías
    Entonces:
      | Semana   | Ecografía               |
      | 11-14    | Confirmación + nuchal  |
      | 20-24    | Estructura fetal completa |
      | 24-28    | Crecimiento + doppler  |
      | 28-32    | Crecimiento cada 2-3 semanas |
      | 32-36     | Crecimiento semanal    |

  # ─────────────────────────────────────────────────────────────
  # 3. COMPLICACIONES ESPECÍFICAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Detección de gemelo delgado
    Dado que se evalúa crecimiento en gemelos
    Cuando hay discordancia >20%
    Entonces el sistema alerta:
      | Alerta                      |
      | "Discordancia de peso >20% — evaluar gemelo delgado" |
      | "Solicitar: doppler umbilical, doppler cerebral" |
      | "Considerar: hospitalización para monitoreo" |

  Escenario: Síndrome de transfusión gemelo a gemelo (STGG)
    Dado que se evalúa monocigóticos con una placenta
    Cuando se sospecha STGG
    Entonces el sistema alerta:
      | Hallazgo                    | Alerta             |
      | Polihidramnios en un gemelo | ⚠️ Evaluar STGG    |
      | Oligohidramnios en otro    | ⚠️ Evaluar STGG    |
      | Discordancia de peso >20%  | ⚠️ Evaluar STGG    |
      | Anemia en un gemelo        | ❌ Emergencia      |

  # ─────────────────────────────────────────────────────────────
  # 4. TIPO DE PARTO
  # ─────────────────────────────────────────────────────────────

  Escenario: Indicaciones de cesárea en gemelos
    Dado que se evalúa plan de parto para gemelos
    Cuando se evalúa
    Entonces:
      | Indicación                  | Tipo de parto     |
      | Gemelos dicigóticos, ambos cefálicos | Vaginal puede intentarse |
      | Primer gemelo no cefálico  | Cesárea           |
      | Gemelos monocigóticos      | Cesárea           |
      | Discordancia >25%          | Cesárea           |
      | Complicaciones             | Cesárea           |

  # ─────────────────────────────────────────────────────────────
  # 5. NUTRICIÓN EN EMBARAZO MÚLTIPLE
  # ─────────────────────────────────────────────────────────────

  Escenario: Recomendaciones nutricionales en gemelos
    Dado que la paciente tiene gemelos
    Cuando se dan recomendaciones
    Entonces:
      | Recomendación              |
      | Calorías extra: +600 kcal/día (vs +340 en singleton) |
      | Proteína: 100-175 g/día    |
      | Hierro: 60-100 mg/día      |
      | Calcio: 2000 mg/día        |
      | Ganancia de peso: 17-25 kg total |
      | Descanso relativo desde semana 28 |
