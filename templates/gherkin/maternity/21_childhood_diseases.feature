# language: es
# Enfermedades Comunes en Infancia (0-5 años)
@status:proposed
@type:acceptance
@domain:maternity
Característica: Enfermedades Infantiles (GHE Maternidad)
  Como pediatra de la maternidad
  Quiero workflows para las enfermedades más comunes en infancia
  Para diagnosticar y tratar correctamente

  # ─────────────────────────────────────────────────────────────
  # 1. INFECCIONES RESPIRATORIAS AGUDAS (IRA)
  # ─────────────────────────────────────────────────────────────

  Escenario: Clasificación de IRA por severidad
    Dado que el niño acude con IRA
    Cuando se clasifica
    Entonces:
      | Severidad | Edad      | Señales              | Acción |
      | Leve      | Cualquiera| Fiebre <38, flujo nasal | Sintomático, 48-72h control |
      | Moderada  | >6 meses  | Fiebre >38, tos productiva | Evaluar neumonía |
      | Severa    | <6 meses  | Dificultad respiratoria | Emergencia |

  Escenario: Manejo de bronquiolitis
    Dado que el niño <2 años acude con bronquiolitis
    Cuando se evalúa
    Entonces el sistema guía:
      | Evaluación                  |
      | SpO2                        |
      | Frecuencia respiratoria     |
      | Uso de músculos accesorios  |
      | Alimentación                |
      | Edema de párpados           |
    Y clasifica según talón clínico:
      | SpO2 >92% y FR <60 y sin distress | Leve: casa |
      | SpO2 90-92% o FR 60-70       | Moderada: observación |
      | SpO2 <90% o FR >70           | Severa: hospitalización |

  # ─────────────────────────────────────────────────────────────
  # 2. INFECCIONES GASTROINTESTINALES (IGI)
  # ─────────────────────────────────────────────────────────────

  Escenario: Clasificación de deshidratación en diarrea
    Dado que el niño acude con diarrea
    Cuando se evalúa deshidratación
    Entonces usa escala de EMS:
      | Signo                       | Sin deshidratación | Leve | Moderada | Severa |
      | Estado general             | Alerta             | Inquieto | Letárgico | Muy letárgico |
      | Ojos                        | Normales           | Hundidos | Muy hundidos | Muy hundidos |
      | Lágrimas                    | Presentes          | Ausentes | Ausentes | Ausentes |
      | Boca/mucosa                 | Húmeda             | Seca    | Muy seca | Muy seca |
      | Bebida                      | Normal             | Sedienta| Muy sediente | No bebe |
      | Skin pinch                  | Vuelve rápido      | Vuelve lento | Vuelve muy lento | No vuelve |

  Escenario: Manejo según deshidratación
    Dado que se clasifica deshidratación
    Cuando se maneja
    Entonces:
      | Severidad | Tratamiento |
      | Sin deshidratación | SRO en casa, alimentación continua |
      | Leve | SRO supervisado en clínica |
      | Moderada | SRO por sonda nasogástrica o IV |
      | Severa | IV urgente + monitoreo |

  # ─────────────────────────────────────────────────────────────
  # 3. FIEBRE
  # ─────────────────────────────────────────────────────────────

  Escenario: Evaluación de fiebre en niño
    Dado que el niño tiene fiebre
    Cuando se evalúa
    Entonces el sistema guía:
      | Edad      | Fiebre    | Evaluación         | Acción |
      | <3 meses  | ≥38.0°C   | Urgente            | Hospitalización |
      | 3-6 meses | ≥38.5°C   | Completa           | Labs + observación |
      | 6 meses-3 años | ≥39°C | Según foco         | Tratamiento |
      | >3 años   | ≥38.5°C   | Según síntomas     | Sintomático |

  Escenario: Manejo de fiebre
    Dado que se trata fiebre
    Cuando se prescribe
    Entonces:
      | Medicamento | Dosis               | Frecuencia |
      | Paracetamol | 15 mg/kg cada 6h   | Máx 4 veces/día |
      | Ibuprofeno  | 10 mg/kg cada 8h   | Máx 3 veces/día (>6 meses) |
      | No aspirina | CONTRAINDICADO en <18 años | Síndrome de Reye |

  # ─────────────────────────────────────────────────────────────
  # 4. OTITIS MEDIA AGUDA
  # ─────────────────────────────────────────────────────────────

  Escenario: Manejo de otitis media aguda
    Dado que el niño tiene otitis media aguda
    Cuando se evalúa
    Entonces el sistema guía:
      | Edad      | Tratamiento         |
      | <6 meses  | Antibiótico inmediato |
      | 6 meses-2 años, bilateral | Antibiótico inmediato |
      | 6 meses-2 años, unilateral leve | Observación 48-72h |
      | >2 años, unilateral | Observación o antibiótico |
    Y antibiótico de elección:
      | Medicamento | Dosis |
      | Amoxicilina | 80-90 mg/kg/día dividido cada 8-12h |
      | Duración | 10 días (<2 años), 5-7 días (>2 años) |

  # ─────────────────────────────────────────────────────────────
  # 5. PARASITOSIS
  # ─────────────────────────────────────────────────────────────

  Escenario: Manejo de parasitosis intestinal
    Dado que el niño tiene parasitosis
    Cuando se trata
    Entonces:
      | Parasito        | Tratamiento         |
      | Oxiuros          | Mebendazol 100mg dosis única |
      | Ascaris          | Albendazol 400mg dosis única |
      | Giardia          | Metronidazol 15mg/kg/día x 7 días |
      | Amiba             | Metronidazol 30-50mg/kg/día x 7-10 días |

  # ─────────────────────────────────────────────────────────────
  # 6. MANCHA BILIRRUBINICA (ICTERICIA)
  # ─────────────────────────────────────────────────────────────

  Escenario: Manejo de ictericia neonatal
    Dado que el recién nacido tiene ictericia
    Cuando se evalúa
    Entonces el sistema calcula:
      | Edad gestacional | Bilirrubina (mg/dL) | Acción |
      | >38 semanas | <12 | Observación |
      | >38 semanas | 12-15 | Fototerapia |
      | >38 semanas | >15 | Fototerapia intensiva |
      | 35-37 semanas | >12 | Fototerapia |
      | <35 semanas | >10 | Fototerapia urgente |

  # ─────────────────────────────────────────────────────────────
  # 7. DESNUTRICIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Clasificación de desnutrición infantil
    Dado que se evalúa estado nutricional del niño
    Cuando se clasifica
    Entonces:
      | Clasificación | IMC/edad       | Talla/edad | Acción |
      | Normal | 15-85 percentil | >-2 DE | Mantener |
      | Riesgo | <15 percentil | -1 a -2 DE | Vigilar |
      | Desnutrición moderada | <3 percentil | -2 a -3 DE | Suplementación |
      | Desnutrición severa | Muy bajo | <-3 DE | Hospitalización |

  Escenario: Manejo de desnutrición moderada
    Dado que se detecta desnutrición moderada
    Cuando se trata
    Entonces:
      | Paso | Acción |
      | 1 | Suplemento terapéutico (plumpy'nut o similar) |
      | 2 | Educación alimentaria a cuidador |
      | 3 | Seguimiento semanal de peso |
      | 4 | Referencia si no mejora en 2 semanas |
