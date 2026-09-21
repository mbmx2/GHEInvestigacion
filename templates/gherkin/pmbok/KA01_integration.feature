# language: es
# @id GHE-PMBOK-KA01-001
# @type practice
# @domain management
# @layer governance
# @risk s2
# @owner project-manager
# @status proposed
# @requirement PRACTICE-GHE-PMBOK-001
# @risk-control CTRL-PMBOK-KA01
# @regulation N/A
@domain:management @type:practice @risk:s2 @status:proposed
Característica: PMBOK KA-01 - Gestión Integrada de Proyectos
  Como director del proyecto GHE
  Quiero integrar todas las áreas de gestión
  Para que cada entregable sea coherente y trazable

  Regla: Todo proyecto tiene charter aprobado

    Escenario: Charter completo
      Dado que se inicia proyecto
      Cuando se documenta
      Entonces incluye: propósito, alcance, hitos, riesgos, stakeholders
      # @evidence EVID-PMBOK-KA01-001

    Escenario: Sin charter
      Dado que no existe charter
      Cuando se verifica
      Entonces se bloquea hasta crear y aprobar
      # @evidence EVID-PMBOK-KA01-001-N

  Regla: Todo cambio se gestiona

    Escenario: Control de cambios
      Dado que se solicita cambio
      Cuando se evalúa
      Entonces: análisis de impacto, aprobación, actualización de documentos
      # @evidence EVID-PMBOK-KA01-002

  Regla: Las decisiones se documentan

    Escenario: Decisiones registradas
      Dado que se toma decisión
      Cuando se documenta
      Entonces: qué, por qué, alternativas, consecuencias, responsable
      # @evidence EVID-PMBOK-KA01-003
