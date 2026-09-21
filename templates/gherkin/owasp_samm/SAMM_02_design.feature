# language: es
# @id GHE-SAMM-DES-001
# @type compliance
# @domain security
# @layer governance
# @risk s1
# @owner architect
# @status proposed
# @requirement SAMM-DESIGN
# @risk-control CTRL-SAMM-DESIGN
# @regulation NOM-024
@domain:security @type:compliance @risk:s1 @status:proposed
Característica: SAMM Design - Requisitos y Arquitectura de Seguridad
  Como arquitecto del proyecto GHE
  Quiero que la seguridad esté integrada en el diseño
  Para que cada componente sea seguro por construcción

  # ─────────────────────────────────────────────────────────────
  # PRÁCTICA 1: Requisitos de Seguridad
  # ─────────────────────────────────────────────────────────────

  Regla: Cada feature tiene requisitos de seguridad

    Escenario: Requisitos de seguridad en features
      Dado que se define un feature
      Cuando se documenta
      Entonces incluye requisitos de seguridad:
        | Requisito                  |
        | Autenticación requerida   |
        | Nivel de autorización     |
        | Cifrado de datos          |
        | Auditoría                 |
      # @evidence EVID-SAMM-DES-001

    Escenario: Requisitos de seguridad trazables
      Dado que se tiene un requisito de seguridad
      Cuando se verifica trazabilidad
      Entonces se puede rastrear:
        | Cadena                     |
        | Requisito → Feature       |
        | Feature → Test de seguridad |
        | Test → Evidencia          |

  # ─────────────────────────────────────────────────────────────
  # PRÁCTICA 2: Arquitectura de Seguridad
  # ─────────────────────────────────────────────────────────────

  Regla: La arquitectura documenta decisiones de seguridad

    Escenario: ADRs de seguridad
      Dado que se toma decisión arquitectónica de seguridad
      Cuando se documenta como ADR
      Entonces incluye:
        | Campo                      |
        | Contexto de seguridad     |
        | Alternativas evaluadas    |
        | Decisión tomada           |
        | Controles implementados   |
        | Riesgos residuales        |
      # @evidence EVID-SAMM-DES-002

    Escenario: Segregación por confianza
      Dado que se separan componentes
      Cuando se verifica
      Entonces:
        | Nivel                      | Componentes |
        | Alto (dominio)            | Lógica de negocio |
        | Medio (aplicación)        | APIs, validación  |
        | Bajo (infraestructura)    | SQLite, sync       |
      Y no hay dependencias de bajo a alto

  Regla: La arquitectura considera amenazas

    Escenario: Threat modeling documentado
      Dado que se diseña componente
      Cuando se evalúa
      Entonces cada amenaza STRIDE tiene un control asignado
      # @evidence EVID-SAMM-DES-003
