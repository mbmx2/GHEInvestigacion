# language: es
# Clojure Spec Driven Design - Database Schemas
# ESQUEMAS DE BD: Usar specs para definir esquemas de base de datos
Característica: Esquemas de BD con clojure.spec (Spec Driven Design - GHE)
  Como desarrollador de base de datos del proyecto GHE
  Quiero que los specs definan los esquemas de BD
  Para que la validación y persistencia sean consistentes

  # ─────────────────────────────────────────────────────────────
  # 1. SPECS → SQL SCHEMA
  # ─────────────────────────────────────────────────────────────

  Escenario: Generar DDL desde specs
    Dado que se define spec de Patient
    Cuando se genera esquema SQL
    Entonces:
      | Spec                        | Columna SQL          |
      | :patient/id (uuid?)         | id TEXT PRIMARY KEY   |
      | :patient/curp (string)      | curp TEXT UNIQUE      |
      | :patient/first-name (string)| first_name TEXT NOT NULL |
      | :patient/birth-date (inst?) | birth_date DATE NOT NULL |
      | :patient/gender (enum)      | gender TEXT CHECK     |
      | :patient/phone (nilable)    | phone TEXT            |

  Escenario: Spec de tabla patients
    Dado que se verifica esquema de tabla patients
    Cuando se compara con spec
    Entonces:
      | Columna SQL                 | Spec correspondiente |
      | id TEXT PRIMARY KEY         | uuid?                |
      | curp TEXT UNIQUE            | :ghe.spec/curp       |
      | first_name TEXT NOT NULL    | :ghe.spec/string     |
      | last_name TEXT NOT NULL     | :ghe.spec/string     |
      | birth_date DATE NOT NULL    | inst?                |
      | gender TEXT NOT NULL        | #{:M :F :O}          |
      | blood_type TEXT             | #{"A+" ... "O-"}     |
      | phone TEXT                  | (s/nilable :ghe.spec/phone) |
      | address TEXT                | (s/nilable :ghe.spec/string) |
      | created_at TIMESTAMP        | inst?                |
      | updated_at TIMESTAMP        | inst?                |
      | sync_status TEXT            | #{:pending :synced :conflict} |

  # ─────────────────────────────────────────────────────────────
  # 2. SPECS → MIGRACIONES
  # ─────────────────────────────────────────────────────────────

  Escenario: Generar migración desde spec
    Dado que se agrega campo al spec
    Cuando se genera migración
    Entonces:
      | Spec modificado             | Migración SQL        |
      | :patient/email (nuevo)      | ALTER TABLE patients ADD COLUMN email TEXT |
      | :patient/email (requerido)  | UPDATE patients SET email='unknown' WHERE email IS NULL; ALTER TABLE ... |

  # ─────────────────────────────────────────────────────────────
  # 3. VALIDACIÓN POST-PERSISTENCIA
  # ─────────────────────────────────────────────────────────────

  Escenario: Validar datos al leer de BD
    Dado que se leen datos de SQLite
    Cuando se deserializan
    Entonces:
      | Paso                       |
      | 1. Leer fila de SQLite     |
      | 2. Convertir a map         |
      | 3. Validar contra spec     |
      | 4. Si válido → retornar    |
      | 5. Si inválido → log error, retornar nil |

  Escenario: Detección de corrupción de datos
    Dado que hay datos corruptos en BD
    Cuando se leen y validan
    Entonces:
      | Dato corrupto              | Acción               |
      | CURP con formato incorrecto| Log + marcar         |
      | Fecha inválida             | Log + marcar         |
      | Gender fuera de enum       | Log + marcar         |
    Y no se pierden datos (se mantienen con warning)

  # ─────────────────────────────────────────────────────────────
  # 4. ÍNDICES Y RENDIMIENTO
  # ─────────────────────────────────────────────────────────────

  Escenario: Generar índices desde specs
    Dado que se analizan specs de búsqueda
    Cuando se generan índices
    Entonces:
      | Campo consultado frecuentemente | Índice generado |
      | :patient/curp                | UNIQUE INDEX     |
      | :patient/last-name           | INDEX            |
      | :consultation/patient-id     | INDEX            |
      | :consultation/date           | INDEX            |
      | :prescription/patient-id     | INDEX            |
  