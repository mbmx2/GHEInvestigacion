# language: es
# @id GHE-PMBOK-KA05-001
# @type practice
# @domain management
# @layer governance
# @risk s1
# @owner qa-lead
# @status proposed
# @requirement PRACTICE-GHE-PMBOK-005
# @risk-control CTRL-PMBOK-KA05
# @regulation N/A
@domain:management @type:practice @risk:s1 @status:proposed
Característica: PMBOK KA-05 - Gestión de Calidad
  Como responsable de calidad del proyecto GHE
  Quiero que la calidad sea un proceso continuo
  Para que cada entrega sea mejor que la anterior

  Regla: La calidad tiene política documentada

    Escenario: Política de calidad
      Dado que se define política
      Cuando se documenta
      Entonces incluye: objetivos, estándares, procesos, métricas
      # @evidence EVID-PMBOK-KA05-001

  Regla: La calidad se asegura con revisiones

    Escenario: Revisiones de calidad
      Dado que se completa un entregable
      Cuando se revisa
      Entonces: checklist de calidad, aprobación, evidencia
      # @evidence EVID-PMBOK-KA05-002

  Regla: La calidad se mejora continuamente

    Escenario: Mejora continua
      Dado que se identifican áreas de mejora
      Cuando se implementan
      Entonces se verifican efectividad y se documenta
      # @evidence EVID-PMBOK-KA05-003
