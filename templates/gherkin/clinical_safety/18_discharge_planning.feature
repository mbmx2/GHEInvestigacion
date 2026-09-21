# language: es
# @id GHE-SAFETY-DP-001
# @type safety
# @domain clinical_safety
# @layer clinical
# @risk s2
# @owner medical-director
# @status proposed
# @requirement REQ-SAFETY-DP
# @risk-control CTRL-SAFETY-DP
# @regulation NOM-004
@domain:clinical_safety @type:safety @risk:s2 @status:proposed
Característica: Plan de Alta (Discharge Planning)
  Como médico del hospital
  Quiero que todo alta tenga un plan documentado y verificado
  Para que el paciente sepa qué hacer en casa y cuándo volver

  Regla: Todo alta tiene plan documentado

    Escenario: Plan de alta completo
      Dado que se decide dar de alta
      Cuando se prepara alta
      Entonces el plan incluye:
        | Sección                   |
        | Diagnóstico de alta       |
        | Tratamiento de alta       |
        | Medicamentos con dosis    |
        | Cuidados en domicilio    |
        | Criterios de alarma      |
        | Próxima cita             |
        | Contacto de emergencia   |

  Reglage: El paciente comprende el plan

    Escenario: Educación al alta
      Dado que se entrega plan de alta
      Cuando se educa al paciente
      Entonces se verifica:
        | Verificación              |
        | Paciente entiende medicamentos |
        | Paciente sabe cuándo volver |
        | Paciente conoce signos de alarma |
        | Paciente tiene contacto de emergencia |

  Regla: El plan se documenta en expediente

    Escenario: Documentación de alta
      Dado que se completa alta
      Cuando se registra
      Entonces incluye:
        | Campo                      |
        | Fecha/hora de alta        |
        | Médico responsable        |
        | Destino del paciente      |
        | Plan de seguimiento       |
        | Firma del paciente       |

  Regla: Seguimiento post-alta se programa

    Escenario: Seguimiento programado
      Dado que paciente egresa
      Cuando se programa seguimiento
      Entonces:
        | Tipo de paciente          | Seguimiento |
        | Post-cirugía             | 1 semana |
        | Post-parto               | 6 semanas |
        | Enfermedad crónica       | Según protocolo |
        | Emergencia               | 48-72 horas |

  # @invariante INV-DP-001: No hay alta sin plan documentado
  Regla: Sin plan no hay alta

    Escenario: Alta sin plan
      Dado que se intenta dar alta sin plan
      Cuando se verifica
      Entonces la alta es bloqueada hasta completar plan
