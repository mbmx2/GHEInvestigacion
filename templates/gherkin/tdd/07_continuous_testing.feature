# language: es
# TDD - Continuous Testing
@status:proposed
@type:acceptance
@domain:general
# TESTING CONTINUO: Tests que se ejecutan durante todo el ciclo de vida
Característica: Continuous Testing (TDD - GHE)
  Como equipo del proyecto GHE
  Quiero que los tests se ejecuten continuamente
  Para mantener calidad constante

  # ─────────────────────────────────────────────────────────────
  # 1. TESTING EN CADA FASE
  # ─────────────────────────────────────────────────────────────

  Escenario: Testing durante desarrollo
    Dado que el desarrollador escribe código
    Cuando usa TDD
    Entonces:
      | Fase                        | Qué se testea      |
      | Diseño                      | Tests de aceptación|
      | Implementación              | Tests unitarios    |
      | Integración                 | Tests de integración|
      | Refactor                    | Todos los tests    |
      | Code review                 | Cobertura          |
      | Deploy                      | E2E tests          |
      | Producción                  | Monitoreo          |

  Escenario: Testing durante mantenimiento
    Dado que se corrige un bug
    Cuando se usa TDD
    Entonces:
      | Paso                       |
      | 1. Escribir test que reproduzca el bug (RED) |
      | 2. Verificar que el test falla |
      | 3. Corregir el bug (GREEN)  |
      | 4. Verificar que el test pasa |
      | 5. Refactor si es necesario |
      | 6. Agregar tests de regresión |
    Y el bug queda documentado como test

  # ─────────────────────────────────────────────────────────────
  # 2. TESTING EN PRODUCCIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Monitoreo de calidad en producción
    Dado que el sistema está en producción
    Cuando se monitorea calidad
    Entonces:
      | Métrica                    | Umbral             |
      | Tiempo de respuesta API    | <200ms             |
      | Tasa de errores            | <0.1%              |
      | Uptime                     | >99%               |
      | Errores de seguridad       | 0                  |
      | Satisfacción del usuario   | >85%               |

  Escenario: Alertas de regresión
    Dado que se detecta regresión en producción
    Cuando se activa alerta
    Entonces:
      | Acción                     |
      | Notificar al equipo        |
      | Crear ticket automático    |
      | Priorizar fix              |
      | Implementar fix con TDD    |
      | Agregar test de regresión  |

  # ─────────────────────────────────────────────────────────────
  # 3. MÉTRICAS DE TESTING CONTINUO
  # ─────────────────────────────────────────────────────────────

  Escenario: Métricas de testing continuo
    Dado que se miden métricas de testing continuo
    Cuando se genera dashboard
    Entonces se incluyen:
      | Métrica                    | Objetivo           |
      | Frecuencia de ejecución    | En cada commit     |
      | Tiempo de feedback         | <5 minutos         |
      | Tasa de éxito del build    | >95%               |
      | Tiempo de fix de tests     | <1 hora            |
      | Cobertura de regresión     | 100%               |
      | Bugs en producción         | <1/mes             |

  Escenario: Retrospectiva de testing
    Dado que se realiza retrospectiva de testing
    Cuando se evalúa effectiveness
    Entonces se discuten:
      | Pregunta                   |
      | ¿Tests detectaron bugs reales? |
      | ¿Tests falsos positivos?   |
      | ¿Tests son rápidos?        |
      | ¿Tests son mantenibles?    |
      | ¿Qué mejorar?              |
  