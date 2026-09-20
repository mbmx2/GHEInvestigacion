# language: es
# FASE 2: Guía Clínica Automatizada - Módulo Maternidad
@status:proposed
@type:acceptance
@domain:maternity
Característica: Guía Clínica para Embarazo (GHE Maternidad)
  Como médico del proyecto GHE
  Quiero que el sistema me guíe paso a paso en cada situación clínica
  Para que no olvide ningún protocolo y cada paciente reciba atención de calidad

  # ─────────────────────────────────────────────────────────────
  # 1. PROTOCOLO: CONTROL PRENATAL RUTINARIO
  # ─────────────────────────────────────────────────────────────

  Escenario: Guía de control prenatal por trimestre
    Dado que la paciente acude a control prenatal
    Cuando se identifica trimestre
    Entonces el sistema muestra checklist:
      | Trimestre | Actividades obligatorias |
      | 1 (sem 1-13) | FUR/FPP, baseline labs, screening riesgos, suplementación |
      | 2 (sem 14-27) | Ecografía estructural, curva tolerancia glucosa, anti-D |
      | 3 (sem 28-40) | Monitoreo estrecho, plan de parto, inducción si >41 sem |

  # ─────────────────────────────────────────────────────────────
  # 2. PROTOCOLO: HIPERTENSIÓN GESTACIONAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Guía de hipertensión gestacional
    Dado que se detecta PA ≥140/90 en embarazada
    Cuando se activa protocolo
    Entonces el sistema guía paso a paso:
      | Paso | Acción |
      | 1 | Confirmar PA en ambos brazos |
      | 2 | Evaluar proteinuria |
      | 3 | Evaluar síntomas (cefalea, visión borrosa, dolor abdominal) |
      | 4 | Solicitar laboratorios (BHC, uricemia, función hepática, renal) |
      | 5 | Clasificar: Leve / Severa / Eclampsia |
      | 6 | Iniciar tratamiento según clasificación |

  Escenario: Guía de manejo de preeclampsia leve
    Dado que se diagnostica preeclampsia leve
    Cuando se activa manejo
    Entonces el sistema guía:
      | Paso | Acción |
      | 1 | Reposo relativo |
      | 2 | Labetalol 100mg VO cada 12h |
      | 3 | Control PA cada 4h |
      | 4 | Proteinuria semanal |
      | 5 | Laboratorios en 48-72h |
      | 6 | Ecografía para crecimiento fetal |
      | 7 | Considerar hospitalización si no mejora |

  Escenario: Guía de preeclampsia severa
    Dado que se diagnostica preeclampsia severa
    Cuando se activa emergencia
    Entonces el sistema guía:
      | Paso | Acción |
      | 1 | HOSPITALIZACIÓN INMEDIATA |
      | 2 | Labetalol 20mg IV lento |
      | 3 | Sulfato de magnesio si >20 semanas |
      | 4 | Corticoides si <34 semanas |
      | 5 | Monitoreo fetal continuo |
      | 6 | Evaluar terminación del embarazo |

  # ─────────────────────────────────────────────────────────────
  # 3. PROTOCOLO: DIABETES GESTACIONAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Guía de diabetes gestacional
    Dado que se confirma diabetes gestacional
    Cuando se activa protocolo
    Entonces el sistema guía:
      | Paso | Acción |
      | 1 | Educación nutricional (referir a nutriólogo) |
      | 2 | Monitoreo de glucosa 4 veces/día |
      | 3 | Meta: ayunas <95, 1h <180, 2h <155 |
      | 4 | Si no controla con dieta en 1-2 semanas → insulina |
      | 5 | Ecografía cada 4 semanas para crecimiento |
      | 6 | Planificar tipo de parto |

  # ─────────────────────────────────────────────────────────────
  # 4. PROTOCOLO: ANEMIA EN EMBARAZO
  # ─────────────────────────────────────────────────────────────

  Escenario: Guía de anemia moderada
    Dado que se detecta Hb <10 g/dL en embarazada
    Cuando se activa protocolo
    Entonces el sistema guía:
      | Paso | Acción |
      | 1 | Hierro oral 60mg cada 24h con vitamina C |
      | 2 | Reevaluar Hb en 4 semanas |
      | 3 | Si no sube → hierro IV |
      | 4 | Si Hb <7 → hospitalización |
      | 5 | Evaluar causa de anemia |

  # ─────────────────────────────────────────────────────────────
  # 5. PROTOCOLO: DEPRESIÓN PERINATAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Guía de depresión perinatal
    Dado que PHQ-9 ≥10 en embarazada o posparto
    Cuando se activa protocolo
    Entonces el sistema guía:
      | Paso | Acción |
      | 1 | Evaluar riesgo suicida |
      | 2 | Evaluar apoyo social |
      | 3 | Iniciar Sertralina 25-50mg/día |
      | 4 | Seguimiento semanal primer mes |
      | 5 | Reevaluar PHQ-9 cada 4 semanas |
      | 6 | Referir a psicología si disponible |

  # ─────────────────────────────────────────────────────────────
  # 6. PROTOCOLO: EMERGENCIA OBSTÉTRICA
  # ─────────────────────────────────────────────────────────────

  Escenario: Guía de hemorragia posparto
    Dado que hay hemorragia >500ml posparto
    Cuando se activa emergencia
    Entonces el sistema guía:
      | Paso | Acción |
      | 1 | Masaje uterino |
      | 2 | Oxitocina 10-20U IV |
      | 3 | Evaluar causa (4 T's) |
      | 4 | Acceso venoso x2 |
      | 5 | Solicitud de sangre |
      | 6 | Considerar cirugía si no responde |

  Escenario: Guía de sufrimiento fetal agudo
    Dado que se detecta sufrimiento fetal (FCF anormal)
    Cuando se activa protocolo
    Entonces el sistema guía:
      | Paso | Acción |
      | 1 | Posición lateral izquierda |
      | 2 | Oxígeno al 100% |
      | 3 | Hidratación IV |
      | 4 | Detener oxitocina si está corriendo |
      | 5 | Evaluar parto inmediato |
      | 6 | Considerar cesárea de emergencia |
