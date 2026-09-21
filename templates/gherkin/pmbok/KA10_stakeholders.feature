# language: es
# @id GHE-PMBOK-KA10-001
# @type practice
# @domain management
# @layer governance
# @risk s2
# @owner project-manager
# @status proposed
# @requirement PRACTICE-GHE-PMBOK-010
# @risk-control CTRL-PMBOK-KA10
# @regulation N/A
@domain:management @type:practice @risk:s2 @status:proposed
Característica: PMBOK KA-10 - Gestión de Interesados
  Como director del proyecto GHE
  Quiero que los stakeholders estén identificados y gestionados
  Para que el proyecto tenga soporte y no encuentre resistencia

  Regla: Los stakeholders se identifican

    Escenario: Stakeholders documentados
      Dado que se identifican stakeholders
      Cuando se registra
      Entonces: nombre, rol, interés, influencia, actitud
      # @evidence EVID-PMBOK-KA10-001

  Regla: La satisfacción se mide

    Escenario: Encuesta de satisfacción
      Dado que se mide satisfacción
      Cuando se ejecuta encuesta
      Entonces se compara con target
      # @evidence EVID-PMBOK-KA10-002

  Regla: La resistencia se gestiona

    Escenario: Resistencia al cambio
      Dado que se detecta resistencia
      Cuando se evalúa
      Entonces: estrategia de engagement, comunicación, capacitación
      # @evidence EVID-PMBOK-KA10-003

  Regla: Los stakeholders se actualizan

    Escenario: Actualización periódica
      Dado que hay cambios significativos
      Cuando se notifica
      Entonces todos los stakeholders relevantes reciben información
      # @evidence EVID-PMBOK-KA10-004
