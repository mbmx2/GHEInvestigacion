# language: es
# @id GHE-SWEBOK-KA05-001
# @type practice
# @domain engineering
# @layer development
# @risk s2
# @owner qa-lead
# @status proposed
# @requirement PRACTICE-GHE-005
# @risk-control CTRL-SWEBOK-KA05
# @regulation N/A
@domain:engineering @type:practice @risk:s2 @status:proposed
Característica: SWEBOK KA-05 - Mantenimiento de Software
  Como responsable de mantenimiento del proyecto GHE
  Quiero procesos de mantenimiento estructurados
  Para que el software evolucione sin acumular deuda técnica

  Regla: Todo cambio tiene clasificación

    Escenario: Clasificación de cambios
      Dado que se solicita un cambio
      Cuando se evalúa
      Entonces se clasifica en: correctivo, adaptativo, perfectivo, preventivo
      # @evidence EVID-SWEBOK-KA05-001

  Regla: Cambios se verifican antes de implementar

    Escenario: Verificación de cambio
      Dado que se implementa un cambio
      Cuando se verifica
      Entonces: tests pasan, no hay regresiones, documentación actualizada
      # @evidence EVID-SWEBOK-KA05-002

  Regla: Deuda técnica se gestiona

    Escenario: Deuda técnica registrada
      Dado que se detecta deuda técnica
      Cuando se registra
      Entonces tiene: severidad, esfuerzo estimado, prioridad, responsable
      # @evidence EVID-SWEBOK-KA05-003

  Regla: 20% del sprint se dedica a deuda técnica

    Escenario: Presupuesto de deuda
      Dado que se planifica sprint
      Cuando se asigna capacidad
      Entonces máximo 20% para deuda técnica
      # @evidence EVID-SWEBOK-KA05-004
