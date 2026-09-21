# Guía de Integración: Gherkin → Implementación Clojure

**Fecha:** 2026-09-21
**Propósito:** Cómo un agente de código convierte features Gherkin en código Clojure funcional
**Audiencia:** Desarrolladores, agents de código, revisores de calidad

---

## 1. Flujo de Trabajo

```
┌─────────────────────────────────────────────────────────────┐
│                  FLUJO GHERKIN → CÓDIGO                     │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  1. FEATURE GHERKIN                                         │
│     │ El agente lee el .feature                            │
│     │ Extrae: regla, escenarios, datos, evidencia          │
│     ▼                                                       │
│  2. ANÁLISIS                                                │
│     │ ¿Qué comportamiento describe?                        │
│     │ ¿Qué dominio afecta?                                 │
│     │ ¿Qué datos necesita?                                 │
│     │ ¿Qué validaciones requiere?                          │
│     ▼                                                       │
│  3. ESPECIFICACIÓN                                         │
│     │ Crear spec de clojure.spec                           │
│     │ Definir estructura de datos                          │
│     │ Definir interfaces (ports)                           │
│     ▼                                                       │
│  4. IMPLEMENTACIÓN                                         │
│     │ Crear namespace de dominio                           │
│     │ Implementar lógica de negocio                       │
│     │ Crear adaptadores de infraestructura                │
│     │ Implementar use cases                              │
│     ▼                                                       │
│  5. TESTING                                                │
│     │ Escribir unit tests (TDD)                           │
│     │ Escribir integration tests                         │
│     │ Ejecutar validación automática                     │
│     ▼                                                       │
│  6. VERIFICACIÓN                                          │
│     │ Comparar comportamiento con feature                │
│     │ Verificar evidencia                                                       │
│     │ Actualizar @status a "verified"                    │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## 2. Estructura del Código Clojure

### 2.1. Organización por Bounded Context

```
src/ghe/
├── domain/                          # Lógica de negocio (SIN dependencias)
│   ├── patient/
│   │   ├── entity.clj              # Patient record
│   │   ├── value_objects.clj       # CURP, BloodType, etc.
│   │   ├── events.clj             # PatientRegistered, etc.
│   │   └── rules.clj             # Reglas de validación
│   ├── clinical/
│   │   ├── consultation.clj
│   │   ├── soap_notes.clj
│   │   └── events.clj
│   ├── obstetric/
│   │   ├── pregnancy.clj
│   │   ├── prenatal_visit.clj
│   │   └── risk.clj
│   ├── pharmacy/
│   │   ├── inventory.clj
│   │   ├── dispensing.clj
│   │   └── events.clj
│   ├── prescription/
│   │   ├── prescription.clj
│   │   └── cds.clj             # Clinical Decision Support
│   └── reporting/
│       ├── daily_report.clj
│       └── suive.clj
│
├── ports/                          # Interfaces (contracts)
│   ├── input/
│   │   ├── patient_use_case.clj
│   │   ├── consultation_use_case.clj
│   │   └── prescription_use_case.clj
│   └── output/
│       ├── patient_repository.clj
│       ├── consultation_repository.clj
│       ├── event_publisher.clj
│       ├── audit_logger.clj
│       └── notification_service.clj
│
├── application/                    # Use cases
│   ├── patient_service.clj
│   ├── consultation_service.clj
│   └── prescription_service.clj
│
├── infrastructure/                 # Adapters
│   ├── db/
│   │   ├── sqlite_patient_repository.clj
│   │   └── schema.clj
│   ├── events/
│   │   └── persistent_event_publisher.clj
│   ├── audit/
│   │   └── file_audit_logger.clj
│   └── notification/
│       └── whatsapp_adapter.clj
│
├── adapters/                       # Driving adapters
│   ├── rest/
│   │   ├── patient_handler.clj
│   │   └── routes.clj
│   └── web/
│       └── frontend/
│
├── composition_root.clj            # Ensamblaje
└── core.clj                        # Entry point
```

---

## 3. Cómo Convertir un Feature Gherkin en Código

### Ejemplo: Feature de Registro de Paciente

**Feature:**
```gherkin
Característica: Registro de Paciente
  Escenario: Registro exitoso
    Dado que "María García" acude por primera vez
    Cuando captura datos básicos
    Entonces el sistema:
      | Acción                     |
      | Crear expediente           |
      | Registrar timestamp        |
      | Mostrar confirmación       |
```

**Implementación paso a paso:**

#### Paso 1: Crear spec (domain/patient/value_objects.clj)

```clojure
(ns ghe.domain.patient.value-objects)

(s/def ::curp
  (s/and string?
         #(re-matches #"[A-Z]{4}\d{6}[HM][A-Z]{5}[A-Z0-9]\d" %)))

(s/def ::first-name
  (s/and string? #(seq %)))

(s/def ::gender #{:M :F :O})
```

#### Paso 2: Crear entity (domain/patient/entity.clj)

```clojure
(ns ghe.domain.patient.entity)

(defrecord Patient [id curp first-name last-name birth-date gender])

(defn create-patient
  "Crea un nuevo paciente con validación."
  [data]
  {:pre [(s/valid? ::curp (:curp data))
         (s/valid? ::first-name (:first-name data))]}
  (->Patient
    (java.util.UUID/randomUUID)
    (:curp data)
    (:first-name data)
    (:last-name data)
    (:birth-date data)
    (:gender data)))
```

#### Paso 3: Crear puerto (ports/output/patient_repository.clj)

```clojure
(ns ghe.ports.output.patient-repository)

(defprotocol PatientRepository
  (save [this patient])
  (find-by-id [this id])
  (find-by-curp [this curp])
  (find-all [this])
  (delete [this id]))
```

#### Paso 4: Crear adaptador (infrastructure/db/sqlite_patient_repository.clj)

```clojure
(ns ghe.infrastructure.db.sqlite-patient-repository
  (:require [ghe.ports.output.patient-repository :as repo]
            [next.jdbc :as jdbc]))

(defrecord SQLitePatientRepository [db]
  repo/PatientRepository
  (save [this patient]
    (jdbc/execute! db
      ["INSERT INTO patients (id, curp, first_name, last_name, birth_date, gender)
        VALUES (?, ?, ?, ?, ?, ?)"
       (str (:id patient)) (:curp patient) (:first-name patient)
       (:last-name patient) (:birth-date patient) (:gender patient)]))
  
  (find-by-id [this id]
    (jdbc/execute-one! db
      ["SELECT * FROM patients WHERE id = ?" (str id)]))
  
  (find-by-curp [this curp]
    (jdbc/execute-one! db
      ["SELECT * FROM patients WHERE curp = ?" curp])))
```

#### Paso 5: Crear use case (application/patient_service.clj)

```clojure
(ns ghe.application.patient-service
  (:require [ghe.ports.input.patient-use-case :as uc]
            [ghe.ports.output.patient-repository :as repo]
            [ghe.domain.patient.entity :as patient]))

(defrecord PatientService [repository event-publisher audit-logger]
  uc/PatientUseCase
  (register [this data]
    (let [patient (patient/create-patient data)]
      (repo/save repository patient)
      (event/publish event-publisher {:type :patient-registered :patient-id (:id patient)})
      (audit/log audit-logger {:action :patient-registered :patient-id (:id patient)})
      patient)))
```

#### Paso 6: Crear test (test/ghe/patient_test.clj)

```clojure
(ns ghe.patient-test
  (:require [clojure.test :refer :all]
            [ghe.domain.patient.entity :as patient]
            [ghe.application.patient-service :as service]))

(deftest test-register-patient
  (testing "Registro exitoso de paciente"
    (let [repo (in-memory-repo)
          service (service/create-service repo)]
      (let [result (service/register service {:curp "GOGC531015MVZRRL04"
                                               :first-name "María"
                                               :last-name "García"})]
        (is (some? (:id result)))
        (is (= "María" (:first-name result))))))

(deftest test-curp-validation
  (testing "CURP válida"
    (is (s/valid? ::curp "GOGC531015MVZRRL04")))
  (testing "CURP inválida"
    (is (not (s/valid? ::curp "ABC123")))))
```

---

## 4. Mapping Feature → Código

| Feature | Domain | Port | Adapter | Test |
|---|---|---|---|---|
| patient_lifecycle/01 | patient/entity.clj | patient_repository.clj | sqlite_patient_repository.clj | patient_test.clj |
| clinical_safety/02 | clinical/consultation.clj | consultation_repository.clj | sqlite_consultation_repository.clj | consultation_test.clj |
| maternity/01 | obstetric/pregnancy.clj | prenatal_repository.clj | sqlite_prenatal_repository.clj | prenatal_test.clj |
| prescription.feature | prescription/prescription.clj | prescription_repository.clj | sqlite_prescription_repository.clj | prescription_test.clj |
| pharmacy_dispensing | pharmacy/inventory.clj | inventory_repository.clj | sqlite_inventory_repository.clj | inventory_test.clj |

---

## 5. Checklist de Implementación

Para cada feature Gherkin:

- [ ] Leer feature completo
- [ ] Identificar dominio afectado
- [ ] Crear/actualizar spec
- [ ] Crear/actualizar entity
- [ ] Crear/actualizar port (interface)
- [ ] Crear/actualizar adapter
- [ ] Crear/actualizar use case
- [ ] Escribir unit test
- [ ] Escribir integration test
- [ ] Ejecutar tests
- [ ] Comparar comportamiento con feature
- [ ] Actualizar @status a "verified"
- [ ] Documentar evidencia

---

## Referencias

- docs/architecture/ARCHITECTURE.md
- docs/architecture/HEXAGONAL_GUIDE.md
- docs/quality/TDD_GUIDE.md
- docs/quality/SPEC_DRIVEN_GUIDE.md
- standards/CODING_STANDARDS.md
