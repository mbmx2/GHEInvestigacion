# language: es
# Offline-First - Queue Management
# GESTIÓN DE COLA: Administrar operaciones pendientes de sync
Característica: Gestión de Cola de Sincronización (Offline-First - GHE)
  Como desarrollador del proyecto GHE
  Quiero gestionar la cola de sincronización de forma eficiente
  Para priorizar y procesar operaciones pendientes

  # ─────────────────────────────────────────────────────────────
  # 1. ESTRUCTURA DE LA COLA
  # ─────────────────────────────────────────────────────────────

  Escenario: Cola de sincronización
    Dado que se gestiona cola de sync
    Cuando se inspecciona
    Entonces la cola tiene:
      | Campo                      | Descripción          |
      | id                         | UUID de la operación |
      | entity_type                | Tipo de entidad      |
      | entity_id                  | ID de la entidad     |
      | operation                  | CREATE/UPDATE/DELETE |
      | payload                    | Datos serializados   |
      | priority                   | CRITICAL/HIGH/NORMAL/LOW |
      | created_at                 | Timestamp local      |
      | sync_status                | PENDING/SYNCED/FAILED |
      | sync_attempts              | Número de intentos   |
      | last_sync_attempt          | Último intento       |

  Escenario: Priorización de operaciones
    Dado que se priorizan operaciones en la cola
    Cuando se procesa
    Entonces:
      | Prioridad                  | Tipo de operación    |
      | CRITICAL                   | Emergencias médicas  |
      | HIGH                       | Prescripciones       |
      | NORMAL                     | Consultas, signos vitales |
      | LOW                        | Reportes, estadísticas |

  # ─────────────────────────────────────────────────────────────
  # 2. PROCESAMIENTO DE LA COLA
  # �────────────────────────────────────────────────────────────

  Escenario: Procesamiento secuencial
    Dado que se procesa la cola
    Cuando hay conexión
    Entonces:
      | Paso                       |
      | 1. Leer operaciones PENDING ordenadas por prioridad |
      | 2. Enviar operación al cloud |
      | 3. Si éxito → marcar SYNCED |
      | 4. Si fallo → marcar FAILED, incrementar intentos |
      | 5. Si intentos > 6 → marcar FAILED_PERMANENT |
      | 6. Continuar con siguiente operación |

  Escenario: Procesamiento por lotes (batch)
    Dado que se usa procesamiento por lotes
    Cuando hay múltiples operaciones pendientes
    Entonces:
      | Configuración              | Valor                |
      | Tamaño máximo de lote      | 50 operaciones       |
      | Timeout por lote           | 30 segundos          |
      | Compresión del lote        | gzip                 |
      | Formato                    | JSON array           |

  # ─────────────────────────────────────────────────────────────
  # 3. MONITOREO DE LA COLA
  # ─────────────────────────────────────────────────────────────

  Escenario: Dashboard de cola de sync
    Dado que se consulta estado de la cola
    Cuando se muestra dashboard
    Entonces:
      | Métrica                    | Valor actual        |
      | Operaciones pendientes     | 23                  |
      | Operaciones synced hoy     | 156                 |
      | Operaciones fallidas       | 2                   |
      | Última sync                | Hace 5 minutos      |
      | Próxima sync programada    | En 25 minutos       |
      | Tamaño de la cola          | 45KB                |

  Escenario: Alertas de cola
    Dado que se monitorean condiciones de alerta
    Cuando se detecta problema
    Entonces:
      | Condición                  | Alerta               |
      | Cola > 100 operaciones    | ⚠️ Cola creciendo   |
      | Operaciones fallidas > 10 | 🔴 Sync fallando    |
      | Sin sync por > 1 hora     | ⚠️ Conectividad     |
      | Cola > 1MB                | ⚠️ Espacio de BD    |

  # ─────────────────────────────────────────────────────────────
  # 4. LIMPIEZA DE LA COLA
  # ─────────────────────────────────────────────────────────────

  Escenario: Limpieza de operaciones sincronizadas
    Dado que se limpian operaciones ya sincronizadas
    Cuando se ejecuta limpieza
    Entonces:
      | Regla                      |
      | Eliminar operaciones SYNCED > 7 días |
      | Mantener FAILED para reintento      |
      | Mantener FAILED_PERMANENT para auditoría |
      | Compactar tabla periódicamente      |
  