# language: es
# Offline-First - Sync Engine
# MOTOR DE SINCRONIZACIÓN: Sincronizar datos locales con cloud
Característica: Sync Engine (Offline-First - GHE)
  Como desarrollador del proyecto GHE
  Quiero un motor de sincronización robusto
  Para sincronizar datos locales con cloud de forma confiable

  # ─────────────────────────────────────────────────────────────
  # 1. OUTBOX PATTERN
  # ─────────────────────────────────────────────────────────────

  Escenario: Patrón Outbox para sincronización
    Dado que se usa patrón Outbox
    Cuando se ejecuta operación local
    Entonces:
      | Paso                       |
      | 1. Operación se guarda en SQLite |
      | 2. Operación se registra en sync_outbox |
      | 3. sync_outbox tiene: entity_type, entity_id, operation, timestamp, payload |
      | 4. Cuando haya internet, sync process lee outbox |
      | 5. Ejecuta operación en cloud |
      | 6. Marca como sincronizada |
      | 7. Limpia outbox periódicamente |

  Escenario: Estructura del outbox
    Dado que se verifica estructura de sync_outbox
    Cuando se inspecciona tabla
    Entonces:
      | Campo                      | Tipo                 |
      | id                         | TEXT PRIMARY KEY     |
      | entity_type                | TEXT NOT NULL        |
      | entity_id                  | TEXT NOT NULL        |
      | operation                  | TEXT (CREATE/UPDATE/DELETE) |
      | payload                    | TEXT (JSON)          |
      | created_at                 | TIMESTAMP            |
      | sync_status                | TEXT (pending/synced/failed) |
      | sync_attempts              | INTEGER DEFAULT 0    |
      | last_sync_attempt          | TIMESTAMP            |
      | error_message              | TEXT                 |

  # ─────────────────────────────────────────────────────────────
  # 2. DELTA SYNC
  # ─────────────────────────────────────────────────────────────

  Escenario: Sincronización de deltas
    Dado que se implementa delta sync
    Cuando se sincroniza
    Entonces:
      | Estrategia                 | Implementación       |
      | Solo cambios               | Sync desde last_sync_timestamp |
      | Compresión                 | gzip antes de enviar |
      | Batch operations           | Enviar múltiples ops en 1 request |
      | Prioridad                  | Urgentes primero (emergencias) |
    Y se minimiza ancho de banda

  Escenario: Sincronización de ida y vuelta
    Dado que se sincroniza en ambas direcciones
    Cuando hay datos en cloud y local
    Entonces:
      | Dirección                  | Qué sincroniza       |
      | Local → Cloud              | Outbox entries       |
      | Cloud → Local              | Nuevos/actualizados desde last_sync |
      | Bidireccional              | Ambos en cada sync   |

  # ─────────────────────────────────────────────────────────────
  # 3. CONFLICTOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Detección de conflictos
    Dado que se detectan conflictos de sincronización
    Cuando la misma entidad cambia en ambos lados
    Entonces se detecta:
      | Criterio                   | Ejemplo              |
      | Mismo entity_id            | patient-123          |
      | Diferentes timestamps      | local: 10:00, cloud: 10:05 |
      | Diferentes valores         | local: "María", cloud: "María García" |
      | Último en modificar gana  | Por defecto          |

  Escenario: Resolución de conflictos
    Dado que hay conflicto de sincronización
    Cuando se resuelve
    Entonces:
      | Estrategia                 | Cuándo usarla        |
      | Last-write-wins            | Por defecto          |
      | Merge automático           | Campos diferentes    |
      | Resolución manual          | Datos críticos       |
      | No resolver (registrar)    | Para auditoría       |

  # ─────────────────────────────────────────────────────────────
  # 4. RETRY Y RESILIENCIA
  # ─────────────────────────────────────────────────────────────

  Escenario: Retry con backoff exponencial
    Dado que falla una sincronización
    Cuando se reintenta
    Entonces:
      | Intento                    | Espera               |
      | 1                          | 0 segundos           |
      | 2                          | 5 segundos           |
      | 3                          | 25 segundos          |
      | 4                          | 2 minutos            |
      | 5                          | 10 minutos           |
      | 6+                         | 30 minutos (máximo)  |

  Escenario: Límite de intentos
    Dado que se alcanza límite de intentos
    Cuando falla después de 6 intentos
    Entonces:
      | Acción                     |
      | Marcar operación como "failed" |
      | Notificar al administrador |
      | Mantener en outbox para reintento manual |
      | No perder datos            |
  