# language: es
# Hexagonal Architecture - Driven Adapters (Output)
@status:proposed
@type:acceptance
@domain:general
# ADAPTADORES DE SALIDA: Implementan los puertos de salida del dominio
Característica: Driven Adapters - Adaptadores de Salida (Arquitectura Hexagonal)
  Como desarrollador del proyecto GHE
  Quiero adaptadores de salida que implementen puertos del dominio
  Para que la infraestructura sea intercambiable sin afectar el dominio

  # ─────────────────────────────────────────────────────────────
  # 1. ADAPTADOR DE BASE DE DATOS (SQLite)
  # ─────────────────────────────────────────────────────────────

  Escenario: Adaptador SQLite para PatientRepository
    Dado que se implementa SQLitePatientRepository
    Cuando se ejecuta una operación
    Entonces el adaptador:
      | Paso                       |
      | 1. Recibe llamada del dominio |
      | 2. Convierte entity a SQL  |
      | 3. Ejecuta query en SQLite |
      | 4. Convierte resultado a entity |
      | 5. Retorna entity al dominio |
    Y el adaptador implementa PatientRepository (puerto)
    Y el dominio NO sabe que usa SQLite

  Escenario: Operaciones del adaptador SQLite
    Dado que se documentan operaciones del adaptador
    Cuando se lista
    Entonces:
      | Operación                  | SQL/Implementación    |
      | save(patient)              | INSERT INTO patients  |
      | findById(id)               | SELECT * WHERE id=?  |
      | findByCURP(curp)           | SELECT * WHERE curp=?|
      | findAll()                  | SELECT * FROM patients|
      | update(patient)            | UPDATE patients SET   |
      | delete(id)                 | DELETE FROM patients  |
    Y cada operación maneja traducción entity↔SQL

  # ─────────────────────────────────────────────────────────────
  # 2. ADAPTADOR DE EVENTOS (Event Publisher)
  # ─────────────────────────────────────────────────────────────

  Escenario: Adaptador de eventos en memoria
    Dado que se implementa InMemoryEventPublisher
    Cuando se publica un evento
    Entonces el adaptador:
      | Paso                       |
      | 1. Recibe evento del dominio |
      | 2. Registra en cola en memoria |
      | 3. Notifica a listeners suscritos |
    Y se usa en tests para verificar eventos publicados

  Escenario: Adaptador de eventos persistente
    Dado que se implementa PersistentEventPublisher
    Cuando se publica un evento
    Entonces el adaptador:
      | Paso                       |
      | 1. Recibe evento del dominio |
      | 2. Serializa a JSON        |
      | 3. Guarda en event_store table |
      | 4. Publica a suscriptores  |
    Y los eventos se persisten para auditoría

  # ─────────────────────────────────────────────────────────────
  # 3. ADAPTADOR DE NOTIFICACIONES
  # ─────────────────────────────────────────────────────────────

  Escenario: Adaptador de notificación WhatsApp
    Dado que se implementa WhatsAppNotificationAdapter
    Cuando se envía alerta urgente
    Entonces el adaptador:
      | Paso                       |
      | 1. Recibe notificación del dominio |
      | 2. Formatea mensaje        |
      | 3. Envía vía WhatsApp API  |
      | 4. Registra envío          |
    Y el adaptador implementa NotificationService (puerto)

  Escenario: Adaptador de notificación mock (tests)
    Dado que se implementa MockNotificationAdapter
    Cuando se envía notificación en tests
    Entonces el adaptador:
      | Paso                       |
      | 1. Registra notificación en lista |
      | 2. No envía realmente      |
      | 3. Permite verificar en tests |
    Y se usa en tests para verificar que notificaciones se envían

  # ─────────────────────────────────────────────────────────────
  # 4. ADAPTADOR DE AUDITORÍA
  # ─────────────────────────────────────────────────────────────

  Escenario: Adaptador de auditoría
    Dado que se implementa FileAuditLogger
    Cuando se registra acción de auditoría
    Entonces el adaptador:
      | Paso                       |
      | 1. Recibe evento de auditoría |
      | 2. Calcula hash SHA-256    |
      | 3. Escribe en archivo de log |
      | 4. Registra timestamp      |
    Y cada registro es inalterable (hash)
    Y se puede verificar integridad del log

  # ─────────────────────────────────────────────────────────────
  # 5. VERIFICACIÓN DE ADAPTADORES DE SALIDA
  # ─────────────────────────────────────────────────────────────

  Escenario: Verificación de intercambiabilidad
    Dado que se verifican adaptadores de salida
    Cuando se cambia adaptador
    Entonces:
      | Adaptador actual           | Adaptador alternativo | Dominio afectado? |
      | SQLitePatientRepository    | InMemoryPatientRepository | No (mismo puerto) |
      | FileAuditLogger            | InMemoryAuditLogger   | No |
      | WhatsAppNotificationAdapter| MockNotificationAdapter | No |
    Y el cambio de adaptador NO requiere modificar dominio
  