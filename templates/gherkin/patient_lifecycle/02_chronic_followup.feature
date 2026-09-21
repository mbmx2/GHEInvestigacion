# language: es
# @id GHE-PATIENT-LIFECYCLE-CHRONIC-001
# @type clinical
# @domain patient
# @layer domain
# @risk s2
# @owner medical-director
# @status proposed
# @requirement REQ-PATIENT-CHRONIC
# @risk-control CTRL-PATIENT-CHRONIC
# @regulation NOM-004
@domain:patient @type:clinical @risk:s2 @status:proposed
Característica: Seguimiento de Pacientes Crónicos
  Como médico del hospital
  Quiero dar seguimiento estructurado a pacientes con enfermedades crónicas
  Para prevenir complicaciones y mejorar calidad de vida

  Regla: Todo paciente crónico tiene plan de seguimiento

    Escenario: Plan de seguimiento generado
      Dado que paciente tiene diabetes diagnosticada
      Cuando se registra diagnóstico
      Entonces sistema genera plan:
        | Frecuencia                | Actividades |
        | Cada 3 meses              | HbA1c, glucosa, control clínico |
        | Cada 6 meses              | Perfil lipídico, función renal |
        | Cada 12 meses             | Fondo de ojo, examen pies |

  Regla: El seguimiento se ejecuta según plan

    Escenario: Control pendiente detectado
      Dado que paciente tiene control pendiente
      Cuando se revisa expediente
      Entonces sistema genera alerta:
        | Alerta                    |
        | "Control de diabetes pendiente desde hace 4 meses" |
        | "Solicitar HbA1c y control" |

  Regenario: Inasistencia a control crónico
    Dado que paciente no asiste a control programado
    Cuando se detecta
    Entonces sistema genera alerta y notifica al equipo

  Regla: El plan se actualiza con cada contacto

    Escenario: Actualización de plan
      Dado que paciente acude a control
      Cuando se actualiza plan
      Entonces próximo control se agenda según protocolo
