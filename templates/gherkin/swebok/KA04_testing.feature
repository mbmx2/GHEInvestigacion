# language: es
# SWEBOK KA-04: Software Testing
@status:proposed
# @requirement:PRACTICE-GHE-001
@type:acceptance
@domain:general
# ÁREA DE CONOCIMIENTO: Pruebas de Software
Característica: Pruebas de Software (SWEBOK KA-04)
  Como ingeniero de calidad del proyecto GHE
  Quiero verificar y validar el sistema de forma integral
  Para garantizar que cumple requisitos y está libre de defectos críticos

  # ─────────────────────────────────────────────────────────────
  # 1. NIVELES DE PRUEBAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Estrategia de testing en pirámide
    Dado que se define estrategia de testing
    Cuando se estructuran niveles
    Entonces la pirámide incluye:
      | Nivel                      | Cobertura | Herramienta    |
      | Unit Tests                 | 95%       | clojure.test   |
      | Integration Tests          | 90%       | clojure.test + test-db |
      | System/E2E Tests           | 85%       | API + UI tests |
      | Acceptance Tests           | 80%       | Gherkin +临床  |
    Y se ejecutan automáticamente en cada commit
    Y se genera reporte de cobertura

  Escenario: Ejecución de unit tests
    Dado que existen unit tests
    Cuando se ejecuta `lein test`
    Entonces:
      | Resultado                  |
      | Todos los tests pasan     |
      | Cobertura >= 95% en domain|
      | Tiempo de ejecución < 5 min|
      | Sin tests pendientes      |

  Escenario: Ejecución de integration tests
    Dado que existen integration tests
    Cuando se ejecutan contra base de datos de prueba
    Entonces:
      | Verificación               | Estado    |
      | CRUD de pacientes          | ✅ Pass   |
      | CRUD de consultas          | ✅ Pass   |
      | CRUD de prescripciones     | ✅ Pass   |
      | Transacciones ACID         | ✅ Pass   |
      | foreign keys               | ✅ Pass   |
      | índices de rendimiento     | ✅ Pass   |

  Escenario: Ejecución de E2E tests
    Dado que existen E2E tests
    Cuando se ejecuta flujo completo
    Entonces se verifica:
      | Flujo                      | Estado    |
      | Registro → Consulta → Receta| ✅ Pass   |
      | Triaje → Referencia        | ✅ Pass   |
      | Farmacia → Dispensación    | ✅ Pass   |
      | Offline → Sync             | ✅ Pass   |

  # ─────────────────────────────────────────────────────────────
  # 2. TÉCNICAS DE PRUEBA
  # ─────────────────────────────────────────────────────────────

  Escenario: Pruebas de caja negra
    Dado que se prueban funcionalidades sin conocer implementación
    Cuando se aplican técnicas
    Entonces se usan:
      | Técnica                    | Aplicación en GHE    |
      | Partición de equivalencia | Rangos de signos vitales |
      | Análisis de valor límite  | Edad gestacional边界 |
      | Tablas de decisión        | Clasificación de riesgo|
      | Transiciones de estado    | Estados de receta     |
      | Pruebas de causa-efecto  | Alertas de CDS        |

  Escenario: Pruebas de caja blanca
    Dado que se prueban caminos internos del código
    Cuando se aplican técnicas
    Entonces se verifica:
      | Técnica                    | Aplicación           |
      | Cobertura de statement    | >95% en domain       |
      | Cobertura de branch       | >90% en domain       |
      | Cobertura de path         | Caminos críticos     |
      | Pruebas de mutación       | PEAEH (meta-testing) |

  # ─────────────────────────────────────────────────────────────
  # 3. PRUEBAS ESPECÍFICAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Pruebas de seguridad
    Dado que se realizan pruebas de seguridad
    Cuando se ejecutan
    Entonces se verifica:
      | Prueba                     | Resultado esperado   |
      | SQL Injection             | Bloqueado            |
      | XSS                       | Sanitizado           |
      | CSRF                      | Token requerido      |
      | Authentication bypass     | Denegado             |
      | Authorization bypass      | Denegado             |
      | Session hijacking         | Protegido            |
      | Password cracking         | bcrypt resistente    |

  Escenario: Pruebas de rendimiento
    Dado que se ejecutan pruebas de carga
    Cuando se simulan 50 usuarios concurrentes
    Entonces se verifica:
      | Métrica                   | Objetivo             |
      | Tiempo respuesta API      | <200ms promedio      |
      | Throughput                | >100 req/seg         |
      | Error rate                | <0.1%                |
      | Memory usage              | Estable              |
      | CPU usage                 | <80%                 |

  Escenario: Pruebas de usabilidad
    Dado que se prueban con usuarios reales
    Cuando médicos usan el sistema
    Entonces se mide:
      | Métrica                   | Objetivo             |
      | Tiempo de aprendizaje     | <2 horas             |
      | Tiempo por tarea          | <5 min registro      |
      | Tasa de error             | <5%                  |
      | Satisfacción (SUS score)  | >80/100              |

  # ─────────────────────────────────────────────────────────────
  # 4. PEAEH (META-TESTING)
  # ─────────────────────────────────────────────────────────────

  Escenario: Verificación de calidad de tests (PEAEH)
    Dado que PEAEH verifica los tests mismos
    Cuando se ejecuta suite PEAEH
    Entonces se verifica:
      | Criterio                   | Estado    |
      | Todos los tests tienen nombres descriptivos | ✅ |
      | Tests son determinísticos  | ✅         |
      | Tests son independientes   | ✅         |
      | Tests ejecutan en <100ms   | ✅         |
      | Tests no dependen de estado global | ✅  |
      | Tests no dependen de orden de ejecución | ✅ |
    