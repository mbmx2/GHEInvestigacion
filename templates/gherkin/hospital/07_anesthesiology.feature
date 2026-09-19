# language: es
# Anestesiología
Característica: Gestión de Anestesia (GHE Hospital)
  Como anestesiólogo del hospital
  Quiero workflows de anestesia
  Para garantizar seguridad del paciente durante procedimientos

  # ─────────────────────────────────────────────────────────────
  # 1. EVALUACIÓN PREANESTÉSICA
  # ─────────────────────────────────────────────────────────────

  Escenario: Evaluación preanestésica completa
    Dado que se programa procedimiento con anestesia
    Cuando se realiza evaluación
    Entonces el sistema guía:
      | Sección                   |
      | Antecedentes personales   |
      | Alergias                  |
      | Medicamentos actuales     |
      | Antecedentes anestésicos  |
      | Exploración física        |
      | Vía aérea (Mallampati)    |
      | ASA                       |
      | Plan anestésico           |
      | Consentimiento informado  |

  Escenario: Clasificación ASA
    Dado que se clasifica paciente
    Entonces:
      | ASA    | Descripción               | Riesgo |
      | ASA I  | Sano                      | Bajo   |
      | ASA II | Enfermedad leve           | Leve   |
      | ASA III| Enfermedad severa         | Moderado|
      | ASA IV | Amenaza vida              | Alto   |
      | ASA V  | Moribundo                 | Muy alto|

  # ─────────────────────────────────────────────────────────────
  # 2. MONITOREO INTRAOPERATORIO
  # ─────────────────────────────────────────────────────────────

  Escenario: Monitoreo estándar
    Dado que se realiza procedimiento
    Cuando se monitorea
    Entonces:
      | Parámetro                  | Frecuencia |
      | ECG continuo              | Continuo   |
      | SpO2                      | Continuo   |
      | Presión arterial          | Cada 3-5 min|
      | Temperatura               | Cada 15 min |
      | Capnografía               | Continuo   |

  # ─────────────────────────────────────────────────────────────
  # 3. RECUPERACIÓN POSTANESTÉSICA
  # ─────────────────────────────────────────────────────────────

  Escenario: Criterios de egreso de recuperación
    Dado que paciente llega a recuperación
    Cuando se evalúa
    Entonces:
      | Criterio                   |
      | PA estable (±20% basal)   |
      | FC estable                |
      | SpO2 >95%                 |
      | Consciente y cooperador   |
      | Dolor controlado (EVA <4) |
      | Sin náuseas/vómitos      |
      | Temperatura >36°C        |

  # ─────────────────────────────────────────────────────────────
  # 4. COMPLICACIONES
  # ─────────────────────────────────────────────────────────────

  Escenario: Manejo de complicación anestésica
    Dado que se detecta complicación
    Entonces el sistema clasifica:
      | Complicación              | Severidad | Acción |
      | Dificultad intubación     | Moderada  | Técnicas rescate |
      | Hipotensión               | Alta      | Volúmenes, vasopresores |
      | Arritmia                 | Alta      | Antiarrítmicos |
      | Anafilaxia               | Crítica   | Adrenalina |
      | Hipertermia maligna      | Crítica   | Dantroleno |

  # ─────────────────────────────────────────────────────────────
  # 5. ANESTESIA EN EMBARAZO
  # ─────────────────────────────────────────────────────────────

  Escenario: Consideraciones en cesárea
    Dado que se programa cesárea
    Entonces:
      | Verificación               |
      | Raquídea/peridural preferida |
      | Medicamentos seguros      |
      | Monitoreo fetal continuo  |
      | Posición Trendelenburg    |
