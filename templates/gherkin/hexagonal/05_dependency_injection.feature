# language: es
# Hexagonal Architecture - Dependency Injection / Composition Root
# RAÍZ DE COMPOSICIÓN: Ensambla adaptadores con puertos
Característica: Dependency Injection - Raíz de Composición (Arquitectura Hexagonal)
  Como desarrollador del proyecto GHE
  Quiero una raíz de composición que ensamble componentes
  Para que las dependencias se configuren en un solo lugar

  # ─────────────────────────────────────────────────────────────
  # 1. RAÍZ DE COMPOSICIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Definición de la raíz de composición
    Dado que se define la raíz de composición (composition root)
    Cuando se ensambla el sistema
    Entonces se configura:
      | Puerto                      | Adaptador (producción) | Adaptador (test) |
      | PatientRepository           | SQLitePatientRepository | InMemoryPatientRepository |
      | ConsultationRepository      | SQLiteConsultationRepository | InMemoryConsultationRepository |
      | PrescriptionRepository      | SQLitePrescriptionRepository | InMemoryPrescriptionRepository |
      | EventPublisher              | PersistentEventPublisher | InMemoryEventPublisher |
      | AuditLogger                 | FileAuditLogger         | InMemoryAuditLogger |
      | NotificationService         | WhatsAppNotificationAdapter | MockNotificationAdapter |
    Y la raíz de composición es el ÚNICO lugar que conoce adaptadores concretos
    Y el dominio NUNCA referencia adaptadores concretos

  Escenario: Configuración por entorno
    Dado que se configuran diferentes entornos
    Cuando se selecciona entorno
    Entonces:
      | Entorno                     | Adaptadores usados      |
      | Producción                 | SQLite, WhatsApp, File  |
      | Desarrollo                 | SQLite, Mock, Console   |
      | Testing                    | InMemory, InMemory, InMemory |
      | Piloto (maternidad)        | SQLite, WhatsApp, File  |
    Y la raíz de composición carga configuración según entorno

  # ─────────────────────────────────────────────────────────────
  # 2. ENSAMBLAJE DE COMPONENTES
  # ─────────────────────────────────────────────────────────────

  Escenario: Ensamblaje de bounded contexts
    Dado que se ensamblan los bounded contexts
    Cuando se construye el sistema
    Entonces:
      | Bounded Context            | Use Cases             | Repositorios          |
      | Patient                    | PatientService        | PatientRepository     |
      | Clinical                   | ConsultationService   | ConsultationRepository|
      | Pharmacy                   | PharmacyService       | InventoryRepository   |
      | Prescription               | PrescriptionService   | PrescriptionRepository|
    Y cada bounded context usa sus propios puertos
    Y la comunicación entre contextos es por eventos

  Escenario: Inyección de dependencias en use cases
    Dado que se inyectan dependencias en use cases
    Cuando se crea un use case
    Entonces:
      | Use Case                   | Dependencias inyectadas |
      | PatientService             | PatientRepository, EventPublisher |
      | ConsultationService        | ConsultationRepository, PatientRepository |
      | PrescriptionService        | PrescriptionRepository, CDS, AuditLogger |
      | PharmacyService            | InventoryRepository, PrescriptionRepository |
    Y las dependencias se inyectan vía constructor o mapa de configuración

  # ─────────────────────────────────────────────────────────────
  # 3. VERIFICACIÓN DE COMPOSICIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Verificación de que dominio no conoce adaptadores
    Dado que se verifican imports del dominio
    Cuando se analiza código del dominio
    Entonces:
      | Import detectado           | Permitido en dominio? |
      | ghe.patient.domain         | ✅ Sí                 |
      | ghe.clinical.domain        | ✅ Sí                 |
      | ghe.infrastructure.sqlite  | ❌ No                 |
      | ghe.infrastructure.http    | ❌ No                 |
      | ghe.adapters.rest          | ❌ No                 |
    Y NO hay imports de infraestructura en el dominio

  Escenario: Verificación de testing con adaptadores mock
    Dado que se testea un use case
    Cuando se usan adaptadores mock
    Entonces:
      | Use Case testado           | Mock usado             | Verificación |
      | PatientService             | InMemoryPatientRepository | Datos correctos |
      | ConsultationService        | InMemoryConsultationRepository | CRUD OK |
      | PrescriptionService        | InMemoryPrescriptionRepository | Validación OK |
    Y los tests NO usan base de datos real
    Y los tests son rápidos (<100ms)

  # ─────────────────────────────────────────────────────────────
  # 4. CAMBIO DE ADAPTADORES
  # ─────────────────────────────────────────────────────────────

  Escenario: Cambio de SQLite a PostgreSQL
    Dado que se necesita migrar de SQLite a PostgreSQL
    Cuando se cambia adaptador
    Entonces se modifica:
      | Archivo modificado         | Qué cambia             |
      | composition_root.clj       | PostgreSQLAdapter en vez de SQLite |
      | postgresql_adapter.clj     | Nuevo adaptador        |
    Y NO se modifica:
      | Archivo                    | Por qué no cambia      |
      | Patient Domain             | No conoce persistencia |
      | PatientRepository (interface)| Misma interface      |
      | REST Adapter               | No conoce base datos   |
      | Tests                      | Usan InMemory          |

  Escenario: Agregar nuevo adaptador de salida
    Dado que se agrega adaptador para HL7 FHIR
    Cuando se implementa
    Entonces:
      | Paso                       |
      | 1. Crear FHIRAdapter implementando FHIRPort |
      | 2. Agregar a composition root |
      | 3. Configurar en entorno    |
      | 4. Tests con mock          |
    Y NO se modifica ningún código existente en dominio
  