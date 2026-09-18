# language: es
# SWEBOK KA-09: Software Engineering Models and Methods
# ÁREA DE CONOCIMIENTO: Modelos y Métodos de Ingeniería de Software
Característica: Modelos y Métodos (SWEBOK KA-09)
  Como arquitecto del proyecto GHE
  Quiero aplicar modelos y métodos apropiados
  Para estructurar el desarrollo de forma consistente

  # ─────────────────────────────────────────────────────────────
  # 1. MODELOS DE PROCESO
  # ─────────────────────────────────────────────────────────────

  Escenario: Selección de modelo de proceso
    Dado que se selecciona modelo de proceso para GHE
    Cuando se evalúan opciones
    Entonces se documenta:
      | Modelo                     | Elegido | Justificación |
      | Waterfall                  | No      | Muy rígido para clínico |
      | V-Model                    | No      | Applicable pero pesado |
      | Incremental                | No      | Sin feedback temprano   |
      | **Iterative/Agile**        | **Sí**  | Feedback continuo con usuarios clínicos |
      | Spiral                     | No      | Complejidad innecesaria |
      | DevOps                     | Complemento | CI/CD y monitoreo |
    Y se justifica la selección con beneficios para contexto clínico

  # ─────────────────────────────────────────────────────────────
  # 2. MÉTODOS DE ANÁLISIS Y DISEÑO
  # ─────────────────────────────────────────────────────────────

  Escenario: Aplicación de Domain-Driven Design
    Dado que se aplica DDD en GHE
    Cuando se modela el dominio
    Entonces se identifican:
      | Concepto DDD               | Aplicación en GHE    |
      | Bounded Contexts           | Patient, Clinical, Pharmacy |
      | Ubiquitous Language        | Términos médicos exactos |
      | Aggregates                 | Patient aggregate, Consultation aggregate |
      | Domain Events              | PatientRegistered, PrescriptionFilled |
      | Value Objects              | CURP, BloodType, VitalSigns |
      | Entities                   | Patient, Consultation, Prescription |
    Y el lenguaje del dominio se usa en código y documentación

  Escenario: Aplicación de Arquitectura Hexagonal
    Dado que se aplica Arquitectura Hexagonal
    Cuando se estructura el código
    Entonces se siguen principios:
      | Principio                   | Implementación      |
      | Dependency Inversion       | Domain no depende de infra |
      | Ports & Adapters           | Interfaces como puertos |
      | Separation of Concerns     | Una responsabilidad por módulo |
      | Open/Closed                | Abierto a extensión, cerrado a modificación |
    Y no hay dependencias circulares
    Y el dominio es testeable sin infraestructura

  Escenario: Aplicación de SOLID
    Dado que se aplican principios SOLID
    Cuando se revisa código
    Entonces se verifica:
      | Principio                   | Verificación        |
      | Single Responsibility      | Una clase = una responsabilidad |
      | Open/Closed                | Extensible sin modificar |
      | Liskov Substitution        | Subtipos son sustituibles |
      | Interface Segregation      | Interfaces específicas |
      | Dependency Inversion       | Depende de abstracciones |

  # ─────────────────────────────────────────────────────────────
  # 3. MÉTODOS DE DISEÑO
  # ─────────────────────────────────────────────────────────────

  Escenario: Diseño orientado a eventos
    Dado que se usa Event Sourcing para ciertos flujos
    Cuando se registran eventos clínicos
    Entonces se documenta:
      | Evento                     | Datos capturados     |
      | PatientRegistered          | id, timestamp, data |
      | ConsultationStarted        | patient_id, provider |
      | VitalSignsRecorded         | consultation_id, values |
      | PrescriptionCreated        | medication, dosage   |
      | MedicationDispensed        | prescription_id, lot |
    Y los eventos son inmutables
    Y permiten reconstruir estado

  Escenario: Diseño de CQRS para consultas complejas
    Dado que se aplica Command Query Responsibility Segregation
    Cuando se separan comandos de consultas
    Entonces:
      | Operación                  | Patrón              |
      | Crear paciente             | Command             |
      | Actualizar consulta        | Command             |
      | Buscar paciente            | Query               |
      | Generar reporte            | Query               |
      | Registrar signos vitales   | Command             |
    Y las queries pueden optimizarse separadamente
    