# language: es
# Accesibilidad WCAG 2.1 - Robustez
# PRINCIPIO 4: El contenido debe ser lo suficientemente robusto para ser interpretado por tecnologías de asistencia
Característica: WCAG 2.1 - Robustez (Accesibilidad - GHE)
  Como responsable de accesibilidad del proyecto GHE
  Quiero que el sistema sea compatible con tecnologías de asistencia
  Para que screen readers, lectores de pantalla y otros dispositivos funcionen correctamente

  # ─────────────────────────────────────────────────────────────
  # 4.1 COMPATIBILIDAD (4.1.1 - 4.1.3)
  # ─────────────────────────────────────────────────────────────

  Escenario: Parsing de HTML
    Dado que se valida HTML
    Cuando se ejecuta validación
    Entonces:
      | Criterio                   | Estado    |
      | HTML válido                | ✅         |
      | Tags cerrados correctamente| ✅         |
      | IDs únicos                 | ✅         |
      | Labels asociados a inputs  | ✅         |

  Escenario: Nombres, roles, valores (4.1.2)
    Dado que se inspeccionan componentes
    Cuando se evalúa accesibilidad
    Entonces:
      | Componente                 | Atributos requeridos  |
      | Botón                      | role="button", aria-label |
      | Input                      | role, aria-required   |
      | Select                     | role="listbox", aria-expanded |
      | Modal                      | role="dialog", aria-modal |
      | Tab                        | role="tab", aria-selected |
      | Toast                      | role="alert", aria-live |
      | Spinner                    | role="status", aria-busy |

  Escenario: Mensajes de estado (4.1.3)
    Dado que hay cambios de estado
    Cuando se actualiza contenido
    Entonces:
      | Evento                      | Atributo             |
      | Guardando...                | aria-live="polite"   |
      | Error de validación         | aria-live="assertive"|
      | Guardado exitoso            | role="status"        |
      | Cargando contenido          | aria-busy="true"     |
      | Nuevo resultado             | aria-live="polite"   |

  # ─────────────────────────────────────────────────────────────
  # 4.2 ARIA
  # ─────────────────────────────────────────────────────────────

  Escenario: Uso correcto de ARIA
    Dado que se usan atributos ARIA
    Cuando se inspeccionan
    Entonces:
      | Atributo                    | Uso correcto         |
      | aria-label                  | Describe el elemento |
      | aria-describedby           | Describe propósito   |
      | aria-required               | Campo obligatorio    |
      | aria-invalid                | Campo con error      |
      | aria-expanded               | Estado de colapsable |
      | aria-selected               | Estado de tab        |
      | aria-checked                | Estado de checkbox   |
      | aria-hidden                 | Oculto de screen readers |
      | aria-live                   | Actualizaciones dinámicas |
      | aria-atomic                 | Contenido completo en live |
      | aria-controls               | Controla otro elemento |
      | aria-labelledby             | Título del elemento  |

  Escenario: Reglas de ARIA
    Dado que se verifican reglas ARIA
    Cuando se evalúa código
    Entonces:
      | Regla                       | Estado    |
      | No usar role sin contenido  | ✅         |
      | No usar aria-hidden en focusables | ✅ |
      | No duplicar roles nativos   | ✅         |
      | Usar aria-live para cambios dinámicos | ✅ |
      | Usar aria-label en botones sin texto | ✅ |

  # ─────────────────────────────────────────────────────────────
  # 4.3 COMPATIBILIDAD CON SCREEN READERS
  # ─────────────────────────────────────────────────────────────

  Escenario: Navegación con NVDA
    Dado que se usa NVDA (Windows)
    Cuando se navega
    Entonces:
      | Acción                      | Resultado esperado   |
      | Leer página completa        | Contenido secuencial |
      | Navegar por heading         | h1→h2→h3 correcto   |
      | Navegar por landmarks       | nav, main, aside     |
      | Navegar por formularios     | Labels correctos     |
      | Navegar por tablas          | Headers correctos    |
      | Leer botón                  | Nombre + estado      |
      | Leer input                  | Label + requerido + error |

  Escenario: Navegación con VoiceOver (Mac)
    Dado que se usa VoiceOver
    Cuando se navega
    Entonces:
      | Criterio                   | Estado    |
      | rotor funciona             | ✅         |
      | headings navigate          | ✅         |
      | form controls navigate     | ✅         |
      | links navigate             | ✅         |

  Escenario: Navegación con TalkBack (Android)
    Dado que se usa TalkBack en Android
    Cuando se navega
    Entonces:
      | Criterio                   | Estado    |
      | Swipe para navegar         | ✅         |
      | Doble tap para activar     | ✅         |
      | Lectura de contenido       | ✅         |
      | Formularios accesibles     | ✅         |

  # ─────────────────────────────────────────────────────────────
  # 4.4 TABLAS ACCESIBLES
  # ─────────────────────────────────────────────────────────────

  Escenario: Tabla de pacientes
    Dado que se muestra tabla de pacientes
    Cuando un screen reader la lee
    Entonces:
      | Elemento                    | Atributo             |
      | <table>                     | role="table"         |
      | <caption>                   | "Lista de pacientes" |
      | <th>                        | scope="col"          |
      | <td>                        | Headers correctos    |
      | Orden                       | aria-sort            |
      | Paginación                  | aria-label           |

  Escenario: Tabla de signos vitales
    Dado que se muestra tabla de signos vitales
    Cuando se inspecciona
    Entonces:
      | Criterio                   | Estado    |
      | Caption descriptiva        | ✅         |
      | Headers correctos          | ✅         |
      | scope="col" en headers     | ✅         |
      | scope="row" cuando aplica  | ✅         |

  # ─────────────────────────────────────────────────────────────
  # 4.5 FORMULARIOS ACCESIBLES
  # ─────────────────────────────────────────────────────────────

  Escenario: Formulario de registro completo
    Dado que se muestra formulario de registro
    Cuando se inspecciona
    Entonces:
      | Campo                      | Atributos             |
      | Nombre                     | id, name, required, aria-required |
      | CURP                       | id, name, pattern, aria-describedby |
      | Fecha nacimiento           | id, name, type="date" |
      | Sexo                       | id, name, role="radiogroup" |
      | Teléfono                   | id, name, type="tel", pattern |
      | Botón guardar              | type="submit", aria-label |

  Escenario: Estados de validación
    Dado que se validan campos
    Cuando hay error
    Entonces:
      | Campo                      | Atributos             |
      | Input inválido             | aria-invalid="true"   |
      | Mensaje de error           | aria-describedby apunta a error |
      | Campo requerido            | aria-required="true"  |
      | Campo válido               | aria-invalid removido |

  # ─────────────────────────────────────────────────────────────
  # 4.6 MODALES ACCESIBLES
  # ─────────────────────────────────────────────────────────────

  Escenario: Modal de confirmación
    Dado que se abre modal de confirmación
    Cuando se inspecciona
    Entonces:
      | Atributo                    | Valor                |
      | role                        | "dialog"             |
      | aria-modal                  | "true"               |
      | aria-labelledby             | Título del modal     |
      | aria-describedby            | Descripción del modal|
      | Focus trap                  | Dentro del modal     |
      | Escape                      | Cierra el modal      |
  