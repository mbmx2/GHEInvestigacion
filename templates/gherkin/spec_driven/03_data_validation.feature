# language: es
# Clojure Spec Driven Design - Validación de Datos
# VALIDACIÓN: Usar specs para validar entrada en cada capa
Característica: Validación con clojure.spec (Spec Driven Design - GHE)
  Como desarrollador del proyecto GHE
  Quiero usar specs para validar todos los datos
  Para que la validación sea consistente y automática

  # ─────────────────────────────────────────────────────────────
  # 1. VALIDACIÓN BÁSICA
  # ─────────────────────────────────────────────────────────────

  Escenario: Validar con s/valid?
    Dado que se usa s/valid? para validar
    Cuando se valida input
    Entonces:
      | Input                       | Spec                 | Resultado |
      | "GOGC531015MVZRRL04"       | :ghe.spec/curp      | ✅ true   |
      | "ABC123"                    | :ghe.spec/curp      | ❌ false  |
      | {:systolic 120 :diastolic 80} | :ghe.spec/bp       | ✅ true   |
      | {:systolic 80 :diastolic 120} | :ghe.spec/bp       | ❌ false  |

  Escenario: Validar con s/explain
    Dado que se usa s/explain para ver errores
    Cuando falla validación
    Entonces muestra:
      | Spec fallido                | Error mostrado       |
      | :ghe.spec/curp con "ABC"   | "ABC" - failed: (re-matches ...) |
      | BP con diastolic > systolic | "120" - failed: #(< (:diastolic %) (:systolic %)) |

  # ─────────────────────────────────────────────────────────────
  # 2. VALIDACIÓN EN CAPAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Validación en API layer
    Dado que se valida en capa API
    Cuando recibe request
    Entonces:
      | Capa                       | Qué valida           |
      | REST API                   | Schema del request   |
      | Application                | Reglas de negocio    |
      | Domain                     | Integridad de datos  |
    Y cada capa usa sus propios specs

  Escenario: Validación en Domain layer
    Dado que se valida en capa Domain
    Cuando se crea entidad
    Entonces:
      | Entidad                    | Spec usado           |
      | Patient                    | :ghe.patient/patient |
      | Consultation               | :ghe.clinical/consultation |
      | Prescription               | :ghe.prescription/prescription |
      | VitalSigns                 | :ghe.clinical/vital-signs |
    Y si falla, se lanza ex-info con el error

  # ─────────────────────────────────────────────────────────────
  # 3. CONFORMACIÓN DE DATOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Usar s/conform para transformar
    Dado que se usa s/conform para conformar datos
    Cuando se procesa input
    Entonces:
      | Input                       | Conformado           |
      | "120/80" (BP string)       | {:systolic 120 :diastolic 80} |
      | "37.5°C" (temp string)     | 37.5                 |
      | "32 semanas" (GA string)   | {:weeks 32 :days 0}  |

  Escenario: Usar s/unform para revertir
    Dado que se usa s/unform para revertir
    Cuando se procesa datos conformados
    Entonces:
      | Conformado                  | Revertido            |
      | {:systolic 120 :diastolic 80} | "120/80"           |
      | {:weeks 32 :days 0}        | "32 semanas"         |

  # ─────────────────────────────────────────────────────────────
  # 4. ERRORES DE VALIDACIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Errores de validación estructurados
    Dado que se generan errores estructurados
    Cuando falla validación
    Entonces el error incluye:
      | Campo                      |
      | path (campo con error)     |
      | spec (spec que falló)      |
      | value (valor proporcionado)|
      | reason (explicación)       |
      | suggestion (corrección sugerida) |

  Escenario: Agregación de errores de validación
    Dado que se validan múltiples campos
    Cuando varios fallan
    Entonces se muestran TODOS los errores:
      | Campo                      | Error                |
      | CURP                       | Formato inválido     |
      | Nombre                     | No puede estar vacío |
      | Teléfono                   | Debe tener 10 dígitos|
      | Fecha nacimiento           | No puede ser futura  |
    Y NO se muestra solo el primero
  