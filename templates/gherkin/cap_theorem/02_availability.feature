# language: es
# CAP Theorem - Disponibilidad
@status:proposed
@type:acceptance
@domain:general
# DISPONIBILIDAD: Cada petición recibe una respuesta (éxito o error)
Característica: Disponibilidad (CAP Theorem - GHE)
  Como arquitecto del proyecto GHE
  Quiero que el sistema esté disponible 100% del tiempo
  Para que la atención médica nunca se detenga

  # ─────────────────────────────────────────────────────────────
  # 1. DISPONIBILIDAD OFFLINE
  # ─────────────────────────────────────────────────────────────

  Escenario: 100% disponibilidad sin internet
    Dado que el sistema NO tiene conexión a internet
    Cuando el médico realiza cualquier operación
    Entonces:
      | Operación                  | Disponible? |
      | Buscar paciente            | ✅ Sí       |
      | Registrar paciente nuevo   | ✅ Sí       |
      | Crear consulta             | ✅ Sí       |
      | Registrar signos vitales   | ✅ Sí       |
      | Crear prescripción         | ✅ Sí       |
      | Sur medicamento            | ✅ Sí       |
      | Generar receta             | ✅ Sí       |
      | Buscar en historial        | ✅ Sí       |
      | Generar reporte local      | ✅ Sí       |
      | Acceder a expediente       | ✅ Sí       |
    Y todas las operaciones toman <500ms

  Escenario: Disponibilidad durante sync
    Dado que el sistema está sincronizando datos
    Cuando el médico realiza operación
    Entonces:
      | Verificación               | Estado    |
      | UI permanece responsiva    | ✅         |
      | Operaciones no se bloquean | ✅         |
      | Sync es background         | ✅         |
      | Sin impacto en rendimiento | ✅         |

  # ─────────────────────────────────────────────────────────────
  # 2. DISPONIBILIDAD EN CONECTIVIDAD LIMITADA
  # ─────────────────────────────────────────────────────────────

  Escenario: Disponibilidad en 2G/EDGE
    Dado que hay conectividad 2G (50 Kbps)
    Cuando se sincroniza
    Entonces:
      | Estrategia                 | Implementación       |
      | Compresión de datos        | gzip (reducción 70%) |
      | Envío por lotes pequeños   | 10 ops por lote      |
      | Priorización               | Emergencias primero  |
      | Timeout extendido          | 60 segundos          |
      | Reintentos con backoff     | Exponencial          |

  Escenario: Disponibilidad con conectividad intermitente
    Dado que la conectividad se pierde y restaura frecuentemente
    Cuando se opera
    Entonces:
      | Verificación               | Estado    |
      | Operaciones locales siempre funcionan | ✅ |
      | Sync se reanuda automáticamente | ✅   |
      | No se pierden datos        | ✅         |
      | No hay duplicados          | ✅         |

  # ─────────────────────────────────────────────────────────────
  # 3. DISPONIBILIDAD EN EMERGENCIAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Disponibilidad en emergencia obstétrica
    Dado que hay emergencia obstétrica
    Cuando el médico necesita acceder al sistema
    Entonces:
      | Verificación               | Estado    |
      | Tiempo de respuesta <200ms | ✅         |
      | Búsqueda de paciente instantánea | ✅   |
      | Signos vitales accesibles  | ✅         |
      | Prescripción disponible    | ✅         |
      | Referencia generable       | ✅         |
      | Sin dependencia de internet| ✅         |

  Escenario: Disponibilidad de drug information
    Dado que el médico necesita información de medicamento
    Cuando busca en vademécum
    Entonces:
      | Verificación               | Estado    |
      | Vademécum local disponible | ✅         |
      | Búsqueda <200ms            | ✅         |
      | Información completa       | ✅         |
      | Interacciones verificadas  | ✅         |

  # ─────────────────────────────────────────────────────────────
  # 4. MÉTRICAS DE DISPONIBILIDAD
  # ─────────────────────────────────────────────────────────────

  Escenario: Medición de disponibilidad
    Dado que se mide disponibilidad del sistema
    Cuando se calcula
    Entonces:
      | Métrica                    | Objetivo     |
      | Uptime local               | 100%         |
      | Uptime total (con sync)    | >99.9%       |
      | Tiempo medio entre fallos  | >30 días     |
      | Tiempo medio de recuperación | <5 min     |
      | Operaciones fallidas       | 0%           |
  