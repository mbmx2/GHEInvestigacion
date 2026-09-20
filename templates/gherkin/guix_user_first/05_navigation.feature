# language: es
# GUIX User First - Navegación
@status:proposed
@type:acceptance
@domain:general
# NAVEGACIÓN: Encontrar lo que necesitas rápidamente
Característica: Navegación (GUIX User First - GHE)
  Como usuario de GHE
  Quiero navegar de forma intuitiva
  Para encontrar información y realizar tareas rápidamente

  # ─────────────────────────────────────────────────────────────
  # 1. ESTRUCTURA DE NAVEGACIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Menú principal
    Dado que se diseña menú principal
    Cuando el usuario abre la app
    Entonces ve:
      | Elemento                    | Sección             |
      | Inicio                      | Dashboard           |
      | Pacientes                   | Lista de pacientes  |
      | Consultas                   | Consultas de hoy    |
      | Farmacia                    | Inventario/Dispensar|
      | Reportes                    | Estadísticas        |
      | Configuración               | Sistema             |
    Y el menú es siempre visible (sidebar o bottom nav)

  Escenario: Breadcrumb
    Dado que se muestra breadcrumb
    Cuando el usuario navega profundo
    Entonces:
      | Ruta                        | Breadcrumb          |
      | Inicio > Pacientes > María García > Consulta | Visible |
    Y puede volver a cualquier nivel

  Escenario: Navegación rápida (Quick Actions)
    Dado que se implementan acciones rápidas
    Cuando el usuario presiona botón flotante
    Entonces ve:
      | Acción                      |
      | Nueva consulta              |
      | Buscar paciente             |
      | Nueva prescripción          |
      | Registrar signos vitales    |

  # ─────────────────────────────────────────────────────────────
  # 2. BÚSQUEDA
  # ─────────────────────────────────────────────────────────────

  Escenario: Búsqueda global
    Dado que se implementa búsqueda global
    Cuando el usuario busca
    Entonces:
      | Criterio                   | Comportamiento      |
      | Búsqueda por nombre        | Autocompletado, resultados en tiempo real |
      | Búsqueda por CURP          | Búsqueda exacta     |
      | Búsqueda por diagnóstico   | Filtra por CIE-10   |
      | Búsqueda por medicamento   | Filtra por vademécum |
      | Búsqueda por fecha         | Rango de fechas     |
    Y los resultados aparecen en <500ms

  Escenario: Búsqueda en tableta
    Dado que se usa búsqueda en tableta
    Cuando se toca barra de búsqueda
    Entonces:
      | Elemento                    | Comportamiento      |
      | Teclado virtual             | Se abre automáticamente |
      | Sugerencias                | Aparecen debajo     |
      | Resultados                 | Lista scrollable    |
      | Cerrar búsqueda            | X o tap fuera       |

  # ─────────────────────────────────────────────────────────────
  # 3. ATAJOS DE TECLADO
  # ─────────────────────────────────────────────────────────────

  Escenario: Atajos de teclado (desktop)
    Dado que se implementan atajos de teclado
    Cuando se usa en desktop
    Entonces:
      | Atajo                       | Acción              |
      | Ctrl + K                   | Buscar paciente     |
      | Ctrl + N                   | Nueva consulta      |
      | Ctrl + S                   | Guardar             |
      | Ctrl + P                   | Prescribir          |
      | Esc                        | Cerrar modal        |
      | Tab                        | Siguiente campo     |
      | Shift + Tab                | Campo anterior      |

  # ─────────────────────────────────────────────────────────────
  # 4. NAVEGACIÓN EN MOBILE
  # ─────────────────────────────────────────────────────────────

  Escenario: Bottom navigation bar
    Dado que se implementa bottom nav en mobile
    Cuando se usa en celular
    Entonces:
      | Tab                         | Icono               |
      | Inicio                      | 🏠                  |
      | Pacientes                   | 👥                  |
      | Consultas                   | 📋                  |
      | Farmacia                    | 💊                  |
      | Más                         | ⋯                  |
    Y las tabs son accesibles con el pulgar

  Escenario: Gestos en mobile
    Dado que se implementan gestos
    Cuando se usa en celular
    Entonces:
      | Gestos                      | Acción              |
      | Swipe left                  | Eliminar/Archivar   |
      | Swipe right                 | Completar           |
      | Pull down                   | Refrescar           |
      | Tap                         | Seleccionar         |
      | Long press                  | Menú contextual     |
  