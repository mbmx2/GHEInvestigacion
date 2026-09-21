# language: es
# @id GHE-CMMI-VER-001
# @type compliance
# @domain process
# @layer engineering
# @risk s1
# @owner qa-lead
# @status proposed
# @requirement CMMI-VER
# @risk-control CTRL-CMMI-VER
# @regulation N/A
@domain:process @type:compliance @risk:s1 @status:proposed
Característica: CMMI - Verificación y Validación (VER + VAL)
  Como responsable de QA del proyecto GHE
  Quiero verificación y validación según CMMI
  Para que cada componente sea probado antes de producción

  Regla: Cada componente tiene plan de verificación

    Escenario: Plan de verificación completo
      Dado que se verifica componente
      Cuando se ejecuta verificación
      Entonces incluye: qué se verifica, cómo se verifica, criterio de éxito, evidencia
      # @evidence EVID-CMMI-VER-001

    Escenario: Verificación sin plan
      Dado que se intenta verificar sin plan
      Cuando se detecta
      Entonces se bloquea hasta crear plan
      # @evidence EVID-CMMI-VER-001-N

  Regla: La verificación usa múltiples métodos

    Escenario: Métodos de verificación
      Dado que se verifica componente
      Cuando se evalúa
      Entonces se usan: revisiones de código, tests unitarios, tests de integración, análisis estático, inspección visual
      # @evidence EVID-CMMI-VER-002

  Regla: La validación verifica necesidades del usuario

    Escenario: Validación clínica
      Dado que se valida componente clínico
      Cuando se verifica
      Entonces: médico aprueba comportamiento, flujo correcto, cálculos correctos, alertas appropriate
      # @evidence EVID-CMMI-VER-003

  # @invariante INV-VER-001: No se libera sin verificación completa
  Regla: No se libera sin verificación

    Escenario: Liberación bloqueada
      Dado que hay verificación pendiente
      Cuando se intenta liberar
      Entonces la liberación es bloqueada
      # @evidence EVID-CMMI-VER-004

    Escenario: Liberación con verificación
      Dado que toda verificación está completa
      Cuando se libera
      Entonces la liberación se ejecuta exitosamente
      # @evidence EVID-CMMI-VER-005
