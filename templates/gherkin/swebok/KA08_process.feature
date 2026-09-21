# language: es
# @id GHE-SWEBOK-KA08-001
# @type practice
# @domain engineering
# @layer process
# @risk s2
# @owner process-lead
# @status proposed
# @requirement PRACTICE-GHE-008
# @risk-control CTRL-SWEBOK-KA08
# @regulation N/A
@domain:engineering @type:practice @risk:s2 @status:proposed
Característica: SWEBOK KA-08 - Proceso de Ingeniería
  Como responsable de procesos del proyecto GHE
  Quiero que el proceso de desarrollo sea definido y medido
  Para que cada entrega sea predecible

  Regla: El proceso tiene fases definidas

    Escenario: Fases del proceso
      Dado que se ejecuta una funcionalidad
      Cuando se sigue el proceso
      Entonces: Inception → Elaboración → Construcción → Transición
      # @evidence EVID-SWEBOK-KA08-001

  Regla: Cada fase tiene criterios de salida

    Escenario: Criterios de salida verificados
      Dado que se completa una fase
      Cuando se verifica
      Entonces tiene criterios documentados y aprobados
      # @evidence EVID-SWEBOK-KA08-002

  Regla: El proceso se mide

    Escenario: Métricas de proceso
      Dado que se miden métricas
      Cuando se evalúa
      Entonces: velocity, lead time, cycle time, defect rate
      # @evidence EVID-SWEBOK-KA08-003
