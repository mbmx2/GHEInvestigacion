# language: es
# @id GHE-SAFETY-TP-001
# @type safety
# @domain clinical_safety
# @layer clinical
# @risk s1
# @owner nurse-director
# @status proposed
# @requirement REQ-SAFETY-TP
# @risk-control CTRL-SAFETY-TP
# @regulation NOM-004
@domain:clinical_safety @type:safety @risk:s1 @status:proposed
Característica: Protocolo de Transferencia entre Unidades
  Como responsable de enfermería del hospital
  Quiero que toda transferencia de paciente entre unidades sea segura y documentada
  Para que no se pierda información ni se comprometa la seguridad

  Regla: Toda transferencia tiene protocolo

    Escenario: Transferencia documentada
      Dado que paciente se transfiere a otra unidad
      Cuando se procesa transferencia
      Entonces incluye:
        | Campo                      |
        | Unidad de origen          |
        | Unidad de destino         |
        | Motivo de transferencia   |
        | Medicación actual         |
        | Alergias                  |
        | Estado del paciente       |
        | Tiempo de transferencia   |

  Regla: Verificación antes de transferencia

    Escenario: Checklist de transferencia
      Dado que se prepara transferencia
      Cuando se verifica
      Entonces:
        | Verificación              |
        | Paciente estabilizado     |
        | Unidad destino informada  |
        | Transporte disponible     |
        | Equipo de monitoreo       |
        | Medicación acompañante   |

  Regla: La transferencia se notifica

    Escenario: Notificación de transferencia
      Dado que se procesa transferencia
      Cuando se notifica
      Entonces:
        | Quién se notifica         |
        | Unidad destino            |
        | Médico tratante          |
        | Familia del paciente     |
        | Dirección del hospital   |

  # @invariante INV-TP-001: No hay transferencia sin plan documentado
  Regla: Sin plan no hay transferencia

    Escenario: Transferencia sin plan
      Dado que se intenta transferir sin plan
      Cuando se verifica
      Entonces la transferencia se bloquea hasta completar plan
