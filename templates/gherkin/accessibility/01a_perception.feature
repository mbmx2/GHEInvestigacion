# language: es
Característica: Percepción - WCAG 2.1
  Como responsable de accesibilidad del proyecto GHE
  Quiero que toda la información sea perceptible
  Para que personas con discapacidad visual usen el sistema

  Contexto:
    Dado que el sistema está activo
    Y que el usuario tiene rol de accesibilidad

  Escenario: Textos alternativos
    Dado que la interfaz contiene imágenes
    Cuando se inspecta
    Entonces cada imagen tiene alt text descriptivo

  Escenario: Contraste de colores
    Dado que se evalúa contraste
    Cuando se mide
    Entonces:
      | Elemento                    | Ratio mínimo |
      | Texto normal (14px)        | 4.5:1       |
      | Texto grande (18px+)       | 3:1         |
      | Componentes interactivos   | 3:1         |
      | Estados de error           | Icono + texto (no solo color) |

  Escenario: Texto redimensionable
    Dado que el usuario redimensiona al 200%
    Cuando se visualiza
    Entonces texto visible, sin scroll horizontal, función preservada

  Escenario: Contenido多媒体
    Dado que se evalúa contenido multimedia
    Entonces:
      | Criterio                   | Estado  |
      | Sin parpadeo >3 veces/seg | ✅       |
      | Animaciones pausables     | ✅       |
      | Respeta prefers-reduced-motion | ✅  |

  Escenario: Orientación de pantalla
    Dado que se gira el dispositivo
    Entonces contenido visible y función preservada
