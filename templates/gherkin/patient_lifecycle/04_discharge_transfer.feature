# language: es
# @id GHE-PATIENT-LIFECYCLE-DISCHARGE-001
# @type clinical
# @domain patient
# @layer domain
# @risk s2
# @owner medical-director
# @status proposed
# @requirement REQ-PATIENT-DISCHARGE
# @risk-control CTRL-PATIENT-DISCHARGE
# @regulation NOM-004
@domain:patient @type:clinical @risk:s2 @status:proposed
Característica: Alta y Transferencia de Pacientes
  Como médico del hospital
  Quiero que todo alta y transferencia sea segura y documentada
  Para que no se pierda información ni se comprometa la seguridad

  Regla: Todo alta tiene plan documentado

    Escenario: Plan de alta completo
      Dado que se decide dar de alta
      Cuando se prepara alta
      Entonces incluye: diagnóstico, tratamiento, medicamentos, cuidados, próximos pasos

    Escenario: Alta sin plan
      Dado que se intenta dar alta sin plan
      Cuando se verifica
      Entonces: alta bloqueada hasta completar plan

  Regla: El paciente comprende el plan

    Escenario: Educación al alta
      Dado que se entrega plan de alta
      Cuando se educa
      Entonces: paciente entiende medicamentos, sabe cuándo volver, conoce signos de alarma

  Regla: Seguimiento post-alta se programa

    Escenario: Seguimiento programado
      Dado que paciente egresa
      Cuando se programa seguimiento
      Entonces tiene fecha y responsable
