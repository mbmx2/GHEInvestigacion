# language: es
# Event-Driven Architecture
@status:proposed
@type:acceptance
@domain:general
Característica: Arquitectura Basada en Eventos (GHE)
  Como arquitecto del proyecto GHE
  Quiero usar eventos de dominio para desacoplar componentes
  Para que el sistema sea extensible y mantenible

  # ─────────────────────────────────────────────────────────────
  # 1. EVENTOS DE DOMINIO
  # ─────────────────────────────────────────────────────────────

  Escenario: Definición de eventos
    Dado que se definen eventos de dominio
    Cuando se registran
    Entonces:
      | Evento                      | Trigger              |
      | PatientRegistered           | Nuevo paciente       |
      | PatientUpdated              | Actualización datos  |
      | ConsultationStarted         | Inicio de consulta   |
      | ConsultationCompleted       | Fin de consulta      |
      | VitalSignsRecorded          | Registro signos      |
      | PrescriptionCreated         | Nueva prescripción   |
      | PrescriptionDispensed       | Medicamento surtido  |
      | RiskLevelChanged            | Cambio de riesgo     |
      | SyncCompleted               | Sincronización fin   |
      | SyncConflictDetected        | Conflicto detectado  |

  Escenario: Estructura de evento
    Dado que se define estructura de evento
    Cuando se crea evento
    Entonces tiene:
      | Campo                      | Tipo                 |
      | event_id                   | UUID                 |
      | event_type                 | String               |
      | timestamp                  | ISO 8601             |
      | aggregate_id               | UUID                 |
      | aggregate_type             | String               |
      | payload                    | JSON                 |
      | metadata                   | Map                  |

  # ─────────────────────────────────────────────────────────────
  # 2. PRODUCTORES Y CONSUMIDORES
  # ─────────────────────────────────────────────────────────────

  Escenario: Productores de eventos
    Dado que se definen productores
    Cuando se emite evento
    Entonces:
      | Productor                   | Eventos emitidos     |
      | Patient Domain             | PatientRegistered    |
      | Consultation Domain        | ConsultationStarted  |
      | Prescription Domain        | PrescriptionCreated  |
      | Sync Engine                | SyncCompleted        |

  Escenario: Consumidores de eventos
    Dado que se definen consumidores
    Cuando se recibe evento
    Entonces:
      | Evento                     | Consumidores         |
      | PatientRegistered          | AuditLogger, SyncQueue |
      | PrescriptionCreated        | PharmacyService, AuditLogger |
      | RiskLevelChanged           | NotificationService, AuditLogger |
      | SyncConflictDetected       | ConflictResolver, NotificationService |

  # ─────────────────────────────────────────────────────────────
  # 3. EVENT STORE
  # ─────────────────────────────────────────────────────────────

  Escenario: Persistencia de eventos
    Dado que se guardan eventos en event store
    Cuando se persiste
    Entonces:
      | Criterio                   | Estado    |
      | Eventos inmutables         | ✅         |
      | Orden temporal preservado  | ✅         |
      | Hash de integridad         | ✅         |
      | Retención configurable     | ✅         |

  Escenario: Replay de eventos
    Dado que se necesita reconstruir estado
    Cuando se hace replay
    Entonces:
      | Criterio                   | Estado    |
      | Se pueden reejecutar eventos | ✅       |
      | Estado reconstruido correctamente | ✅  |
      | Idempotencia garantizada  | ✅         |
