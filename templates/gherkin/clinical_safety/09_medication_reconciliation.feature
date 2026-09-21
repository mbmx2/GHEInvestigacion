# language: es
# @id GHE-SAFETY-MR-001
# @type safety
# @domain clinical_safety
# @layer clinical
# @risk s1
# @owner pharmacist
# @status proposed
# @requirement REQ-SAFETY-MR
# @risk-control CTRL-SAFETY-MR
# @regulation NOM-004
@domain:clinical_safety @type:safety @risk:s1 @status:proposed
Característica: Reconciliación de Medicamentos
  Como farmacéutico del hospital
  Quiero que cada cambio de medicación sea reconciliado
  Para prevenir errores de medicación en transiciones de cuidado

  Regla: Toda transición de cuidado incluye reconciliación

    Escenario: Reconciliación al ingreso
      Dado que paciente es hospitalizado
      Cuando se registra medicación
      Entonces se verifica:
        | Verificación              |
        | Medicamentos previos      |
        | Medicamentos actuales     |
        | Alergias                  |
        | Interacciones            |
        | Dosis correcta           |

    Escenario: Reconciliación al alta
      Dado que paciente egresa
      Cuando se prepara alta
      Entonces se verifica:
        | Verificación              |
        | Medicamentos de alta vs. previos |
        | Dosis actualizadas       |
        | Instrucciones claras     |
        | Paciente comprende       |

    Escenario: Reconciliación en transferencia
      Dado que paciente se transfiere a otra unidad
      Cuando se procesa transferencia
      Entonces se verifica:
        | Verificación              |
        | Medicación actual completa |
        | Alergias documentadas    |
        | Nueva unidad informada   |

  Regla: Doble verificación en medicamentos críticos

    Escenario: Doble verificación
      Dado que se administra medicamento de alto riesgo
      Cuando se verifica
      Entonces dos profesionales verifican:
        | Verificación              |
        | Paciente correcto         |
        | Medicamento correcto      |
        | Dosis correcta            |
        | Vía correcta             |
        | Hora correcta            |

  Regla: Reconciliación documentada

    Escenario: Documentación de reconciliación
      Dado que se reconcilian medicamentos
      Cuando se documenta
      Entonces incluye:
        | Campo                      |
        | Medicamentos antes         |
        | Medicamentos después      |
        | Cambios realizados        |
        | Justificación             |
        | Profesional responsable   |
        | Fecha y hora              |
