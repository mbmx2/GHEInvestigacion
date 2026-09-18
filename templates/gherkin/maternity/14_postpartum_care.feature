# language: es
# Cuidados Posparto
Característica: Control Posparto (GHE Maternidad)
  Como médico de la maternidad
  Quiero protocolos completos de cuidados posparto
  Para prevenir complicaciones después del parto

  # ─────────────────────────────────────────────────────────────
  # 1. CHECKLIST DE EGRESO POSPARTO
  # ─────────────────────────────────────────────────────────────

  Escenario: Checklist de egreso
    Dado que la paciente egresa después del parto
    Cuando se completa checklist
    Entonces incluye:
      | Verificación               | Estado    |
      | Hemorragia controlada      | ✅         |
      | PA estable                 | ✅         |
      | FC estable                 | ✅         |
      | Diuresis presente          | ✅         |
      | Lactancia iniciada         | ✅         |
      | Episiotomía/herida revisada| ✅         |
      | Educación entregada        | ✅         |
      | Próxima cita agendada      | ✅         |
      | Medicamentos de alta       | ✅         |
      | Contacto de emergencia     | ✅         |

  # ─────────────────────────────────────────────────────────────
  # 2. SIGNOS DE ALARMA POSPARTO
  # ─────────────────────────────────────────────────────────────

  Escenario: Educación sobre signos de alarma
    Dado que la paciente egresa
    Cuando recibe educación
    Entonces incluye:
      | Signo de alarma            | Acción             |
      | Sangrado >1/hora           | Acudir a emergencia|
      | Fiebre >38°C               | Acudir a emergencia|
      | Dolor intenso en episiotomía| Acudir a emergencia|
      | Enrojecimiento/supuración  | Acudir a emergencia|
      | Dolor en pantorrilla       | Acudir a emergencia|
      | Dificultad para orinar     | Acudir a emergencia|
      | Tristeza persistente >2 sem| Consultar médico  |

  # ─────────────────────────────────────────────────────────────
  # 3. CONTROL POSPARTO (6 SEMANAS)
  # ─────────────────────────────────────────────────────────────

  Escenario: Control posparto a las 6 semanas
    Dado que la paciente acude a control posparto
    Cuando se evalúa
    Entonces el sistema guía:
      | Evaluación                  |
      | Estado de la herida/episiotomía |
      | Involución uterina         |
      | Loquios (color, olor, cantidad) |
      | Lactancia materna          |
      | Estado emocional (Edinburgh) |
      | Planificación familiar     |
      | Anticoncepción elegida     |
      | Control de peso            |
      | Resultados de laboratorio  |

  # ─────────────────────────────────────────────────────────────
  # 4. DEPRESIÓN POSPARTO
  # ─────────────────────────────────────────────────────────────

  Escenario: Screening de depresión posparto
    Dado que se aplica Edinburgh Postnatal Depression Scale
    Cuando se evalúa
    Entonces:
      | Puntaje Edinburgh | Clasificación | Acción |
      | <10               | Bajo riesgo   | Seguimiento normal |
      | 10-12             | Moderado      | Reevaluar en 2 semanas |
      | 13-19             | Alto          | Tratamiento: Sertralina |
      | ≥20               | Muy alto      | Referencia psiquiátrica |

  # ─────────────────────────────────────────────────────────────
  # 5. PLANIFICACIÓN FAMILIAR
  # ─────────────────────────────────────────────────────────────

  Escenario: Asesoría de anticoncepción posparto
    Dado que se asesora sobre anticoncepción
    Cuando se evalúa
    Entonces el sistema muestra opciones:
      | Método                     | Eficacia | Tipo        |
      | DI de cobre                | 99%      | Irreversible|
      | DI hormonal                | 99%      | Irreversible|
      | Implanon                   | 99%      | Irreversible|
      | Inyectable trimestral      | 94%      | Reversible  |
      | Pastilla anticonceptiva    | 91%      | Reversible  |
      | Condón masculino           | 82%      | Barrera     |
    Y nota: Lactancia no es método anticonceptivo confiable
