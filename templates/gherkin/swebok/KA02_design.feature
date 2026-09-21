# language: es
# SWEBOK KA-02: Software Design
@status:proposed
# @requirement:PRACTICE-GHE-001
@type:acceptance
@domain:general
# ÁREA DE CONOCIMIENTO: Diseño de Software
Característica: Diseño de Software (SWEBOK KA-02)
  Como arquitecto de software del proyecto GHE
  Quiero diseñar el sistema con principios sólidos
  Para garantizar mantenibilidad, escalabilidad y calidad arquitectónica

  # ─────────────────────────────────────────────────────────────
  # 1. DISEÑO DE ARQUITECTURA
  # ─────────────────────────────────────────────────────────────

  Escenario: Definición de arquitectura hexagonal
    Dado que se diseña la arquitectura de GHE
    Cuando se define la estructura
    Entonces se documenta:
      | Componente                | Responsabilidad      |
      | Domain Layer              | Lógica de negocio    |
      | Application Layer         | Casos de uso         |
      | Infrastructure Layer      | SQLite, sync, encrypt|
      | Interface Layer           | Web UI, REST API     |
    Y cada componente se comunica solo a través de puertos (interfaces)
    Y no hay dependencias directas entre capas externas

  Escenario: Definición de bounded contexts
    Dado que se aplica Domain-Driven Design
    Cuando se identifican contextos acotados
    Entonces se definen:
      | Bounded Context           | Entidades principales|
      | Patient                   | Patient, Allergy     |
      | Clinical                  | Consultation, Note   |
      | Obstetric                 | Pregnancy, PrenatalVisit |
      | Pharmacy                  | Inventory, Dispensing|
      | Prescription              | Prescription, CDS    |
      | Reporting                 | Report, Dashboard    |
    Y cada bounded context tiene su propio dominio
    Y la comunicación entre contextos es por eventos de dominio

  Escenario: Evaluación de decisiones arquitectónicas (ADR)
    Dado que se toma una decisión arquitectónica
    Cuando se documenta como ADR
    Entonces el ADR incluye:
      | Sección                   |
      | Estado (Propuesto/Aceptado/Deprecated/Superseded) |
      | Contexto                  |
      | Decisión                  |
      | Consecuencias (positivas y negativas) |
      | Alternativas consideradas |
    Y se numeran secuencialmente (ADR-001, ADR-002, etc.)
    Y se mantienen actualizados

  # ─────────────────────────────────────────────────────────────
  # 2. DISEÑO DE COMPONENTES
  # ─────────────────────────────────────────────────────────────

  Escenario: Diseño de componentes del dominio
    Dado que se diseñan componentes clínicos
    Cuando se definen interfaces
    Entonces cada componente expone:
      | Componente                | Interface            |
      | Patient                   | PatientRepository    |
      | Clinical                  | ConsultationRepository|
      | Obstetric                 | PrenatalRepository   |
      | Pharmacy                  | InventoryRepository  |
      | Prescription              | PrescriptionService  |
    Y cada interface define operaciones CRUD básicas
    Y cada interface define operaciones de dominio específicas

  Escenario: Diseño de patrones de diseño
    Dado que se aplican patrones de diseño
    Cuando se implementan
    Entonces se usan patrones apropiados:
      | Patrón                    | Uso en GHE           |
      | Repository                | Acceso a datos       |
      | Strategy                  | Algoritmos intercambiables (CDS) |
      | Observer                  | Eventos de dominio   |
      | Factory                   | Creación de entidades|
      | Command                   | Operaciones undo/redo|
      | Template Method           | Flujos estandarizados|
      | Adapter                   | Conexión con sistemas externos|

  # ─────────────────────────────────────────────────────────────
  # 3. DISEÑO DE INTERFACES
  # ─────────────────────────────────────────────────────────────

  Escenario: Diseño de interfaz de usuario
    Dado que se diseña la UI de GHE
    Cuando se definen pantallas
    Entonces se documentan:
      | Pantalla                  | Componentes          |
      | Lista de pacientes        | Tabla, búsqueda, filtros |
      | Expediente del paciente   | Tabs, formularios, gráficas |
      | Formulario de consulta    | Campos SOAP, botones |
      | Receta electrónica        | Lista medicamentos, firma |
      | Dashboard                 | KPIs, gráficas       |
    Y cada pantalla tiene wireframe asociado
    Y se validan con usuarios reales

  Escenario: Diseño de API REST
    Dado que se diseña la API de GHE
    Cuando se definen endpoints
    Entonces se sigue convención RESTful:
      | Recurso                   | Método | Endpoint               |
      | Pacientes                 | GET    | /api/patients          |
      | Pacientes                 | POST   | /api/patients          |
      | Paciente                  | GET    | /api/patients/:id      |
      | Paciente                  | PUT    | /api/patients/:id      |
      | Consultas                 | GET    | /api/consultations     |
      | Consultas                 | POST   | /api/consultations     |
      | Recetas                   | GET    | /api/prescriptions     |
      | Recetas                   | POST   | /api/prescriptions     |
      | Signos vitales            | POST   | /api/vital-signs       |
      | Reportes                  | GET    | /api/reports           |
    Y cada endpoint tiene documentación OpenAPI
    Y cada endpoint tiene autenticación requerida

  # ─────────────────────────────────────────────────────────────
  # 4. DISEÑO DE BASE DE DATOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Diseño del modelo de datos
    Dado que se diseña el esquema de SQLite
    Cuando se definen tablas
    Entonces se documentan:
      | Tabla                     | Columnas principales  |
      | patients                  | id, curp, name, birth_date, gender |
      | consultations             | id, patient_id, date, soap_notes   |
      | vital_signs               | id, consultation_id, bp, hr, temp  |
      | prescriptions             | id, consultation_id, medication, dosage |
      | pregnancies               | id, patient_id, lmp, edd, status   |
      | prenatal_visits           | id, pregnancy_id, visit_number, findings |
      | audit_log                 | id, user_id, action, entity, timestamp |
    Y cada tabla tiene llave primaria
    Y las relaciones usan foreign keys
    Y se crean índices para búsquedas frecuentes

  Escenario: Diseño de seguridad en diseño
    Dado que se diseña la seguridad
    Cuando se definen controles
    Entonces se documentan:
      | Capa                      | Control              |
      | Autenticación             | bcrypt + tokens      |
      | Autorización              | RBAC por roles       |
      | Cifrado en reposo         | AES-256              |
      | Cifrado en tránsito       | TLS 1.3              |
      | Auditoría                 | SHA-256 audit log    |
      | Validación de entrada     | Parameterized queries|
      | Gestión de sesiones       | Tokens con expiración|
    