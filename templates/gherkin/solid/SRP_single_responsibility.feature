# language: es
# SOLID - S: Single Responsibility Principle
@status:proposed
@type:acceptance
@domain:general
# PRINCIPIO: Cada módulo/clase debe tener una sola razón para cambiar
Característica: Principio de Responsabilidad Única (SOLID - S)
  Como desarrollador del proyecto GHE
  Quiero que cada componente tenga una sola responsabilidad
  Para garantizar cohesión y facilitar mantenimiento

  # ─────────────────────────────────────────────────────────────
  # 1. VERIFICACIÓN DE RESPONSABILIDAD ÚNICA
  # ─────────────────────────────────────────────────────────────

  Escenario: Verificación de Patient Domain
    Dado que se analiza el bounded context Patient
    Cuando se revisa responsabilidad
    Entonces el dominio Patient solo gestiona:
      | Responsabilidad            | Ejemplo              |
      | Registro de paciente       | Crear, actualizar    |
      | Datos demográficos         | Nombre, CURP, edad   |
      | Identificación             | ID único, validación |
      | Estado del paciente        | Activo, inactivo     |
    Y NO gestiona:
      | Responsabilidad ajena      | Por qué es incorrecto|
      | Consultas médicas          | PertenecClinical     |
      | Prescripciones             | PertenecPrescription |
      | Inventario                 | PertenecPharmacy     |

  Escenario: Verificación de Consultation Domain
    Dado que se analiza el bounded context Clinical
    Cuando se revisa responsabilidad
    Entonces el dominio Clinical solo gestiona:
      | Responsabilidad            | Ejemplo              |
      | Crear consulta             | Timestamp, provider  |
      | Documentar SOAP            | Notas clínicas       |
      | Registrar diagnóstico      | CIE-10               |
      | Plan terapéutico           | Indicaciones         |
    Y NO gestiona:
      | Responsabilidad ajena      | Por qué es incorrecto|
      | Signos vitales             | PertenecObservation  |
      | Prescripciones             | PartenecPrescription |
      | Facturación                | Fuera del alcance    |

  Escenario: Verificación de Prescription Domain
    Dado que se analiza el bounded context Prescription
    Cuando se revisa responsabilidad
    Entonces Prescription solo gestiona:
      | Responsabilidad            |
      | Crear receta médica        |
      | Validar interacciones      |
      | Verificar alergias         |
      | Firma electrónica          |
    Y NO gestiona:
      | Responsabilidad            |
      | Dispensar medicamento      |
      | Manejar inventario         |
      | Calcular costos            |

  Escenario: Verificación de Pharmacy Domain
    Dado que se analiza el bounded context Pharmacy
    Cuando se revisa responsabilidad
    Entonces Pharmacy solo gestiona:
      | Responsabilidad            |
      | Inventario de medicamentos |
      | Dispensación               |
      | Control de lotes           |
      | Alertas de caducidad       |
    Y NO gestiona:
      | Responsabilidad            |
      | Crear recetas médicas      |
      | Diagnosticar pacientes     |
      | Generar reportes clínicos  |

  # ─────────────────────────────────────────────────────────────
  # 2. DETECCIÓN DE VIOLACIONES
  # ─────────────────────────────────────────────────────────────

  Escenario: Detección de God Object
    Dado que se revisa código en busca de violaciones
    Cuando se encuentra una clase con múltiples responsabilidades
    Entonces se identifica:
      | Clase detectada            | Responsabilidades     | Acción |
      | PatientService             | CRUD + consultas + prescripciones + reportes | Refactorizar |
    Y se propone separar en:
      | Nueva clase                | Responsabilidad       |
      | PatientService             | CRUD de pacientes     |
      | PatientConsultationService | Consultas del paciente|
      | PatientReportService       | Reportes del paciente |

  Escenario: Verificación de función pura
    Dado que se analiza una función del dominio
    Cuando se verifica pureza
    Entonces la función:
      | Criterio                   | Estado    |
      | No tiene efectos secundarios| ✅        |
      | No modifica estado externo | ✅        |
      | Mismo input = mismo output | ✅        |
      | Dependencias inyectadas    | ✅        |

  # ─────────────────────────────────────────────────────────────
  # 3. MÉTRICAS DE RESPONSABILIDAD ÚNICA
  # ─────────────────────────────────────────────────────────────

  Escenario: Métricas de cohesión
    Dado que se miden métricas de cohesión
    Cuando se evalúa LCOM (Lack of Cohesion of Methods)
    Entonces se verifica:
      | Módulo                     | LCOM   | Estado |
      | Patient Domain             | 0.2    | ✅ Alto cohesión |
      | Consultation Domain        | 0.3    | ✅ Alto cohesión |
      | Pharmacy Domain            | 0.1    | ✅ Alto cohesión |
      | Reporting Module           | 0.6    | ⚠️ Revisar |
    Y LCOM < 0.5 indica alta cohesión (deseable)
  