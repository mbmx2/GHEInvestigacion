# language: es
# Clojure Spec Driven Design - API Design
# DISEÑO DE API: Usar specs para definir contratos de API
Característica: Diseño de API con clojure.spec (Spec Driven Design - GHE)
  Como desarrollador de API del proyecto GHE
  Quiero usar specs para definir contratos de API
  Para que la documentación y validación sean automáticas

  # ─────────────────────────────────────────────────────────────
  # 1. SPECS DE REQUEST
  # ─────────────────────────────────────────────────────────────

  Escenario: Spec de request POST /api/patients
    Dado que se define spec de request para crear paciente
    Cuando se documenta
    Entonces:
      | Campo                      | Spec                 | Obligatorio |
      | :patient/first-name        | :ghe.spec/string     | Sí         |
      | :patient/last-name         | :ghe.spec/string     | Sí         |
      | :patient/curp              | :ghe.spec/curp       | Sí         |
      | :patient/birth-date        | inst?                 | Sí         |
      | :patient/gender            | #{:M :F :O}          | Sí         |
      | :patient/blood-type        | #{"A+" ... "O-"}     | No         |
      | :patient/phone             | :ghe.spec/phone      | No         |
      | :patient/address           | :ghe.spec/string     | No         |

  Escenario: Spec de request POST /api/consultations
    Dado que se define spec de request para crear consulta
    Cuando se documenta
    Entonces:
      | Campo                      | Spec                 | Obligatorio |
      | :consultation/patient-id   | uuid?                | Sí         |
      | :consultation/type         | #{:general ...}      | Sí         |
      | :consultation/chief-complaint | :ghe.spec/string  | Sí         |
      | :consultation/soap         | :ghe.spec/soap-notes | Sí         |
      | :consultation/diagnosis    | (s/coll-of :ghe.spec/cie10) | Sí |

  # ─────────────────────────────────────────────────────────────
  # 2. SPECS DE RESPONSE
  # ─────────────────────────────────────────────────────────────

  Escenario: Spec de response exitosa
    Dado que se define spec de response
    Cuando se documenta
    Entonces:
      | Campo                      | Spec                 |
      | :response/success          | true                 |
      | :response/data             | Entidad creada       |
      | :response/timestamp        | inst?                 |

  Escenario: Spec de response de error
    Dado que se define spec de error
    Cuando se documenta
    Entonces:
      | Campo                      | Spec                 |
      | :response/success          | false                |
      | :response/error            | :ghe.spec/string     |
      | :response/details          | (s/coll-of map?)     |
      | :response/timestamp        | inst?                 |

  # ─────────────────────────────────────────────────────────────
  # 3. GENERACIÓN DE DOCUMENTACIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Generar documentación desde specs
    Dado que se generan docs desde specs
    Cuando se ejecuta tool
    Entonces genera:
      | Documento                   | Contenido            |
      | OpenAPI/Swagger             | Esquema de API       |
      | Ejemplos de request         | Datos de ejemplo     |
      | Tabla de campos             | Campos y tipos       |
      | Errores posibles            | Códigos de error     |

  # ─────────────────────────────────────────────────────────────
  # 4. MIDDLEWARE DE VALIDACIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Middleware que valida con specs
    Dado que se implementa middleware de validación
    Cuando llega request
    Entonces:
      | Paso                       |
      | 1. Extraer spec del endpoint |
      | 2. Validar body contra spec |
      | 3. Si válido → continuar    |
      | 4. Si inválido → 400 + errores |

  Escenario: Validación de query parameters
    Dado que se validan query params
    Cuando se procesa petición GET
    Entonces:
      | Parámetro                  | Spec                 |
      | page                       | (s/and int? pos?)    |
      | limit                      | (s/and int? #(<= 1 % 100)) |
      | sort                       | #{"name" "date" "risk"} |
      | order                      | #{"asc" "desc"}      |
  