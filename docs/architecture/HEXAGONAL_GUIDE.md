# Guía de Arquitectura Hexagonal para GHE

> *"La Arquitectura Hexagonal no es un patrón de diseño — es una filosofía de separación de responsabilidades."*

---

## 1. ¿Qué es la Arquitectura Hexagonal?

La **Arquitectura Hexagonal** (también conocida como **Ports and Adapters**) fue creada por **Alistair Cockburn** en 2005. Su principio fundamental es:

> *"Separar el núcleo de la aplicación de las dependencias externas mediante la abstracción de interfaces (puertos) y la implementación de adaptadores."*

### Componentes principales

```
┌─────────────────────────────────────────────────────────────┐
│                    ADAPTADORES DE ENTRADA                    │
│  (Driving Adapters)                                          │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐                  │
│  │ REST API │  │   CLI    │  │  Web UI  │                  │
│  └────┬─────┘  └────┬─────┘  └────┬─────┘                  │
│       │              │              │                        │
│  ┌────┴──────────────┴──────────────┴─────┐                 │
│  │          PUERTOS DE ENTRADA             │                 │
│  │  (Driving Ports - Use Cases)            │                 │
│  │  PatientUseCase, ConsultationUseCase    │                 │
│  └─────────────────┬──────────────────────┘                 │
│                    │                                         │
│  ┌─────────────────┴──────────────────────┐                 │
│  │           DOMAIN LAYER                  │                 │
│  │  ┌─────────────────────────────────┐   │                 │
│  │  │         ENTIDADES                │   │                 │
│  │  │  Patient, Consultation, Rx       │   │                 │
│  │  └─────────────────────────────────┘   │                 │
│  │  ┌─────────────────────────────────┐   │                 │
│  │  │       VALUE OBJECTS              │   │                 │
│  │  │  CURP, BloodType, BloodPressure  │   │                 │
│  │  └─────────────────────────────────┘   │                 │
│  │  ┌─────────────────────────────────┐   │                 │
│  │  │      EVENTOS DE DOMINIO          │   │                 │
│  │  │  PatientRegistered, RxCreated    │   │                 │
│  │  └─────────────────────────────────┘   │                 │
│  │  ┌─────────────────────────────────┐   │                 │
│  │  │      REGLAS DE NEGOCIO          │   │                 │
│  │  │  Validaciones, Cálculos          │   │                 │
│  │  └─────────────────────────────────┘   │                 │
│  └─────────────────┬──────────────────────┘                 │
│                    │                                         │
│  ┌─────────────────┴──────────────────────┐                 │
│  │         PUERTOS DE SALIDA               │                 │
│  │  (Driven Ports - Interfaces)            │                 │
│  │  PatientRepository, EventPublisher      │                 │
│  └────┬──────────────┬──────────────┬─────┘                 │
│       │              │              │                        │
│  ┌────┴─────┐  ┌────┴─────┐  ┌────┴─────┐                 │
│  │  SQLite  │  │ WhatsApp │  │   File   │                  │
│  │ Adapter  │  │ Adapter  │  │  Logger  │                  │
│  └──────────┘  └──────────┘  └──────────┘                  │
│                    ADAPTADORES DE SALIDA                     │
│  (Driven Adapters)                                           │
└─────────────────────────────────────────────────────────────┘
```

---

## 2. Componentes de GHE en Hexagonal

### 2.1. Domain Layer (Core)

| Componente | Responsabilidad |
|---|---|
| **Patient Entity** | Registro y datos demográficos |
| **Consultation Entity** | Consultas médicas y notas SOAP |
| **Prescription Entity** | Prescripciones y validación |
| **Pregnancy Entity** | Embarazo y control prenatal |
| **VitalSigns Value Object** | Signos vitales y clasificación |
| **CURP Value Object** | Validación de CURP |
| **Eventos de Dominio** | PatientRegistered, PrescriptionCreated |
| **Reglas de Negocio** | Validaciones, cálculos, clasificaciones |

### 2.2. Ports (Interfaces)

| Puerto | Tipo | Operaciones |
|---|---|---|
| **PatientUseCase** | Input | register, find, update, delete |
| **ConsultationUseCase** | Input | start, addNote, complete |
| **PrescriptionUseCase** | Input | create, sign, findByPatient |
| **PatientRepository** | Output | save, findById, findByCURP |
| **ConsultationRepository** | Output | save, findById, findByPatient |
| **EventPublisher** | Output | publish |
| **AuditLogger** | Output | log |
| **NotificationService** | Output | sendAlert, sendReminder |

### 2.3. Driving Adapters (Input)

| Adaptador | Implementación |
|---|---|
| **REST API** | HTTP endpoints → Use Cases |
| **CLI** | Terminal commands → Use Cases |
| **Web UI** | ClojureScript → REST API |

### 2.4. Driven Adapters (Output)

| Adaptador | Implementación |
|---|---|
| **SQLite Adapter** | PatientRepository → SQLite |
| **Event Publisher** | EventPublisher → Event Store |
| **Audit Logger** | AuditLogger → File/DB |
| **Notification** | NotificationService → WhatsApp |

---

## 3. Reglas de la Arquitectura Hexagonal en GHE

### 3.1. Regla de Dependencias

```
Las dependencias SIEMPRE apuntan HACIA EL INTERIOR (hacia el dominio).

✅ Domain → Ports (definidos por el dominio)
✅ Adapters → Ports (implementan puertos)
❌ Domain → Adapters (NUNCA)
❌ Domain → Infrastructure (NUNCA)
```

### 3.2. Regla de Aislamiento

```
El dominio NO puede:
- Importar paquetes de infrastructure
- Importar paquetes de adapters
- Conocer SQLite, HTTP, UI
- Crear instancias de adaptadores concretos
```

### 3.3. Regla de Testing

```
Los tests del dominio:
- NO necesitan base de datos
- NO necesitan servidor web
- NO necesitan conexión a internet
- Son rápidos (<100ms)
- Son determinísticos
- Son independientes
```

---

## 4. Estructura de Directorios

```
src/
├── ghe/
│   ├── domain/                    # Domain Layer (CORE)
│   │   ├── patient/
│   │   │   ├── entity.clj         # Patient entity
│   │   │   ├── value_objects.clj  # CURP, BloodType, etc.
│   │   │   ├── events.clj         # PatientRegistered, etc.
│   │   │   └── rules.clj          # Business rules
│   │   ├── clinical/
│   │   │   ├── consultation.clj
│   │   │   ├── soap_notes.clj
│   │   │   └── events.clj
│   │   ├── pharmacy/
│   │   │   ├── inventory.clj
│   │   │   └── dispensing.clj
│   │   └── obstetric/
│   │       ├── pregnancy.clj
│   │       ├── prenatal_visit.clj
│   │       └── risk.clj
│   │
│   ├── ports/                     # Ports (INTERFACES)
│   │   ├── input/                 # Driving Ports
│   │   │   ├── patient_use_case.clj
│   │   │   ├── consultation_use_case.clj
│   │   │   └── prescription_use_case.clj
│   │   └── output/                # Driven Ports
│   │       ├── patient_repository.clj
│   │       ├── consultation_repository.clj
│   │       ├── event_publisher.clj
│   │       ├── audit_logger.clj
│   │       └── notification_service.clj
│   │
│   ├── application/               # Application Layer
│   │   ├── patient_service.clj    # Implements PatientUseCase
│   │   ├── consultation_service.clj
│   │   ├── prescription_service.clj
│   │   └── pharmacy_service.clj
│   │
│   ├── infrastructure/            # Driven Adapters
│   │   ├── db/
│   │   │   ├── sqlite_patient_repository.clj
│   │   │   ├── sqlite_consultation_repository.clj
│   │   │   └── schema.clj
│   │   ├── events/
│   │   │   ├── persistent_event_publisher.clj
│   │   │   └── in_memory_event_publisher.clj
│   │   ├── audit/
│   │   │   ├── file_audit_logger.clj
│   │   │   └── in_memory_audit_logger.clj
│   │   ├── notification/
│   │   │   ├── whatsapp_adapter.clj
│   │   │   └── mock_adapter.clj
│   │   └── encryption/
│   │       └── aes256.clj
│   │
│   ├── adapters/                  # Driving Adapters
│   │   ├── rest/
│   │   │   ├── patient_handler.clj
│   │   │   ├── consultation_handler.clj
│   │   │   └── routes.clj
│   │   ├── cli/
│   │   │   └── patient_command.clj
│   │   └── web/
│   │       └── frontend/
│   │
│   ├── composition_root.clj       # Composition Root
│   └── core.clj                   # Entry point
│
├── test/
│   ├── ghe/
│   │   ├── domain/                # Unit tests (NO DB)
│   │   │   ├── patient_test.clj
│   │   │   └── consultation_test.clj
│   │   ├── application/           # Integration tests (mocks)
│   │   │   ├── patient_service_test.clj
│   │   │   └── consultation_service_test.clj
│   │   └── infrastructure/        # Integration tests (real DB)
│   │       ├── sqlite_patient_repository_test.clj
│   │       └── rest_handler_test.clj
│   └── peaeh/                     # Meta-testing
│       └── peaeh_test.clj
```

---

## 5. Flujo de Datos

### 5.1. Request → Response (Input)

```
1. REST API recibe POST /api/patients
2. PatientHandler parsea body a map
3. PatientHandler llama a PatientUseCase.register()
4. PatientService (implementa UseCase) ejecuta lógica
5. PatientService llama a PatientRepository.save()
6. SQLitePatientRepository guarda en SQLite
7. PatientService publica PatientRegistered event
8. EventPublisher notifica listeners
9. Response retorna al REST API
10. REST API retorna JSON al cliente
```

### 5.2. Domain Event → Output

```
1. PrescriptionCreated event se publica
2. EventPublisher lo registra en event_store
3. PharmacyService (listener) recibe el evento
4. PharmacyService verifica inventario
5. Si hay stock, PharmacyService registra dispensación
6. AuditLogger registra la acción
7. NotificationService envía recordatorio si aplica
```

---

## 6. Testing con Hexagonal Architecture

### 6.1. Niveles de Testing

| Nivel | Qué se testea | Adaptadores usados | Tiempo |
|---|---|---|---|
| **Unit** | Lógica de dominio | Ninguno | <10ms |
| **Integration** | Use Cases | InMemory adapters | <100ms |
| **Integration** | Adaptadores | SQLite real (temp) | <500ms |
| **E2E** | Flujo completo | Mix de reales y mocks | <2s |

### 6.2. Test de Dominio (Unit)

```clojure
(deftest test-calculate-gestational-age
  (testing "Calcula edad gestacional correctamente"
    (is (= 20 (obstetric/calculate-gestational-age
                 (java.time.LocalDate/of 2024 5 1)
                 (java.time.LocalDate/of 2024 9 25))))))
```

### 6.3. Test de Use Case (Integration)

```clojure
(deftest test-register-patient
  (testing "Registra paciente con repositorio en memoria"
    (let [repo (in-memory/create-repo)
          service (patient-service/create repo event-publisher)]
      (patient/use-case/register service test-patient)
      (is (= test-patient (patient/repository/find-by-id repo (:id test-patient)))))))
```

---

## 7. Checklist de Verificación

- [ ] Domain NO importa infrastructure
- [ ] Ports son interfaces/protocols
- [ ] Adapters implementan ports
- [ ] Composition root ensambla todo
- [ ] Tests de dominio NO necesitan DB
- [ ] Tests de use cases usan InMemory adapters
- [ ] Se puede cambiar SQLite por PostgreSQL sin modificar dominio
- [ ] Eventos de dominio son inmutables
- [ ] Cada bounded context es independiente

---

## 8. Referencias

- **"Becoming Agile in an Imperfect World"**: Alistair Cockburn (creador)
- **"Hexagonal Architecture"**: Patricio Pyliotis
- **"Applying Hexagonal Architecture in Clojure"**: Community resources
- **"Clean Architecture"**: Robert C. Martin (complementa hexagonal)

---

*Arquitectura Hexagonal en GHE: El dominio es el centro del universo.*
