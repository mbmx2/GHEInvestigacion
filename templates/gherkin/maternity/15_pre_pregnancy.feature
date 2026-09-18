# language: es
# Pre-Embarazo: Planificación Familiar y Salud Preconcepcional
Característica: Atención Preconcepcional (GHE Maternidad)
  Como médico de la maternidad
  Quiero workflows de pre-embarazo
  Para que las mujeres lleguen al embarazo en las mejores condiciones posibles

  # ─────────────────────────────────────────────────────────────
  # 1. CONSULTA PRECONCEPCIONAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Consulta preconcepcional completa
    Dado que la mujer acude antes de embarazarse
    Cuando se realiza evaluación
    Entonces el sistema guía:
      | Sección                   |
      | Historia menstrual        |
      | Antecedentes ginecológicos|
      | Antecedentes obstétricos  |
      | Enfermedades crónicas     |
      | Medicamentos actuales     |
      | Alergias                  |
      | Hábitos (tabaco, alcohol, drogas) |
      | Historia familiar         |
      | Examen físico             |
      | Laboratorios basales     |

  # ─────────────────────────────────────────────────────────────
  # 2. VACUNACIÓN PRECONCEPCIONAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Verificar estado de vacunación
    Dado que se evalúa estado vacunal
    Cuando se revisa
    Entonces el sistema verifica:
      | Vacuna                    | Requerida         | Estado |
      | Rubéola                   | 2 dosis o inmunidad| Verificar |
      | Hepatitis B               | 3 dosis o inmunidad| Verificar |
      | Varicela                  | 2 dosis o inmunidad| Verificar |
      | Influenza                 | Anual             | Actualizar |
      | Tdap                      | Cada 10 años      | Verificar |
      | COVID-19                  | Esquema completo  | Verificar |

  Escenario: Vacunas pendientes antes de embarazo
    Dado que la paciente necesita vacuna de rubéola
    Cuando se evalúa
    Entonces el sistema alerta:
      | Alerta                      |
      | "Paciente no tiene inmunidad contra rubéola" |
      | "Aplicar vacuna MMR"       |
      | "Esperar 1 mes después de vacuna antes de embarazarse" |
      | "Rubéola en embarazo causa sordera, ceguera, malformaciones" |

  # ─────────────────────────────────────────────────────────────
  # 3. ASESORÍA GENÉTICA
  # ─────────────────────────────────────────────────────────────

  Escenario: Evaluación de riesgo genético
    Dado que se evalúa historial familiar
    Cuando se detectan antecedentes
    Entonces el sistema clasifica:
      | Antecedente                | Riesgo             | Acción |
      | Enfermedad metabólica hereditaria | Medio | Tamizaje |
      | Malformación congénita familiar | Medio | Evaluación |
      | Consanguinidad            | Alto               | Referencia genética |
      | Edad materna >35 años     | Medio              | Tamizaje |

  # ─────────────────────────────────────────────────────────────
  # 4. NUTRICIÓN PRECONCEPCIONAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Recomendaciones nutricionales
    Dado que se asesora antes del embarazo
    Cuando se dan recomendaciones
    Entonces incluye:
      | Recomendación              |
      | Ácido fólico 400-800 µg/día (mínimo 1 mes antes) |
      | Hierro si anemia          |
      | Calcio 1000 mg/día        |
      | Peso saludable (IMC 18.5-24.9) |
      | Alimentación equilibrada  |
      | Actividad física regular  |
      | Evitar tabaco y alcohol   |

  # ─────────────────────────────────────────────────────────────
  # 5. MANEJO DE ENFERMEDADES CRÓNICAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Optimización antes de embarazo
    Dado que la paciente tiene diabetes antes de embarazarse
    Cuando se optimiza control
    Entonces el sistema verifica:
      | Verificación               | Meta      |
      | HbA1c                      | <6.5% antes de embarazo |
      | Retinopatía                | Evaluada  |
      | Nefropatía                 | Evaluada  |
      | Medicamentos               | Ajustar a seguros en embarazo |

  # ─────────────────────────────────────────────────────────────
  # 6. PLANIFICACIÓN FAMILIAR
  # ─────────────────────────────────────────────────────────────

  Escenario: Consejería anticonceptiva
    Dado que la mujer no desea embarazarse aún
    Cuando se asesora
    Entonces el sistema muestra opciones:
      | Método                     | Eficacia | Reversibilidad |
      | DI de cobre                | 99%      | Sí             |
      | DI hormonal                | 99%      | Sí             |
      | Implanon                   | 99%      | Sí             |
      | Pastilla anticonceptiva    | 91%      | Sí             |
      | Condón masculino           | 82%      | Sí             |
    Y el sistema registra método elegido y plan de seguimiento
