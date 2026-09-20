# language: es
# Accesibilidad WCAG 2.1 - Operabilidad
@status:proposed
@type:acceptance
@domain:accessibility
# PRINCIPIO 2: Los componentes de la interfaz deben ser operables
Característica: WCAG 2.1 - Operabilidad (Accesibilidad - GHE)
  Como responsable de accesibilidad del proyecto GHE
  Quiero que toda la interfaz sea operable por teclado y dispositivos de asistencia
  Para que todos los usuarios puedan realizar tareas sin barreras

  # ─────────────────────────────────────────────────────────────
  # 2.1 ACCESIBILIDAD POR TECLADO (2.1.1 - 2.1.2)
  # ─────────────────────────────────────────────────────────────

  Escenario: Navegación completa por teclado
    Dado que se navega solo con teclado
    Cuando se usa Tab/Shift+Tab
    Entonces:
      | Criterio                   | Estado    |
      | Todos los elementos interactivos son alcanzables | ✅ |
      | No hay traps de teclado    | ✅         |
      | Focus visible siempre      | ✅         |
      | Orden lógico de tabulación | ✅         |

  Escenario: Atajos de teclado
    Dado que se usan atajos de teclado
    Cuando se ejecutan
    Entonces:
      | Atajo                       | Acción              |
      | Tab                         | Siguiente elemento  |
      | Shift+Tab                   | Elemento anterior   |
      | Enter                       | Activar botón/link  |
      | Espacio                     | Activar checkbox    |
      | Escape                      | Cerrar modal        |
      | Flechas                     | Navegar menú/lista  |
      | Ctrl+K                      | Buscar              |
      | Ctrl+S                      | Guardar             |
      | Ctrl+N                      | Nueva consulta      |

  Escenario: Focus management en modales
    Dado que se abre un modal
    Cuando se activa
    Entonces:
      | Criterio                   | Estado    |
      | Focus se mueve al modal    | ✅         |
      | Focus no escapa del modal  | ✅         |
      | Escape cierra el modal     | ✅         |
      | Al cerrar, focus vuelve al trigger | ✅ |

  Escenario: Skip links
    Dado que se carga una página
    Cuando se presiona Tab inicialmente
    Entonces aparece skip link:
      | Skip link                   | Destino              |
      | "Saltar al contenido principal" | <main>           |
      | "Saltar a navegación"       | <nav>                |

  # ─────────────────────────────────────────────────────────────
  # 2.2 TIEMPO SUFICIENTE (2.2.1 - 2.2.2)
  # ─────────────────────────────────────────────────────────────

  Escenario: Timeout de sesión
    Dado que hay timeout de sesión
    Cuando se acerca la expiración
    Entonces:
      | Criterio                   | Estado    |
      | Warning antes de expirar   | ✅ (5 min) |
      | Puede extender sesión      | ✅         |
      | Tiempo mínimo 20 seg       | ✅ (5 min) |
      | Puede guardar datos        | ✅ (auto-save) |

  Escenario: Pausar, detener, ocultar
    Dado que hay contenido con movimiento
    Cuando se muestra
    Entonces:
      | Criterio                   | Estado    |
      | Puede pausar               | ✅         |
      | Puede detener              | ✅         |
      | Puede ocultar              | ✅         |
      | Duración <5 seg            | ✅         |

  # ─────────────────────────────────────────────────────────────
  # 2.3 ATAJOS DE TECLADO (2.1.4)
  # ─────────────────────────────────────────────────────────────

  Escenario: Atajos de una sola tecla
    Dado que se definen atajos de una tecla
    Cuando se presiona
    Entonces:
      | Atajo                       | Acción              |
      | Ctrl+K                      | Buscar              |
      | Ctrl+S                      | Guardar             |
      | Ctrl+N                      | Nueva consulta      |
      | Escape                      | Cerrar modal        |
    Y el usuario puede desactivar atajos
    Y no hay atajos que interfieran con screen readers

  # ─────────────────────────────────────────────────────────────
  # 2.4 NAVEGACIÓN (2.4.1 - 2.4.7)
  # ─────────────────────────────────────────────────────────────

  Escenario: Skip blocks repetitivos
    Dado que se navega por la página
    Cuando se encuentra contenido repetitivo
    Entonces:
      | Criterio                   | Estado    |
      | Skip link disponible       | ✅         |
      | Menú principal accesible   | ✅         |
      | Breadcrumb visible         | ✅         |

  Escenario: Títulos y etiquetas descriptivos
    Dado que se evalúa descripción de elementos
    Cuando se inspecciona
    Entonces:
      | Elemento                    | Descripción          |
      | <title> de cada página     | Descriptivo y único  |
      | <h1> por página            | 1 por página         |
      | Labels de formularios      | Descriptivos         |
      | Botones                    | Acción que realizan  |
      | Links                      | Destino claro        |

  Escenario: Focus visible
    Dado que se navega por teclado
    Cuando se tabula entre elementos
    Entonces:
      | Criterio                   | Estado    |
      | Focus ring visible         | ✅ (2px, color alto contraste) |
      | Focus no se oculta         | ✅         |
      | Focus en todos los interactivos | ✅    |

  Escenario: Propósito de link en contexto
    Dado que se evalúan links
    Cuando se inspeccionan
    Entonces:
      | Link                        | Propósito claro?    |
      | "Leer más"                  | ✅ (aria-label)     |
      | "Click aquí"               | ❌ (rechazado)      |
      | "Ver expediente de María"   | ✅ (descriptivo)    |

  # ─────────────────────────────────────────────────────────────
  # 2.5 INPUT MODO (2.5.1 - 2.5.3)
  # ─────────────────────────────────────────────────────────────

  Escenario: Gestos simples
    Dado que se usan gestos en touch
    Cuando se interactúa
    Entonces:
      | Gesto                       | Alternativa teclado |
      | Tap                         | Enter               |
      | Swipe                       | Flechas             |
      | Long press                  | Menú contextual     |
      | Pinch                       | +/-                 |

  Escenario: Acciones con un solo dedo
    Dado que se evalúa accesibilidad touch
    Cuando se verifica
    Entonces:
      | Criterio                   | Estado    |
      | Acciones con un solo dedo  | ✅         |
      | Sin gestos complejos       | ✅         |
      | Tamaño mínimo de toque 44x44 | ✅       |

  # ─────────────────────────────────────────────────────────────
  # 2.6 NAVEGACIÓN EN TABLETA (2.5)
  # ─────────────────────────────────────────────────────────────

  Escenario: Navegación por tableta
    Dado que se usa en tableta
    Cuando se interactúa
    Entonces:
      | Criterio                   | Estado    |
      | Touch targets 44x44px      | ✅         |
      | Espacio entre targets 8px  | ✅         |
      | Gestos intuitivos          | ✅         |
      | Menú hamburguesa accesible | ✅         |
      | Bottom nav en mobile       | ✅         |
  