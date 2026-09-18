# language: es
# HL7 FHIR R4 - Interoperabilidad en Salud
Característica: HL7 FHIR R4 - Interoperabilidad (GHE)
  Como desarrollador de interoperabilidad del proyecto GHE
  Quiero implementar endpoints FHIR R4
  Para intercambiar datos con otros sistemas de salud

  # ─────────────────────────────────────────────────────────────
  # 1. RECURSOS FHIR BÁSICOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Patient Resource
    Dado que se expone Patient vía FHIR
    Cuando se consulta GET /fhir/Patient/{id}
    Entonces retorna:
      | Campo                      | FHIR Path            |
      | resourceType               | "Patient"            |
      | id                         | UUID                 |
      | identifier[0].value        | CURP                 |
      | name[0].family             | Apellido             |
      | name[0].given[0]           | Nombre               |
      | gender                     | "male"/"female"      |
      | birthDate                  | AAAA-MM-DD           |
      | telecom[0].value           | Teléfono             |
      | address[0]                 | Domicilio            |

  Escenario: Encounter Resource
    Dado que se expone Encounter vía FHIR
    Cuando se consulta
    Entonces retorna:
      | Campo                      | FHIR Path            |
      | resourceType               | "Encounter"          |
      | patient.reference          | Patient/{id}         |
      | class.code                 | "AMB" (ambulatoria)  |
      | type[0].coding[0].code     | Consulta             |
      | period.start               | Fecha/hora inicio    |
      | period.end                 | Fecha/hora fin       |
      | status                     | "finished"           |

  Escenario: Observation Resource (Signos Vitales)
    Dado que se expone Observation vía FHIR
    Cuando se consulta
    Entonces retorna:
      | Campo                      | FHIR Path            |
      | resourceType               | "Observation"        |
      | status                     | "final"              |
      | category[0].coding[0].code | "vital-signs"        |
      | code[0].coding[0].code     | LOINC code           |
      | valueQuantity.value         | Valor numérico       |
      | valueQuantity.unit          | Unidad               |
      | effectiveDateTime           | Fecha/hora           |

  Escenario: Condition Resource (Diagnósticos)
    Dado que se expone Condition vía FHIR
    Cuando se consulta
    Entonces retorna:
      | Campo                      | FHIR Path            |
      | resourceType               | "Condition"          |
      | patient.reference          | Patient/{id}         |
      | code[0].coding[0].system   | "http://hl7.org/fhir/sid/icd-10" |
      | code[0].coding[0].code     | Código CIE-10        |
      | clinicalStatus             | "active"             |
      | onsetDateTime              | Fecha de inicio      |

  Escenario: MedicationRequest Resource
    Dado que se expone MedicationRequest vía FHIR
    Cuando se consulta
    Entonces retorna:
      | Campo                      | FHIR Path            |
      | resourceType               | "MedicationRequest"  |
      | status                     | "active"             |
      | intent                     | "order"              |
      | medicationReference        | Medication/{id}      |
      | dosageInstruction[0]       | Dosis, frecuencia    |
      | authoredOn                 | Fecha prescripción   |

  # ─────────────────────────────────────────────────────────────
  # 2. OPERACIONES FHIR
  # ─────────────────────────────────────────────────────────────

  Escenario: Búsqueda de pacientes
    Dado que se busca paciente vía FHIR
    Cuando se ejecuta GET /fhir/Patient?family=García
    Entonces retorna Bundle con:
      | Campo                      | Contenido           |
      | resourceType               | "Bundle"            |
      | type                       | "searchset"         |
      | total                      | Número de resultados|
      | entry[]                    | Pacientes encontrados|

  Escenario: Búsqueda de observaciones
    Dado que se buscan signos vitales
    Cuando se ejecuta GET /fhir/Observation?patient={id}&code=85354-9
    Entonces retorna observaciones de PA del paciente

  # ─────────────────────────────────────────────────────────────
  # 3. VALIDACIÓN FHIR
  # ─────────────────────────────────────────────────────────────

  Escenario: Validación de recursos
    Dado que se crea recurso FHIR
    Cuando se valida
    Entonces:
      | Validación                  | Estado    |
      | Estructura correcta        | ✅         |
      | Perfiles obligatorios      | ✅         |
      | Codificación válida        | ✅         |
      | Referencias resueltas      | ✅         |

  # ─────────────────────────────────────────────────────────────
  # 4. SEGURIDAD FHIR
  # ─────────────────────────────────────────────────────────────

  Escenario: Autenticación OAuth2
    Dado que se accede a endpoints FHIR
    Cuando se autentica
    Entonces:
      | Criterio                   | Estado    |
      | Token OAuth2 requerido     | ✅         |
      | Scopes definidos           | ✅         |
      | CORS configurado           | ✅         |

  Escenario: Autorización por paciente
    Dado que se accede a datos de paciente
    Cuando se verifica autorización
    Entonces:
      | Criterio                   | Estado    |
      | Solo accede autorizado     | ✅         |
      | Scope patient/*.read       | ✅         |
      | Scope patient/*.write      | ✅ (si role) |
