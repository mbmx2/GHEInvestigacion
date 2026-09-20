# language: es
# Nutrición en Embarazo
@status:proposed
@type:acceptance
@domain:maternity
Característica: Asesoría Nutricional (GHE Maternidad)
  Como nutriólogo de la maternidad
  Quiero planes alimentarios específicos por trimestre
  Para mejorar el estado nutricional de madres y bebés

  # ─────────────────────────────────────────────────────────────
  # 1. EVALUACIÓN NUTRICIONAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Evaluación nutricional inicial
    Dado que la paciente acude a consulta nutricional
    Cuando se evalúa
    Entonces el sistema registra:
      | Parámetro                  | Valor              |
      | Peso pre-embarazo         | [registrado]       |
      | Peso actual               | [registrado]       |
      | Talla                     | [registrado]       |
      | IMC pre-embarazo          | [calculado]        |
      | Ganancia de peso hasta ahora | [calculada]     |
      | Ganancia esperada (semana)| [calculada]        |
      | Estado nutricional        | [clasificación]    |

  # ─────────────────────────────────────────────────────────────
  # 2. RECOMENDACIONES POR TRIMESTRE
  # ─────────────────────────────────────────────────────────────

  Escenario: Recomendaciones 1er trimestre
    Dado que la paciente está en el 1er trimestre
    Cuando se dan recomendaciones
    Entonces incluye:
      | Recomendación              |
      | Calorías extra: 0 kcal    |
      | Ácido fólico: 600 µg/día  |
      | Hierro: 30 mg/día         |
      | Calcio: 1000 mg/día       |
      | Agua: 8 vasos/día         |
      | Evitar: alcohol, tabaco, café excesivo |

  Escenario: Recomendaciones 2do trimestre
    Dado que la paciente está en el 2do trimestre
    Cuando se dan recomendaciones
    Entonces incluye:
      | Recomendación              |
      | Calorías extra: 340 kcal/día |
      | Proteína: 71 g/día        |
      | Hierro: 30 mg/día         |
      | Calcio: 1000 mg/día       |
      | Ganancia de peso esperada: 5-6 kg en trimestre |

  Escenario: Recomendaciones 3er trimestre
    Dado que la paciente está en el 3er trimestre
    Cuando se dan recomendaciones
    Entonces incluye:
      | Recomendación              |
      | Calorías extra: 450 kcal/día |
      | Proteína: 75 g/día        |
      | Hierro: 30 mg/día         |
      | Calcio: 1000 mg/día       |
      | Comidas pequeñas y frecuentes |
      | Evitar: comidas copiosas   |

  # ─────────────────────────────────────────────────────────────
  # 3. MONITOREO DE PESO
  # ─────────────────────────────────────────────────────────────

  Escenario: Evaluación de ganancia de peso
    Dado que se registra peso actual
    Cuando se compara con meta
    Entonces:
      | Semana | Peso actual | Ganancia | Esperada | Estado |
      | 12     | 58 kg       | +2 kg    | +1-2 kg  | ✅ Normal |
      | 20     | 63 kg       | +7 kg    | +5-6 kg  | ⚠️ Alto |
      | 28     | 70 kg       | +14 kg   | +11-12 kg| ❌ Excesiva |

  # ─────────────────────────────────────────────────────────────
  # 4. PLAN ALIMENTARIO
  # ─────────────────────────────────────────────────────────────

  Escenario: Generación de plan alimentario
    Dado que se genera plan según trimestre
    Cuando se muestra
    Entonces incluye:
      | Comida                     | Contenido          |
      | Desayuno                   | Avena, fruta, huevo, leche |
      | Colación mañana            | Fruta, nueces       |
      | Comida                     | Proteína, verdura, arroz integral |
      | Colación tarde             | Yogurt, fruta       |
      | Cena                       | Proteína, ensalada, pan integral |
      | Total estimado             | [calorías/día]     |
