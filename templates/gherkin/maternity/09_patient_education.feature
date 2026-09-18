# language: es
# Educación al Paciente - Material en Lenguaje Simple
Característica: Educación Paciente Maternidad (GHE)
  Como paciente embarazada
  Quiero material educativo en lenguaje simple y visual
  Para entender mi embarazo y cuidarme mejor

  # ─────────────────────────────────────────────────────────────
  # 1. MATERIAL POR TRIMESTRE
  # ─────────────────────────────────────────────────────────────

  Escenario: Educación por trimestre
    Dado que la paciente está en el trimestre 1
    Cuando recibe material
    Entonces incluye:
      | Tema                       | Formato          |
      | "Mi bebé está empezando"  | Infografía visual |
      | Alimentación saludable    | Guía con imágenes |
      | Ácido fólico importancia  | Tarjeta recordatoria |
      | Signos de alarma          | Tarjeta de bolso   |
      | Ejercicio seguro          | Infografía         |

  Escenario: Educación sobre nutrición
    Dado que se entrega guía de nutrición
    Cuando la paciente la lee
    Entonces incluye:
      | Sección                   | Contenido visual  |
      | Alimentos recomendados    | Fotos + texto simple |
      | Alimentos a evitar        | Fotos con X rojo  |
      | Tamaño de porciones       | Imágenes comparativas |
      | Hidratación              | "8 vasos de agua al día" |

  # ─────────────────────────────────────────────────────────────
  # 2. SIGNOS DE ALARMA
  # ─────────────────────────────────────────────────────────────

  Escenario: Tarjeta de signos de alarma
    Dado que se entrega tarjeta de signos de alarma
    Cuando la paciente la lee
    Entonces incluye:
      | Signo de alarma            | Acción             |
      | Cefalea intensa            | Acudir a emergencia|
      | Visión borrosa             | Acudir a emergencia|
      | Hinchazón súbita en cara  | Acudir a emergencia|
      | Sangrado vaginal           | Acudir a emergencia|
      | Fiebre >38°C               | Acudir a emergencia|
      | Dolor abdominal intenso    | Acudir a emergencia|
      | Disminución movimientos bebé| Acudir a emergencia|
      | Dificultad para respirar   | Acudir a emergencia|

  # ─────────────────────────────────────────────────────────────
  # 3. CUIDADOS PRENATALES
  # ─────────────────────────────────────────────────────────────

  Escenario: Checklist de cuidados prenatales
    Dado que se entrega checklist visual
    Cuando la paciente lo revisa
    Entonces incluye:
      | Cuidado                     | Frecuencia       |
      | Tomar ácido fólico         | Todos los días   |
      | Tomar hierro               | Todos los días   |
      | Comer frutas y verduras    | En cada comida   |
      | Beber agua                 | 8 vasos al día   |
      | Dormir de lado izquierdo   | Al acostarse     |
      | Ejercicio suave            | 30 min, 5 días/semana |
      | No fumar                   | Nunca            |
      | No tomar alcohol           | Nunca            |

  # ─────────────────────────────────────────────────────────────
  # 4. EDUCACIÓN SOBRE PARTO
  # ─────────────────────────────────────────────────────────────

  Escenario: Educación sobre signos de trabajo de parto
    Dado que la paciente está en el tercer trimestre
    Cuando recibe educación
    Entonces incluye:
      | Señal                       | Significado       |
      | Contracciones regulares    | Trabajo de parto  |
      | Ruptura de bolsa           | Acudir a emergencia|
      | Sangrado como regla        | Acudir a emergencia|
      | Dolor pélvico intenso      | Evaluación        |

  # ─────────────────────────────────────────────────────────────
  # 5. EDUCACIÓN SOBRE LACTANCIA
  # ─────────────────────────────────────────────────────────────

  Escenario: Educación sobre lactancia
    Dado que se acerca el parto
    Cuando se entrega material de lactancia
    Entonces incluye:
      | Tema                       | Contenido        |
      | Beneficios de la lactancia | Infografía       |
      | Técnica de amamantamiento | Paso a paso visual|
      | Posiciones para amamantar | Ilustraciones    |
      | Señales de buen amamantamiento | Lista     |
      | Cuándo buscar ayuda       | Lista            |

  # ─────────────────────────────────────────────────────────────
  # 6. MÉTRICAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Métricas de educación
    Dado que se mide efectividad de educación
    Cuando se compara
    Entonces:
      | Métrica                    | Sin educación | Con educación |
      | Conocimiento de signos alarma | 30%        | 80%           |
      | Adherencia a suplementos  | 50%           | 85%           |
      | Acudir a emergencia a tiempo | 40%        | 75%           |
      | Satisfacción              | 70%           | 90%           |
