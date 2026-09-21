# language: es
# @id GHE-NIST-SSDF-RV-001
# @type compliance
# @domain security
# @layer operations
# @risk s1
# @owner security-lead
# @status proposed
# @requirement NIST-SSDF-RV
# @risk-control CTRL-NIST-SSDF-RV
# @regulation NOM-024
@domain:security @type:compliance @risk:s1 @status:proposed
Característica: NIST SSDF RV - Responder a Vulnerabilidades
  Como responsable de seguridad del proyecto GHE
  Quiero responder rápidamente a vulnerabilidades descubiertas
  Para que se corrijan antes de ser explotadas

  Regla: Las vulnerabilidades se reportan de forma segura

    Escenario: Canal de reporte
      Dado que se descubre una vulnerabilidad
      Cuando se reporta
      Entonces se usa canal seguro (no público)
      Y se clasifica por severidad
      # @evidence EVID-NIST-SSDF-RV-001

  Regla: Las vulnerabilidades se remedian según severidad

    Escenario: Remediación según SLA
      Dado que se clasifica vulnerabilidad
      Cuando se planifica remediación
      Entonces:
        | Severidad | Tiempo máximo |
        | Crítica | 24 horas |
        | Alta | 7 días |
        | Media | 30 días |
        | Baja | Siguiente release |
      # @evidence EVID-NIST-SSDF-RV-002

  Regla: Se verifica que la remediación funciona

    Escenario: Verificación post-remediación
      Dado que se corrige vulnerabilidad
      Cuando se verifica
      Entonces: la vulnerabilidad ya no se detecta y no se introdujeron nuevas
      # @evidence EVID-NIST-SSDF-RV-003

  Regla: Se comunican vulnerabilidades a stakeholders

    Escenario: Notificación de vulnerabilidad
      Dado que se detecta vulnerabilidad que afecta a usuarios
      Cuando se notifica
      Entonces: se informa a stakeholders, se documenta, se planifica remediación
      # @evidence EVID-NIST-SSDF-RV-004

  # @invariante INV-SSDF-RV-001: Ninguna vulnerabilidad queda sin seguimiento
  Regla: Toda vulnerabilidad tiene dueño y fecha

    Escenario: Vulnerabilidad sin seguimiento
      Dado que se detecta vulnerabilidad sin owner
      Cuando se audita
      Entonces se asigna owner y fecha de remediación
      # @evidence EVID-NIST-SSDF-RV-005
