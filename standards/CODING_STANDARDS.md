# Estándares de Código para GHE

---

## 1. Lenguaje: Clojure

### 1.1. Nomenclatura

```clojure
;; Funciones y variables: kebab-case
(defn calculate-gestational-age [lmp-date]
  ...)

(def patient-name "María García")

;; Records y protocols: PascalCase
(defrecord Patient [id first-name last-name])
(defprotocol ClinicalRepository
  (save-patient [this patient])
  (find-patient [this id]))

;; Constantes: SCREAMING-SNAKE-CASE
(def MAX-PATIENTS-PER-PAGE 50)
(def API-VERSION "1.0.0")

;; Namespaces: kebab-case con prefijo del proyecto
(ghe.patient)
(ghe.clinical.consultation)
(ghe.pharmacy.inventory)
```

### 1.2. Estructura de Archivos

```
src/
├── ghe/
│   ├── core.clj                 # Entry point
│   ├── config.clj               # Configuración
│   ├── patient/
│   │   ├── domain.clj           # Domain logic
│   │   ├── repository.clj       # Data access
│   │   ├── service.clj          # Use cases
│   │   └── api.clj              # REST endpoints
│   ├── clinical/
│   │   ├── consultation.clj
│   │   ├── vital_signs.clj
│   │   └── notes.clj
│   ├── obstetric/
│   │   ├── prenatal.clj
│   │   ├── triage.clj
│   │   └── risk.clj
│   ├── pharmacy/
│   │   ├── inventory.clj
│   │   ├── dispensing.clj
│   │   └── prescription.clj
│   ├── reporting/
│   │   ├── daily_report.clj
│   │   ├── suive.clj
│   │   └── analytics.clj
│   ├── infrastructure/
│   │   ├── db.clj               # SQLite adapter
│   │   ├── sync.clj             # Sync engine
│   │   ├── encryption.clj       # AES-256
│   │   └── audit.clj            # Audit log
│   └── shared/
│       ├── validation.clj       # Input validation
│       ├── errors.clj           # Error handling
│       └── utils.clj            # Utility functions
```

### 1.3. Convenciones de Estilo

```clojure
;; 1. Funciones puras cuando sea posible
(defn calculate-bmi
  "Calcula el Índice de Masa Corporal a partir de peso y talla."
  [weight-kg height-m]
  (when (and (pos? weight-kg) (pos? height-m))
    (/ weight-kg (* height-m height-m))))

;; 2. Destructuring para mapas
(defn format-patient-name
  "Formatea el nombre completo del paciente."
  [{:keys [first-name last-name]}]
  (str first-name " " last-name))

;; 3. Threading macros para pipelines
(defn active-patient-names
  "Obtiene nombres de pacientes activos."
  [patients]
  (->> patients
       (filter :active?)
       (map format-patient-name)
       sort))

;; 4. Docstrings en todas las funciones públicas
(defn create-consultation
  "Crea una nueva consulta para un paciente.
   
   Parámetros:
     patient-id - ID del paciente
     consultation-data - Mapa con datos de la consulta
   
   Retorna:
     Mapa con la consulta creada o error"
  [patient-id consultation-data]
  ...)

;; 5. defn- para funciones privadas
(defn- validate-curp
  "Valida formato de CURP mexicana."
  [curp]
  (re-matches #"[A-Z]{4}\d{6}[HM][A-Z]{5}[A-Z0-9]\d" curp))

;; 6. Manejo de errores con ex-info
(defn find-patient
  "Busca paciente por ID."
  [db patient-id]
  (or (db/find-patient db patient-id)
      (throw (ex-info "Paciente no encontrado"
                      {:type :patient-not-found
                       :patient-id patient-id}))))
```

---

## 2. Manejo de Errores

### 2.1. Tipos de Error

```clojure
;; Definición de tipos de error del dominio
(def error-types
  {:patient-not-found     "Paciente no encontrado"
   :consultation-not-found "Consulta no encontrada"
   :prescription-invalid  "Prescripción inválida"
   :stock-insufficient    "Stock insuficiente"
   :allergy-conflict      "Conflicto con alergia conocida"
   :interaction-detected  "Interacción medicamentosa detectada"
   :validation-error      "Error de validación"
   :sync-conflict         "Conflicto de sincronización"
   :unauthorized          "No autorizado"
   :audit-failure         "Fallo en auditoría"})
```

### 2.2. Patrón de Error

```clojure
;; Lanzar error con contexto
(throw (ex-info (get error-types :patient-not-found)
                {:type :patient-not-found
                 :patient-id patient-id
                 :component :patient-service
                 :timestamp (java.time.Instant/now)}))

;; Capturar con contexto
(try
  (save-consultation db consultation)
  (catch clojure.lang.ExceptionInfo e
    (let [{:keys [type patient-id]} (ex-data e)]
      (case type
        :validation-error
        {:status 400 :body {:error (ex-message e)}}
        
        :patient-not-found
        {:status 404 :body {:error "Paciente no encontrado"
                            :patient-id patient-id}}
        
        :allergy-conflict
        {:status 200 :body {:warning (ex-message e)
                            :requires-confirmation true}}
        
        ;; Default
        {:status 500 :body {:error "Error interno"}}))))
```

---

## 3. Validación de Entrada

### 3.1. Validadores

```clojure
(ns ghe.shared.validation)

(defn validate-curp
  "Valida formato de CURP mexicana (18 caracteres)."
  [curp]
  (and (string? curp)
       (= 18 (count curp))
       (re-matches #"[A-Z]{4}\d{6}[HM][A-Z]{5}[A-Z0-9]\d" curp)))

(defn validate-blood-pressure
  "Valida rango de presión arterial."
  [systolic diastolic]
  (and (integer? systolic)
       (integer? diastolic)
       (<= 60 systolic 300)
       (<= 30 diastolic 200)
       (< diastolic systolic)))

(defn validate-patient-data
  "Valida datos obligatorios del paciente."
  [patient]
  (cond
    (clojure.string/blank? (:first-name patient))
    {:valid? false :error "Nombre es obligatorio"}
    
    (clojure.string/blank? (:last-name patient))
    {:valid? false :error "Apellido es obligatorio"}
    
    (nil? (:birth-date patient))
    {:valid? false :error "Fecha de nacimiento es obligatoria"}
    
    (not (#{:M :F} (:gender patient)))
    {:valid? false :error "Sexo debe ser M o F"}
    
    (not (validate-curp (:curp patient)))
    {:valid? false :error "CURP inválida"}
    
    :else {:valid? true}))
```

---

## 4. Testing

### 4.1. Convenciones

```clojure
;; Archivo: ghe/patient/domain_test.clj
(ns ghe.patient.domain-test
  (:require [clojure.test :refer :all]
            [ghe.patient.domain :as patient]))

;; Test con nombre descriptivo
(deftest test-calculate-age
  (testing "Calcula edad correctamente"
    (is (= 25 (patient/calculate-age "1999-03-15" "2024-03-15"))))
  
  (testing "Edge case: cumpleaños hoy"
    (is (= 30 (patient/calculate-age "1994-09-18" "2024-09-18"))))
  
  (testing "Edge case: nacimiento futuro retorna nil"
    (is (nil? (patient/calculate-age "2030-01-01" "2024-09-18")))))

;; Test de validación
(deftest test-validate-curp
  (testing "CURP válida"
    (is (true? (patient/validate-curp "GOGC531015MVZRRL04"))))
  
  (testing "CURP con caracteres minúsculos"
    (is (false? (patient/validate-curp "gogc531015mvzrrl04"))))
  
  (testing "CURP corta"
    (is (false? (patient/validate-curp "ABC123"))))
  
  (testing "CURP nula"
    (is (false? (patient/validate-curp nil)))))

;; Test de BMI
(deftest test-calculate-bmi
  (testing "BMI normal"
    (is (= 22.5 (patient/calculate-bmi 70 1.77) 0.1)))
  
  (testing "BMI obesidad"
    (is (> (patient/calculate-bmi 120 1.65) 40)))
  
  (testing "Datos inválidos"
    (is (nil? (patient/calculate-bmi 0 1.77)))
    (is (nil? (patient/calculate-bmi 70 0)))))
```

### 4.2. Cobertura

```bash
# Ejecutar tests con cobertura
lein cloverage

# Verificar cobertura mínima
# Domain logic: 95%
# Use cases: 90%
# API endpoints: 85%
# Total: 85%
```

---

## 5. Documentación

### 5.1. Docstrings

```clojure
(defn create-prescription
  "Crea una receta electrónica para un paciente.
   
   La receta se vincula automáticamente a la consulta del paciente
   y se envía al módulo de farmacia para dispensación.
   
   Parámetros:
     db - Conexión a base de datos
     patient-id - ID del paciente (string, UUID)
     consultation-id - ID de la consulta (string, UUID)
     prescription-data - Mapa con:
       :medication-name - Nombre del medicamento (string)
       :dosage - Dosis (string, ej: '500mg')
       :frequency - Frecuencia (string, ej: 'Cada 8 horas')
       :duration - Duración (string, ej: '7 días')
       :quantity - Cantidad (integer)
       :instructions - Instrucciones especiales (string, opcional)
   
   Retorna:
     {:success true :prescription-id \"Rx-2024-00001\"}
     o
     {:success false :error \"Mensaje de error\"}
   
   Ejemplo:
     (create-prescription db 
       \"patient-123\" 
       \"consultation-456\"
       {:medication-name \"Paracetamol\"
        :dosage \"500mg\"
        :frequency \"Cada 8 horas\"
        :duration \"5 días\"
        :quantity 15})"
  [db patient-id consultation-id prescription-data]
  ...)
```

---

*Estándares de código GHE: Porque código claro es código seguro.*
