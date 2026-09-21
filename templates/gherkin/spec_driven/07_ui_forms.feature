# language: es
# Clojure Spec Driven Design - UI Forms
@status:proposed
# @requirement:PRACTICE-GHE-001
@type:acceptance
@domain:general
# FORMULARIOS UI: Usar specs para generar formularios automáticamente
Característica: Formularios UI con clojure.spec (Spec Driven Design - GHE)
  Como desarrollador frontend del proyecto GHE
  Quiero que los specs generen formularios automáticamente
  Para que la UI sea consistente con la validación

  # ─────────────────────────────────────────────────────────────
  # 1. GENERACIÓN DE FORMULARIOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Generar form desde spec de Patient
    Dado que se tiene spec de Patient
    Cuando se genera form
    Entonces genera:
      | Campo                      | Componente UI        |
      | :patient/first-name        | Text input           |
      | :patient/last-name         | Text input           |
      | :patient/curp              | Text input + validación regex |
      | :patient/birth-date        | Date picker          |
      | :patient/gender            | Select (M/F/O)       |
      | :patient/blood-type        | Select (A+...O-)     |
      | :patient/phone             | Phone input          |
      | :patient/address           | Text area            |

  Escenario: Inferir tipo de componente desde spec
    Dado que se infiere componente desde spec
    Cuando se analiza spec
    Entonces:
      | Spec                        | Componente inferido  |
      | string?                     | Text input           |
      | int?                        | Number input         |
      | #{:a :b :c}                 | Select               |
      | boolean?                    | Checkbox             |
      | inst?                       | Date picker          |
      | (s/nilable ...)             | Input opcional       |
      | (s/coll-of ...)             | Multi-select         |

  # ─────────────────────────────────────────────────────────────
  # 2. VALIDACIÓN EN TIEMPO REAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Validación durante escritura
    Dado que el usuario escribe en campo
    Cuando termina (onBlur)
    Entonces:
      | Campo                      | Validación spec      |
      | CURP                       | s/valid? contra :ghe.spec/curp |
      | Nombre                     | s/valid? contra :ghe.spec/string |
      | Teléfono                   | s/valid? contra :ghe.spec/phone |
      | Fecha                      | s/valid? contra inst? |

  Escenario: Mostrar errores de spec en UI
    Dado que falla validación de spec
    Cuando se muestra error
    Entonces:
      | Spec fallido                | Mensaje UI           |
      | :ghe.spec/curp             | "CURP inválida. Debe tener 18 caracteres en mayúsculas" |
      | :ghe.spec/phone            | "Teléfono debe tener 10 dígitos" |
      | :ghe.spec/string           | "Este campo es obligatorio" |
      | bp diastolic > systolic     | "Presión diastólica debe ser menor que sistólica" |

  # ─────────────────────────────────────────────────────────────
  # 3. FORMULARIOS DINÁMICOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Formulario condicional
    Dado que se tiene form con campos condicionales
    Cuando cambia valor de campo
    Entonces:
      | Si gender = :F             | Mostrar campo embarazada |
      | Si type = :prenatal        | Mostrar campos obstétricos |
      | Si emergency = true        | Mostrar campos de urgencia |
    Y los campos condicionales también se validan con specs

  Escenario: Formulario multi-step
    Dado que se tiene form largo multi-step
    Cuando se navega entre pasos
    Entonces:
      | Paso                       | Campos               |
      | 1. Datos personales        | Nombre, CURP, fecha, sexo |
      | 2. Datos de contacto       | Teléfono, domicilio  |
      | 3. Datos clínicos          | Sangre, alergias     |
      | 4. Confirmación            | Resumen + guardar    |
    Y cada paso se valida antes de avanzar

  # ─────────────────────────────────────────────────────────────
  # 4. REUTILIZACIÓN DE COMPONENTES
  # ─────────────────────────────────────────────────────────────

  Escenario: Componentes reutilizables desde specs
    Dado que se crean componentes genéricos
    Cuando se usan en múltiples formularios
    Entonces:
      | Componente                  | Uso                  |
      | CurpInput                   | Form registro, búsqueda |
      | DatePicker                  | Cualquier fecha      |
      | SelectEnum                  | Sexo, tipo sangre, etc. |
      | PhoneInput                  | Cualquier teléfono   |
      | VitalSignsForm              | Triaje, consulta     |
    Y cada componente valida con su spec correspondiente
  