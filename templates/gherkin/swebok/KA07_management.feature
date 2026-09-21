# language: es
# @id GHE-SWEBOK-KA07-001
# @type practice
# @domain engineering
# @layer governance
# @risk s2
# @owner project-manager
# @status proposed
# @requirement PRACTICE-GHE-007
# @risk-control CTRL-SWEBOK-KA07
# @regulation N/A
@domain:engineering @type:practice @risk:s2 @status:proposed
Característica: SWEBOK KA-07 - Gestión de Ingeniería
  Como director del proyecto GHE
  Quiero gestión de ingeniería estructurada
  Para que cada sprint entregue valor medible

  Regla: El trabajo se planifica por sprints

    Escenario: Sprint planificado
      Dado que se planifica sprint
      Cuando se selecciona trabajo
      Entonces: historias priorizadas, capacidad definida, dependencias identificadas
      # @evidence EVID-SWEBOK-KA07-001

  Regla: El avance se mide diariamente

    Escenario: Daily standup
      Dado que se ejecuta daily
      Cuando se reporta
      Entonces: qué hice, qué haré, impedimentos
      # @evidence EVID-SWEBOK-KA07-002

  Regla: La retrospectiva mejora el proceso

    Escenario: Retrospectiva
      Dado que se completa sprint
      Cuando se retrospectiva
      Entonces: qué salió bien, qué mejorar, acciones concretas
      # @evidence EVID-SWEBOK-KA07-003
