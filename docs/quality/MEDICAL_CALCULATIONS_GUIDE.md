# Guía de Cálculos Médicos para el Proyecto GHE

> *"Cada cálculo médico debe ser automático, preciso y con alertas integradas."*

---

## 1. Calculadoras Incluidas en GHE

### 1.1. Hematología

| Calculadora | Fórmula | Alertas |
|---|---|---|
| **BHC completa** | Referencias por sexo/edad | Anemia, leucocitosis, trombocitopenia |
| **Clasificación anemia** | VCM, HCM, CHCM | Micro/normo/macroцитica |
| **Fórmula leucocitaria** | Porcentajes | Neutrofilia, linfocitosis |

### 1.2. Bioquímica

| Calculadora | Fórmula | Alertas |
|---|---|---|
| **Glucosa** | mg/dL | Prediabetes, diabetes, hipoglucemia |
| **TFG (MDRD)** | 175 × Cr^(-1.154) × Edad^(-0.203) | ERC etapas 1-5 |
| **Clearence Cr (Cockcroft)** | ((140-edad)×peso)/(72×Cr) | Ajuste de dosis |
| **Perfil hepático** | TGO, TGP, FA, GGT, Bilirrubina | Hepatotoxicidad, ictericia |
| **Perfil lipídico** | CT, LDL, HDL, TG | Riesgo cardiovascular |
| **Electrolitos** | Na, K, Cl, Ca, Mg, PO4 | Emergencias |
| **Anión gap** | Na - (Cl + HCO3) | Acidosis con AG↑ |

### 1.3. Gasometría

| Calculadora | Fórmula | Alertas |
|---|---|---|
| **pH/CO2/HCO3** | Algoritmo de interpretation | Acidosis/alcalosis |
| **Anión gap corregido** | AG × (4/albumina) | Hipalbuminemia |
| **Gradiente A-a** | PAO2 - PaO2 | Enfermedad pulmonar |

### 1.4. Obstetricia

| Calculadora | Fórmula | Alertas |
|---|---|---|
| **Edad gestacional** | (Fecha actual - FUR) / 7 | |
| **FPP (Naegele)** | FUR + 280 días | |
| **APGAR Score** | 5 criterios (0-2 cada uno) | Depresión neonatal |
| **Bishop Score** | 5 parámetros (0-3 cada uno) | Inducción |

### 1.5. Neurología

| Calculadora | Fórmula | Alertas |
|---|---|---|
| **Glasgow Coma Scale** | Ocular + Verbal + Motora | Intubación si ≤8 |

### 1.6. Cardiovascular

| Calculadora | Fórmula | Alertas |
|---|---|---|
| **Riesgo Framingham** | Múltiples factores | Riesgo 10 años |

### 1.7. Endocrinología

| Calculadora | Fórmula | Alertas |
|---|---|---|
| **BMI/IMC** | peso / talla² | Clasificación OMS |
| **HbA1c → glucosa promedio** | (HbA1c + 2.6) / 0.0915 | Meta terapéutica |
| **TSH/T4L** | Algoritmo diagnóstico | Hipotiroidismo/hipertiroidismo |

### 1.8. Coagulación

| Calculadora | Fórmula | Alertas |
|---|---|---|
| **INR** | TP/TP control | Riesgo de sangrado |
| **D-dímero** | ng/mL | TVP, TEP, DIC |

### 1.9. Nutrición

| Calculadora | Fórmula | Alertas |
|---|---|---|
| **SC (Mosteller)** | √(peso×talla/3600) | Dosis |
| **RCB (Harris-Benedict)** | Ecuación compleja | Necesidades calóricas |
| **Necesidades proteicas** | g/kg/día | Desnutrición |

---

## 2. Unidades y Conversiones

| Parámetro | Unidades comunes | Conversión |
|---|---|---|
| Glucosa | mg/dL ↔ mmol/L | ÷18 o ×0.0555 |
| Colesterol | mg/dL ↔ mmol/L | ÷38.67 o ×0.0259 |
| Creatinina | mg/dL ↔ µmol/L | ÷88.4 o ×11.3 |
| Uric acid | mg/dL ↔ µmol/L | ÷16.8 o ×59.5 |
| Hemoglobina | g/dL ↔ g/L | ×10 o ÷10 |

---

## 3. Alertas Automáticas

### Valores Críticos

| Parámetro | Valor crítico | Acción |
|---|---|---|
| Glucosa | <50 o >500 mg/dL | 🔴 Emergencia |
| K+ | <2.5 o >6.0 mEq/L | 🔴 Emergencia |
| Na+ | <120 o >160 mEq/L | 🔴 Emergencia |
| Ca++ | <6 o >14 mg/dL | 🔴 Emergencia |
| pH | <7.20 o >7.60 | 🔴 Emergencia |
| PaO2 | <40 mmHg | 🔴 Emergencia |
| Plaquetas | <50,000/µL | 🔴 Emergencia |
| Hb | <5 g/dL | 🔴 Emergencia |
| INR | >5.0 | 🔴 Emergencia |
| TFG | <15 mL/min | 🔴 Diálisis |

---

## 4. Referencias

- **"Laboratory and Diagnostic Tests"**: IoM
- **"Harrison's Principles of Internal Medicine"**: McGraw-Hill
- **"Williams Obstetrics"**: McGraw-Hill
- **"Guyton and Hall Textbook of Medical Physiology"**: Elsevier
- **"Diagnosis and Treatment in Family Medicine"**: McGraw-Hill

---

*Cálculos Médicos en GHE: Precisión automática para mejores decisiones clínicas.*
