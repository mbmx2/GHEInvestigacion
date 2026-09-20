# language: es
# Clojure Spec Driven Design - Generative Testing
@status:proposed
@type:acceptance
@domain:general
# TESTING GENERATIVO: Usar specs para generar datos de prueba automáticamente
Característica: Generative Testing con clojure.spec (Spec Driven Design - GHE)
  Como desarrollador del proyecto GHE
  Quiero usar specs para generar datos de prueba automáticamente
  Para encontrar edge cases que no pensé manualmente

  # ─────────────────────────────────────────────────────────────
  # 1. GENERACIÓN DE DATOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Generar datos válidos con s/gen
    Dado que se usa s/gen para generar datos
    Cuando se genera muestra
    Entonces:
      | Spec                        | Datos generados      |
      | :ghe.spec/string           | Strings aleatorios   |
      | :ghe.spec/positive-int     | Enteros positivos    |
      | :ghe.spec/curp             | CURPs válidas aleatorias |
      | :ghe.patient/patient       | Patients completos   |
      | :ghe.clinical/consultation | Consultations completas |

  Escenario: Generar edge cases
    Dado que se generan edge cases automáticamente
    Cuando se ejecuta generación
    Entonces el generador produce:
      | Tipo                        | Ejemplo              |
      | Strings vacíos              | ""                   |
      | Strings muy largos          | "aaaa... (1000)"     |
      | Números límite              | 0, MAX_VALUE         |
      | Null                        | nil                  |
      | Fechas extremas             | Epoch, futuro        |

  # ─────────────────────────────────────────────────────────────
  # 2. PROP-BASED TESTING
  # ─────────────────────────────────────────────────────────────

  Escenario: Property-based test con s/check
    Dado que se define propiedad a verificar
    Cuando se ejecuta s/check
    Entonces:
      | Propiedad                   | Verificación         |
      | roundtrip: conform → unform | Datos se preservan   |
      | inverse: valid → conform    | Datos conformados son válidos |
      | generative: spec genera datos válidos | Generados pasan s/valid? |

  Escenario: Property-based test de dominio
    Dado que se verifica propiedad del dominio
    Cuando se ejecuta s/check
    Entonces:
      | Propiedad                   | Verificación         |
      | BMI siempre positivo        | Para todo patient, BMI > 0 |
      | PA diastólica < sistólica   | Para todo BP, diastolic < systolic |
      | Edad gestacional 0-42       | Para todo pregnancy, weeks ∈ [0,42] |
      | CURP siempre 18 caracteres  | Para toda CURP, (count curp) = 18 |

  # ─────────────────────────────────────────────────────────────
  # 3. CUSTOM GENERATORS
  # ─────────────────────────────────────────────────────────────

  Escenario: Generador personalizado para CURP
    Dado que se crea generador personalizado de CURPs
    Cuando se genera CURP
    Entonces:
      | Característica              | Generador            |
      | 18 caracteres               | Gen de 18 chars      |
      | Primeros 4: letra           | Gen de letras mayúsculas |
      | Siguientes 6: fecha         | Gen de fechas válidas |
      | Sexo (H/M)                  | Gen de #{H M}        |
      | Estado (2 letras)           | Gen de códigos estado|
      | Último: alfanumérico        | Gen de alfanumérico  |

  Escenario: Generador personalizado para signos vitales
    Dado que se crea generador de signos vitales realistas
    Cuando se genera
    Entonces genera datos realistas:
      | Campo                       | Rango generado       |
      | PA sistólica                | 80-180               |
      | PA diastólica               | 50-110               |
      | Frecuencia cardíaca         | 50-120               |
      | Temperatura                 | 35.0-40.0            |
      | Saturación O2               | 85-100               |
      | Peso                        | 40-150 kg            |

  # ─────────────────────────────────────────────────────────────
  # 4. SHRINKING
  # ─────────────────────────────────────────────────────────────

  Escenario: Shrinking de contraejemplos
    Dado que un test falla
    Cuando se ejecuta shrinking
    Entonces el generador encuentra contraejemplo mínimo:
      | Input original (grande)     | Contraejemplo mínimo |
      | Patient con 50 campos       | Patient con campos mínimos |
      | BP con valores extremos     | BP con diastolic = systolic |
    Y el contraejemplo es fácil de reproducir

  # ─────────────────────────────────────────────────────────────
  # 5. MÉTRICAS DE TESTING GENERATIVO
  # ─────────────────────────────────────────────────────────────

  Escenario: Métricas de generative testing
    Dado que se miden métricas
    Cuando se ejecuta s/check
    Entonces:
      | Métrica                    | Valor objetivo      |
      | Número de muestras generadas | 100+ por spec     |
      | Tiempo de ejecución        | <30 segundos        |
      | Contraejemplos encontrados | 0                   |
      | Shrinking exitoso          | 100% de contraejemplos |
  