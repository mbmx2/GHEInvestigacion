# language: es
# Urgencias Generales
@status:proposed
@type:acceptance
@domain:hospital
Característica: Atención de Urgencias (GHE Hospital)
  Como médico de urgencias del hospital
  Quiero workflows de urgencias generales
  Para atender emergencias que no son obstétricas

  # ─────────────────────────────────────────────────────────────
  # 1. TRIAJE DE URGENCIAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Clasificación de triaje (5 niveles)
    Dado que se clasifica paciente en urgencias
    Cuando se evalúa
    Entonces:
      | Nivel | Color   | Tiempo máx | Ejemplo |
      | 1     | Rojo    | Inmediato  | Paro cardíaco, trauma mayor |
      | 2     | Naranja | 10 min     | Dolor torácico, ACV |
      | 3     | Amarillo| 30 min     | Fiebre alta, fractures |
      | 4     | Verde   | 60 min     | Resfriado, dolor leve |
      | 5     | Azul    | 120 min    | Receta, duda |

  # ─────────────────────────────────────────────────────────────
  # 2. EMERGENCIAS MÉDICAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Dolor torácico
    Dado que el paciente llega con dolor torácico
    Cuando se evalúa
    Entonces el sistema guía:
      | Paso                       | Tiempo |
      | ECG de 12 derivaciones    | 10 min |
      | Troponina                 | 15 min |
      | Rx tórax                  | 15 min |
      | Acceso venoso             | Inmediato |
      | Oxígeno si SpO2 <94%     | Inmediato |
      | Aspirina 300mg            | Inmediato |
      | Score HEART               | Inmediato |

  Escenario: Accidente cerebrovascular
    Dado que se sospecha ACV
    Cuando se evalúa
    Entonces el sistema guía:
      | Paso                       | Tiempo |
      | NIHSS                      | 5 min  |
      | TAC craneal sin contraste  | 25 min |
      | Glucosa capilar            | Inmediato |
      | Evaluar ventana trombolítica| <4.5h |
      | Evaluar ventana trombectomía| <24h  |

  # ─────────────────────────────────────────────────────────────
  # 3. TRAUMATISMO
  # ─────────────────────────────────────────────────────────────

  Escenario: Evaluación primaria (ATLS)
    Dado que llega paciente politraumatizado
    Cuando se evalúa
    Entonces el sistema guía:
      | Paso | Evaluación |
      | A    | Vía aérea + C-spine |
      | B    | Respiración |
      | C    | Circulación + hemorragia |
      | D    | Discapacidad (Glasgow) |
      | E    | Exposición/Examen |

  # ─────────────────────────────────────────────────────────────
  # 4. INTOXICACIONES
  # ─────────────────────────────────────────────────────────────

  Escenario: Manejo de intoxicación
    Dado que llega paciente intoxicado
    Cuando se evalúa
    Entonces el sistema guía:
      | Sustancia                 | Antídoto/Tratamiento |
      | Paracetamol               | NAC (N-acetilcisteína) |
      | Organofosforados          | Atropina + pralidoxima |
      | Benzodiazepinas           | Flumazenil          |
      | Opioides                  | Naloxona            |
      | Metanol                   | Fomepizol           |
      | Hierro                    | Deferoxamina        |

  # ─────────────────────────────────────────────────────────────
  # 5. EPISTAXIS
  # ─────────────────────────────────────────────────────────────

  Escenario: Manejo de epistaxis
    Dado que el paciente llega con epistaxis
    Cuando se evalúa
    Entonces el sistema guía:
      | Paso                       |
      | Compresión nasal 15 min   |
      | Oxígeno nasal             |
      | Acceso venoso             |
      | Si no cede: taponamiento  |
      | Si no cede: arteriografía + embolización |

  # ─────────────────────────────────────────────────────────────
  # 6. PROTOCOLO DE CÓDIGO AZUL (PARO)
  # ─────────────────────────────────────────────────────────────

  Escenario: Protocolo de paro cardíaco
    Dado que se activa código azul
    Cuando se ejecuta
    Entonces:
      | Paso                       | Tiempo |
      | RCP de alta calidad       | Inmediato |
      | Desfibrilación            | <3 min |
      | Adrenalina cada 3-5 min   | Cada 3-5 min |
      | Amiodarona si VF/pVT      | 2da descarga |
      | Reevaluación cada 2 min   | Cada 2 min |
      | Considerar causa reversible| Continuo |
    Y factores H's y T's:
      | H's                        | T's          |
      | Hipovolemia               | Taponamiento cardíaco |
      | Hipoxia                   | TEP           |
      | Hidrogenión (acidosis)    | Tórax abierto  |
      | Hipokalemia               | Tension neumotórax |
      | Hipotermia                | Toxinas        |

  # ─────────────────────────────────────────────────────────────
  # 7. REGISTRO DE URGENCIAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Documentación de urgencia
    Dado que se atiende urgencia
    Cuando se documenta
    Entonces incluye:
      | Sección                   |
      | Motivo de consulta       |
      | Exploración física        |
      | Signos vitales           |
      | Diagnóstico              |
      | Tratamiento realizado    |
      | Estudios solicitados     |
      | Evolución                |
      | Destino (alta/hospitalización/referencia) |
      | Indicaciones de seguimiento |
