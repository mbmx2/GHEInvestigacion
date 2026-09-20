# language: es
# Neonatología: Cuidados del Recién Nacido
@status:proposed
@type:acceptance
@domain:maternity
Característica: Neonatología (GHE Maternidad)
  Como pediatra neonatólogo
  Quiero workflows para el cuidado del recién nacido
  Para detectar y tratar patologías neonatales a tiempo

  # ─────────────────────────────────────────────────────────────
  # 1. EVALUACIÓN INMEDIATA
  # ─────────────────────────────────────────────────────────────

  Escenario: Evaluación del recién nacido al nacer
    Dado que nace un bebé
    Cuando se realiza evaluación
    Entonces el sistema guía:
      | Evaluación                  |
      | APGAR a 1 y 5 minutos     |
      | Peso, talla, perímetro cefálico |
      | Temperatura                |
      | Examen físico completo     |
      | Reflejos primitivos        |
      | Screenings neonatales      |

  Escenario: Registro de APGAR
    Dado que se puntúa APGAR
    Cuando se registra
    Entonces el sistema calcula:
      | Componente                 | 0              | 1              | 2              |
      | Apariencia                 | Azul/pálido    | Cuerpo rosado  | Todo rosado    |
      | Pulso                      | Ausente        | <100           | >100           |
      | Gesticulación              | Ausente        | Mueca          | Llanto activo  |
      | Actividad                  | Flácido        | Flexión leve   | Movimiento activo |
      | Respiración                | Ausente        | Irregular      | Buena, llanto  |
    Y el sistema puntúa y clasifica:
      | Puntaje                    | Clasificación  |
      | 7-10                       | Normal         |
      | 4-6                        | Depresión moderada |
      | 0-3                        | Depresión severa (emergencia) |

  # ─────────────────────────────────────────────────────────────
  # 2. SCREENINGS NEONATALES
  # ─────────────────────────────────────────────────────────────

  Escenario: Screening de hipotiroidismo congénito
    Dado que se realiza screening neonatal
    Cuando se toma muestra de talón
    Entonces el sistema registra:
      | Estudio                    | Valor normal     | Alerta    |
      | TSH neonatal               | <10 mUI/L        | >20: confirmar |
      | T4 neonatal                | >7 µg/dL         | <5: confirmar |

  Escenario: Screening de fenilcetonuria
    Dado que se realiza screening neonatal
    Cuando se evalúa
    Entonces:
      | Estudio                    | Valor normal     | Alerta    |
      | Fenilalanina               | <2 mg/dL         | >4: confirmar |

  Escenario: Screening de anemia falciforme
    Dado que se realiza screening neonatal
    Cuando se evalúa
    Entonces:
      | Estudio                    | Valor normal     | Alerta    |
      | Hemoglobina electroforesis | HbF predominante | HbS: sospecha |

  # ─────────────────────────────────────────────────────────────
  # 3. ICTERICIA NEONATAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Detección de ictericia
    Dado que el recién nacido presenta ictericia
    Cuando se evalúa
    Entonces el sistema calcula:
      | Parámetro                  | Normal           | Alerta    |
      | Bilirrubina total (transcutánea) | <5 mg/dL a las 24h | >5: evaluar |
      | Bilirrubina total (sérica) | <12 mg/dL | >15: fototerapia |
    Y el sistema evalúa riesgo:
      | Factor                      | Riesgo aumentado |
      | Edad gestacional <38 sem   | Sí               |
      | Pérdida de peso >10%       | Sí               |
      | Amamantamiento exclusivo   | Monitorear        |
      | Hemólisis                  | Sí               |

  # ─────────────────────────────────────────────────────────────
  # 4. PREMATURIDAD
  # ─────────────────────────────────────────────────────────────

  Escenario: Clasificación de prematuridad
    Dado que nace un bebé prematuro
    Cuando se clasifica
    Entonces:
      | Clasificación              | Semanas | Peso aprox |
      | Extremadamente prematuro   | <28     | <1,000g    |
      | Muy prematuro              | 28-32   | 1,000-1,500g |
      | Prematuro tardío           | 32-37   | 1,500-2,500g |
    Y el sistema genera plan según clasificación:
      | Clasificación              | Cuidados         |
      | Extremadamente prematuro   | UCIN, ventilación |
      | Muy prematuro              | UCIN, apoyo respiratorio |
      | Prematuro tardío           | Observación, termorregulación |

  # ─────────────────────────────────────────────────────────────
  # 5. BAJO PESO AL NACER
  # ─────────────────────────────────────────────────────────────

  Escenario: Clasificación de bajo peso
    Dado que el bebé nace con bajo peso
    Cuando se clasifica
    Entonces:
      | Clasificación              | Peso      | Acción |
      | Bajo peso                  | <2,500g   | Monitoreo |
      | Muy bajo peso              | <1,500g   | UCIN |
      | Extremadamente bajo peso   | <1,000g   | UCIN especial |
    Y el sistema evalúa causa:
      | Causa                      | Probable         |
      | Prematuridad              | Edad gestacional |
      | Restricción intrauterina   | Biometría fetal  |
      | Ambos                      | Prematuro + IUGR |

  # ─────────────────────────────────────────────────────────────
  # 6. LACTANCIA NEONATAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Apoyo a lactancia en neonato
    Dado que el recién nacido necesita lactancia
    Cuando se evalúa
    Entonces el sistema verifica:
      | Verificación               | Estado    |
      | Primer amamantamiento <1h  | Verificar |
      | Lactancia cada 2-3 horas  | Verificar |
      | Señales de alimentación    | Verificar |
      | Pérdida de peso <10%       | Verificar |
      | Sin ictericia severa       | Verificar |

  # ─────────────────────────────────────────────────────────────
  # 7. VACUNACIÓN NEONATAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Vacunas neonatales
    Dado que nace el bebé
    Cuando se verifica esquema vacunal
    Entonces:
      | Vacuna                    | Momento          |
      | BCG (tuberculosis)        | Al nacer         |
      | Hepatitis B (1ra dosis)   | Primeras 24 horas|
    Y se registra en expediente del bebé

  # ─────────────────────────────────────────────────────────────
  # 8. SEGUIMIENTO
  # ─────────────────────────────────────────────────────────────

  Escenario: Control neonatal post-alta
    Dado que el bebé egresa de la maternidad
    Cuando se planifica seguimiento
    Entonces:
      | Control                     | Tiempo           |
      | Evaluación de peso         | 48-72 horas post-nacimiento |
      | Screening neonatal resultado| 2 semanas       |
      | Control de ictericia       | 48-72 horas post-nacimiento |
      | Control pediátrico         | 1 mes            |
