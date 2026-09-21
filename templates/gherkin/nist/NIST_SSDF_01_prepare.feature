# language: es
# @id GHE-NIST-SSDF-PO-001
# @type compliance
# @domain security
# @layer governance
# @risk s1
# @owner security-lead
# @status proposed
# @requirement NIST-SSDF-PO
# @risk-control CTRL-NIST-SSDF-PO
# @regulation NOM-024
@domain:security @type:compliance @risk:s1 @status:proposed
Característica: NIST SSDF PO - Preparar la Organización
  Como responsable de seguridad del proyecto GHE
  Quiero que la organización esté preparada para desarrollar software seguro
  Para que cada decisión de seguridad sea informada y documentada

  Regla: La organización define políticas de seguridad del software

    Escenario: Política de desarrollo seguro
      Dado que se define política
      Cuando se documenta
      Entonces incluye: objetivos, alcance, roles, procesos, métricas
      # @evidence EVID-NIST-SSDF-PO-001

    Escenario: Sin política definida
      Dado que no existe política de desarrollo seguro
      Cuando se verifica
      Entonces se bloquea desarrollo hasta crear política
      # @evidence EVID-NIST-SSDF-PO-001-N

  Regla: Los roles de seguridad están definidos

    Escenario: Roles documentados
      Dado que se asignan roles de seguridad
      Cuando se verifica
      Entonces:
        | Rol                        | Responsabilidad |
        | Security Champion         | Seguridad en desarrollo |
        | Security Reviewer         | Revisión de código |
        | Incident Responder        | Respuesta a incidentes |
        | Privacy Officer           | Privacidad de datos |

  Regla: El personal recibe capacitación

    Escenario: Capacitación en desarrollo seguro
      Dado que se capacita al equipo
      Cuando se ejecuta
      Entonces incluye: OWASP Top 10, secure coding, privacidad, respuesta a incidentes

  # @invariante INV-SSDF-PO-001: Toda función tiene un owner de seguridad
  Regla: Cada función tiene owner de seguridad

    Escenario: Función sin owner
      Dado que se detecta función sin owner de seguridad
      Cuando se audita
      Entonces se asigna owner y se documenta
      # @evidence EVID-NIST-SSDF-PO-002
