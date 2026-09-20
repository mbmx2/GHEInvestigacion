# language: es
# Salud Mental Infantil y Desarrollo Socioemocional
@status:proposed
@type:acceptance
@domain:maternity
Característica: Salud Mental Infantil (GHE Maternidad)
  Como pediatra del proyecto GHE
  Quiero workflows de salud mental infantil
  Para detectar trastornos del desarrollo y salud mental a tiempo

  # ─────────────────────────────────────────────────────────────
  # 1. EVALUACIÓN DEL DESARROLLO SOCIOEMOCIONAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Evaluación de hitos socioemocionales
    Dado que el niño acude a control de desarrollo
    Cuando se evalúa socioemocional
    Entonces el sistema verifica:
      | Edad     | Hito esperado                     |
      | 2 meses | Sonrisa social, mira caras        |
      | 6 meses | Reconoce padres, juguetes favoritos |
      | 12 meses| Separación ansiosa, imita gestos   |
      | 18 meses| Señala para compartir interés      |
      | 24 meses | Juego simbólico, copia acciones  |
      | 3 años   | Juego cooperativo, amigos imaginarios |
      | 4 años   | Entiende reglas, empatía básica   |
      | 5 años   | Control de impulsos, amistades    |

  # ─────────────────────────────────────────────────────────────
  # 2. TRASTORNOS DEL DESARROLLO
  # ─────────────────────────────────────────────────────────────

  Escenario: Detección de TEA (Trastorno del Espectro Autista)
    Dado que se sospecha TEA
    Cuando se evalúa
    Entonces el sistema verifica:
      | Señal de alerta             | Edad mínima |
      | No señala con dedo          | 12 meses    |
      | No dice 2 palabras espontáneas | 24 meses |
      | No responde a nombre        | 12 meses    |
      | Pérdida de habilidades      | Cualquier edad |
      | No hace contacto visual     | 6 meses     |
      | Intereses restringidos      | 24 meses    |
    Y si ≥2 señales → Referencia a neuropediatra/terapia del desarrollo

  Escenario: Detección de TDAH
    Dado que se sospecha TDAH
    Cuando se evalúa (niño >6 años)
    Entonces:
      | Síntoma                     | Frecuencia requerida |
      | Inatención                  | ≥6 meses, ≥6 síntomas |
      | Hiperactividad              | ≥6 meses, ≥6 síntomas |
      | Impulsividad                | ≥6 meses, ≥6 síntomas |
      | Interfiere en funciones     | Escuela + casa       |
    Y el sistema sugiere:
      | Acción                    |
      | Evaluación neurológica   |
      | Evaluación psicológica   |
      | Entrevista con maestros  |
      | Plan de intervención     |

  # ─────────────────────────────────────────────────────────────
  # 3. TRASTORNOS DE ALIMENTACIÓN INFANTIL
  # ─────────────────────────────────────────────────────────────

  Escenario: Detección de picky eating
    Dado que el niño rechaza alimentos frecuentemente
    Cuando se evalúa
    Entonces:
      | Criterio                   | Acción |
      | Come <20 alimentos         | Evaluar |
      | Rechaza texturas           | Evaluación nutricional |
      | Pérdida de peso            | Referencia |
      | Ansiedad ante comida       | Evaluación psicológica |

  Escenario: Detección de ARFID
    Dado que el niño tiene rechazo severo de alimentos
    Cuando se evalúa
    Entonces:
      | Señal                       | Acción |
      | Pérdida de peso significativa | Urgencia |
      | Deficiencias nutricionales | Labs urgentes |
      | Ansiedad extrema ante comida | Referencia |
      | Rango de alimentos <10     | Referencia |

  # ─────────────────────────────────────────────────────────────
  # 4. TRASTORNOS DEL SUEÑO INFANTIL
  # ─────────────────────────────────────────────────────────────

  Escenario: Evaluación de sueño infantil
    Dado que los padres reportan problemas de sueño
    Cuando se evalúa
    Entonces:
      | Edad     | Sueño normal          | Alerta |
      | 0-3 meses | 14-17 horas, despertares frecuentes | >20h o <12h |
      | 3-6 meses | 12-15 horas, 1-2 despertares | >16h o <10h |
      | 6-12 meses | 12-14 horas, 1 despertar | >15h o <10h |
      | 1-3 años  | 11-14 horas, siesta  | >15h o <10h |
      | 3-5 años  | 10-13 horas, siesta  | >14h o <9h |

  # ─────────────────────────────────────────────────────────────
  # 5. ANSIEDAD DE SEPARACIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Ansiedad de separación normal vs. patológica
    Dado que el niño muestra ansiedad al separarse
    Cuando se evalúa
    Entonces:
      | Criterio                   | Normal (<3 años) | Preocupante (>3 años) |
      | Llanto al separarse        | Sí               | Sí                    |
      | Duración del llanto        | <15 minutos      | >30 minutos           |
      | Intervención con padres    | Se calma          | No se calma           |
      | Interfiere en escuela      | No               | Sí                    |
      | Evita situaciones sociales | No               | Sí                    |
    Y si es preocupante → Evaluación de ansiedad infantil

  # ─────────────────────────────────────────────────────────────
  # 6. MALTRATO INFANTIL
  # ─────────────────────────────────────────────────────────────

  Escenario: Detección de maltrato infantil
    Dado que se sospecha maltrato
    Cuando se evalúa
    Entonces el sistema verifica:
      | Señal                       | Presente |
      | Lesiones incompatibles con historia | Sí/No |
      | Hematomas en diferentes etapas | Sí/No |
      | Retraso en desarrollo         | Sí/No |
      | Comportamiento temeroso       | Sí/No |
      | Higiene deficiente            | Sí/No |
      | Nutrición deficiente          | Sí/No |
    Y si sospecha → Reportar a DIF y autoridades
    Y registrar en expediente de forma detallada
  