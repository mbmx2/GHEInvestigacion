# language: es
# Offline-First - Local Storage (SQLite)
# ALMACENAMIENTO LOCAL: SQLite como fuente de verdad
Característica: Almacenamiento Local SQLite (Offline-First - GHE)
  Como desarrollador del proyecto GHE
  Quiero que SQLite sea la fuente de verdad local
  Para garantizar disponibilidad y rendimiento offline

  # ─────────────────────────────────────────────────────────────
  # 1. CONFIGURACIÓN DE SQLITE
  # ─────────────────────────────────────────────────────────────

  Escenario: Configuración óptima de SQLite
    Dado que se configura SQLite para offline-first
    Cuando se establecen parámetros
    Entonces:
      | Parámetro                  | Valor                |
      | Journal mode               | WAL (Write-Ahead Logging) |
      | Synchronous                | NORMAL               |
      | Cache size                 | -64000 (64MB)        |
      | Busy timeout               | 5000ms               |
      | Foreign keys               | Habilitadas          |
      | Encryption                 | SQLCipher AES-256    |
      | Temp store                 | MEMORY               |
      | Mmap size                  | 256MB                |
    Y WAL permite lecturas concurrentes durante escritura

  Escenario: Rendimiento de SQLite
    Dado que se mide rendimiento de SQLite
    Cuando se ejecutan operaciones
    Entonces:
      | Operación                  | Tiempo objetivo      |
      | Insertar paciente          | <50ms                |
      | Buscar paciente por CURP   | <100ms               |
      | Buscar por nombre (LIKE)   | <200ms               |
      | Crear consulta             | <50ms                |
      | Obtener historial paciente | <150ms               |
      | Generar reporte básico     | <1s                  |
      | Full-text search           | <300ms               |

  # ─────────────────────────────────────────────────────────────
  # 2. FULL-TEXT SEARCH (FTS5)
  # ─────────────────────────────────────────────────────────────

  Escenario: Búsqueda de texto completo
    Dado que se implementa FTS5 en SQLite
    Cuando se busca paciente
    Entonces:
      | Búsqueda                   | Resultado            |
      | "María García"             | Encuentra coincidencias exactas |
      | "María"                    | Encuentra todas las Marías |
      | "García López"             | Búsqueda compuesta   |
      | "GALM85"                   | Búsqueda parcial CURP |
    Y FTS5 es más rápido que LIKE para búsquedas de texto

  Escenario: Índices para búsquedas frecuentes
    Dado que se crean índices para optimizar
    Cuando se verifica
    Entonces:
      | Índice                     | Columna              |
      | idx_patients_curp          | patients.curp        |
      | idx_patients_name          | patients.last_name, first_name |
      | idx_consultations_patient  | consultations.patient_id |
      | idx_consultations_date     | consultations.consultation_date |
      | idx_prescriptions_patient  | prescriptions.patient_id |
      | idx_audit_log_timestamp    | audit_log.timestamp  |

  # ─────────────────────────────────────────────────────────────
  # 3. INTEGRIDAD DE DATOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Integridad referencial
    Dado que SQLite maneja foreign keys
    Cuando se verifica
    Entonces:
      | Relación                   | Integridad           |
      | Patient → Consultation     | Foreign key          |
      | Consultation → VitalSigns  | Foreign key          |
      | Consultation → Prescription| Foreign key          |
      | Pregnancy → PrenatalVisit  | Foreign key          |
    Y se preveniría eliminación de registros padre con hijos

  Escenario: Transacciones ACID
    Dado que se ejecuta operación compleja
    Cuando se usa transacción
    Entonces:
      | Criterio ACID              | Estado    |
      | Atomicity                  | ✅ Todo o nada |
      | Consistency                | ✅ Reglas de negocio |
      | Isolation                  | ✅ WAL mode    |
      | Durability                 | ✅ Escritura en disco |

  # ─────────────────────────────────────────────────────────────
  # 4. GESTIÓN DE ESPACIO
  # ─────────────────────────────────────────────────────────────

  Escenario: Gestión de tamaño de base de datos
    Dado que se monitorea tamaño de BD
    Cuando se evalúa
    Entonces:
      | Métrica                    | Objetivo             |
      | Tamaño por 10K pacientes   | <500MB               |
      | Tamaño por 100K consultas  | <200MB               |
      | Límite de crecimiento      | <2GB                 |
      | Vaciamiento de temp tables | Automático           |
      | VACUUM periódico           | Mensual              |
  