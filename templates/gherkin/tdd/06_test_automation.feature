# language: es
# TDD - Test Automation
# AUTOMATIZACIÓN DE TESTS: Ejecución automática en cada commit
Característica: Automatización de Tests (TDD - GHE)
  Como desarrollador del proyecto GHE
  Quiero automatizar la ejecución de tests
  Para detectar regresiones inmediatamente

  # ─────────────────────────────────────────────────────────────
  # 1. CI/CD PIPELINE
  # ─────────────────────────────────────────────────────────────

  Escenario: Pipeline de CI/CD
    Dado que se configura pipeline de integración continua
    Cuando se ejecuta pipeline
    Entonces las etapas son:
      | Etapa                       | Qué ejecuta         |
      | 1. Build                    | Compilar código     |
      | 2. Unit Tests               | Tests unitarios     |
      | 3. Integration Tests        | Tests de integración|
      | 4. Code Analysis            | Linting,sonarqube   |
      | 5. Security Scan            | OWASP ZAP           |
      | 6. E2E Tests                | Tests end-to-end    |
      | 7. Deploy (si todo pasa)    | Despliegue automático|
    Y cada etapa debe pasar para continuar

  Escenario: Criterio de paso en CI
    Dado que se define criterio de paso
    Cuando se ejecuta pipeline
    Entonces:
      | Criterio                    | Umbral             |
      | Todos los tests pasan      | 100%               |
      | Cobertura de código        | >85%               |
      | Sin bugs críticos          | 0                  |
      | Sin vulnerabilidades críticas | 0                |
      | Code review aprobado       | 1+ approval        |
      | Build exitoso              | 0 errors           |

  # ─────────────────────────────────────────────────────────────
  # 2. EJECUCIÓN EN DESARROLLO
  # ─────────────────────────────────────────────────────────────

  Escenario: Test runner local
    Dado que el desarrollador ejecuta tests localmente
    Cuando ejecuta comando
    Entonces:
      | Comando                     | Qué ejecuta         |
      | lein test                   | Todos los tests     |
      | lein test :only ghe.patient-test | Tests de paciente |
      | lein test --watch           | Modo observación    |
      | lein cloverage              | Con cobertura       |
    Y los tests se ejecutan en <5 minutos

  Escenario: Test watch mode
    Dado que se usa modo observación
    Cuando se guarda un archivo
    Entonces:
      | Acción                      |
      | Tests se re-ejecutan automáticamente |
      | Solo se ejeculan tests afectados |
      | Resultado se muestra en terminal |
      | Si falla, se muestra error detallado |

  # ─────────────────────────────────────────────────────────────
  # 3. REPORTES
  # ─────────────────────────────────────────────────────────────

  Escenario: Reporte de tests
    Dado que se ejecuta suite de tests
    Cuando se genera reporte
    Entonces incluye:
      | Sección                     |
      | Resumen (pass/fail/skip)    |
      | Cobertura por módulo        |
      | Tests más lentos            |
      | Tests fallidos (detalles)   |
      | Tendencia (mejora/empeora)  |
    Y el reporte es exportable a HTML/JSON

  Escenario: Dashboard de tests
    Dado que se muestra dashboard de tests
    Cuando se consulta
    Entonces se ve:
      | Métrica                    | Valor actual        |
      | Total tests                | 5,573              |
      | Tests pasando              | 5,573 (100%)       |
      | Tests fallando             | 0                  |
      | Cobertura                  | 92%                |
      | Tiempo de ejecución        | 3 min 24 seg       |
      | Última ejecución           | Automática (commit) |
  