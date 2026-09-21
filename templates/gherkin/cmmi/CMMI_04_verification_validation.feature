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

    Escenario: Plan de verificación
      Dado que se verifica componente
      Cuando se ejecuta verificación
      Entonces incluye:
        | Elemento                    |
        | Qué se verifica           |
        | Cómo se verifica          |
        | Criterio de éxito         |
        | Evidencia requerida       |
      # @evidence EVID-CMMI-VER-001

  Regla: La verificación usa múltiples métodos

    Escenario: Métodos de verificación
      Dado que se verifica componente
      Cuando se evalúa
      Entonces se usan:
        | Método                     |
        | Revisiones de código     |
        | Tests unitarios           |
        | Tests de integración     |
        | Análisis estático        |
        | Inspección visual        |
      # @evidence EVID-CMMI-VER-002

  Regla: La validación verifica que el sistema cumple necesidades del usuario

    Escenario: Validación clínica
      Dado que se valida componente clínico
      Cuando se verifica
      Entonces:
        | Verificación              |
        | Médico aprueba comportamiento |
        | Flujo clínico correcto   |
        | Cálculos correctos       |
        | Alertas appropriate      |
      # @evidence EVID-CMMI-VER-003

  Regla: No se libera sin verificación completa

    Escenario: Liberación bloqueada
      Dado que hay verificación pendiente
      Cuando se intenta liberar
      Entonces la liberación es bloqueada
      # @evidence EVID-CMMI-VER-004
