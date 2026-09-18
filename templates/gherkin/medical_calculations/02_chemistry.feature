# language: es
# Cálculos Médicos - Química Sanguínea
# BIOQUÍMICA: Análisis de química sanguínea completa
Característica: Química Sanguínea Completa (GHE)
  Como médico del proyecto GHE
  Quiero interpretar química sanguínea automáticamente
  Para detectar disfunciones metabólicas y orgánicas

  # ─────────────────────────────────────────────────────────────
  # 1. GLUCOSA
  # ─────────────────────────────────────────────────────────────

  Escenario: Interpretación de glucosa
    Dado que se interpreta glucosa sérica
    Cuando se evalúa
    Entonces:
      | Valor                       | Interpretación     |
      | 70-100 mg/dL (ayunas)      | Normal             |
      | 100-125 mg/dL (ayunas)     | Prediabetes        |
      | >126 mg/dL (ayunas, 2 veces)| Diabetes mellitus |
      | <70 mg/dL                  | Hipoglucemia       |
      | >200 mg/dL (aleatoria)     | Hiperglucemia severa |
      | >300 mg/dL                 | Emergencia (cetoacidosis/hiperosmolar) |

  # ─────────────────────────────────────────────────────────────
  # 2. FUNCIONALIDAD RENAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Interpretación de creatinina
    Dado que se interpreta creatinina sérica
    Cuando se evalúa
    Entonces:
      | Valor (hombre)  | Valor (mujer) | Interpretación     |
      | 0.7-1.3 mg/dL  | 0.6-1.1 mg/dL | Normal             |
      | 1.4-2.0 mg/dL  | 1.2-1.8 mg/dL | ERC etapa 2        |
      | 2.1-4.0 mg/dL  | 1.9-3.5 mg/dL | ERC etapa 3        |
      | 4.1-7.0 mg/dL  | 3.6-6.0 mg/dL | ERC etapa 4        |
      | >7.0 mg/dL     | >6.0 mg/dL    | ERC etapa 5 (diálisis)|

  Escenario: Cálculo de Tasa de Filtrado Glomerular (TFG)
    Dado que se calcula TFG (MDRD)
    Cuando se ingresa creatinina, edad, sexo, raza
    Entonces calcula:
      | Fórmula MDRD                |
      | TFG = 175 × (Cr)^-1.154 × (Edad)^-0.203 × (0.742 si mujer) |
    Y clasifica:
      | TFG                         | Etapa ERC          |
      | ≥90 mL/min/1.73m²           | Etapa 1 (normal)   |
      | 60-89                       | Etapa 2 (leve)     |
      | 45-59                       | Etapa 3a (moderada)|
      | 30-44                       | Etapa 3b (mod severa)|
      | 15-29                       | Etapa 4 (severa)   |
      | <15                         | Etapa 5 (diálisis) |

  # ─────────────────────────────────────────────────────────────
  # 3. FUNCIONALIDAD HEPÁTICA
  # ─────────────────────────────────────────────────────────────

  Escenario: Interpretación de perfil hepático
    Dado que se interpreta perfil hepático
    Cuando se evalúa
    Entonces:
      | Parámetro                  | Normal           | Elevado =          |
      | TGO (AST)                  | 5-40 U/L         | Daño hepatocelular |
      | TGP (ALT)                  | 7-56 U/L         | Daño hepatocelular |
      | Fosfatasa alcalina         | 44-147 U/L       | Colestasis         |
      | GGT                        | 9-48 U/L         | Colestasis         |
      | Bilirrubina total          | 0.1-1.2 mg/dL    | Ictericia          |
      | Bilirrubina directa        | 0.0-0.3 mg/dL    | Ictericia obstructiva|
      | Bilirrubina indirecta      | 0.1-0.9 mg/dL    | Hemólisis          |
      | Albumina                   | 3.5-5.5 g/dL     | Desnutrición       |
      | Tiempo de protrombina      | 11-13.5 seg       | Síntesis hepática  |

  Escenario: Clasificación de ictericia
    Dado que se clasifica ictericia
    Cuando se evalúa bilirrubina
    Entonces:
      | Tipo                        | Bilirrubina       | Causa              |
      | Prehepática (hemolítica)    | Indirecta ↑       | Hemólisis          |
      | Hepática (hepatocelular)   | Directa + Indirecta↑ | Hepatitis      |
      | Posthepática (obstructiva) | Directa ↑         | Cálculos, tumor    |

  # ─────────────────────────────────────────────────────────────
  # 4. ELECTROLITOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Interpretación de electrolitos
    Dado que se interpretan electrolitos séricos
    Cuando se evalúa
    Entonces:
      | Electrolito | Normal        | Bajo =            | Alto =             |
      | Sodio (Na)  | 136-145 mEq/L | Hiponatremia      | Hipernatremia      |
      | Potasio (K) | 3.5-5.0 mEq/L | Hipopotasemia     | Hiperpotasemia     |
      | Cloro (Cl)  | 98-106 mEq/L  | Hipocloremia      | Hipercloremia      |
      | Calcio (Ca) | 8.5-10.5 mg/dL| Hipocalcemia      | Hipercalcemia      |
      | Fósforo     | 2.5-4.5 mg/dL | Hipofosfatemia    | Hiperfosfatemia    |
      | Magnesio    | 1.7-2.2 mg/dL | Hipomagnesemia    | Hipermagnesemia    |

  Escenario: Emergencias de electrolitos
    Dado que se detecta electrodo crítico
    Cuando se evalúa
    Entonces:
      | Electrolito | Valor crítico    | Emergencia          |
      | K           | >6.0 o <2.5     | Arritmias, parada   |
      | Na          | <120 o >160     | Convulsiones, coma  |
      | Ca          | >14 o <6        | Arritmias, tetania  |
      | Mg          | <1.0            | Tetania, arritmias  |

  # ─────────────────────────────────────────────────────────────
  # 5. LÍPIDOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Interpretación de perfil lipídico
    Dado que se interpreta perfil lipídico
    Cuando se evalúa
    Entonces:
      | Parámetro                  | Deseable          | Límite alto       |
      | Colesterol total           | <200 mg/dL        | 200-239 mg/dL     |
      | LDL                        | <100 mg/dL óptimo | 130-159 alto      |
      | HDL                        | >40 mg/dL         | <40 bajo          |
      | Triglicéridos              | <150 mg/dL        | 200-499 alto      |
  