# language: es
# GUIX User First - Responsive Design
@status:proposed
# @requirement:PRACTICE-GHE-001
@type:acceptance
@domain:general
# DISEÑO RESPONSIVO: Que funcione en cualquier tamaño de pantalla
Característica: Responsive Design (GUIX User First - GHE)
  Como desarrollador frontend del proyecto GHE
  Quiero que la interfaz se adapte a cualquier dispositivo
  Para que funcione en computadoras, tablets y celulares

  # ─────────────────────────────────────────────────────────────
  # 1. BREAKPOINTS
  # ─────────────────────────────────────────────────────────────

  Escenario: Breakpoints definidos
    Dado que se definen breakpoints
    Cuando se verifica diseño
    Entonces:
      | Breakpoint                 | Rango              | Uso principal |
      | Mobile                     | <640px             | Celular       |
      | Tablet                     | 640-1024px         | Tablet        |
      | Desktop                    | >1024px            | Computadora   |
      | Large Desktop              | >1280px            | Monitor grande|
    Y cada breakpoint tiene layout optimizado

  # ─────────────────────────────────────────────────────────────
  # 2. LAYOUT RESPONSIVE
  # ─────────────────────────────────────────────────────────────

  Escenario: Layout en desktop
    Dado que se visualiza en desktop (>1024px)
    Cuando se carga pantalla
    Entonces:
      | Elemento                    | Comportamiento      |
      | Sidebar                     | Visible permanente  |
      | Contenido principal         | Expandido           |
      | Tablas                      | Todas las columnas  |
      | Formularios                 | 2 columnas          |
      | Dashboard                   | Grid de 3-4 columnas|

  Escenario: Layout en tablet
    Dado que se visualiza en tablet (640-1024px)
    Cuando se carga pantalla
    Entonces:
      | Elemento                    | Comportamiento      |
      | Sidebar                     | Colapsable (hamburger) |
      | Contenido principal         | Semi-expandido      |
      | Tablas                      | Columnas esenciales |
      | Formularios                 | 1-2 columnas        |
      | Dashboard                   | Grid de 2 columnas  |

  Escenario: Layout en mobile
    Dado que se visualiza en mobile (<640px)
    Cuando se carga pantalla
    Entonces:
      | Elemento                    | Comportamiento      |
      | Sidebar                     | Oculto (menú hamburguesa) |
      | Contenido principal         | Full width          |
      | Tablas                      | Cards apiladas      |
      | Formularios                 | 1 columna           |
      | Dashboard                   | Stack vertical      |

  # ─────────────────────────────────────────────────────────────
  # 3. COMPONENTES RESPONSIVE
  # ─────────────────────────────────────────────────────────────

  Escenario: Tabla responsive
    Dado que se muestra tabla de pacientes
    Cuando la pantalla es pequeña
    Entonces:
      | Desktop                     | Mobile              |
      | Tabla completa              | Cards apiladas      |
      | Todas las columnas visibles | Columnas esenciales |
      | Paginación                  | Scroll infinito     |
      | Búsqueda                    | Barra fija arriba   |

  Escenario: Formulario responsive
    Dado que se muestra formulario de registro
    Cuando la pantalla es pequeña
    Entonces:
      | Elemento                    | Comportamiento      |
      | Campos                      | Full width          |
      | Botones                     | Full width          |
      | Secciones                   | Stack vertical      |
      | DatePicker                  | Modal en mobile     |
      | Select                      | Full width          |

  # ─────────────────────────────────────────────────────────────
  # 4. TOUCH
  # ─────────────────────────────────────────────────────────────

  Escenario: Optimización para touch
    Dado que se usa en dispositivo touch
    Cuando se interactúa
    Entonces:
      | Criterio                   | Estado    |
      | Tamaño mínimo de toque     | 44x44px   |
      | Espacio entre elementos    | 8px mínimo|
      | Gestos intuitivos          | Swipe, tap |
      | Hover no es necesario      | ✅         |
      | Menú contextual            | Long press|

  Escenario: Virtual keyboard
    Dado que se abre teclado virtual
    Cuando se ingresa texto
    Entonces:
      | Criterio                   | Estado    |
      | Input visible durante input| ✅         |
      | Label siempre visible      | ✅ (float) |
      | Scroll automático          | ✅         |
      | Tipo de teclado adecuado   | ✅ (numérico para números) |
  