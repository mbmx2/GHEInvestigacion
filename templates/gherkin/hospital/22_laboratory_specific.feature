# language: es
# Laboratorio - Estudios Específicos
@status:proposed
@type:acceptance
@domain:hospital
Característica: Estudios de Laboratorio (GHE Hospital)
  Como biólogo clínico del hospital
  Quiero workflows para estudios específicos de laboratorio
  Para generar resultados precisos por cada tipo de estudio

  # ─────────────────────────────────────────────────────────────
  # 1. MICROBIOLOGÍA
  # ─────────────────────────────────────────────────────────────

  Escenario: Cultivo y antibiograma
    Dado que se solicita cultivo
    Cuando se procesa
    Entonces:
      | Paso                       |
      | Recepción de muestra      |
      | Siembra en medios         |
      | Incubación (24-48h)       |
      | Identificación del microorganismo |
      | Prueba de sensibilidad    |
      | Reporte de antibiograma   |

  Escenario: Urocultivo
    Dado que se realiza urocultivo
    Cuando se procesa
    Entonces:
      | Resultado                  | Interpretación |
      | <10,000 UFC/mL           | Negativo (contaminación) |
      | 10,000-100,000 UFC/mL    | Zona gris, repetir |
      | >100,000 UFC/mL          | Positivo (ITU)     |

  # ─────────────────────────────────────────────────────────────
  # 2. BIOQUÍMICA ESPECÍFICA
  # ─────────────────────────────────────────────────────────────

  Escenario: Perfil tiroideo completo
    Dado que se solicita perfil tiroideo
    Cuando se interpreta
    Entonces:
      | Resultado TSH | T4L       | Interpretación |
      | Alto          | Bajo      | Hipotiroidismo primario |
      | Bajo          | Alto      | Hipertiroidismo primario |
      | Bajo          | Normal    | Hipertiroidismo subclínico |
      | Alto          | Normal    | Hipotiroidismo subclínico |
      | Normal        | Normal    | Eutiroideo       |

  Escenario: Perfil lipídico
    Dado que se interpreta perfil lipídico
    Cuando se evalúa
    Entonces:
      | Parámetro     | Deseable     | Límite alto   | Alto     |
      | CT            | <200         | 200-239       | ≥240     |
      | LDL           | <100 óptimo  | 130-159       | ≥160     |
      | HDL           | >40          | 35-39 bajo     | <35 muy bajo |
      | TG            | <150         | 200-499        | ≥500     |

  # ─────────────────────────────────────────────────────────────
  # 3. HEMATOLOGÍA
  # ─────────────────────────────────────────────────────────────

  Escenario: Frotis de sangre periférica
    Dado que se realiza frotis
    Cuando se interpreta
    Entonces el sistema registra:
      | Elemento                    | Hallazgo |
      | Forma de glóbulos rojos    | Normocíticos normocrómicos |
      | Leucocito differential     | Neutrofilia      |
      | Plaquetas                  | Normales          |
      | Formas anormales           | Ausentes          |

  # ─────────────────────────────────────────────────────────────
  # 4. URINÁLISIS
  # ─────────────────────────────────────────────────────────────

  Escenario: Interpretación de uroanálisis
    Dado que se procesa uroanálisis
    Cuando se interpreta
    Entonces:
      | Parámetro     | Normal            | Anormal          |
      | Color         | Amarillo claro    | Rojo (hematuria) |
      | Turbidez      | Clara             | Turbia (infección)|
      | pH            | 4.5-8.0           | <4.5 o >8.0     |
      | Densidad       | 1.005-1.030       | <1.005 o >1.030 |
      | Proteínas      | Negativa          | Positiva (+)    |
      | Glucosa        | Negativa          | Positiva         |
      | Hemoglobina    | Negativa          | Positiva (hematuria)|
      | Leucocitos     | Negativos         | Positivos (ITU)  |
      | Nitritos        | Negativos         | Positivos (bacteriana)|
      | Cilindros       | Ausentes          | Presentes (renal)|

  # ─────────────────────────────────────────────────────────────
  # 5. COAGULACIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Interpretación de coagulación
    Dado que se interpreta perfil de coagulación
    Cuando se evalúa
    Entonces:
      | Parámetro     | Normal        | Elevado =          |
      | TP            | 11-13.5 seg   | Déficit vit K, warfarina |
      | INR           | 0.8-1.2       | Riesgo sangrado   |
      | TTP           | 25-35 seg     | Déficit factores IV,VIII,IX,XI |
      | Fibrinógeno   | 200-400 mg/dL | Bajo: DIC         |
      | D-dímero       | <500 ng/mL   | Elevado: TVP, TEP, DIC |

  # ─────────────────────────────────────────────────────────────
  # 6. GASOMETRÍA ARTERIAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Interpretación de gasometría
    Dado que se procesa gasometría arterial
    Cuando se interpreta
    Entonces el sistema usa algoritmo:
      | Paso | Verificación |
      | 1    | pH: ¿ácido (<7.35) o alcalino (>7.45)? |
      | 2    | ¿Metabólica (HCO3) o respiratoria (PaCO2)? |
      | 3    | ¿Compensación? |
      | 4    | ¿Anión gap elevado? |
      | 5    | Diagnóstico final |

  # ─────────────────────────────────────────────────────────────
  # 7. SEROLOGÍA
  # ─────────────────────────────────────────────────────────────

  Escenario: Interpretación de serología
    Dado que se procesan estudios serológicos
    Cuando se interpreta
    Entonces:
      | Estudio        | Positivo =              | Negativo =        |
      | VDRL           | Sífilis (activa o pasada) | Sin sífilis      |
      | FTA-ABS        | Confirmación de sífilis | Sin sífilis      |
      | HBsAg          | Hepatitis B activa      | Sin HBV activa   |
      | Anti-HCV        | Exposición a HCV        | Sin exposición   |
      | VIH (Elisa)     | Screening positivo      | Requiere confirmación |
      | Toxoplasmosis   | Exposición              | Sin exposición   |
      | Rubéola IgG      | Inmunidad               | Sin inmunidad    |
