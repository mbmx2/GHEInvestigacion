# language: es
# Cálculos Médicos - Gasometría Arterial
@status:proposed
@type:acceptance
@domain:general
# ACIDO-BASE: Equilibrio ácido-base
Característica: Gasometría Arterial (GHE)
  Como médico del proyecto GHE
  Quiero interpretar gasometría arterial automáticamente
  Para diagnosticar trastornos de equilibrio ácido-base

  # ─────────────────────────────────────────────────────────────
  # 1. VALORES NORMALES
  # ─────────────────────────────────────────────────────────────

  Escenario: Parámetros de gasometría
    Dado que se ingresa gasometría arterial
    Cuando se interpreta
    Entonces:
      | Parámetro                  | Normal           |
      | pH                         | 7.35-7.45        |
      | PaCO2                      | 35-45 mmHg       |
      | HCO3                       | 22-26 mEq/L      |
      | PaO2                       | 80-100 mmHg      |
      | SaO2                       | 95-100%          |
      | Exceso de base (BE)        | -2 a +2 mEq/L    |
      | Anión gap                  | 8-16 mEq/L       |

  # ─────────────────────────────────────────────────────────────
  # 2. ALGORITMO DE INTERPRETACIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Acidosis metabólica
    Dado que se detecta pH <7.35 y HCO3 <22
    Cuando se interpreta
    Entonces:
      | Paso                       | Verificación       |
      | 1. ¿pH <7.35?             | Sí (acidosis)      |
      | 2. ¿HCO3 bajo?            | Sí (metabólica)    |
      | 3. ¿Compensación?         | PaCO2 bajo (<35)   |
      | 4. ¿Anión gap elevado?    | Sí → CETO/ULMA    |
      | 5. Causas                  | Cetoacidosis, IRC, intoxicación |

  Escenario: Acidosis respiratoria
    Dado que se detecta pH <7.35 y PaCO2 >45
    Cuando se interpreta
    Entonces:
      | Paso                       | Verificación       |
      | 1. ¿pH <7.35?             | Sí (acidosis)      |
      | 2. ¿PaCO2 alto?           | Sí (respiratoria)  |
      | 3. ¿Aguda o crónica?      | HCO3 normal=aguda  |
      | 4. Causas                  | EPOC, neumonía, depresión respiratoria |

  Escenario: Alcalosis metabólica
    Dado que se detecta pH >7.45 y HCO3 >26
    Cuando se interpreta
    Entonces:
      | Paso                       | Verificación       |
      | 1. ¿pH >7.45?             | Sí (alcalosis)     |
      | 2. ¿HCO3 alto?            | Sí (metabólica)    |
      | 3. ¿Compensación?         | PaCO2 alto (>45)   |
      | 4. Causas                  | Vómitos, diuréticos, hiperaldosteronismo |

  Escenario: Alcalosis respiratoria
    Dado que se detecta pH >7.45 y PaCO2 <35
    Cuando se interpreta
    Entonces:
      | Paso                       | Verificación       |
      | 1. ¿pH >7.45?             | Sí (alcalosis)     |
      | 2. ¿PaCO2 bajo?           | Sí (respiratoria)  |
      | 3. Causas                  | Hiperventilación, dolor, ansiedad, embolia |

  # ─────────────────────────────────────────────────────────────
  # 3. ANIÓN GAP
  # ─────────────────────────────────────────────────────────────

  Escenario: Cálculo de anión gap
    Dado que se calcula anión gap
    Cuando se ingresa electrolitos
    Entonces:
      | Fórmula                     |
      | AG = Na - (Cl + HCO3)      |
      | Normal: 8-16 mEq/L         |
      | Corregir por albumina si es <4 g/dL |

  Escenario: Acidosis con anión gap elevado
    Dado que AG >16
    Cuando se clasifica
    Entonces causas:
      | Causa                       | Ejemplo            |
      | Cetoacidosis                | Diabetes           |
      | Lactato elevado             | Sepsis, shock      |
      | Uremia                      | IRC                |
      | Ingesta tóxica              | Metanol, etilenglicol, salicilatos |

  # ─────────────────────────────────────────────────────────────
  # 4. OXIGENACIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Clasificación de hipoxemia
    Dado que se clasifica hipoxemia
    Cuando se evalúa PaO2
    Entonces:
      | Severidad                   | PaO2              |
      | Leve                        | 60-79 mmHg        |
      | Moderada                    | 40-59 mmHg        |
      | Severa                      | <40 mmHg          |

  Escenario: Cálculo de gradiente alvéolo-arterial
    Dado que se calcula gradiente A-a
    Cuando se ingresa datos
    Entonces:
      | Fórmula                     |
      | PAO2 = FiO2 × (Patm - PH2O) - PaCO2/0.8 |
      | Gradiente = PAO2 - PaO2    |
      | Normal: <15 mmHg           |
      | Elevado: Difusión↓ o shunt |
  