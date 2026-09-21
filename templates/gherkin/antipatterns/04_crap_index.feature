# language: es
# CRAP Index y Métricas de Riesgo de Cambio
@status:proposed
# @evidence:code
@type:acceptance
@domain:quality
Característica: Análisis CRAP y Métricas de Riesgo (GHE)
  Como tech lead del proyecto GHE
  Quiero medir el riesgo de cambio en el código
  Para priorizar refactorización y prevenir defectos

  # ─────────────────────────────────────────────────────────────
  # 1. CRAP INDEX (Change Risk Anti-Pattern)
  # ─────────────────────────────────────────────────────────────

  Escenario: Cálculo de CRAP para funciones
    Dado que se calcula CRAP Index
    Cuando se evalúa cada función
    Entonces:
      | Función                    | Complejidad | Duplicación | CRAP Score | Riesgo |
      | calculate-gestational-age | 2           | 0           | 4          | Bajo   |
      | validate-patient-data     | 8           | 2           | 80         | Alto   |
      | process-consultation      | 15          | 3           | 240        | Crítico|
      | generate-report           | 12          | 5           | 216        | Crítico|

  Escenario: Clasificación de riesgo por CRAP
    Dado que se evalúa CRAP de cada función
    Cuando se clasifica
    Entonces:
      | CRAP Score | Riesgo     | Acción |
      | <10        | Bajo       | Mantener |
      | 10-30      | Medio      | Monitorear |
      | 30-50      | Alto       | Refactorizar pronto |
      | >50        | Crítico    | Refactorizar AHORA |

  Escenario: Detección de funciones críticas
    Dado que se ejecuta análisis CRAP
    Cuando se identifican funciones con CRAP >50
    Entonces se generan alerts:
      | Función                    | CRAP  | Acción |
      | process-consultation      | 240   | Extraer sub-funciones |
      | generate-report           | 216   | Simplificar lógica   |
      | validate-all-fields       | 180   | Dividir por dominio  |

  # ─────────────────────────────────────────────────────────────
  # 2. MÉTRICAS COMPLEMENTARIAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Complejidad ciclomática
    Dado que se mide complejidad ciclomática
    Cuando se evalúa
    Entonces:
      | Función                    | Complejidad | Estado |
      | calculate-age             | 2           | ✅ Excelente |
      | validate-patient          | 8           | ⚠️ Aceptable |
      | process-emergency         | 15          | ❌ Alta      |
      | generate-complex-report   | 12          | ⚠️ Aceptable |

  Escenario: Líneas de código por función
    Dado que se mide LOC por función
    Cuando se evalúa
    Entonces:
      | Función                    | LOC   | Estado |
      | calculate-age             | 15    | ✅     |
      | validate-patient          | 45    | ✅     |
      | process-consultation      | 150   | ❌ >100 |
      | generate-report           | 120   | ❌ >100 |

  Escenario: Duplicación de código
    Dado que se detecta código duplicado
    Cuando se analiza
    Entonces:
      | Código duplicado           | Veces | Líneas | Acción |
      | Validación de campos      | 5     | 80     | Extraer función compartida |
      | Formateo de fechas       | 8     | 40     | Crear helper              |
      | Consulta SQL similar     | 3     | 60     | Crear repositorio genérico |

  # ─────────────────────────────────────────────────────────────
  # 3. MÉTRICAS DE DEUDA TÉCNICA
  # ─────────────────────────────────────────────────────────────

  Escenario: Deuda técnica total
    Dado que se mide deuda técnica completa
    Cuando se evalúa
    Entonces:
      | Categoría                  | Items | Horas estimadas |
      | Código duplicado           | 15    | 40 horas        |
      | Funciones >50 líneas      | 8     | 24 horas        |
      | Sin tests                 | 3     | 12 horas        |
      | Sin documentación         | 5     | 10 horas        |
      | Dependencias obsoletas    | 2     | 4 horas         |
      | **Total**                 | **33**| **90 horas**    |

  Escenario: Priorización de deuda técnica
    Dado que se prioriza deuda técnica
    Cuando se evalúa impacto vs esfuerzo
    Entonces:
      | Item                      | Impacto | Esfuerzo | Prioridad |
      | Funciones CRAP >50        | Alto    | Medio    | ⭐⭐⭐⭐⭐ |
      | Código duplicado          | Medio   | Bajo     | ⭐⭐⭐⭐   |
      | Sin tests                 | Alto    | Medio    | ⭐⭐⭐⭐   |
      | Dependencias obsoletas    | Medio   | Bajo     | ⭐⭐⭐     |
      | Sin documentación         | Bajo    | Bajo     | ⭐⭐       |

  # ─────────────────────────────────────────────────────────────
  # 4. TÉCNICAS DE REDUCCIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Estrategias de reducción de CRAP
    Dado que se reducen funciones con CRAP alto
    Cuando se aplica refactorización
    Entonces:
      | Técnica                    | Cuándo usarla |
      | Extract Function          | Función >50 LOC  |
      | Extract Class             | Clase con >7 responsabilidades |
      | Replace Temp with Query   | Variables temporales |
      | Introduce Parameter Object | Muchos parámetros |
      | Replace Conditional with Polymorphism | Muchos switch/case |
      | Replace Temp with Strategy | Algoritmos intercambiables |

  Escenario: Métricas post-refactor
    Dado que se refactoriza función con CRAP 240
    Cuando se aplica Extract Function
    Entonces:
      | Métrica                    | Antes  | Después |
      | Complejidad ciclomática   | 15     | 6       |
      | Líneas de código          | 150    | 45      |
      | Duplicación               | 3      | 0       |
      | CRAP Score                | 240    | 36      |
      | Tests que pasan           | 100%   | 100%    |

  # ─────────────────────────────────────────────────────────────
  # 5. REPORTES
  # ─────────────────────────────────────────────────────────────

  Escenario: Dashboard de CRAP
    Dado que se consulta dashboard de CRAP
    Cuando se genera
    Entonces incluye:
      | Métrica                    | Valor actual | Trend |
      | Funciones con CRAP >50    | 4            | ↓     |
      | Complejidad promedio      | 5.2          | ↓     |
      | LOC promedio por función  | 28           | ↓     |
      | Duplicación total         | 2.1%         | ↓     |
      | Deuda técnica (horas)     | 90           | ↓     |
      | % código con CRAP bajo    | 92%          | ↑     |
