# language: es
# @id GHE-SWEBOK-KA12-001
# @type practice
# @domain engineering
# @layer governance
# @risk s2
# @owner project-manager
# @status proposed
# @requirement PRACTICE-GHE-012
# @risk-control CTRL-SWEBOK-KA12
# @regulation N/A
@domain:engineering @type:practice @risk:s2 @status:proposed
Característica: SWEBOK KA-12 - Economía de Ingeniería
  Como director del proyecto GHE
  Quiero tomar decisiones económicas informadas
  Para que cada inversión tenga retorno medible

  Regla: Todo cambio tiene costo-beneficio

    Escenario: Análisis costo-beneficio
      Dado que se propone un cambio
      Cuando se evalúa
      Entonces se documenta: costo, beneficio, ROI, alternativas
      # @evidence EVID-SWEBOK-KA12-001

  Regla: La deuda técnica se mide en costo

    Escenario: Costo de deuda técnica
      Dado que se mide deuda técnica
      Cuando se evalúa
      Entonces: horas estimadas, costo monetario, impacto en velocidad
      # @evidence EVID-SWEBOK-KA12-002

  Regla: Se prioriza por valor económico

    Escenario: Priorización económica
      Dado que se priorizan features
      Cuando se evalúa
      Entonces se usa matriz: valor / esfuerzo / riesgo
      # @evidence EVID-SWEBOK-KA12-003
