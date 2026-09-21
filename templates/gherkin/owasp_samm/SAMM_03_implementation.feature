# language: es
# @id GHE-SAMM-IMPL-001
# @type compliance
# @domain security
# @layer development
# @risk s1
# @owner dev-lead
# @status proposed
# @requirement SAMM-IMPLEMENTATION
# @risk-control CTRL-SAMM-IMPL
# @regulation NOM-024
@domain:security @type:compliance @risk:s1 @status:proposed
Característica: SAMM Implementation - Build y Deployment Seguro
  Como desarrollador del proyecto GHE
  Quiero que la construcción y despliegue sean seguros
  Para que no se introduzcan vulnerabilidades durante el desarrollo

  # ─────────────────────────────────────────────────────────────
  # PRÁCTICA 1: Build Seguro
  # ─────────────────────────────────────────────────────────────

  Regla: El código se construye de forma reproducible y segura

    Escenario: Build reproducible
      Dado que se ejecuta build
      Cuando se verifica
      Entonces:
        | Verificación              | Estado |
        | Build determinista        | ✅      |
        | Dependencies lockfile     | ✅      |
        | Análisis estático         | ✅      |
        | Code review requerido     | ✅      |
      # @evidence EVID-SAMM-IMPL-001

    Escenario: Análisis estático de código
      Dado que se ejecuta análisis estático
      Cuando se verifica
      Entonces:
        | Herramienta               | Qué detecta |
        | clj-kondo                 | Code smells, bugs |
        | clojure.spec              | Errores de tipo    |
        | Dependency check          | CVEs en dependencias |
      # @evidence EVID-SAMM-IMPL-002

    Escenario: Code review de seguridad
      Dado que se revisa código
      Cuando se verifica
      Entonces:
        | Criterio                   | Estado |
        | Sin SQL injection         | ✅      |
        | Sin XSS                   | ✅      |
        | Sin secrets hardcodeados  | ✅      |
        | Input validado            | ✅      |
        | Output codificado         | ✅      |

  # ─────────────────────────────────────────────────────────────
  # PRÁCTICA 2: Deployment Seguro
  # ─────────────────────────────────────────────────────────────

  Regla: El despliegue es automatizado y verificado

    Escenario: Despliegue con verificación
      Dado que se despliega nueva versión
      Cuando se ejecuta despliegue
      Entonces:
        | Paso                       |
        | Build automático          |
        | Tests automatizados       |
        | Verificación pre-deploy   |
        | Deploy automatizado       |
        | Health check post-deploy  |
        | Rollback automático si falla |
      # @evidence EVID-SAMM-IMPL-003

    Escenario: Rollback automático
      Dado que falla health check post-deploy
      Cuando se detecta fallo
      Entonces sistema revierte automáticamente a versión anterior
      Y notifica al equipo

  Regla: La configuración de seguridad se gestiona como código

    Escenario: Configuración versionada
      Dado que se modifica configuración de seguridad
      Cuando se aplica cambio
      Entonces:
        | Verificación              | Estado |
        | Cambio versionado en Git  | ✅      |
        | Code review requerido     | ✅      |
        | Testing de configuración  | ✅      |
