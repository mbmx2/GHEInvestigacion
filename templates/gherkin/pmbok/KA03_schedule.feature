# language: es
# PMBOK KA-03: Project Schedule Management
# ÁREA DE CONOCIMIENTO: Gestión del Cronograma del Proyecto
Característica: Gestión del Cronograma (PMBOK KA-03)
  Como director del proyecto GHE
  Quiero gestionar el cronograma de forma efectiva
  Para entregar a tiempo y dentro de plazos

  # ─────────────────────────────────────────────────────────────
  # 1. PLANIFICACIÓN DEL CRONOGRAMA
  # ─────────────────────────────────────────────────────────────

  Escenario: Definición de hitos del proyecto
    Dado que se define el cronograma maestro
    Cuando se establecen hitos
    Entonces se documentan:
      | Hito                       | Fecha objetivo  | Dependencia |
      | Hito 1: Requisitos completos | Mes 1         | Ninguna     |
      | Hito 2: Arquitectura aprobada | Mes 2        | Hito 1      |
      | Hito 3: MVP funcional      | Mes 4          | Hito 2      |
      | Hito 4: Beta interna       | Mes 5          | Hito 3      |
      | Hito 5: Piloto en maternidad | Mes 6        | Hito 4      |
      | Hito 6: Certificación NOM  | Mes 8          | Hito 5      |
      | Hito 7: Producción         | Mes 9          | Hito 6      |

  Escenario: Estimación de duración de actividades
    Dado que se estiman tareas del proyecto
    Cuando se usa estimación
    Entonces se aplica:
      | Técnica                    | Aplicación           |
      | Estimación análoga         | Comparar con proyectos similares |
      | Estimación paramétrica     | Líneas de código vs. horas |
      | Estimación de tres puntos  | Optimista/Pessimista/Más probable |
      | Cadenas críticas           | Identificar ruta crítica |
    Y se documenta base de estimaciones

  Escenario: Identificación de ruta crítica
    Dado que se identifica la ruta crítica
    Cuando se analiza el diagrama de red
    Entonces se muestra:
      | Actividad                  | Duración | Crítica? |
      | Requisitos                 | 4 semanas | Sí      |
      | Diseño arquitectura        | 2 semanas | Sí      |
      | Implementación dominio     | 6 semanas | Sí      |
      | Implementación UI           | 4 semanas | No (slack: 2 sem) |
      | Testing                     | 4 semanas | Sí      |
      | Despliegue piloto          | 2 semanas | Sí      |
      | **Ruta crítica**           | **22 semanas** | |

  # ─────────────────────────────────────────────────────────────
  # 2. CONTROL DEL CRONOGRAMA
  # ─────────────────────────────────────────────────────────────

  Escenario: Seguimiento de avance (Earned Value)
    Dado que se mide avance con Earned Value
    Cuando se genera reporte
    Entonces se incluyen métricas:
      | Métrica                    | Valor   |
      | Valor Ganado (EV)          | 75,000  |
      | Valor Planeado (PV)        | 80,000  |
      | Costo Real (AC)            | 70,000  |
      | SPI (Schedule Performance Index) | 0.94 |
      | CPI (Cost Performance Index)    | 1.07 |
      | EAC (Estimate at Completion)    | 93,500 |
    Y se evalúa:
      | Indicador                  | Interpretación       |
      | SPI < 1                   | Ligero retraso       |
      | CPI > 1                   | Bajo costo           |
      | Proyección EAC            | Dentro de presupuesto|

  Escenario: Análisis de desviaciones
    Dado que hay desviación en cronograma
    Cuando se analiza
    Entonces se documenta:
      | Actividad                  | Planificado | Real    | Desviación |
      | Implementación dominio     | 6 sem       | 7 sem   | +1 sem     |
      | Testing                     | 4 sem       | 3 sem   | -1 sem     |
    Y se identifican causas raíz
    Y se proponen acciones correctivas
  