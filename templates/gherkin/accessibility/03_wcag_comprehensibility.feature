# language: es
# Accesibilidad WCAG 2.1 - Comprensibilidad
@status:proposed
@type:acceptance
@domain:accessibility
# PRINCIPIO 3: La información y el funcionamiento de la interfaz deben ser comprensibles
Característica: WCAG 2.1 - Comprensibilidad (Accesibilidad - GHE)
  Como responsable de accesibilidad del proyecto GHE
  Quiero que el sistema sea fácil de entender
  Para que todos los usuarios puedan usarlo sin confusión

  # ─────────────────────────────────────────────────────────────
  # 3.1 LEGIBILIDAD (3.1.1 - 3.1.2)
  # ─────────────────────────────────────────────────────────────

  Escenario: Idioma del contenido
    Dado que se inspecta el idioma del documento
    Cuando se evalúa
    Entonces:
      | Criterio                   | Estado    |
      | Idioma declarado en <html> | ✅ (es)    |
      | Cambios de idioma marcados | ✅ (lang)  |
      | Contenido en español       | ✅         |

  Escenario: Abreviaturas
    Dado que se usan abreviaturas médicas
    Cuando se inspeccionan
    Entonces:
      | Abreviatura                | Expansión            |
      | HTA                        | Hipertensión Arterial |
      | DM                         | Diabetes Mellitus    |
      | ECV                        | Enfermedad Cardiovascular |
      | IRA                        | Infección Respiratoria Aguda |
      | IC                         | Insuficiencia Cardíaca |
    Y cada abreviatura tiene expand en title/tooltip

  # ─────────────────────────────────────────────────────────────
  # 3.2 PREDECIBILIDAD (3.2.1 - 3.2.4)
  # ─────────────────────────────────────────────────────────────

  Escenario: Focus no cambia contexto
    Dado que se tabula entre elementos
    Cuando se da focus a un elemento
    Entonces:
      | Criterio                   | Estado    |
      | No se abre nueva ventana   | ✅         |
      | No se cambia de página     | ✅         |
      | No se activa submit        | ✅         |

  Escenario: Navegación consistente
    Dado que se navega por el sistema
    Cuando se compara entre páginas
    Entonces:
      | Criterio                   | Estado    |
      | Menú en misma posición     | ✅         |
      | Breadcrumb en misma posición | ✅       |
      | Acciones en misma posición | ✅         |

  Escenario: Identificación de errores
    Dado que el usuario comete error
    Cuando se detecta
    Entonces:
      | Criterio                   | Estado    |
      | Error descrito claramente  | ✅         |
      | Campo con error resaltado  | ✅ (borde rojo) |
      | Sugerencia de corrección   | ✅         |
      | Enfoque en campo con error | ✅         |

  # ─────────────────────────────────────────────────────────────
  # 3.3 ASISTENCIA EN INPUT (3.3.1 - 3.3.4)
  # ─────────────────────────────────────────────────────────────

  Escenario: Descripción de error
    Dado que falla validación
    Cuando se muestra error
    Entonces:
      | Campo                      | Mensaje de error     |
      | CURP                       | "CURP inválida. Debe tener 18 caracteres en mayúsculas" |
      | Nombre                     | "El nombre es obligatorio" |
      | Teléfono                   | "El teléfono debe tener 10 dígitos" |
      | Fecha nacimiento           | "La fecha no puede ser futura" |

  Escenario: Labels y ayudas
    Dado que se muestran formularios
    Cuando se inspecciona accesibilidad
    Entonces:
      | Elemento                    | Ayuda                  |
      | CURP                        | title="Formato: 4 letras, 6 números, 1 sexo, 5 letras, 1 alfanumérico" |
      | Fecha de nacimiento         | aria-describedby con formato |
      | Tipo de sangre             | aria-describedby con opciones |
      | Sexo                       | aria-describedby con opciones |

  Escenario: Prevención de errores
    Dado que se puede prevenir un error
    Cuando se verifica
    Entonces:
      | Mecanismo                   | Ejemplo              |
      | Selección en vez de input   | Select para Sexo     |
      | Formato predefinido         | DatePicker para fechas |
      | Autocompletado              | CURP se valida en tiempo real |
      | Confirmación antes de borrar | Modal de confirmación |

  # ─────────────────────────────────────────────────────────────
  # 3.4 NIVELES DE ASISTENCIA (3.3.3 - 3.3.5)
  # ─────────────────────────────────────────────────────────────

  Escenario: Sugerencias de error
    Dado que falla validación
    Cuando se muestra error
    Entonces:
      | Error                       | Sugerencia           |
      | CURP inválida              | "Ingrese 18 caracteres en mayúsculas" |
      | Fecha futura               | "La fecha no puede ser posterior a hoy" |
      | Campo vacío                | "Este campo es obligatorio" |

  Escenario: Prevención de errores legales/financieros
    Dado que se realizan acciones con consecuencias
    Cuando se verifica
    Entonces:
      | Acción                      | Protección           |
      | Eliminar paciente          | Confirmación modal   |
      | Modificar prescripción     | Confirmación + log   |
      | Enviar referencia          | Confirmación         |

  # ─────────────────────────────────────────────────────────────
  # 3.5 CONSISTENCIA (3.2.3 - 3.2.6)
  # ─────────────────────────────────────────────────────────────

  Escenario: Componentes consistentes
    Dado que se evalúa consistencia
    Cuando se compara entre pantallas
    Entonces:
      | Componente                  | Consistente          |
      | Botón primario             | Mismo color, tamaño  |
      | Input de texto             | Mismo estilo         |
      | Select                     | Mismo estilo         |
      | Modal                      | Mismo diseño         |
      | Toast/notification         | Misma posición       |
  