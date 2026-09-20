# language: es
# Cirugía Ginecológica
@status:proposed
@type:acceptance
@domain:hospital
Característica: Procedimientos Quirúrgicos Ginecológicos (GHE Hospital)
  Como cirujano ginecólogo del hospital
  Quiero workflows para cirugías ginecológicas
  Para realizar procedimientos de forma segura y documentada

  # ─────────────────────────────────────────────────────────────
  # 1. CIRUGÍAS MÁS FRECUENTES
  # ─────────────────────────────────────────────────────────────

  Escenario: Lista de cirugías ginecológicas
    Dado que se documentan cirugías ginecológicas
    Cuando se lista
    Entonces incluye:
      | Cirugía                    | CIE-9/10 |
      | Histerectomía total        | 68.4 / Z90.710 |
      | Miomectomía               | 74.3 / 74.4 |
      | Ooforectomía              | 65.3 / 65.4 |
      | Salpingectomía            | 66.2 / 66.6 |
      | Conección (conización)    | 67.1 / 67.611 |
      | Curetaje endometrial      | 69.5 / 69.52 |
      | Laparoscopia diagnóstica  | 54.2 / Z00.00 |

  # ─────────────────────────────────────────────────────────────
  # 2. PRE-OPERATORIO
  # ─────────────────────────────────────────────────────────────

  Escenario: Evaluación preoperatoria
    Dado que se programa cirugía ginecológica
    Cuando se evalúa pre-operatorio
    Entonces el sistema verifica:
      | Verificación               |
      | Consentimiento informado  |
      | Indicación quirúrgica     |
      | Evalucación preanestésica |
      | Estudios preoperatorios   |
      | Ayuno (8h sólidos, 2h líquidos) |
      | Profilaxis antibiótica    |
      | Tipo de sangre y Rh       |
      | Seguro/pago               |

  Escenario: Checklist prequirúrgico (OMS)
    Dado que se ejecuta checklist de la OMS
    Cuando se verifica
    Entonces:
      | Fase                       | Verificaciones |
      | Antes de inducción        | Identidad, sitio, procedimiento, consentimiento, alergias |
      | Antes de incisión         | Profilaxis, anticipación antibiótica |
      | Antes de salir de quirófano| Conteo instrumental, gasas, drenajes |

  # ─────────────────────────────────────────────────────────────
  # 3. INTRA-OPERATORIO
  # ─────────────────────────────────────────────────────────────

  Escenario: Registro intraoperatorio
    Dado que se realiza cirugía ginecológica
    Cuando se documenta
    Entonces el sistema registra:
      | Campo                     |
      | Procedimiento realizado  |
      | Hallazgos               |
      | Complicaciones          |
      | Pérdida sanguínea        |
      | Tiempo quirúrgico        |
      | Materiales/implantes     |
      | Cultivos tomados         |
      | Estado del paciente      |

  # ─────────────────────────────────────────────────────────────
  # 4. POST-OPERATORIO
  # ─────────────────────────────────────────────────────────────

  Escenario: Cuidados postoperatorios
    Dado que el paciente regresa de quirófano
    Cuando se inician cuidados
    Entonces el sistema guía:
      | Actividad                  | Frecuencia |
      | Signos vitales            | Cada 1h primeras 4h, luego cada 4h |
      | Control del dolor         | Cada 4h EVA |
      | Movilización temprana     | 6-12h post-op |
      | Dieta                     | según tolerancia |
      | Drenaje (si aplica)       | Control de volumen |
      | Curación de herida        | 24-48h |

  # ─────────────────────────────────────────────────────────────
  # 5. COMPLICACIONES QUIRÚRGICAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Detección de complicación post-cirugía
    Dado que se detecta complicación
    Cuando se evalúa
    Entonces el sistema clasifica:
      | Complicación              | Signos            | Acción |
      | Hemorragia                | Dolor + distensión| Evaluar, posible reintervención |
      | Infección de herida       | Fiebre, eritema   | Antibiótico, curaciones |
      | Trombosis                 | Dolor pantorrilla | Ecografía doppler |
      | Dehiscencia de herida     | Separación de bordes | Reintervención |
      | Fístula                   | Flujo por herida  | Evaluación |

  # ─────────────────────────────────────────────────────────────
  # 6. LAPAROSCOPIA
  # ─────────────────────────────────────────────────────────────

  Escenario: Registro de laparoscopia
    Dado que se realiza laparoscopia ginecológica
    Cuando se documenta
    Entonces el sistema registra:
      | Campo                     |
      | Indicación              |
      | Hallazgos               |
      | Procedimientos realizados |
      | Complicaciones          |
      | Tiempo quirúrgico        |
      | Tipo de anestesia        |
      | Estado al egreso         |
