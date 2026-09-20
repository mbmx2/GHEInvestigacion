# language: es
# Clojure Spec Driven Design - Fundamentos
@status:proposed
@type:acceptance
@domain:general
# FILOSOFÍA: Los specs definen la forma de los datos ANTES de escribir código
Característica: Fundamentos de clojure.spec (Spec Driven Design - GHE)
  Como desarrollador Clojure del proyecto GHE
  Quiero usar clojure.spec para definir la forma de los datos
  Para que el sistema valide, genere y documente automáticamente

  # ─────────────────────────────────────────────────────────────
  # 1. SPEC BÁSICOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Definición de spec básico
    Dado que se define un spec para un campo
    Cuando se declara
    Entonces:
      | Spec                        | Definición           |
      | :ghe.spec/string           | (s/and string? #(seq %)) |
      | :ghe.spec/positive-int     | (s/and int? pos?)    |
      | :ghe.spec/curp             | (s/and string? #(re-matches #"[A-Z]{4}\d{6}[HM][A-Z]{5}[A-Z0-9]\d" %)) |
      | :ghe.spec/email            | (s/and string? #(re-matches #".+@.+\..+" %)) |
      | :ghe.spec/phone            | (s/and string? #(re-matches #"\d{10}" %)) |

  Escenario: Uso de predicados compuestos
    Dado que se combinan predicados
    Cuando se valida
    Entonces:
      | Predicado                   | Ejemplo              |
      | s/and                       | (s/and int? pos?)    |
      | s/or                        | (s/or :int int? :str string?) |
      | s/nilable                   | (s/nilable string?)  |
      | s/keys                      | (s/keys :req [...])  |
      | s/coll-of                   | (s/coll-of int?)     |
      | s/map-of                    | (s/map-of string? int?) |

  # ─────────────────────────────────────────────────────────────
  # 2. SPECS DE ENTIDADES
  # ─────────────────────────────────────────────────────────────

  Escenario: Spec de Patient
    Dado que se define spec de Patient
    Cuando se declara
    Entonces:
      | Campo                      | Spec                 |
      | :patient/id                | uuid?                |
      | :patient/curp              | :ghe.spec/curp       |
      | :patient/first-name        | :ghe.spec/string     |
      | :patient/last-name         | :ghe.spec/string     |
      | :patient/birth-date        | inst?                 |
      | :patient/gender            | #{:M :F :O}          |
      | :patient/blood-type        | #{"A+" "A-" "B+" "B-" "AB+" "AB-" "O+" "O-"} |
      | :patient/phone             | (s/nilable :ghe.spec/phone) |
      | :patient/address           | (s/nilable :ghe.spec/string) |

  Escenario: Spec de Consultation
    Dado que se define spec de Consultation
    Cuando se declara
    Entonces:
      | Campo                      | Spec                 |
      | :consultation/id           | uuid?                |
      | :consultation/patient-id   | uuid?                |
      | :consultation/provider-id  | uuid?                |
      | :consultation/date         | inst?                 |
      | :consultation/type         | #{:general :prenatal :emergency :followup} |
      | :consultation/chief-complaint | :ghe.spec/string  |
      | :consultation/soap         | :ghe.spec/soap-notes |
      | :consultation/diagnosis    | (s/coll-of :ghe.spec/cie10) |
      | :consultation/risk-level   | #{:low :medium :high :critical} |
      | :consultation/status       | #{:active :completed :cancelled} |

  Escenario: Spec de Prescription
    Dado que se define spec de Prescription
    Cuando se declara
    Entonces:
      | Campo                      | Spec                 |
      | :prescription/id           | uuid?                |
      | :prescription/consultation-id | uuid?             |
      | :prescription/patient-id   | uuid?                |
      | :prescription/medication   | :ghe.spec/string     |
      | :prescription/dosage       | :ghe.spec/string     |
      | :prescription/frequency    | :ghe.spec/string     |
      | :prescription/quantity     | :ghe.spec/positive-int |
      | :prescription/instructions | (s/nilable :ghe.spec/string) |
      | :prescription/signed       | boolean?             |
      | :prescription/dispensed    | boolean?             |

  # ─────────────────────────────────────────────────────────────
  # 3. SPECS COMPUESTOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Spec de VitalSigns (value object)
    Dado que se define spec de VitalSigns
    Cuando se declara
    Entonces:
      | Campo                      | Spec                 |
      | :vital-signs/bp-systolic   | (s/and int? #(<= 60 % 300)) |
      | :vital-signs/bp-diastolic  | (s/and int? #(<= 30 % 200)) |
      | :vital-signs/heart-rate    | (s/and int? #(<= 30 % 250)) |
      | :vital-signs/temperature   | (s/and number? #(<= 30.0 % 45.0)) |
      | :vital-signs/weight        | (s/and number? #(pos? %)) |
      | :vital-signs/height        | (s/and number? #(pos? %)) |
      | :vital-signs/o2-saturation | (s/and int? #(<= 0 % 100)) |

  Escenario: Spec de SOAP Notes
    Dado que se define spec de SOAP
    Cuando se declara
    Entonces:
      | Campo                      | Spec                 |
      | :soap/subjective           | :ghe.spec/string     |
      | :soap/objective            | :ghe.spec/string     |
      | :soap/assessment           | :ghe.spec/string     |
      | :soap/plan                 | :ghe.spec/string     |
    Y cada campo es obligatorio

  # ─────────────────────────────────────────────────────────────
  # 4. REGISTRAR SPECS
  # ─────────────────────────────────────────────────────────────

  Escenario: Registro de specs
    Dado que se registran specs
    Cuando se carga el namespace
    Entonces:
      | Spec                        | Registrado con       |
      | :ghe.patient/patient        | (s/def :ghe.patient/patient ...) |
      | :ghe.clinical/consultation  | (s/def :ghe.clinical/consultation ...) |
      | :ghe.prescription/prescription | (s/def ...)      |
    Y los specs están disponibles globalmente
  