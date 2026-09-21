# language: es
# @id GHE-SAMM-GOV-001
# @type compliance
# @domain security
# @layer governance
# @risk s1
# @owner security-lead
# @status proposed
# @requirement SAMM-GOVERNANCE
# @risk-control CTRL-SAMM-GOV
# @regulation NOM-024
@domain:security @type:compliance @risk:s1 @status:proposed
Característica: SAMM Governance - Estrategia, Métricas y Cumplimiento
  Como responsable de seguridad del hospital
  Quiero que la gobernanza de seguridad sea documentada y medible
  Para que cada decisión de seguridad sea trazable y auditable

  # ─────────────────────────────────────────────────────────────
  # PRÁCTICA 1: Estrategia y Métricas
  # ─────────────────────────────────────────────────────────────

  Regla: La organización define una estrategia de seguridad

    Escenario: Estrategia de seguridad documentada
      Dado que se define estrategia de seguridad para GHE
      Cuando se documenta
      Entonces incluye:
        | Elemento                    |
        | Objetivos de seguridad     |
        | Métricas de seguridad      |
        | Periodo de revisión        |
        | Responsables               |
      # @evidence EVID-SAMM-GOV-001

    Escenario: Métricas de seguridad definidas
      Dado que se definen métricas
      Cuando se evalúa
      Entonces:
        | Métrica                    | Objetivo  | Frecuencia |
        | Tiempo de respuesta a vulnerabilidades | <24h crítico | Continua |
        | % features con tests de seguridad | >95% | Mensual |
        | Incidencias de seguridad   | 0          | Mensual |
        | Cobertura de auditoría     | 100%       | Trimestral |

  # ─────────────────────────────────────────────────────────────
  # PRÁCTICA 2: Política y Cumplimiento
  # ─────────────────────────────────────────────────────────────

  Regla: Existe una política de seguridad documentada

    Escenario: Política de seguridad
      Dado que se define política de seguridad
      Cuando se documenta
      Entonces incluye:
        | Elemento                    |
        | Política de acceso         |
        | Política de cifrado        |
        | Política de logging        |
        | Política de respuesta a incidentes |
        | Política de privacidad     |
      # @evidence EVID-SAMM-GOV-002

    Escenario: Cumplimiento normativo verificado
      Dado que se verifica cumplimiento
      Cuando se evalúa
      Entonces:
        | Norma                      | Estado |
        | NOM-024                    | ✅      |
        | LFPDPPP                    | ✅      |
        | OWASP ASVS Nivel 2        | En proceso |

  # ─────────────────────────────────────────────────────────────
  # PRÁCTICA 3: Educación y Orientación
  # ─────────────────────────────────────────────────────────────

  Regla: El personal recibe capacitación en seguridad

    Escenario: Programa de capacitación
      Dado que se planifica capacitación
      Cuando se ejecuta
      Entonces incluye:
        | Módulo                     | Frecuencia |
        | Seguridad de contraseñas  | Anual      |
        | Phishing                  | Trimestral |
        | Uso seguro del sistema    | Al ingreso |
        | Reporte de incidentes     | Anual      |
      # @evidence EVID-SAMM-GOV-003

    Escenario: Simulacros de respuesta
      Dado que se ejecutan simulacros
      Cuando se evalúa
      Entonces:
        | Tipo                       | Frecuencia |
        | Simulacro de phishing     | Trimestral |
        | Simulacro de incidente    | Semestral  |
        | Simulacro de continuidad  | Anual      |
