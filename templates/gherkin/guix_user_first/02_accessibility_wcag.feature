# language: es
# GUIX User First - Accesibilidad (WCAG)
# ACCESIBILIDAD: Que TODOS puedan usar el sistema
Característica: Accesibilidad WCAG (GUIX User First - GHE)
  Como responsable de UX del proyecto GHE
  Quiero que el sistema sea accesible para todos
  Para cumplir WCAG 2.1 nivel AA

  # ─────────────────────────────────────────────────────────────
  # 1. PERCEPCIÓN (WCAG 1)
  # ─────────────────────────────────────────────────────────────

  Escenario: Alternativas de texto
    Dado que se implementa contenido no textual
    Cuando se verifica
    Entonces:
      | Elemento                    | Accesibilidad        |
      | Imágenes                   | Alt text descriptivo |
      | Iconos                     | Label + aria-label   |
      | Gráficas                   | Descripción textual  |
      | Botones                    | Texto visible        |
      | Logo                       | Alt "GHE - Sistema Médico" |

  Escenario: Colores y contraste
    Dado que se verifican colores
    Cuando se evalúa contraste
    Entonces:
      | Elemento                    | Contraste mínimo     |
      | Texto normal               | 4.5:1 (WCAG AA)     |
      | Texto grande               | 3:1 (WCAG AA)       |
      | Componentes interactivos   | 3:1 contra fondo    |
      | Estados de error           | No solo color (icono + texto) |
      | Estados de éxito           | No solo color (icono + texto) |

  Escenario: Adaptable
    Dado que se verifica adaptabilidad
    Cuando se usa en diferentes dispositivos
    Entonces:
      | Criterio                   | Estado    |
      | Se puede usar solo con teclado | ✅    |
      | Información no depende solo de color | ✅ |
      | Orden de lectura lógico    | ✅         |
      | Instrucciones no dependen solo de forma/ubicación | ✅ |

  # ─────────────────────────────────────────────────────────────
  # 2. OPERABILIDAD (WCAG 2)
  # ─────────────────────────────────────────────────────────────

  Escenario: Navegación por teclado
    Dado que se usa solo teclado
    Cuando se navega
    Entonces:
      | Criterio                   | Estado    |
      | Tab key navega entre elementos | ✅    |
      | Enter activa botones       | ✅         |
      | Escape cierra modales      | ✅         |
      | Focus visible en todos los elementos | ✅ |
      | Skip links para contenido principal | ✅ |
      | No hay traps de teclado    | ✅         |

  Escenario: Tiempo suficiente
    Dado que se ajustan tiempos
    Cuando hay timeout
    Entonces:
      | Criterio                   | Estado    |
      | Sesión >30 minutos         | ✅         |
      | Warning antes de expirar   | ✅ (5 min antes) |
      | Puede extender sesión      | ✅         |

  # ─────────────────────────────────────────────────────────────
  # 3. COMPrensIBLE (WCAG 3)
  # ─────────────────────────────────────────────────────────────

  Escenario: Legible
    Dado que se verifica legibilidad
    Cuando se evalúa contenido
    Entonces:
      | Criterio                   | Estado    |
      | Idioma del contenido       | ✅ (español) |
      | Texto se puede redimensionar | ✅ (200%) |
      | Espaciado entre líneas     | ✅ (1.5x) |
      | Ancho de párrafo           | ✅ (<80 chars) |
      | Sin texto justificado      | ✅         |

  Escenario: Predecible
    Dado que se verifica predecibilidad
    Cuando se usa la interfaz
    Entonces:
      | Criterio                   | Estado    |
      | Comportamiento consistente | ✅         |
      | Navegación consistente     | ✅         |
      | Identificación de componente | ✅       |
      | Cambios de contexto solo con aviso | ✅ |

  # ─────────────────────────────────────────────────────────────
  # 4. ROBUSTEZ (WCAG 4)
  # ─────────────────────────────────────────────────────────────

  Escenario: Compatibilidad con tecnologías de asistencia
    Dado que se verifica compatibilidad
    Cuando se usa con screen reader
    Entonces:
      | Tecnología                 | Compatible           |
      | NVDA                       | ✅                    |
      | JAWS                       | ✅ (verificar)        |
      | VoiceOver (Mac)            | ✅                    |
      | TalkBack (Android)         | ✅                    |

  Escenario: Validación HTML
    Dado que se valida HTML
    Cuando se ejecuta validación
    Entonces:
      | Criterio                   | Estado    |
      | HTML válido                | ✅         |
      | ARIA roles correctos       | ✅         |
      | ARIA labels presentes      | ✅         |
      | Landmarks definidos        | ✅         |
      | Heading hierarchy          | ✅ (h1→h2→h3) |
  