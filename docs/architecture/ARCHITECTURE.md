# Arquitectura Técnica de GHE

> *"Offline-first no es una característica — es una filosofía de diseño."*

---

## 1. Principios Arquitectónicos

### 1.1. Hexagonal (Ports & Adapters)

GHE sigue la arquitectura hexagonal de Alistair Cockburn:

```
                    ┌─────────────────────┐
                    │   Application Core  │
                    │   (Domain Logic)    │
                    ├─────────────────────┤
                    │                     │
    ┌───────────────┤   Ports (Interfaces)├───────────────┐
    │               │                     │               │
    │  ┌────────────┴─────────────────────┴────────────┐  │
    │  │                                                │  │
    │  │  Input Ports          Output Ports             │  │
    │  │  - Use Cases          - Repository             │  │
    │  │  - Commands           - Events                 │  │
    │  │  - Queries            - External Services      │  │
    │  │                                                │  │
    │  └────────────────────────────────────────────────┘  │
    │                                                      │
    │  Adapters (Infrastructure)                           │
    │  - SQLite Adapter (offline storage)                  │
    │  - HTTP Adapter (REST API)                           │
    │  - UI Adapter (Web frontend)                         │
    │  - FHIR Adapter (interoperability)                   │
    │  - Sync Adapter (cloud sync when online)             │
    │                                                      │
    └──────────────────────────────────────────────────────┘
```

**Ventajas para GHE:**
- El dominio clínico NO depende de SQLite, HTTP o cualquier infraestructura
- Fácil de testear (mock de puertos)
- Fácil de cambiar infraestructura (migrar de SQLite a PostgreSQL si es necesario)
- Fácil de agregar nuevos adaptadores (FHIR, HL7, etc.)

### 1.2. Offline-First

```
┌─────────────────────────────────────────────────┐
│                 GHE Offline Strategy             │
├─────────────────────────────────────────────────┤
│                                                  │
│  ┌──────────────┐      ┌──────────────┐         │
│  │   UI Layer   │      │  REST API    │         │
│  │  (Browser)   │      │  (Optional)  │         │
│  └──────┬───────┘      └──────┬───────┘         │
│         │                      │                  │
│  ┌──────┴──────────────────────┴───────┐         │
│  │        Local SQLite Database         │         │
│  │  - All data stored locally           │         │
│  │  - Full-text search                  │         │
│  │  - WAL mode for performance          │         │
│  │  - Encrypted at rest (AES-256)       │         │
│  └──────────────┬───────────────────────┘         │
│                 │                                  │
│  ┌──────────────┴───────────────────────┐         │
│  │        Sync Queue (when online)       │         │
│  │  - Outbox pattern                     │         │
│  │  - Conflict resolution (last-write)   │         │
│  │  - Retry with exponential backoff     │         │
│  └──────────────┬───────────────────────┘         │
│                 │                                  │
│  ┌──────────────┴───────────────────────┐         │
│  │        Cloud Sync (when online)       │         │
│  │  - HTTPS/TLS 1.3                      │         │
│  │  - Delta sync (only changes)          │         │
│  │  - Compression (gzip)                 │         │
│  └──────────────────────────────────────┘         │
│                                                  │
└─────────────────────────────────────────────────┘
```

### 1.3. Bounded Contexts

Cada módulo clínico es un bounded context independiente:

| Bounded Context | Responsabilidad | Eventos de Dominio |
|---|---|---|
| **Patient** | Registro, datos demográficos, identificación | PatientRegistered, PatientUpdated |
| **Clinical** | Expediente, notas, evolución | ConsultationStarted, NoteSaved |
| **Obstetric** | Triaje obstétrico, control prenatal | PrenatalVisitRecorded, RiskDetected |
| **Pharmacy** | Inventario, dispensación, recetas | PrescriptionFilled, StockAlert |
| **Prescription** | Receta electrónica, CDS | PrescriptionCreated, InteractionAlert |
| **Reporting** | Estadísticas, SUIVE, dashboards | ReportGenerated |

---

## 2. Stack Tecnológico

### 2.1. Backend

| Componente | Tecnología | Justificación |
|---|---|---|
| **Lenguaje** | Clojure | Immutabilidad, concurrencia, JVM |
| **Base de datos** | SQLite | Offline-first, zero-config, portability |
| **Web server** | Jetty / http-kit | Ligero, embedded |
| **Serialización** | Transit+JSON | Rápido, compacto |
| **Testing** | clojure.test + PEAEH | 5,573+ tests verificados |

### 2.2. Frontend

| Componente | Tecnología | Justificación |
|---|---|---|
| **Framework** | ClojureScript (Reagent/Re-frame) | Clojure en browser, un solo lenguaje |
| **UI Kit** | Re-com / Tailwind CSS | Componentes médicos, responsive |
| **State** | Re-frame (app-db) | Single source of truth |
| **Build** | Shadow CLJS | Hot reload, optimizado |

### 2.3. Infraestructura

| Componente | Tecnología | Justificación |
|---|---|---|
| **OS** | Linux (Debian/Ubuntu) | Estabilidad, soporte |
| **Container** | Docker | Reproducibilidad |
| **Sync** | Custom sync engine | Offline-first, conflict resolution |
| **Encryption** | AES-256 + TLS 1.3 | Seguridad de datos |
| **Backup** | Local + USB rotation | Sin dependencia de nube |

---

## 3. Modelo de Datos

### 3.1. Entidades Principales

```sql
-- Paciente
CREATE TABLE patients (
    id TEXT PRIMARY KEY,           -- UUID
    curp TEXT UNIQUE,              -- CURP mexicana
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    birth_date DATE NOT NULL,
    gender TEXT NOT NULL,           -- 'M', 'F', 'O'
    blood_type TEXT,                -- 'A+', 'A-', etc.
    phone TEXT,
    address TEXT,
    emergency_contact TEXT,
    emergency_phone TEXT,
    allergies TEXT,                 -- JSON array
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    sync_status TEXT DEFAULT 'pending'  -- 'pending', 'synced', 'conflict'
);

-- Consulta
CREATE TABLE consultations (
    id TEXT PRIMARY KEY,
    patient_id TEXT NOT NULL REFERENCES patients(id),
    consultation_date TIMESTAMP NOT NULL,
    provider_id TEXT NOT NULL,
    chief_complaint TEXT NOT NULL,
    -- SOAP notes
    subjective TEXT,                -- Subjetivo
    objective TEXT,                 -- Objetivo (signos vitales)
    assessment TEXT,                -- Valoración (diagnóstico CIE-10)
    plan TEXT,                      -- Plan terapéutico
    -- Metadata
    consultation_type TEXT,         -- 'prenatal', 'general', 'followup'
    risk_level TEXT,                -- 'low', 'medium', 'high', 'critical'
    status TEXT DEFAULT 'active',   -- 'active', 'completed', 'cancelled'
    sync_status TEXT DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Signos Vitales
CREATE TABLE vital_signs (
    id TEXT PRIMARY KEY,
    consultation_id TEXT NOT NULL REFERENCES consultations(id),
    blood_pressure_systolic INTEGER,
    blood_pressure_diastolic INTEGER,
    heart_rate INTEGER,
    temperature DECIMAL(4,1),
    weight DECIMAL(5,2),
    height DECIMAL(5,2),
    oxygen_saturation INTEGER,
    respiratory_rate INTEGER,
    -- Obstétricos
    fundal_height DECIMAL(4,1),    -- Altura uterina en cm
    fetal_heart_rate INTEGER,       -- FCF
    fetal_position TEXT,             -- Presentación
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Receta
CREATE TABLE prescriptions (
    id TEXT PRIMARY KEY,
    consultation_id TEXT NOT NULL REFERENCES consultations(id),
    patient_id TEXT NOT NULL REFERENCES patients(id),
    medication_name TEXT NOT NULL,
    generic_name TEXT,
    dosage TEXT NOT NULL,
    frequency TEXT NOT NULL,
    duration TEXT,
    quantity INTEGER,
    instructions TEXT,
    -- Safety
    contraindications_checked BOOLEAN DEFAULT FALSE,
    interaction_alerts TEXT,        -- JSON array
    -- Dispensing
    dispensed BOOLEAN DEFAULT FALSE,
    dispensed_at TIMESTAMP,
    dispensed_by TEXT,
    pharmacy_stock_id TEXT,
    sync_status TEXT DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Embarazo
CREATE TABLE pregnancies (
    id TEXT PRIMARY KEY,
    patient_id TEXT NOT NULL REFERENCES patients(id),
    lmp_date DATE,                  -- Fecha de ultima regla
    edd_date DATE,                  -- Fecha probable de parto
    gestational_age_weeks INTEGER,
    risk_factors TEXT,              -- JSON array
    prenatal_visits_count INTEGER DEFAULT 0,
    status TEXT DEFAULT 'active',   -- 'active', 'completed', 'complicated'
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Control Prenatal
CREATE TABLE prenatal_visits (
    id TEXT PRIMARY KEY,
    pregnancy_id TEXT NOT NULL REFERENCES pregnancies(id),
    consultation_id TEXT NOT NULL REFERENCES consultations(id),
    visit_number INTEGER NOT NULL,
    gestational_age_at_visit INTEGER,
    -- Hallazgos
    blood_pressure TEXT,
    weight_gain DECIMAL(4,2),
    fundal_height DECIMAL(4,1),
    fetal_heart_rate INTEGER,
    fetal_position TEXT,
    edema TEXT,                     -- 'none', 'mild', 'moderate', 'severe'
    proteinuria TEXT,                -- '+', '++', '+++', '++++'
    uric_acid DECIMAL(4,2),
    hemoglobin DECIMAL(4,2),
    -- Plan
    next_visit_date DATE,
    risk_level TEXT,
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

---

## 4. Seguridad

### 4.1. Cifrado

| Capa | Método | Detalle |
|---|---|---|
| **En reposo** | AES-256 | SQLite database encrypted |
| **En tránsito** | TLS 1.3 | Todas las comunicaciones |
| **Backups** | AES-256 | Archivos cifrados |
| **Passwords** | bcrypt | Salt + hash |

### 4.2. Autenticación y Autorización

```clojure
;; Modelo de roles
(def roles
  {:admin    #{:manage-users :view-reports :system-config}
   :doctor   #{:create-consultation :prescribe :view-patients}
   :nurse    #{:record-vitals :triage :view-patients}
   :pharmacy #{:dispense :manage-inventory :view-prescriptions}
   :reception #{:register-patient :schedule :view-basic-info}})
```

### 4.3. Auditoría

Cada acción en GHE genera un registro de auditoría:

```sql
CREATE TABLE audit_log (
    id TEXT PRIMARY KEY,
    user_id TEXT NOT NULL,
    action TEXT NOT NULL,           -- 'create', 'read', 'update', 'delete'
    entity_type TEXT NOT NULL,      -- 'patient', 'consultation', etc.
    entity_id TEXT NOT NULL,
    old_value TEXT,                 -- JSON (before change)
    new_value TEXT,                 -- JSON (after change)
    ip_address TEXT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    hash TEXT NOT NULL              -- SHA-256 para integridad
);
```

---

## 5. Offline-First: Detalles de Implementación

### 5.1. Estrategia de Sincronización

```
1. TODA operación se escribe localmente (SQLite)
2. Se agrega a la cola de sincronización (outbox)
3. Cuando hay internet, se envía al servidor
4. Si hay conflicto, se resuelve por:
   - Última escritura gana (por defecto)
   - Merge manual (para datos críticos)
5. Si no hay internet, la cola espera
6. Retry con exponential backoff
```

### 5.2. Resolución de Conflictos

```clojure
;; Estrategia de resolución de conflictos
(defn resolve-conflict [local-remote]
  (cond
    ;; Datos del paciente: merge automático
    (= (:entity-type local-remote) :patient)
    (merge-patient-data local-remote)

    ;; Consulta clínica: última escritura gana
    (= (:entity-type local-remote) :consultation)
    (last-write-wins local-remote)

    ;; Prescripción: alertar al médico
    (= (:entity-type local-remote) :prescription)
    (flag-for-review local-remote)

    ;; Por defecto: última escritura gana
    :else (last-write-wins local-remote)))
```

---

## 6. Interoperabilidad (Futuro)

### 6.1. HL7 FHIR R4

GHE implementará endpoints FHIR para interoperabilidad:

| Resource | Uso en GHE |
|---|---|
| Patient | Datos del paciente |
| Encounter | Consulta médica |
| Observation | Signos vitales |
| Condition | Diagnósticos |
| MedicationRequest | Recetas |
| AllergyIntolerance | Alergias |
| DiagnosticReport | Estudios |
| Immunization | Vacunas (futuro) |

### 6.2. Integración con IMSS/ISSSTE

```
GHE → FHIR API → SIEM (Sistema de Información Electoral del México)
                 → SUIVE (COFEPRIS)
                 → Reportes SSA
```

---

## 7. Rendimiento

| Métrica | Objetivo | Medición |
|---|---|---|
| Tiempo de búsqueda de paciente | <500ms | SQLite FTS5 |
| Tiempo de carga de expediente | <1s | Lazy loading |
| Tiempo de guardado de consulta | <200ms | Transacción SQLite |
| Tiempo de generación de receta | <100ms | Template rendering |
| Tamaño de base de datos | <1GB por 10,000 pacientes | SQLite compression |

---

*Arquitectura GHE: Diseñada para la realidad, no para el laboratorio.*
