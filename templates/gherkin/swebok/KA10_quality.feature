# language: es
# @id GHE-SWEBOK-KA10-001
# @type practice
# @domain engineering
# @layer quality
# @risk s2
# @owner qa-lead
# @status proposed
# @requirement PRACTICE-GHE-010
# @risk-control CTRL-SWEBOK-KA10
# @regulation N/A
@domain:engineering @type:practice @risk:s2 @status:proposed
Característica: SWEBOK KA-10 - Calidad de Software
  Como responsable de calidad del proyecto GHE
  Quiero que la calidad sea medible y mejorable
  Para que cada release sea mejor que el anterior

  Regla: La calidad se mide con métricas

    Escenario: Métricas de calidad definidas
      Dado que se definen métricas
      Cuando se mide
      Entonces: cobertura, defectos, deuda técnica, satisfacción
      # @evidence EVID-SWEBOK-KA10-001

  Regla: La calidad se asegura con procesos

    Escenario: QA implementado
      Dado que se ejecuta QA
      Cuando se verifica
      Entonces: revisiones, análisis estático, auditorías
      # @evidence EVID-SWEBOK-KA10-002

  Regla: La calidad mejora continuamente

    Escenario: Mejora continua
      Dado que se identifican áreas de mejora
      Cuando se implementan
      Entonces se verifican efectividad y se documenta
      # @evidence EVID-SWEBOK-KA10-003
