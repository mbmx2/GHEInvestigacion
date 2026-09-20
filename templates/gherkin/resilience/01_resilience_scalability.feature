# language: es
# Resiliencia y Escalabilidad
@status:proposed
@type:acceptance
@domain:general
Característica: Resiliencia del Sistema (GHE)
  Como arquitecto del proyecto GHE
  Quiero que el sistema tolere fallos y escale correctamente
  Para que la atención médica nunca se detenga

  # ─────────────────────────────────────────────────────────────
  # 1. DEGRADACIÓN CONTROLADA
  # ─────────────────────────────────────────────────────────────

  Escenario: Degradación cuando cloud no disponible
    Dado que el servicio cloud no responde
    Cuando el sistema detecta fallo
    Entonces:
      | Capa                      | Comportamiento |
      | UI                        | Funciona 100% local |
      | Domain                    | Sin cambios         |
      | Local DB                  | Sin cambios         |
      | Sync                      | Cola pendiente      |
      | Notificaciones            | Diferidas           |

  Escenario: Degradación cuando BD local falla
    Dado que SQLite falla
    Cuando se detecta
    Entonces:
      | Acción                    |
      | Mostrar error claro       |
      | No perder datos en cola   |
      | Intentar recuperación     |
      | Si no posible → alertar admin |

  # ─────────────────────────────────────────────────────────────
  # 2. SATURACIÓN DE COLA
  # ─────────────────────────────────────────────────────────────

  Escenario: Cola de sync se llena
    Dado que la cola de sync tiene >1000 operaciones pendientes
    Cuando se evalúa
    Entonces:
      | Acción                    |
      | Priorizar operaciones críticas |
      | Comprimir datos viejos    |
      | Alertar al administrador  |
      | No bloquear operaciones locales |

  # ─────────────────────────────────────────────────────────────
  # 3. IDEMPOTENCIA
  # ─────────────────────────────────────────────────────────────

  Escenario: Reintento idempotente
    Dado que una operación falla y se reintenta
    Cuando se reenvía
    Entonces:
      | Verificación              |
      | No se crea duplicado      |
      | Se actualiza si ya existe |
      | Se mantiene consistencia  |

  # ─────────────────────────────────────────────────────────────
  # 4. RECUPERACIÓN TRAS REINICIO
  # ─────────────────────────────────────────────────────────────

  Escenario: Recuperación post-reinicio
    Dado que el sistema se reinicia
    Cuando se recupera
    Entonces:
      | Verificación              |
      | BD SQLite intacta         |
      | Cola de sync preservada   |
      | Sesiones expiradas        |
      | Backup verificado         |
      | Sync se reanuda           |

  # ─────────────────────────────────────────────────────────────
  # 5. CRECIMIENTO DE BD
  # ─────────────────────────────────────────────────────────────

  Escenario: Crecimiento de base de datos
    Dado que la BD crece con el tiempo
    Cuando se monitorea
    Entonces:
      | Umbral                    | Acción |
      | <1GB                      | Normal |
      | 1-2GB                     | Monitorear |
      | >2GB                      | VACUUM + archivar |
      | >5GB                      | Alertar + migrar datos antiguos |

  # ─────────────────────────────────────────────────────────────
  # 6. BACKPRESSURE
  # ─────────────────────────────────────────────────────────────

  Escenario: Backpressure en sync
    Dado que el cloud no puede recibir datos tan rápido como se generan
    Cuando hay backpressure
    Entonces:
      | Acción                    |
      | Reducir frecuencia de sync|
      | Enviar solo datos críticos|
      | Buffer local              |
      | Reanudar cuando mejore    |
