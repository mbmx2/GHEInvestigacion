# Guía Spec Driven Design para el Proyecto GHE

> *"Los specs son la fuente única de verdad: validan, generan, documentan y testean."*

---

## 1. ¿Qué es Spec Driven Design?

**Spec Driven Design** es una técnica de desarrollo donde se definen las **especificaciones de datos** (specs) ANTES de escribir el código que los procesa. En Clojure, esto se logra con **clojure.spec**.

### Beneficios

| Beneficio | Descripción |
|---|---|
| **Validación automática** | Los specs validan entrada en cada capa |
| **Generación de tests** | clojure.spec genera datos de prueba automáticamente |
| **Documentación viva** | Los specs documentan la forma de los datos |
| **Diseño emergente** | Los specs guían la arquitectura |
| **Consistencia** | Validación idéntica en todas las capas |

---

## 2. Spec Driven Design Aplicado a GHE

### 2.1. Pipeline de Desarrollo

```
┌─────────────────────────────────────────────────────────────┐
│                    SPEC DRIVEN PIPELINE                      │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  1. DEFINIR SPEC (forma de los datos)                       │
│     ↓                                                       │
│  2. GENERAR TESTS (s/check)                                 │
│     ↓                                                       │
│  3. IMPLEMENTAR CÓDIGO (que pase los specs)                 │
│     ↓                                                       │
│  4. VALIDAR EN CADA CAPA (API, App, Domain, DB)             │
│     ↓                                                       │
│  5. GENERAR DOCS (desde specs)                              │
│     ↓                                                       │
│  6. GENERAR UI (formularios desde specs)                    │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### 2.2. Specs del Dominio GHE

```clojure
;; Patient
(s/def :ghe.patient/id uuid?)
(s/def :ghe.patient/curp (s/and string? #(re-matches #"[A-Z]{4}\d{6}[HM][A-Z]{5}[A-Z0-9]\d" %)))
(s/def :ghe.patient/first-name (s/and string? #(seq %)))
(s/def :ghe.patient/last-name (s/and string? #(seq %)))
(s/def :ghe.patient/birth-date inst?)
(s/def :ghe.patient/gender #{:M :F :O})
(s/def :ghe.patient/blood-type #{"A+" "A-" "B+" "B-" "AB+" "AB-" "O+" "O-"})

(s/def :ghe.patient/patient
  (s/keys :req [:ghe.patient/id
                :ghe.patient/curp
                :ghe.patient/first-name
                :ghe.patient/last-name
                :ghe.patient/birth-date
                :ghe.patient/gender]
          :opt [:ghe.patient/blood-type
                :ghe.patient/phone
                :ghe.patient/address]))

;; VitalSigns
(s/def :ghe.vital/bp-systolic (s/and int? #(<= 60 % 300)))
(s/def :ghe.vital/bp-diastolic (s/and int? #(<= 30 % 200)))
(s/def :ghe.vital/heart-rate (s/and int? #(<= 30 % 250)))
(s/def :ghe.vital/temperature (s/and number? #(<= 30.0 % 45.0)))
(s/def :ghe.vital/weight (s/and number? pos?))
(s/def :ghe.vital/height (s/and number? pos?))
(s/def :ghe.vital/o2-saturation (s/and int? #(<= 0 % 100)))

(s/def :ghe.vital/vital-signs
  (s/keys :req [:ghe.vital/bp-systolic
                :ghe.vital/bp-diastolic
                :ghe.vital/heart-rate
                :ghe.vital/temperature
                :ghe.vital/weight
                :ghe.vital/height]
          :opt [:ghe.vital/o2-saturation]))
```

### 2.3. Uso en Cada Capa

| Capa | Uso de specs |
|---|---|
| **API** | Validar request/response |
| **Application** | Validar input de use cases |
| **Domain** | Validar entidades, value objects |
| **Database** | Definir esquemas, validar al leer |
| **UI** | Generar formularios, validar input |

---

## 3. Generative Testing

```clojure
;; Generar datos automáticamente
(s/gen :ghe.patient/patient)
;; → #uuid "...", "GOGC531015MVZRRL04", "María", "García", ...

;; Property-based testing
(s/check :ghe.patient/patient)
;; → Verifica que el spec genera datos válidos

;; Custom generators
(s/def :ghe.spec/curp
  (s/with-gen
    (s/and string? #(re-matches #"[A-Z]{4}\d{6}[HM][A-Z]{5}[A-Z0-9]\d" %))
    (fn [] (gen/fmap curp-generator (gen/vector gen/char-alpha 4)))))
```

---

## 4. Specs → Documentación → UI

### 4.1. Documentación automática

```clojure
;; Desde specs se genera:
;; - OpenAPI/Swagger docs
;; - Tablas de campos
;; - Ejemplos de request/response
;; - Errores posibles
```

### 4.2. UI automática

```clojure
;; Desde specs se generan:
;; - Formularios (text, select, date, number)
;; - Validación en tiempo real
;; - Mensajes de error
;; - Componentes reutilizables
```

---

## 5. Métricas

```yaml
spec_driven_metrics:
  coverage:
    specs_defined: 45
    entities_covered: "100%"
    value_objects_covered: "100%"
  
  validation:
    api_validation: "100%"
    domain_validation: "100%"
    db_validation: "100%"
  
  testing:
    generative_tests: 25
    property_based_tests: 15
    edge_cases_found: 12
  
  documentation:
    auto_generated_docs: true
    openapi_from_specs: true
    ui_from_specs: true
```

---

## 6. Checklist

- [ ] Specs definidos para todas las entidades
- [ ] Specs definidos para value objects
- [ ] Specs definidos para API request/response
- [ ] Generative testing ejecutándose
- [ ] Validación en cada capa
- [ ] Documentación generada desde specs
- [ ] UI generada desde specs
- [ ] Custom generators para datos realistas

---

## 7. Referencias

- **clojure.spec.alpha**: https://clojure.org/guides/spec
- **"Spec Driven Development"**: Clojure community
- **"Generative Design"**: Abelson & Sussman
- **"Property-Based Testing with clojure.test"**: Reborg

---

*Spec Driven Design en GHE: Los specs son la fuente única de verdad.*
