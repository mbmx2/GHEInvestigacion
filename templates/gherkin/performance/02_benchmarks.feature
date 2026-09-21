# language: es
# @id GHE-PERFORMANCE-BENCHMARK-001
# @type performance
# @domain operations
# @layer infrastructure
# @risk s2
# @owner ops-lead
# @status proposed
# @requirement REQ-PERFORMANCE-BENCHMARK
# @risk-control CTRL-PERFORMANCE-BENCHMARK
# @regulation N/A
@domain:operations @type:performance @risk:s2 @status:proposed
Característica: Benchmarks de Rendimiento
  Como responsable de operaciones del hospital
  Quiero benchmarks de rendimiento para cada componente
  Para que el sistema responda dentro de tiempos aceptables

  Regla: Tiempos de respuesta se miden

    Escenario: Benchmark de respuesta
      Dado que se ejecuta benchmark
      Cuando se mide
      Entonces:
        | Operación                 | Objetivo |
        | Búsqueda de paciente      | <500ms   |
        | Carga de expediente       | <1s      |
        | Guardado de consulta      | <200ms   |
        | Generación de receta      | <300ms   |
        | Generación de reporte     | <5s      |
        | Sync de lote de 50 ops   | <30s     |

  Regla: Stress test se ejecuta periódicamente

    Escenario: Stress test
      Dado que se ejecuta stress test
      Cuando se simula carga
      Entonces el sistema:
        | Nivel de carga | Comportamiento |
        | Normal (1x) | Funciona al 100% |
        | Alto (2x) | Degradación <20% |
        | Crítico (5x) | Degradación controlada |
        | Extremo (10x) | Rechaza peticiones new |

  Regla: Memory leaks se detectan

    Escenario: Endurance test
      Dado que se ejecuta por 8 horas
      Cuando se mide memoria
      Entonces: sin memory leaks, uso estable
