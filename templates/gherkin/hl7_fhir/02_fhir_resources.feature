# language: es
# @id GHE-HL7-FHIR-RESOURCES-001
# @type compliance
# @domain interoperability
# @layer infrastructure
# @risk s2
# @owner architect
# @status proposed
# @requirement REQ-HL7-FHIR-RESOURCES
# @risk-control CTRL-HL7-FHIR-RESOURCES
# @regulation NOM-024
@domain:interoperability @type:compliance @risk:s2 @status:proposed
Característica: Recursos FHIR para GHE
  Como arquitecto del hospital
  Quiero que cada entidad clínica tenga su Resource FHIR
  Para que el intercambio de datos sea interoperable

  Regla: Patient tiene Resource FHIR

    Escenario: Patient FHIR válido
      Dado que se expone Patient
      Cuando se valida contra FHIR R4
      Entonces: estructura válida, CURP en identifier, nombre, género, nacimiento

  Regla: Encounter tiene Resource FHIR

    Escenario: Encounter FHIR válido
      Dado que se expone Encounter
      Cuando se valida
      Entonces: patient reference, class code, status, period

  Regla: Observation tiene Resource FHIR

    Escenario: Observation FHIR válido
      Dado que se exponen signos vitales
      Cuando se valida
      Entonces: patient reference, code LOINC, valueQuantity, effectiveDateTime

  Regla: Condition tiene Resource FHIR

    Escenario: Condition FHIR válido
      Dado que se exponen diagnósticos
      Cuando se valida
      Entonces: patient reference, code CIE-10, clinicalStatus, onsetDateTime

  Regla: MedicationRequest tiene Resource FHIR

    Escenario: MedicationRequest FHIR válido
      Dado que se exponen recetas
      Cuando se valida
      Entonces: patient reference, medication, dosageInstruction, authoredOn

  Regla: Búsqueda funciona

    Escenario: Búsqueda de pacientes
      Dado que se busca paciente por apellido
      Cuando se ejecuta GET /fhir/Patient?family=García
      Entonces: retorna Bundle con resultados
