# language: es
# SWEBOK KA-07: Software Engineering Management
@status:proposed
@type:acceptance
@domain:general
# ÁREA DE CONOCIMIENTO: Gestión de Ingeniería de Software
Característica: Gestión de Ingeniería de Software (SWEBOK KA-07)
  Como líder técnico del proyecto GHE
  Quiero gestionar el proyecto de forma efectiva
  Para entregar valor dentro de alcance, tiempo y presupuesto

  # ─────────────────────────────────────────────────────────────
  # 1. GESTIÓN DE PROYECTO
  # ─────────────────────────────────────────────────────────────

  Escenario: Planificación del proyecto
    Dado que se inicia el proyecto GHE
    Cuando se planifica
    Entonces se documenta:
      | Elemento                   |
      | Alcance del proyecto       |
      | Restricciones (offline, normativas) |
      | Supuestos                 |
      | Hitos y entregables       |
      | Presupuesto               |
      | Equipo y roles             |
      | Riesgos identificados     |
    Y se crea roadmap de alto nivel

  Escenario: Gestión de alcance
    Dado que se define alcance del proyecto
    Cuando se gestiona
    Entonces se documenta:
      | Dentro del alcance         | Fuera del alcance    |
      | Expediente clínico         | Facturación CFDI     |
      | Farmacia                   | Laboratorio externo  |
      | Receta electrónica         | Telemedicina         |
      | Reportes SUIVE             | App móvil nativa     |
      | Offline-first              | Multi-tenant         |
    Y todo cambio de alcance pasa por control de cambios

  Escenario: Estimación de esfuerzo
    Dado que se estiman tareas del proyecto
    Cuando se usa estimación
    Entonces se aplica:
      | Técnica                    | Aplicación           |
      | Planning Poker            | Historias de usuario |
      | T-Shirt Sizing            | Features grandes     |
      | Velocity                  | Sprints futuros      |
      | Three-Point Estimation    | Tareas complejas     |

  # ─────────────────────────────────────────────────────────────
  # 2. GESTIÓN DE PLANIFICACIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Planificación de sprints
    Dado que se planifica sprint de 2 semanas
    Cuando se seleccionan historias
    Entonces se considera:
      | Criterio                   |
      | Historias aprobadas por prioridad |
      | Capacidad del equipo       |
      | Dependencias identificadas |
      | Riesgos del sprint         |
      | Buffer para imprevistos (20%) |

  Escenario: Seguimiento de progreso
    Dado que el sprint está en curso
    Cuando se hace daily standup
    Entonces se reporta:
      | Pregunta                   |
      | ¿Qué hice ayer?           |
      | ¿Qué haré hoy?            |
      | ¿Hay impedimentos?        |
    Y se actualiza tablero Kanban
  