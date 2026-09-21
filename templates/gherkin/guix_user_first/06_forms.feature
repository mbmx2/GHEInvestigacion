# language: es
# GUIX User First - Formularios
@status:proposed
# @requirement:PRACTICE-GHE-001
@type:acceptance
@domain:general
# FORMULARIOS: Entrada de datos eficiente y sin errores
Característica: Formularios (GUIX User First - GHE)
  Como usuario de GHE
  Quiero formularios rápidos y sin errores
  Para registrar información clínica eficientemente

  # ─────────────────────────────────────────────────────────────
  # 1. DISEÑO DE FORMULARIOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Layout de formularios
    Dado que se diseñan formularios
    Cuando se muestra
    Entonces:
      | Criterio                   | Estado    |
      | Labels siempre visibles   | ✅ (float labels) |
      | Un campo por línea        | ✅         |
      | Campos obligatorios marcados | ✅ (*)   |
      | Orden lógico              | ✅         |
      | Botones al fondo fijo     | ✅         |
      | Progreso visible (largos) | ✅ (steps)|

  Escenario: Formulario de registro de paciente
    Dado que se diseña formulario de registro
    Cuando se muestra
    Entonces tiene:
      | Campo                      | Tipo                  |
      | Nombre                     | Texto, float label   |
      | Apellido paterno           | Texto, float label   |
      | Apellido materno           | Texto, float label   |
      | CURP                       | Texto, validación regex |
      | Fecha de nacimiento        | DatePicker           |
      | Sexo                       | Select (M/F/O)       |
      | Tipo de sangre            | Select               |
      | Teléfono                   | Numérico, 10 dígitos |
      | Domicilio                  | Texto                |
      | Contacto de emergencia     | Texto + teléfono     |

  # ─────────────────────────────────────────────────────────────
  # 2. VALIDACIÓN EN TIEMPO REAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Validación durante escritura
    Dado que el usuario escribe en un campo
    Cuando termina de escribir (onBlur)
    Entonces:
      | Campo                      | Validación           |
      | CURP                       | Regex + longitud     |
      | Nombre                     | No vacío, solo letras|
      | Teléfono                   | 10 dígitos           |
      | Fecha nacimiento           | No futura            |
      | Email                      | Formato válido       |
    Y el error se muestra junto al campo
  