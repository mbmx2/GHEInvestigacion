# language: es
# @id GHE-CICD-STAGES-001
# @type compliance
# @domain development
# @layer infrastructure
# @risk s2
# @owner dev-lead
# @status proposed
# @requirement REQ-CICD-STAGES
# @risk-control CTRL-CICD-STAGES
# @regulation N/A
@domain:development @type:compliance @risk:s2 @status:proposed
Característica: Pipeline CI/CD Completo
  Como desarrollador del proyecto GHE
  Quiero pipeline de CI/CD con todas las etapas
  Para que cada commit se verifique automáticamente

  Regla: Pipeline tiene todas las etapas

    Escenario: Pipeline completo
      Dado que se ejecuta pipeline
      Cuando se verifica
      Entonces incluye:
        | Etapa                      | Herramienta |
        | Checkout                  | Git         |
        | Install dependencies      | Leiningen  |
        | Linting                   | clj-kondo   |
        | Unit tests                | clojure.test|
        | Integration tests         | clojure.test|
        | Coverage check            | cloverage   |
        | Security scan             | dependency-check |
        | Build                     | Leiningen   |
        | Deploy to staging         | Script       |
        | Smoke tests               | API tests    |

  Regla: No se despliega sin tests pasando

    Escenario: Deploy bloqueado
      Dado que hay tests fallidos
      Cuando se intenta desplegar
      Entonces se bloquea deploy

  Regla: Rollback está disponible

    Escenario: Rollback ejecutado
      Dado que falla health check post-deploy
      Cuando se ejecuta rollback
      Entonces: versión anterior restaurada, verificación OK

  Regla: Configuración versionada

    Escenario: Configuración en Git
      Dado que se modifica configuración
      Cuando se aplica
      Entonces: versionada en Git, code review, testea
