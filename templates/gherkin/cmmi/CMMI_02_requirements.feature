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
      Entonces incluye:
        | Campo                      |
        | ID único                  |
        | Descripción clara         |
        | Fuente (norma/stakeholder)|
        | Prioridad                 |
        | Criterio de aceptación   |
        | Método de verificación   |
        | Estado                    |
      # @evidence EVID-CMMI-RD-001

  Regla: Los requisitos se validan con stakeholders

    Escenario: Validación con usuario final
      Dado que se tiene un requisito
      Cuando se valida con stakeholder
      Entonces se confirma que el requisito:
        | Verificación              |
        | Es correcto               |
        | Es completo               |
        | Es consistente            |
        | Es verificable            |
      # @evidence EVID-CMMI-RD-002

  Regla: Los requisitos tienen trazabilidad

    Escenario: Trazabilidad completa
      Dado que se tiene un requisito
      Cuando se verifica trazabilidad
      Entonces se puede rastrear:
        | Cadena                     |
        | Requisito → Norma         |
        | Requisito → Feature       |
        | Requisito → Test          |
        | Requisito → Evidencia     |
      # @evidence EVID-CMMI-RD-003

  Regla: Los cambios de requisitos se gestionan

    Escenario: Cambio de requisito
      Dado que un requisito necesita cambio
      Cuando se solicita
      Entonces se evalúa impacto
      Y se aprueba antes de implementar
      Y se actualiza trazabilidad
      # @evidence EVID-CMMI-RD-004
