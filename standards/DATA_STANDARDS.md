# Estándares de Datos para GHE

---

## 1. Principios de Gestión de Datos

```
1. Los datos pertenecen al paciente
2. Los datos deben ser precisos y completos
3. Los datos deben ser accesibles cuando se necesitan
4. Los datos deben ser seguros y confidenciales
5. Los datos deben ser interoperables
```

---

## 2. Codificación Médica

### 2.1. CIE-10 (Diagnósticos)

GHE usa la Clasificación Internacional de Enfermedades, Décima Revisión para codificar diagnósticos.

```sql
-- Tabla de codificación CIE-10
CREATE TABLE cie10_codes (
    code TEXT PRIMARY KEY,           -- 'O14.1'
    description TEXT NOT NULL,       -- 'Preeclampsia severa'
    category TEXT NOT NULL,          -- 'Embarazo'
    subcategory TEXT,                -- 'Complicaciones'
    chapter TEXT,                    -- 'XIV'
    is_active BOOLEAN DEFAULT TRUE
);
```

**Diagnósticos frecuentes en maternidad:**

| Código | Descripción | Capítulo |
|---|---|---|
| O00-O08 | Embarazo ectópico | XIV |
| O10-O16 | Edema, proteinuria, trastornos hipertensivos | XIV |
| O20-O29 | Otros trastornos maternos | XIV |
| O30-O48 | Atención materna | XIV |
| O60-O75 | Complicaciones del trabajo de parto | XIV |
| O80-O84 | Parto | XIV |
| O85-O92 | Complicaciones del puerperio | XIV |
| O94-O9A | Otras afecciones maternas | XIV |
| Z34 | Supervisión de embarazo normal | XXI |
| Z35 | Supervisión de embarazo de alto riesgo | XXI |

### 2.2. SNOMED CT (Terminología Clínica)

```sql
-- Tabla de terminología SNOMED CT
CREATE TABLE snomed_concepts (
    concept_id TEXT PRIMARY KEY,     -- '364589006'
    preferred_term TEXT NOT NULL,    -- 'Asthma'
    semantic_tag TEXT,               -- 'Disorder'
    is_active BOOLEAN DEFAULT TRUE
);
```

### 2.3. LOINC (Laboratorio)

```sql
-- Tabla de códigos LOINC
CREATE TABLE loinc_codes (
    loinc_code TEXT PRIMARY KEY,     -- '2345-7'
    long_common_name TEXT NOT NULL,  -- 'Glucose [Mass/volume] in Serum or Plasma'
    component TEXT,
    property TEXT,
    unit TEXT,
    is_active BOOLEAN DEFAULT TRUE
);
```

**Códigos LOINC frecuentes en maternidad:**

| Código | Descripción |
|---|---|
| 2345-7 | Glucosa sérica |
| 718-7 | Hemoglobina |
| 24978-1 | Acido úrico |
| 14959-1 | Proteinuria |
| 10524-7 | Hemoglobina glicada |
| 4548-4 | Hematocrito |
| 6690-2 | Leucocitos |
| 777-3 | Plaquetas |

### 2.4. CUPS (Procedimientos)

```sql
-- Tabla de códigos CUPS (Colombia) / Equivalente México
CREATE TABLE procedure_codes (
    code TEXT PRIMARY KEY,
    description TEXT NOT NULL,
    category TEXT,
    is_active BOOLEAN DEFAULT TRUE
);
```

---

## 3. Modelo de Datos Clínico

### 3.1. Paciente

```sql
CREATE TABLE patients (
    id TEXT PRIMARY KEY,
    -- Identificación
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    second_last_name TEXT,
    curp TEXT UNIQUE,
    birth_date DATE NOT NULL,
    gender TEXT NOT NULL CHECK (gender IN ('M', 'F', 'O')),
    -- Datos clínicos
    blood_type TEXT CHECK (blood_type IN ('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-')),
    rh_factor TEXT CHECK (rh_factor IN ('+', '-')),
    -- Contacto
    phone TEXT,
    address TEXT,
    municipality TEXT,
    state TEXT,
    postal_code TEXT,
    -- Contacto de emergencia
    emergency_contact_name TEXT,
    emergency_contact_phone TEXT,
    emergency_contact_relation TEXT,
    -- Metadata
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by TEXT NOT NULL,
    sync_status TEXT DEFAULT 'pending' CHECK (sync_status IN ('pending', 'synced', 'conflict'))
);
```

### 3.2. Alergias

```sql
CREATE TABLE allergies (
    id TEXT PRIMARY KEY,
    patient_id TEXT NOT NULL REFERENCES patients(id),
    allergen TEXT NOT NULL,
    allergen_type TEXT CHECK (allergen_type IN ('drug', 'food', 'environmental', 'other')),
    severity TEXT CHECK (severity IN ('mild', 'moderate', 'severe', 'life-threatening')),
    reaction TEXT,
    verified BOOLEAN DEFAULT FALSE,
    recorded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    recorded_by TEXT NOT NULL
);
```

### 3.3. Consulta

```sql
CREATE TABLE consultations (
    id TEXT PRIMARY KEY,
    patient_id TEXT NOT NULL REFERENCES patients(id),
    provider_id TEXT NOT NULL,
    -- Fecha y tipo
    consultation_date TIMESTAMP NOT NULL,
    consultation_type TEXT CHECK (consultation_type IN ('prenatal', 'general', 'followup', 'emergency')),
    -- SOAP
    subjective TEXT,                    -- Subjetivo (palabras del paciente)
    objective TEXT,                     -- Objetivo (hallazgos del médico)
    assessment TEXT,                    -- Valoración (diagnóstico CIE-10)
    plan TEXT,                          -- Plan terapéutico
    -- Clasificación
    chief_complaint TEXT NOT NULL,      -- Motivo de consulta
    diagnosis_code TEXT,                -- CIE-10 principal
    diagnosis_secondary TEXT,           -- CIE-10 secundario (JSON array)
    risk_level TEXT CHECK (risk_level IN ('low', 'medium', 'high', 'critical')),
    -- Estado
    status TEXT DEFAULT 'active' CHECK (status IN ('active', 'completed', 'cancelled')),
    -- Metadata
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    sync_status TEXT DEFAULT 'pending'
);
```

### 3.4. Signos Vitales

```sql
CREATE TABLE vital_signs (
    id TEXT PRIMARY KEY,
    consultation_id TEXT NOT NULL REFERENCES consultations(id),
    -- Generales
    blood_pressure_systolic INTEGER CHECK (blood_pressure_systolic BETWEEN 60 AND 300),
    blood_pressure_diastolic INTEGER CHECK (blood_pressure_diastolic BETWEEN 30 AND 200),
    heart_rate INTEGER CHECK (heart_rate BETWEEN 30 AND 250),
    temperature DECIMAL(4,1) CHECK (temperature BETWEEN 30.0 AND 45.0),
    oxygen_saturation INTEGER CHECK (oxygen_saturation BETWEEN 0 AND 100),
    respiratory_rate INTEGER CHECK (respiratory_rate BETWEEN 5 AND 60),
    -- Antropométricos
    weight DECIMAL(5,2) CHECK (weight > 0),
    height DECIMAL(5,2) CHECK (height > 0),
    bmi DECIMAL(4,1) GENERATED ALWAYS AS (weight / (height * height)) STORED,
    -- Obstétricos
    fundal_height DECIMAL(4,1),        -- Altura uterina en cm
    fetal_heart_rate INTEGER,           -- FCF en lpm
    fetal_position TEXT,                -- 'Cefálica', 'Pélvica', 'Transversa'
    -- Metadata
    recorded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    recorded_by TEXT NOT NULL
);
```

### 3.5. Embarazo

```sql
CREATE TABLE pregnancies (
    id TEXT PRIMARY KEY,
    patient_id TEXT NOT NULL REFERENCES patients(id),
    -- Fechas
    lmp_date DATE,                      -- Fecha de última regla
    edd_date DATE,                      -- Fecha probable de parto
    -- Estado
    gestational_age_weeks INTEGER,
    current_trimester INTEGER CHECK (current_trimester BETWEEN 1 AND 4),
    -- Factores de riesgo
    risk_factors TEXT,                  -- JSON array
    risk_level TEXT CHECK (risk_level IN ('low', 'medium', 'high')),
    -- Estadísticas
    prenatal_visits_count INTEGER DEFAULT 0,
    -- Estado del embarazo
    status TEXT DEFAULT 'active' CHECK (status IN ('active', 'completed', 'complicated', 'terminated')),
    -- Resultado (si se completó)
    delivery_date DATE,
    delivery_type TEXT,
    birth_weight DECIMAL(5,2),
    apgar_score INTEGER,
    -- Metadata
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### 3.6. Receta

```sql
CREATE TABLE prescriptions (
    id TEXT PRIMARY KEY,
    consultation_id TEXT NOT NULL REFERENCES consultations(id),
    patient_id TEXT NOT NULL REFERENCES patients(id),
    -- Medicamento
    medication_name TEXT NOT NULL,
    generic_name TEXT,
    medication_code TEXT,               -- Código de medicamento
    dosage TEXT NOT NULL,
    dosage_unit TEXT,
    route_of_administration TEXT,       -- 'Oral', 'IV', 'IM', etc.
    frequency TEXT NOT NULL,
    duration TEXT,
    quantity INTEGER,
    refills INTEGER DEFAULT 0,
    -- Instrucciones
    instructions TEXT,
    -- Seguridad
    contraindications_checked BOOLEAN DEFAULT FALSE,
    allergy_checked BOOLEAN DEFAULT FALSE,
    interaction_alerts TEXT,            -- JSON array
    interaction_alerts_acknowledged BOOLEAN DEFAULT FALSE,
    -- Dispensación
    dispensed BOOLEAN DEFAULT FALSE,
    dispensed_at TIMESTAMP,
    dispensed_by TEXT,
    pharmacy_stock_id TEXT,
    -- Estado
    status TEXT DEFAULT 'active' CHECK (status IN ('active', 'dispensed', 'completed', 'cancelled')),
    -- Metadata
    prescribed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    prescribed_by TEXT NOT NULL,
    signed BOOLEAN DEFAULT FALSE,
    signed_at TIMESTAMP,
    sync_status TEXT DEFAULT 'pending'
);
```

### 3.7. Control Prenatal

```sql
CREATE TABLE prenatal_visits (
    id TEXT PRIMARY KEY,
    pregnancy_id TEXT NOT NULL REFERENCES pregnancies(id),
    consultation_id TEXT NOT NULL REFERENCES consultations(id),
    -- Número de visita
    visit_number INTEGER NOT NULL,
    gestational_age_at_visit INTEGER,
    -- Hallazgos
    blood_pressure TEXT,
    weight DECIMAL(5,2),
    weight_gain DECIMAL(4,2),
    fundal_height DECIMAL(4,1),
    fetal_heart_rate INTEGER,
    fetal_position TEXT,
    edema TEXT CHECK (edema IN ('none', 'mild', 'moderate', 'severe')),
    proteinuria TEXT,
    -- Laboratorio
    hemoglobin DECIMAL(4,2),
    hematocrit DECIMAL(4,2),
    glucose DECIMAL(5,2),
    uric_acid DECIMAL(4,2),
    -- Plan
    next_visit_date DATE,
    risk_level TEXT,
    notes TEXT,
    -- Metadata
    recorded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    recorded_by TEXT NOT NULL
);
```

---

## 4. Validación de Datos

### 4.1. Reglas de Validación

```clojure
(def validation-rules
  {:patient
   {:first-name     {:required true :type :string :min-length 1 :max-length 100}
    :last-name      {:required true :type :string :min-length 1 :max-length 100}
    :curp           {:required true :type :string :pattern #"[A-Z]{4}\d{6}[HM][A-Z]{5}[A-Z0-9]\d"}
    :birth-date     {:required true :type :date :before java.time.LocalDate/now}
    :gender         {:required true :type :enum :values #{:M :F :O}}
    :blood-type     {:required false :type :enum :values #{"A+" "A-" "B+" "B-" "AB+" "AB-" "O+" "O-"}}}
   
   :vital-signs
   {:systolic  {:required true :type :integer :min 60 :max 300}
    :diastolic {:required true :type :integer :min 30 :max 200}
    :heart-rate {:required true :type :integer :min 30 :max 250}
    :temperature {:required true :type :decimal :min 30.0 :max 45.0}
    :weight    {:required true :type :decimal :min 0.1 :max 500}
    :height    {:required true :type :decimal :min 0.3 :max 3.0}}
   
   :prescription
   {:medication-name {:required true :type :string}
    :dosage          {:required true :type :string}
    :frequency       {:required true :type :string}
    :quantity        {:required true :type :integer :min 1}}})
```

### 4.2. Validación en Tiempo Real

```clojure
(defn validate-vital-signs
  "Valida signos vitales contra rangos normales."
  [vital-signs]
  (let [warnings (atom [])]
    ;; PA sistólica
    (when (< (:systolic vital-signs) 90)
      (swap! warnings conj "PA sistólica baja: posible hipotensión"))
    (when (> (:systolic vital-signs) 140)
      (swap! warnings conj "PA sistólica elevada: posible hipertensión"))
    ;; PA diastólica
    (when (> (:diastolic vital-signs) 90)
      (swap! warnings conj "PA diastólica elevada: vigilar preeclampsia"))
    ;; FCF
    (when (< (:fetal-heart-rate vital-signs) 110)
      (swap! warnings conj "FCF baja: posible sufrimiento fetal"))
    (when (> (:fetal-heart-rate vital-signs) 160)
      (swap! warnings conj "FCF alta: vigilar"))
    ;; Temperatura
    (when (> (:temperature vital-signs) 37.5)
      (swap! warnings conj "Temperatura elevada: vigilar infección"))
    @warnings))
```

---

## 5. Interoperabilidad

### 5.1. HL7 FHIR R4 Resources

| Resource | Uso en GHE | Mapeo |
|---|---|---|
| Patient | Datos del paciente | patients → Patient |
| Encounter | Consulta médica | consultations → Encounter |
| Observation | Signos vitales | vital_signs → Observation |
| Condition | Diagnósticos | diagnosis_code → Condition |
| MedicationRequest | Recetas | prescriptions → MedicationRequest |
| AllergyIntolerance | Alergias | allergies → AllergyIntolerance |
| DiagnosticReport | Estudios | (futuro) → DiagnosticReport |
| Immunization | Vacunas | (futuro) → Immunization |

### 5.2. Exportación FHIR

```json
{
  "resourceType": "Patient",
  "id": "ghe-patient-123",
  "identifier": [{
    "system": "http://ghe.local/patient",
    "value": "patient-uuid"
  }],
  "name": [{
    "family": "García",
    "given": ["María", "López"]
  }],
  "gender": "female",
  "birthDate": "1985-03-15",
  "address": [{
    "line": ["Calle Juárez 15"],
    "city": "Altotonga",
    "state": "Veracruz",
    "country": "MX"
  }]
}
```

---

## 6. Portabilidad de Datos

### 6.1. Exportación

```clojure
(defn export-patient-data
  "Exporta datos del paciente en formato estándar."
  [patient-id format]
  (case format
    :fhir (export-to-fhir patient-id)
    :csv (export-to-csv patient-id)
    :pdf (export-to-pdf patient-id)
    :cda (export-to-cda patient-id)))
```

### 6.2. Importación

```clojure
(defn import-patient-data
  "Importa datos de paciente desde formato externo."
  [data format]
  (case format
    :fhir (import-from-fhir data)
    :csv (import-from-csv data)))
```

---

## 7. Retención y Eliminación

| Tipo de dato | Retención | Eliminación |
|---|---|---|
| Expediente clínico | 5 años mínimo | Soft delete |
| Registro de auditoría | 10 años | No se elimina |
| Backups | 5 años | Rotación con destrucción segura |
| Consentimientos | 5 años | Soft delete |

### 7.1. Soft Delete

```clojure
(defn soft-delete-patient
  "Elimina lógicamente un paciente (no físico)."
  [patient-id]
  (db/update! :patients
    {:deleted_at (java.time.Instant/now)
     :deleted_by current-user-id
     :sync_status "pending"}
    [:id patient-id]))
```

---

*Datos GHE: Precisos, seguros, portables.*
