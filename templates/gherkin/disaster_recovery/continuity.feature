# language: es
# Disaster Recovery y Business Continuity
@status:proposed
@type:acceptance
@domain:general
Característica: Recuperación ante Desastres y Continuidad del Negocio (GHE)
  Como responsable de operaciones del proyecto GHE
  Quiero planificar recuperación ante desastres
  Para que la atención médica nunca se detenga

  # ─────────────────────────────────────────────────────────────
  # 1. BACKUP
  # ─────────────────────────────────────────────────────────────

  Escenario: Backup automático diario
    Dado que se configuran backups automáticos
    Cuando se ejecuta backup
    Entonces:
      | Configuración              | Valor                |
      | Frecuencia                 | Diaria (2:00 AM)     |
      | Tipo                       | Completo + incremental|
      | Cifrado                    | AES-256              |
      | Ubicación local            | /var/backups/ghe     |
      | Retención                  | 30 días              |
      | Verificación de integridad | SHA-256              |

  Escenario: Backup antes de actualizaciones
    Dado que se va a actualizar el sistema
    Cuando se ejecuta backup
    Entonces:
      | Paso                       |
      | 1. Crear backup completo   |
      | 2. Verificar integridad    |
      | 3. Ejecutar actualización  |
      | 4. Verificar post-update   |
      | 5. Si falla → restaurar    |

  # ─────────────────────────────────────────────────────────────
  # 2. RESTAURACIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Restauración desde backup
    Dado que se necesita restaurar base de datos
    Cuando se ejecuta restauración
    Entonces:
      | Paso                       | Tiempo objetivo |
      | Detener servicio           | <1 minuto       |
      | Verificar backup           | <1 minuto       |
      | Restaurar SQLite           | <5 minutos      |
      | Verificar integridad       | <2 minutos      |
      | Reiniciar servicio         | <1 minuto       |
      | **Total**                  | **<10 minutos** |

  Escenario: Restauración selectiva
    Dado que se necesita restaurar solo un paciente
    Cuando se ejecuta
    Entonces:
      | Criterio                   | Estado    |
      | Selección por paciente ID  | ✅         |
      | Selección por rango fecha  | ✅         |
      | Sin afectar otros datos    | ✅         |

  # ─────────────────────────────────────────────────────────────
  # 3. CONTINUIDAD DEL NEGOCIO
  # ─────────────────────────────────────────────────────────────

  Escenario: Plan de continuidad ante fallo de hardware
    Dado que falla la computadora principal
    Cuando se activa plan
    Entonces:
      | Paso                       |
      | 1. Activar computadora de respaldo |
      | 2. Restaurar último backup |
      | 3. Continuar operación     |
      | 4. Investigar causa        |
      | 5. Reparar/reemplazar      |

  Escenario: Plan de continuidad ante fallo de red
    Dado que falla la red completamente
    Cuando se activa plan
    Entonces:
      | Verificación               | Estado    |
      | Sistema 100% funcional    | ✅         |
      | Sync pendiente para cuando haya red | ✅ |
      | Sin pérdida de datos      | ✅         |

  Escenario: Plan de continuidad ante desastre natural
    Dado que ocurre desastre natural (sismo, inundación)
    Cuando se evalúa situación
    Entonces:
      | Prioridad                  | Acción              |
      | 1. Seguridad del personal | Evacuar             |
      | 2. Datos de pacientes     | Recuperar backup USB|
      | 3. Continuidad            | Operar en sitio alterno |
      | 4. Restauración           | Cuando sea seguro   |

  # ─────────────────────────────────────────────────────────────
  # 4. RPO Y RTO
  # ─────────────────────────────────────────────────────────────

  Escenario: Definición de RPO y RTO
    Dado que se definen métricas de recuperación
    Cuando se establecen
    Entonces:
      | Métrica                    | Objetivo     |
      | RPO (Recovery Point Objective) | <24 horas (backup diario) |
      | RTO (Recovery Time Objective) | <10 minutos   |
      | MTD (Maximum Tolerable Downtime) | <60 minutos |
  