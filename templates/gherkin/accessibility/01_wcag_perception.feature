# language: es
# Accesibilidad WCAG 2.1 - Percepción
# PRINCIPIO 1: La información debe ser presentada de forma que los usuarios puedan percibirla
Característica: WCAG 2.1 - Percepción (Accesibilidad - GHE)
  Como responsable de accesibilidad del proyecto GHE
  Quiero que toda la información sea perceptible por todos los usuarios
  Para que personas con discapacidad visual, auditiva o motora usen el sistema

  # ─────────────────────────────────────────────────────────────
  # 1.1 TEXTOS ALTERNATIVOS (1.1.1)
  # ─────────────────────────────────────────────────────────────

  Escenario: Imágenes con texto alternativo
    Dado que la interfaz contiene imágenes
    Cuando se inspecta cada imagen
    Entonces:
      | Elemento                    | Alt text requerido    |
      | Logo de GHE                 | "GHE - Sistema Médico" |
      | Iconos de menú              | Descripción de función|
      | Gráficas de signos vitales  | Descripción del dato  |
      | Fotos de perfil             | "Foto de [nombre]"    |
      | Iconos de estado            | "Conectado"/"Sin conexión" |

  Escenario: Iconos sin texto
    Dado que se usan iconos como botones
    Cuando se inspecciona accesibilidad
    Entonces:
      | Icono                       | aria-label            |
      | 🔍 (buscar)                | "Buscar paciente"     |
      | ➕ (nuevo)                 | "Nuevo registro"      |
      | ✏️ (editar)               | "Editar"              |
      | 🗑️ (eliminar)            | "Eliminar"            |
      | 📋 (copiar)               | "Copiar"              |
      | 🔄 (actualizar)           | "Actualizar"          |

  # ─────────────────────────────────────────────────────────────
  # 1.2 CONTENIDO CAPTCHABLE (1.2.1)
  # ─────────────────────────────────────────────────────────────

  Escenario: Gráficas con alternativa textual
    Dado que se muestran gráficas de signos vitales
    Cuando un usuario de screen reader accede
    Entonces:
      | Gráfica                     | Alternativa textual  |
      | Presión arterial (gráfica)  | Tabla con valores    |
      | Curva de peso               | Tabla con valores    |
      | Edad gestacional (gráfica)  | Texto: "32 semanas"  |
      | Tendencia de glucosa        | Tabla con valores    |
      | Curva de crecimiento fetal  | Tabla con valores    |

  Escenario: Vídeos con subtítulos
    Dado que se muestra contenido de video (futuro)
    Cuando se reproduce
    Entonces:
      | Criterio                   | Estado    |
      | Subtítulos habilitados     | ✅         |
      | Transcripción disponible   | ✅         |
      | Audio descripción          | ⚠️ Futuro |

  # ─────────────────────────────────────────────────────────────
  # 1.3 CONTENIDO ADAPTABLE (1.3.1)
  # ─────────────────────────────────────────────────────────────

  Escenario: Estructura semántica correcta
    Dado que se inspecta la estructura HTML
    Cuando se evalúa semántica
    Entonces:
      | Elemento                    | Uso correcto         |
      | <h1>                       | Título principal (1 por página) |
      | <h2>                       | Secciones principales |
      | <h3>                       | Subsecciones          |
      | <nav>                      | Navegación            |
      | <main>                     | Contenido principal   |
      | <aside>                    | Sidebar               |
      | <table>                    | Tablas de datos (NO layout) |
      | <form>                     | Formularios           |
      | <label>                    | Asociado a cada input |

  Escenario: Secuencia de lectura lógica
    Dado que se navega solo con teclado (Tab)
    Cuando se avanza por la página
    Entonces el orden de tabulación es:
      | Orden                       | Elemento              |
      | 1                           | Skip link             |
      | 2                           | Menú principal        |
      | 3                           | Barra de búsqueda     |
      | 4                           | Contenido principal   |
      | 5                           | Acciones principales  |
      | 6                           | Sidebar               |

  Escenario: Formularios con labels asociados
    Dado que se muestran formularios
    Cuando se inspecciona accesibilidad
    Entonces cada input tiene:
      | Input                       | Label asociado        |
      | Nombre                      | <label for="nombre">Nombre</label> |
      | CURP                        | <label for="curp">CURP</label> |
      | Fecha nacimiento           | <label for="nac">Fecha de nacimiento</label> |
      | Sexo                        | <label for="sexo">Sexo</label> |

  # ─────────────────────────────────────────────────────────────
  # 1.4 CONTENIDO DISTINGUIBLE (1.4.1 - Color)
  # ─────────────────────────────────────────────────────────────

  Escenario: Información no depende solo de color
    Dado que se muestran estados visuales
    Cuando se evalúa accesibilidad
    Entonces:
      | Estado                      | Indicador             |
      | Conectado                   | 🟢 + texto "Conectado"|
      | Sin conexión                | 🔴 + texto "Sin conexión" |
      | Sincronizando               | 🟡 + texto "Sincronizando" |
      | Error                       | 🔴 + texto + icono ⚠️ |
      | Éxito                       | 🟢 + texto + icono ✅ |
      | Advertencia                 | 🟡 + texto + icono ⚠️ |

  # ─────────────────────────────────────────────────────────────
  # 1.5 CONTRASTE (1.4.3 - 1.4.6)
  # ─────────────────────────────────────────────────────────────

  Escenario: Contraste de texto normal
    Dado que se evalúa contraste de texto
    Cuando se mide ratio de contraste
    Entonces:
      | Elemento                    | Ratio mínimo | WCAG    |
      | Texto normal (14px)         | 4.5:1        | AA      |
      | Texto grande (18px+)        | 3:1          | AA      |
      | Texto en fondo oscuro       | 7:1          | AAA     |
      | Texto en fondo claro        | 4.5:1        | AA      |

  Escenario: Contraste de componentes interactivos
    Dado que se evalúa contraste de componentes
    Cuando se mide
    Entonces:
      | Componente                  | Ratio mínimo |
      | Botón primario (fondo/texto)| 4.5:1        |
      | Botón outline (borde/texto) | 3:1          |
      | Input (borde/fondo)         | 3:1          |
      | Link (texto/fondo)          | 4.5:1        |
      | Icono (color/fondo)         | 3:1          |

  Escenario: Contraste en modo oscuro
    Dado que se usa modo oscuro
    Cuando se evalúa contraste
    Entonces:
      | Elemento                    | Ratio mínimo |
      | Texto en fondo oscuro       | 7:1 (AAA)    |
      | Texto secundario            | 4.5:1        |
      | Componentes                 | 3:1          |

  # ─────────────────────────────────────────────────────────────
  # 1.6 REDIMENSIONADO DE TEXTO (1.4.4)
  # ─────────────────────────────────────────────────────────────

  Escenario: Texto redimensionable hasta 200%
    Dado que el usuario redimensiona texto al 200%
    Cuando se visualiza
    Entonces:
      | Criterio                   | Estado    |
      | Texto visible              | ✅         |
      | Sin scroll horizontal      | ✅         |
      | Funcionalidad preservada   | ✅         |
      | Layout se adapta           | ✅         |

  Escenario: Espaciado de texto
    Dado que se ajusta espaciado de texto
    Cuando se aplica
    Entonces:
      | Propiedad                   | Valor permitido      |
      | Interlineado               | 1.5x                 |
      | Espacio entre párrafos     | 2x                   |
      | Espacio entre letras       | 0.12x                |
      | Espacio entre palabras     | 0.16x                |

  # ─────────────────────────────────────────────────────────────
  # 1.7 CONTENIDO MULTIMEDIA (1.2 - 1.4)
  # ─────────────────────────────────────────────────────────────

  Escenario: Audio sin video
    Dado que se reproduce solo audio (futuro)
    Cuando se escucha
    Entonces:
      | Criterio                   | Estado    |
      | Transcripción disponible   | ✅         |
      | Control de reproducción    | ✅         |

  Escenario: Contenido que parpadea
    Dado que se evalúa contenido animado
    Cuando se verifica
    Entonces:
      | Criterio                   | Estado    |
      | No parpadea más de 3 veces/seg | ✅  |
      | Sin flash por debajo umbral | ✅        |
      | Animaciones se pueden pausar | ✅       |
      | Prefers-reduced-motion     | Respetado |

  # ─────────────────────────────────────────────────────────────
  # 1.8 ORIENTACIÓN (1.3.4)
  # ─────────────────────────────────────────────────────────────

  Escenario: Orientación de pantalla
    Dado que se gira el dispositivo
    Cuando se cambia orientación
    Entonces:
      | Criterio                   | Estado    |
      | Contenido visible          | ✅         |
      | Funcionalidad preservada   | ✅         |
      | No se bloquea orientación  | ✅         |
  