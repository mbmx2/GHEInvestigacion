# language: es
# SWEBOK KA-08: Software Engineering Process
@status:proposed
# @requirement:PRACTICE-GHE-001
@type:acceptance
@domain:general
# ÁREA DE CONOCIMIENTO: Proceso de Ingeniería de Software
Característica: Proceso de Ingeniería de Software (SWEBOK KA-08)
  Como responsable de proceso del proyecto GHE
  Quiero definir y mejorar procesos de desarrollo
  Para garantizar calidad y previsibilidad

  # ─────────────────────────────────────────────────────────────
  # 1. DEFINICIÓN DE PROCESO
  # ─────────────────────────────────────────────────────────────

  Escenario: Definición del ciclo de vida de software
    Dado que se define el proceso de desarrollo de GHE
    Cuando se documenta
    Entonces se establece:
      | Fase                       | Actividades         | Salida     |
      | Inception                  | Requisitos, alcance | SRS, Business Case |
      | Elaboración               | Arquitectura, diseño| ADR, Arch. Document |
      | Construcción               | Código, tests       | Código funcional |
      | Transición                 | Despliegue, validación| Sistema en producción |
      | Mantenimiento              | Corrección, mejora  | Nuevas versiones |
    Y cada fase tiene criterios de salida
    Y cada fase tiene review de calidad

  Escenario: Proceso de desarrollo iterativo
    Dado que se usa desarrollo iterativo
    Cuando se ejecuta un sprint
    Entonces el ciclo incluye:
      | Actividad                  | Duración            |
      | Planificación del sprint   | 2 horas (día 1)     |
      | Desarrollo                 | 8 días              |
      | Daily standups             | 15 min/día          |
      | Code review continuo       | Continuo            |
      | Testing continuo           | Continuo            |
      | Demo al stakeholder        | 2 horas (día 10)    |
      | Retrospectiva              | 1 hora (día 10)     |

  # ─────────────────────────────────────────────────────────────
  # 2. GESTIÓN DE PROCESO
  # ─────────────────────────────────────────────────────────────

  Escenario: Métricas de proceso
    Dado que se miden métricas de proceso
    Cuando se genera dashboard
    Entonces se incluyen:
      | Métrica                    | Valor objetivo      |
      | Velocity del equipo        | 20-30 story points  |
      | Lead time                  | <2 semanas          |
      | Cycle time                 | <3 días             |
      | Tasa de defectos           | <5 por sprint       |
      | Cobertura de tests         | >85%                |
      | Cumplimiento de estimación| ±20%                |

  # ─────────────────────────────────────────────────────────────
  # 3. MEJORA DE PROCESO
  # ─────────────────────────────────────────────────────────────

  Escenario: Retrospectiva de sprint
    Dado que se realiza retrospectiva
    Cuando el equipo evalúa
    Entonces se documenta:
      | Sección                   |
      | ¿Qué salió bien?          |
      | ¿Qué salió mal?           |
      | ¿Qué podemos mejorar?     |
      | Acciones concretas         |
      | Responsables               |
      | Fecha de cumplimiento      |

  Escenario: Mejora continua (Kaizen)
    Dado que se identifican áreas de mejora
    Cuando se implementan
    Entonces se priorizan:
      | Mejora                     | Impacto | Esfuerzo | Prioridad |
      | Automatizar deploy         | Alto    | Bajo     | Alta      |
      | Mejorar tests E2E          | Medio   | Medio    | Media     |
      | Documentar API             | Medio   | Bajo     | Media     |
      | Reducir deuda técnica      | Alto    | Alto     | Alta      |
    