# language: es
# Cálculos Médicos - Biometría Hemática
# HEMATOLOGÍA: Análisis de sangre completo
Característica: Biometría Hemática Completa (BHC) (GHE)
  Como médico del proyecto GHE
  Quiero interpretar biometría hemática automáticamente
  Para detectar anemia, infecciones y trastornos hematológicos

  # ─────────────────────────────────────────────────────────────
  # 1. PARAMETROS DE BHC
  # ─────────────────────────────────────────────────────────────

  Escenario: Interpretación de BHC completa
    Dado que se ingresa resultado de BHC
    Cuando se interpreta
    Entonces el sistema evalúa:
      | Parámetro                  | Hombre         | Mujer          | Unidad  |
      | Leucocitos                 | 4,500-11,000   | 4,500-11,000   | /µL     |
      | Neutrófilos                | 40-70%         | 40-70%         | %       |
      | Linfocitos                 | 20-40%         | 20-40%         | %       |
      | Monocitos                  | 2-8%           | 2-8%           | %       |
      | Eosinófilos                | 1-4%           | 1-4%           | %       |
      | Basófilos                  | 0-1%           | 0-1%           | %       |
      | Hemoglobina                | 14-18 g/dL     | 12-16 g/dL     | g/dL    |
      | Hematocrito                | 42-52%         | 36-46%         | %       |
      | VCM                        | 80-100 fL      | 80-100 fL      | fL      |
      | HCM                        | 27-33 pg       | 27-33 pg       | pg      |
      | Concentración de Hb        | 32-36 g/dL     | 32-36 g/dL     | g/dL    |
      | Plaquetas                  | 150,000-400,000| 150,000-400,000| /µL     |
      | VCM                        | 80-100 fL      | 80-100 fL      | fL      |
      | RDW                        | 11.5-14.5%     | 11.5-14.5%     | %       |

  # ─────────────────────────────────────────────────────────────
  # 2. CLASIFICACIÓN DE ANEMIA
  # ─────────────────────────────────────────────────────────────

  Escenario: Clasificación de anemia por VCM
    Dado que se detecta anemia (Hb baja)
    Cuando se clasifica por VCM
    Entonces:
      | VCM                         | Clasificación     | Causas principales |
      | <80 fL (microcítica)       | Anemia microcítica | Déficit de hierro, Talasemia |
      | 80-100 fL (normocítica)    | Anemia normocítica| Enfermedad crónica, Hemólisis |
      | >100 fL (macrocítica)      | Anemia macrocítica| Déficit B12, Ácido fólico |

  Escenario: Clasificación de anemia por severidad
    Dado que se clasifica anemia por severidad
    Cuando se evalúa Hb
    Entonces:
      | Severidad                   | Hb (hombre) | Hb (mujer) |
      | Leve                        | 10-14 g/dL  | 10-12 g/dL  |
      | Moderada                    | 7-10 g/dL   | 7-10 g/dL   |
      | Severa                      | <7 g/dL     | <7 g/dL     |
      | Crítica                     | <5 g/dL     | <5 g/dL     |

  # ─────────────────────────────────────────────────────────────
  # 3. LEUCOCITOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Interpretación de leucocitos
    Dado que se interpreta conteo de leucocitos
    Cuando se evalúa
    Entonces:
      | Valor                       | Interpretación     |
      | >11,000/µL (leucocitosis)  | Infección, inflamación, leucemia |
      | <4,500/µL (leucopenia)     | Inmunosupresión, viral, medicamentos |
      | >30,000/µL                 | Emergencia (leucostasis) |

  Escenario: Fórmula leucocitaria
    Dado que se interpreta fórmula leucocitaria
    Cuando se evalúa
    Entonces:
      | Hallazgo                    | Interpretación     |
      | Neutrofilia (>70%)          | Infección bacteriana |
      | Neutropenia (<40%)          | Inmunosupresión    |
      | Linfocitosis (>40%)         | Infección viral    |
      | Eosinofilia (>4%)           | Alergias, parásitos|
      | Bandemia (>10%)             | Infección severa   |

  # ─────────────────────────────────────────────────────────────
  # 4. PLAQUETAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Interpretación de plaquetas
    Dado que se interpreta conteo plaquetario
    Cuando se evalúa
    Entonces:
      | Valor                       | Interpretación     |
      | >400,000/µL (trombocitosis)| Infección, inflamación, neoplasia |
      | <150,000/µL (trombocitopenia)| ITP, TTP, síndrome HELLP |
      | <50,000/µL                 | Riesgo de sangrado |
      | <20,000/µL                 | Emergencia         |

  # ─────────────────────────────────────────────────────────────
  # 5. ALERTAS AUTOMÁTICAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Alertas de BHC crítica
    Dado que se detecta valor crítico en BHC
    Cuando se evalúa
    Entonces:
      | Parámetro                  | Valor crítico       | Alerta    |
      | Leucocitos                 | >30,000             | 🔴 Alta   |
      | Plaquetas                  | <50,000             | 🔴 Alta   |
      | Hemoglobina                | <5 g/dL             | 🔴 Alta   |
      | Neutrófilos                | <500                | 🔴 Alta   |
      | Blastos en sangre periférica| >5%                 | 🔴 Alta   |
  