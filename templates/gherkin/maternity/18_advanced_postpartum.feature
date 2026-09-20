# language: es
# Posparto Avanzado: Cesárea, Infección, Trombosis, Ejercicio
@status:proposed
@type:acceptance
@domain:maternity
Característica: Posparto Avanzado (GHE Maternidad)
  Como médico de la maternidad
  Quiero protocolos completos de posparto avanzado
  Para detectar y manejar complicaciones tardías

  # ─────────────────────────────────────────────────────────────
  # 1. CUIDADOS POST-CESÁREA
  # ─────────────────────────────────────────────────────────────

  Escenario: Protocolo de cuidados post-cesárea
    Dado que la paciente tuvo cesárea
    Cuando se activa protocolo
    Entonces el sistema guía:
      | Hora post-op | Actividad |
      | 0-2h         | Monitoreo continuo, oxígeno, hidratación IV |
      | 2-6h         | Evaluar movable, signos vitales cada 30 min |
      | 6-12h        | Próximo alimento líquido, caminar con ayuda |
      | 12-24h       | Dieta blanda, caminar, quitar sonda vesical |
      | 24-48h        | Dieta progresiva, curación de herida |
      | 48-72h        | Evaluación de alta si sin complicaciones |

  Escenario: Criterios de alta post-cesárea
    Dado que se evalúa alta post-cesárea
    Cuando se verifica
    Entonces debe cumplir:
      | Criterio                   | Estado    |
      | Tolerancia oral            | ✅         |
      | Dolor controlado           | ✅ (EVA <4) |
      | Herida estable             | ✅         |
      | Orinando espontáneamente   | ✅         |
      | Sin fiebre                 | ✅         |
      | Lactancia iniciada         | ✅         |

  Escenario: Signos de alarma post-cesárea
    Dado que la paciente egresa post-cesárea
    Cuando recibe educación
    Entonces incluye:
      | Signo de alarma            | Acción |
      | Fiebre >38°C               | Acudir a emergencia |
      | Enrojecimiento, calor, supuración en herida | Acudir |
      | Dolor intenso que no mejora con analgésico | Acudir |
      | Sangrado abundante         | Acudir a emergencia |
      | Dolor en pantorrilla       | Acudir (trombosis) |
      | Dificultad para respirar   | Acudir a emergencia |

  # ─────────────────────────────────────────────────────────────
  # 2. INFECCIÓN POSPARTO
  # ─────────────────────────────────────────────────────────────

  Escenario: Detección de infección posparto
    Dado que la paciente presenta signos de infección
    Cuando se evalúa
    Entonces el sistema clasifica:
      | Tipo de infección          | Signos             | Tratamiento |
      | Endometritis               | Fiebre, dolor uterino, loquios fétidos | Antibiótico IV |
      | Infección de herida        | Eritema, calor, supuración | Antibiótico oral, curaciones |
      | Absceso mamario            | Dolor, enrojecimiento, fiebre | Antibiótico + vacío |
      | Infección urinaria         | Disuria, poliuria, fiebre | Antibiótico oral |
      | Pielonefritis posparto     | Fiebre alta, flanco, náuseas | Antibiótico IV |

  Escenario: Protocolo de endometritis
    Dado que se diagnostica endometritis
    Cuando se inicia tratamiento
    Entonces:
      | Paso | Acción |
      | 1 | Clindamicina 900mg IV cada 8h + Gentamicina 5mg/kg IV cada 24h |
      | 2 | Si no mejora en 48h → ampliar cobertura |
      | 3 | Considerar absceso pélvico (ecografía) |
      | 4 | Si absceso → drenaje + antibiótico |

  # ─────────────────────────────────────────────────────────────
  # 3. TROMBOSIS VENOSA PROFUNDA
  # ─────────────────────────────────────────────────────────────

  Escenario: Prevención de TVP postparto
    Dado que la paciente tiene factores de riesgo
    Cuando se evalúa
    Entonces el sistema verifica:
      | Factor de riesgo           | Presente |
      | Cesárea                    | Verificar |
      | Inmovilización prolongada  | Verificar |
      | Obesidad                   | Verificar |
      | Antecedentes de TVP        | Verificar |
      | Tabaquismo                 | Verificar |
    Y si ≥2 factores:
      | Prevención                  |
      | Movilización temprana       |
      | Medias de compresión        |
      | Heparina profiláctica si alto riesgo |
      | Educación sobre signos de TVP |

  Escenario: Detección de TVP
    Dado que la paciente presenta signos de TVP
    Cuando se evalúa
    Entonces el sistema guía:
      | Signo                       | Evaluación        |
      | Dolor en pantorrilla        | Signo de Homans   |
      | Inflamación unilateral      | Medir circunferencia |
      | Calor local                 | Palpación         |
      | Enrojecimiento              | Inspección        |
    Y solicita:
      | Estudio                    |
      | D-dímero                   |
      | Ecografía doppler venoso   |
    Y si confirma TVP:
      | Tratamiento                 |
      | Heparina de bajo peso molecular |
      | Anticoagulación 6 semanas  |
      | Referencia a hematólogo    |

  # ─────────────────────────────────────────────────────────────
  # 4. EJERCICIO POSPARTO
  # ─────────────────────────────────────────────────────────────

  Escenario: Retorno al ejercicio postparto
    Dado que la paciente quiere retomar ejercicio
    Cuando se evalúa
    Entonces el sistema guía según tipo de parto:
      | Tipo de parto | Retorno al ejercicio |
      | Vaginal sin complicaciones | Caminar desde día 1, ejercicio suave 2 semanas |
      | Vaginal con episiotomía | Caminar desde día 1, evitar sentadillas 4 semanas |
      | Cesárea sin complicaciones | Caminar desde día 1, ejercicio abdominal 6 semanas |
      | Cesárea con complicaciones | Según indicación médica |

  Escenario: Progresión de ejercicio postparto
    Dado que se planifica retorno al ejercicio
    Cuando se establece progresión
    Entonces:
      | Semana postparto | Actividad |
      | 0-2              | Caminar 10-15 min/día |
      | 2-4              | Caminar 20-30 min/día, ejercicios de suelo pélvico |
      | 4-6              | Ejercicio suave (yoga, pilates adaptado) |
      | 6-8              | Ejercicio moderado (natación, caminar rápido) |
      | 8-12             | Retorno gradual a ejercicio previo |
      | >12              | Actividad completa si sin complicaciones |

  # ─────────────────────────────────────────────────────────────
  # 5. EPISIOTOMÍA
  # ─────────────────────────────────────────────────────────────

  Escenario: Cuidados de episiotomía
    Dado que la paciente tiene episiotomía
    Cuando se evalúa
    Entonces el sistema guía:
      | Cuidado                     | Frecuencia        |
      | Lavar con agua y jabón     | Cada vez que orine |
      | Aplicar compresas frías    | Primeras 24 horas |
      | Sentar sobre almohada     | Primeras 2 semanas |
      | Evitar sentadillas profundas | 4 semanas      |
      | Evitar relaciones sexuales | 6 semanas         |
      | Curación con sulfadiazina  | Si hay suturas |
