# language: es
# @id GHE-CMMI-RD-001
# @type compliance
# @domain process
# @layer engineering
# @risk s1
# @owner requirements-lead
# @status proposed
# @requirement CMMI-RD
# @risk-control CTRL-CMMI-RD
# @regulation NOM-004
@domain:process @type:compliance @risk:s1 @status:proposed
Característica: CMMI - Desarrollo de Requisitos (RD + REQM)
  Como responsable de requisitos del proyecto GHE
  Quiero que los requisitos se desarrollen y gestionen según CMMI
  Para que cada requisito sea claro, trazable y verificable

  Regla: Los requisitos se documentan con formato estándar

    Escenario: Requisito completo
      Dado que se define un requisito
      Cuando se documenta
      Entonces incluye: ID único, descripción, fuente, prioridad, criterio de aceptación, método de verificación, estado
      # @evidence EVID-CMMI-RD-001

    Escenario: Requisito incompleto
      Dado que se detecta requisito sin criterio de aceptación
      Cuando se verifica
      Entonces se bloquea hasta completar
      # @evidence EVID-CMMI-RD-001-N

  Regla: Los requisitos se validan con stakeholders

    Escenario: Validación con usuario final
      Dado que se tiene un requisito
      Cuando se valida con stakeholder
      Entonces se confirma que es correcto, completo, consistente y verificable
      # @evidence EVID-CMMI-RD-002

  # @invariante INV-RD-001: Cada requisito tiene trazabilidad completa
  Regla: Los requisitos tienen trazabilidad

    Escenario: Trazabilidad completa
      Dado que se tiene un requisito
      Cuando se verifica trazabilidad
      Entonces se puede rastrear: requisito → norma, feature, test, evidencia
      # @evidence EVID-CMMI-RD-003

    Escenario: Trazabilidad rota
      Dado que un requisito NO tiene test asociado
      Cuando se detecta
      Entonces se genera gap de trazabilidad
      Y se solicita crear el test antes de avanzar
      # @evidence EVID-CMMI-RD-003-N

  Regla: Los cambios de requisitos se gestionan

    Escenario: Cambio de requisito
      Dado que un requisito necesita cambio
      Cuando se solicita
      Entonces se evalúa impacto, se aprueba, se actualiza trazabilidad
      # @evidence EVID-CMMI-RD-004

  # @invariante INV-RD-002: No se implementa sin requisito aprobado
  Regla: No hay implementación sin requisito

    Escenario: Implementación sin requisito
      Dado que se detecta código sin requisito asociado
      Cuando se audita
      Entonces se marca como deuda técnica
      Y se solicita documentar el requisito retroactivamente
      # @evidence EVID-CMMI-RD-005
