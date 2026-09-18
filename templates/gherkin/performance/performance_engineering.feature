# language: es
# Performance Engineering
Característica: Ingeniería de Rendimiento (GHE)
  Como responsable de rendimiento del proyecto GHE
  Quiero garantizar rendimiento aceptable
  Para que el sistema responda rápido incluso bajo carga

  # ─────────────────────────────────────────────────────────────
  # 1. OBJETIVOS DE RENDIMIENTO
  # ─────────────────────────────────────────────────────────────

  Escenario: Definir objetivos de rendimiento
    Dado que se definen SLAs de rendimiento
    Cuando se documentan
    Entonces:
      | Métrica                    | Objetivo     |
      | Tiempo respuesta API       | <200ms (p95) |
      | Tiempo carga de página     | <2s (p95)    |
      | Tiempo búsqueda paciente   | <500ms       |
      | Tiempo guardado consulta   | <200ms       |
      | Tiempo generación receta   | <300ms       |
      | Tiempo sync local→cloud    | <30s (lote)  |
      | Throughput                 | >50 req/seg  |
      | Conexiones concurrentes    | >20          |

  # ─────────────────────────────────────────────────────────────
  # 2. TESTING DE RENDIMIENTO
  # ─────────────────────────────────────────────────────────────

  Escenario: Load test
    Dado que se ejecuta load test
    Cuando se simulan 20 usuarios concurrentes
    Entonces:
      | Métrica                    | Objetivo     |
      | Tiempo respuesta promedio  | <200ms       |
      | Tiempo respuesta p99       | <500ms       |
      | Error rate                 | <0.1%        |
      | Throughput                 | >50 req/seg  |
      | CPU usage                  | <80%         |
      | Memory usage               | Estable      |

  Escenario: Stress test
    Dado que se ejecuta stress test
    Cuando se incrementa carga gradualmente
    Entonces:
      | Carga                      | Comportamiento esperado |
      | 1x (normal)               | Normal                |
      | 2x                         | Respuestas lentas     |
      | 5x                         | Degradación controlada|
      | 10x                        | Rechazo de conexiones |
      | Recuperación               | Vuelve a normal      |

  Escenario: Endurance test
    Dado que se ejecuta endurance test (soak test)
    Cuando se ejecuta por 8 horas
    Entonces:
      | Verificación               | Estado    |
      | Sin memory leaks           | ✅         |
      | Tiempo estable             | ✅         |
      | Sin degradación            | ✅         |
      | Sin errores acumulados     | ✅         |

  # ─────────────────────────────────────────────────────────────
  # 3. BENCHMARKS ESPECÍFICOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Benchmark de SQLite
    Dado que se ejecuta benchmark de SQLite
    Cuando se mide rendimiento
    Entonces:
      | Operación                  | Objetivo     |
      | Insert (paciente)          | <50ms        |
      | Select by ID               | <10ms        |
      | Select by CURP             | <50ms        |
      | Full-text search           | <300ms       |
      | Join multi-table           | <500ms       |
      | Export a PDF               | <5s          |

  Escenario: Benchmark de sync
    Dado que se ejecuta benchmark de sync
    Cuando se mide
    Entonces:
      | Escenario                  | Objetivo     |
      | Sync 10 operaciones        | <5s          |
      | Sync 100 operaciones       | <30s         |
      | Compresión gzip            | >60% reducción|
      | Tiempo de resolución de conflicto | <1s |

  # ─────────────────────────────────────────────────────────────
  # 4. MONITOREO EN PRODUCCIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Métricas de monitoreo
    Dado que se monitorea rendimiento en producción
    Cuando se consulta dashboard
    Entonces:
      | Métrica                    | Umbral de alerta    |
      | Tiempo respuesta p95       | >500ms              |
      | Error rate                 | >1%                 |
      | CPU usage                  | >80%                |
      | Memory usage               | >85%                |
      | Disk usage                 | >80%                |
      | Sync queue size            | >100 ops            |
  