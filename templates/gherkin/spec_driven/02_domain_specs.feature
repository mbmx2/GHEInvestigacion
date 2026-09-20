# language: es
# Clojure Spec Driven Design - Dominio del Negocio
@status:proposed
@type:acceptance
@domain:general
# SPECS como documentación viva del dominio médico
Característica: Specs del Dominio del Negocio (Spec Driven Design - GHE)
  Como desarrollador del proyecto GHE
  Quiero que los specs documenten el dominio médico
  Para que la validación y documentación sean la misma cosa

  # ─────────────────────────────────────────────────────────────
  # 1. SPECS DE VALORES MÉDICOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Spec de BloodPressure
    Dado que se define spec de BloodPressure
    Cuando se declara con reglas clínicas
    Entonces:
      | Regla clínica               | Implementación       |
      | PA sistólica > diastólica   | (s/and #(< (:diastolic %) (:systolic %))) |
      | PA sistólica 60-300         | (s/and int? #(<= 60 % 300)) |
      | PA diastólica 30-200        | (s/and int? #(<= 30 % 200)) |

  Escenario: Spec de GestationalAge
    Dado que se define spec de GestationalAge
    Cuando se declara
    Entonces:
      | Regla clínica               | Implementación       |
      | Edad gestacional 0-42 semanas| (s/and int? #(<= 0 % 42)) |
      | Días 0-6                    | (s/and int? #(<= 0 % 6))  |
      | Formato "XX semanas + Y días"| Spec compuesto       |

  Escenario: Spec de MedicationDose
    Dado que se define spec de MedicationDose
    Cuando se declara
    Entonces:
      | Campo                      | Spec                 |
      | :dose/amount               | (s/and number? pos?) |
      | :dose/unit                 | #{"mg" "g" "ml" "UI" "gotas" "tabletas"} |
      | :dose/frequency            | #{"Cada 4h" "Cada 6h" "Cada 8h" "Cada 12h" "Cada 24h"} |
      | :dose/route                | #{"Oral" "IV" "IM" "SC" "Tópica" "Sublingual"} |

  # ─────────────────────────────────────────────────────────────
  # 2. SPECS DE FLUJO CLÍNICO
  # ─────────────────────────────────────────────────────────────

  Escenario: Spec de TriageRisk
    Dado que se define spec de TriageRisk
    Cuando se declara
    Entonces:
      | Nivel                      | Criterios           |
      | :critical                  | Glasgow <9, PA <70, SpO2 <85% |
      | :high                      | Glasgow 9-12, PA 70-90, SpO2 85-92% |
      | :medium                    | Glasgow 13-14, PA 90-140, SpO2 92-95% |
      | :low                       | Glasgow 15, PA normal, SpO2 >95% |

  Escenario: Spec de ConsultationType
    Dado que se define spec de ConsultationType
    Cuando se declara
    Entonces:
      | Tipo                       | Descripción          |
      | :consultation/general      | Medicina general     |
      | :consultation/prenatal     | Control prenatal     |
      | :consultation/emergency    | Urgencia             |
      | :consultation/followup     | Seguimiento          |
      | :consultation/nutrition    | Nutrición            |
      | :consultation/dental       | Odontología          |

  # ─────────────────────────────────────────────────────────────
  # 3. SPECS DE CIE-10
  # ─────────────────────────────────────────────────────────────

  Escenario: Spec de código CIE-10
    Dado que se define spec de CIE-10
    Cuando se declara
    Entonces:
      | Campo                      | Spec                 |
      | :cie10/code                | (s/and string? #(re-matches #"[A-Z]\d{2}(\.\d{1,2})?" %)) |
      | :cie10/description         | :ghe.spec/string     |
      | :cie10/category            | :ghe.spec/string     |
    Y se puede validar código en tiempo real

  Escenario: Spec de código LOINC
    Dado que se define spec de LOINC
    Cuando se declara
    Entonces:
      | Campo                      | Spec                 |
      | :loinc/code                | (s/and string? #(re-matches #"\d{1,5}-\d" %)) |
      | :loinc/name                | :ghe.spec/string     |
      | :loinc/unit                | (s/nilable :ghe.spec/string) |

  # ─────────────────────────────────────────────────────────────
  # 4. SPECS DE REGLAS DE NEGOCIO
  # ─────────────────────────────────────────────────────────────

  Escenario: Spec de regla de prescripción
    Dado que se define spec que valida regla de negocio
    Cuando se declara
    Entonces:
      | Regla                       | Spec                 |
      | No prescribir sin consulta | (s/keys :req [:prescription/consultation-id]) |
      | Cantidad > 0               | (s/keys :req [:prescription/quantity] :fn #(> (:prescription/quantity %) 0)) |
      | Medicamento no vacío       | (s/keys :req [:prescription/medication] :fn #(seq (:prescription/medication %))) |

  Escenario: Spec con :fn para validación compleja
    Dado que se define spec con función de validación
    Cuando se declara
    Entonces:
      | Spec                        | Función de validación |
      | :ghe.spec/patient-valid    | :fn que verifica edad > 0 |
      | :ghe.spec/bp-valid         | :fn que verifica diastolic < systolic |
      | :ghe.spec/gestational-valid| :fn que verifica weeks 0-42 |
  