# language: es
# Cocina - Dietas Específicas y HACCP
Característica: Dietas Específicas (GHE Hospital)
  Como nutriólogo del hospital
  Quiero workflows para dietas específicas por patología
  Para asegurar nutrición adecuada según condición clínica

  # ─────────────────────────────────────────────────────────────
  # 1. DIETA PARA DIABÉTICOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Dieta para diabetes tipo 2
    Dado que se prescribe dieta diabética
    Cuando se planifica
    Entonces:
      | Parámetro                  | Recomendación |
      | Calorías                  | 25-30 kcal/kg/día |
      | Carbohidratos             | 45-60% calóricos |
      | Proteínas                 | 15-20% calóricos |
      | Lípidos                   | 25-35% calóricos |
      | Fibra                     | 25-30 g/día      |
      | Comidas                   | 5-6 comidas/día  |
      | Horarios fijos            | Sí               |

  # ─────────────────────────────────────────────────────────────
  # 2. DIETA PARA INSUFICIENCIA RENAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Dieta para ERC prediálisis
    Dado que se prescribe dieta renal
    Cuando se planifica
    Entonces:
      | Nutriente                 | Restricción |
      | Sodio                     | <2 g/día    |
      | Potasio                   | <2 g/día (si hiperK) |
      | Fósforo                   | <800 mg/día |
      | Proteínas                 | 0.6-0.8 g/kg/día |
      | Líquidos                  | Según diuresis  |
      | Calorías                  | 30-35 kcal/kg/día |

  Escenario: Dieta para hemodiálisis
    Dado que el paciente está en hemodiálisis
    Cuando se planifica dieta
    Entonces:
      | Parámetro                  | Recomendación |
      | Proteínas                 | 1.0-1.2 g/kg/día (interdialítico) |
      | Potasio                   | <2 g/día        |
      | Fósforo                   | <800 mg/día     |
      | Sodio                     | <2 g/día        |
      | Líquidos                  | Diuresis + 500 mL |
      | Calorías                  | 30-35 kcal/kg/día|

  # ─────────────────────────────────────────────────────────────
  # 3. DIETA PARA INSUFICIENCIA CARDÍACA
  # ─────────────────────────────────────────────────────────────

  Escenario: Dieta para IC
    Dado que se prescribe dieta para IC
    Cuando se planifica
    Entonces:
      | Parámetro                  | Recomendación |
      | Sodio                     | <2 g/día       |
      | Líquidos                  | <1.5 L/día (si severa) |
      | Calorías                  | 25-30 kcal/kg/día |
      | Proteínas                 | 1.0 g/kg/día    |
      | Comidas                   | 5-6 pequeñas     |

  # ─────────────────────────────────────────────────────────────
  # 4. DIETA PARA DESNUTRICIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Dieta de repleción
    Dado que el paciente está desnutrido
    Cuando se planifica dieta de repleción
    Entonces:
      | Parámetro                  | Recomendación |
      | Calorías                  | 30-35 kcal/kg/día |
      | Proteínas                 | 1.2-1.5 g/kg/día |
      | Frecuencia comidas        | 6-8 comidas/día  |
      | Suplemento oral           | Sí (Sustagen o similar) |
      | Monitoreo peso            | Semanal          |

  # ─────────────────────────────────────────────────────────────
  # 5. NUTRICIÓN PARENTERAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Indicaciones de nutrición parenteral
    Dado que se evalúa necesidad de NP
    Cuando se indica
    Entonces:
      | Indicación                |
      | ICV por >7 días           |
      | Imposibilidad de ingesta  |
      | Delgamiento intestinal severo |
      | Quemados severos          |

  Escenario: Control de nutrición parenteral
    Dado que paciente recibe NP
    Cuando se monitorea
    Entonces:
      | Parámetro                  | Frecuencia |
      | Glucosa capilar           | Cada 6h     |
      | Electrolitos              | Diario      |
      | Función hepática          | Semanal     |
      | Balance hídrico           | Diario      |
      | Peso                      | Diario      |
      | Sitio de infusión         | Cada turno  |

  # ─────────────────────────────────────────────────────────────
  # 6. HACCP EN COCINA HOSPITALARIA
  # ─────────────────────────────────────────────────────────────

  Escenario: Puntos Críticos de Control (HACCP)
    Dado que se implementa HACCP
    Cuando se verifica
    Entonces:
      | CCP | Peligro          | Límite           | Monitoreo | Acción correctiva |
      | 1   | Microbiológico   | Temp <4°C recep  | Cada llegada | Rechazar si >7°C |
      | 2   | Microbiológico   | Temp almacenamiento | Cada 4h  | Ajustar temp    |
      | 3   | Microbiológico   | Temp cocción >74°C| Cada lote  | Recocinar      |
      | 4   | Microbiológico   | Temp servicio >60°C | Al servir | Recalentar     |
      | 5   | Químico          | Alérgenos         | Cada preparación | Etiquetar |
