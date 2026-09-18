# language: es
# Offline-First - Data Integrity During Sync
# INTEGRIDAD DE DATOS: Garantizar que los datos no se corrompen durante sync
Característica: Integridad de Datos durante Sincronización (Offline-First - GHE)
  Como desarrollador del proyecto GHE
  Quiero garantizar integridad de datos durante sincronización
  Para que nunca se pierdan o corrompan datos de pacientes

  # ─────────────────────────────────────────────────────────────
  # 1. HASH DE INTEGRIDAD
  # ─────────────────────────────────────────────────────────────

  Escenario: Hash de integridad por registro
    Dado que se calcula hash por cada registro
    Cuando se guarda localmente
    Entonces:
      | Campo                      | Cálculo              |
      | data_hash                  | SHA-256 del contenido|
      | created_at                 | Timestamp local      |
      | updated_at                 | Timestamp de última modificación |
      | version                    | Número de versión    |
    Y el hash se recalcula en cada modificación

  Escenario: Verificación de integridad post-sync
    Dado que se completa sincronización
    Cuando se verifica integridad
    Entonces:
      | Verificación               | Estado    |
      | Hash local = Hash cloud    | ✅         |
      | Sin registros corruptos    | ✅         |
      | Sin datos faltantes        | ✅         |
      | Sin duplicados            | ✅         |

  # ─────────────────────────────────────────────────────────────
  # 2. VERSIONING
  # ─────────────────────────────────────────────────────────────

  Escenario: Versionado de entidades
    Dado que se versionan entidades
    Cuando se modifica una entidad
    Entonces:
      | Campo                      | Comportamiento       |
      | version                    | Incrementa en +1     |
      | updated_at                 | Se actualiza         |
      | data_hash                  | Se recalcula         |
    Y la versión se usa para detectar conflictos

  Escenario: Detección de conflictos por versión
    Dado que se detectan conflictos por versión
    Cuando local y cloud tienen versiones diferentes
    Entonces:
      | Versión local | Versión cloud | Resultado        |
      | 5             | 5             | Sin conflicto    |
      | 5             | 6             | Cloud gana       |
      | 6             | 5             | Local gana       |
      | 5             | 5 (diferentes datos) | Conflicto |

  # ─────────────────────────────────────────────────────────────
  # 3. BACKUP ANTES DE SYNC
  # ─────────────────────────────────────────────────────────────

  Escenario: Backup antes de sync grande
    Dado que se va a sincronizar gran volumen de datos
    Cuando se inicia sync
    Entonces:
      | Paso                       |
      | 1. Crear backup de SQLite  |
      | 2. Verificar integridad del backup |
      | 3. Ejecutar sync           |
      | 4. Verificar integridad post-sync |
      | 5. Si sync falla → restaurar backup |

  Escenario: Backup periódico automático
    Dado que se configuran backups automáticos
    Cuando se ejecuta
    Entonces:
      | Configuración              | Valor                |
      | Frecuencia                 | Diaria (2:00 AM)     |
      | Retención                  | 30 días              |
      | Ubicación                  | /var/backups/ghe     |
      | Cifrado                    | AES-256              |
      | Verificación de integridad | SHA-256              |

  # ─────────────────────────────────────────────────────────────
  # 4. REESTRABLECIMIENTO
  # ─────────────────────────────────────────────────────────────

  Escenario: Restauración desde backup
    Dado que se necesita restaurar base de datos
    Cuando se ejecuta restauración
    Entonces:
      | Paso                       |
      | 1. Detener servicio        |
      | 2. Verificar backup        |
      | 3. Restaurar SQLite        |
      | 4. Verificar integridad    |
      | 5. Reiniciar servicio      |
      | 6. Re-sincronizar cambios pendientes |

  Escenario: Recuperación post-falla de sync
    Dado que falla sincronización y hay datos corruptos
    Cuando se detecta
    Entonces:
      | Paso                       |
      | 1. Detectar corrupción     |
      | 2. Restaurar último backup |
      | 3. Re-sincronizar desde último timestamp |
      | 4. Resolver conflictos     |
      | 5. Verificar integridad    |
      | 6. Notificar al admin      |
  