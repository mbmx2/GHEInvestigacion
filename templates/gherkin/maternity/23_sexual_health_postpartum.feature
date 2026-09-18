# language: es
# Salud Sexual y Reproductiva Postparto
Característica: Salud Sexual Postparto (GHE Maternidad)
  Como médico de la maternidad
  Quiero workflows de salud sexual postparto
  Para atender esta área frecuentemente ignorada

  # ─────────────────────────────────────────────────────────────
  # 1. EVALUACIÓN DE SALUD SEXUAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Evaluación de retorno a actividad sexual
    Dado que la paciente pregunta sobre actividad sexual
    Cuando se evalúa
    Entonces el sistema verifica:
      | Criterio                   | Estado    |
      | Tipo de parto              | Vaginal/Cesárea |
      | Complicaciones posparto    | Verificar  |
      | Lactancia                  | Verificar  |
      | Dolor                      | Evaluar    |
      | Estado emocional           | Evaluar    |

  Escenario: Criterios para retorno a actividad sexual
    Dado que se evalúa disponibilidad
    Cuando se verifica
    Entonces:
      | Criterio                   | Mínimo   |
      | Semanas postparto          | 6 semanas|
      | Sin complicaciones         | Sí       |
      | Episiotomía cicatrizada    | Sí       |
      | Sin dolor                  | Sí       |
      | Consentimiento mutuo       | Sí       |
    Y el sistema nota: "No hay fecha 'correcta' — es cuando ambos están listos"

  # ─────────────────────────────────────────────────────────────
  # 2. PROBLEMAS COMUNES
  # ─────────────────────────────────────────────────────────────

  Escenario: Dolor durante relaciones (dispareunia)
    Dado que la paciente reporta dolor durante relaciones
    Cuando se evalúa
    Entonces el sistema guía:
      | Causa probable              | Tratamiento |
      | Sequedad vaginal (lactancia)| Estrógeno tópico |
      | Cicatriz de episiotomía     | Fisioterapia pélvica |
      | Atrofia vaginal            | Estrógeno tópico |
      | Dispareunia profunda       | Evaluación ginecológica |

  Escenario: Disminución de libido
    Dado que la paciente reporta disminución de deseo
    Cuando se evalúa
    Entonces:
      | Factor                      | Acción |
      | Fatiga por cuidado del bebé | Educación, distribución de tareas |
      | Cambios hormonales (lactancia) | Informar que es normal |
      | Depresión                  | Evaluar y tratar |
      | Imagen corporal           | Apoyo emocional |

  # ─────────────────────────────────────────────────────────────
  # 3. PLANIFICACIÓN FAMILIAR
  # ─────────────────────────────────────────────────────────────

  Escenario: Anticoncepción en lactancia
    Dado que la paciente está en lactancia y quiere anticoncepción
    Cuando se asesora
    Entonces el sistema muestra opciones compatibles con lactancia:
      | Método                     | Compatible | Notas |
      | DI de cobre                | ✅ Sí       | Poner desde posparto |
      | DI hormonal                | ⚠️ Parcial  | Puede disminuir leche |
      | Implante subdérmico        | ✅ Sí       | Excelente opción |
      | Inyectable trimestral      | ⚠️ Parcial  | Puede disminuir leche |
      | Progesterona-only (minipill)| ✅ Sí      | Efectividad menor |
      | Condón                      | ✅ Sí       | Sin efectos hormonales |
      | Lactancia como método      | ⚠️ Solo 6 meses exclusivos | LAM |

  # ─────────────────────────────────────────────────────────────
  # 4. SEGURIDAD EN RELACIONES
  # ─────────────────────────────────────────────────────────────

  Escenario: Educación sobre seguridad en relaciones
    Dado que se asesora sobre salud sexual
    Cuando se dan recomendaciones
    Entonces incluye:
      | Recomendación              |
      | Usar condón si no se desea embarazo |
      | El método anticonceptivo elegido puede tardar en ser efectivo |
      | No hay "ventana segura" confiable en posparto |
      | Buscar atención si hay dolor, sangrado o secreción |
