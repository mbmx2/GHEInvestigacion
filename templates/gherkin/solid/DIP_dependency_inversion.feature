# language: es
# SOLID - D: Dependency Inversion Principle
@status:proposed
# @requirement:PRACTICE-GHE-001
@type:acceptance
@domain:general
# PRINCIPIO: Los módulos de alto nivel no deben depender de módulos de bajo nivel. Ambos deben depender de abstracciones.
Característica: Principio de Inversión de Dependencias (SOLID - D)
  Como desarrollador del proyecto GHE
  Quiero que los módulos dependan de abstracciones, no de implementaciones
  Para lograr desacoplamiento y testabilidad

  # ─────────────────────────────────────────────────────────────
  # 1. DEPENDENCIAS HACIA ATRACCIONES
  # ─────────────────────────────────────────────────────────────

  Escenario: Domain Layer no depende de Infrastructure
    Dado que se verifica la capa de dominio
    Cuando se analizan dependencias
    Entonces el dominio:
      | Dependencia                 | Estado    |
      | Domain NO importa SQLite    | ✅        |
      | Domain NO importa HTTP      | ✅        |
      | Domain NO importa UI        | ✅        |
      | Domain SÍ define puertos    | ✅        |
      | Domain depende de interfaces | ✅        |

  Escenario: Inyección de dependencias en uso
    Dado que se usa inyección de dependencias
    Cuando se crea un servicio del dominio
    Entonces las dependencias se inyectan:
      | Servicio                    | Depende de (interface) |
      | PatientService             | PatientRepository      |
      | ConsultationService        | ConsultationRepository |
      | PrescriptionService        | PrescriptionRepository |
      | PharmacyService            | InventoryRepository    |
    Y NO se crean instancias con `new` o `atom`
    Y las implementaciones se proveen desde fuera

  Escenario: Configuration de dependencias
    Dado que se configura el sistema
    Cuando se ensamblan componentes
    Entonces se definen implementaciones:
      | Interface                   | Implementación (producción) | Implementación (test) |
      | PatientRepository           | SQLitePatientRepository     | InMemoryPatientRepository |
      | ConsultationRepository      | SQLiteConsultationRepository| InMemoryConsultationRepository |
      | AuditLogger                 | FileAuditLogger             | InMemoryAuditLogger |
      | Notifier                    | WhatsAppNotifier            | MockNotifier |

  # ─────────────────────────────────────────────────────────────
  # 2. VERIFICACIÓN DE DESACOPLAMIENTO
  # ─────────────────────────────────────────────────────────────

  Escenario: Verificación de desacoplamiento
    Dado que se analiza desacoplamiento entre módulos
    Cuando se mide acoplamiento
    Entonces:
      | Módulo                     | Acoplamiento | Estado |
      | Patient Domain             | Bajo (solo interfaces) | ✅ |
      | Clinical Domain            | Bajo (solo interfaces) | ✅ |
      | Pharmacy Domain            | Bajo (solo interfaces) | ✅ |
      | Reporting Module           | Medio (varias dependencias) | ⚠️ |
    Y Bajo acoplamiento = <5 dependencias directas

  Escenario: Testabilidad por desacoplamiento
    Dado que los módulos están desacoplados
    Cuando se escriben tests
    Entonces se pueden mockear dependencias fácilmente:
      | Módulo a testear           | Mock necesario    | Dificultad |
      | PatientService             | PatientRepository | Fácil      |
      | ConsultationService        | ConsultationRepository | Fácil |
      | PrescriptionService        | PrescriptionRepository + CDS | Fácil |
      | PharmacyService            | InventoryRepository | Fácil    |

  # ─────────────────────────────────────────────────────────────
  # 3. PATRONES DE INVERSIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Uso de Repository Pattern
    Dado que se usa Repository Pattern
    Cuando se implementa acceso a datos
    Entonces:
      | Componente                  | Rol                   |
      | PatientRepository (interface)| Puerto en dominio    |
      | SQLitePatientRepository     | Adaptador en infra    |
      | InMemoryPatientRepository  | Adaptador para tests  |
    Y el dominio define QUÉ necesita
    Y la infraestructura CÓMO lo provee

  Escenario: Uso de Strategy Pattern para CDS
    Dado que se implementa Clinical Decision Support
    Cuando se usan estrategias de validación
    Entonces:
      | Interface                   | Implementaciones     |
      | CDSStrategy                 | AllergyChecker       |
      |                           | InteractionChecker   |
      |                           | DoseValidator        |
    Y el motor CDS usa la interface
    Y NO conoce las implementaciones concretas

  Escenario: Event-driven architecture
    Dado que se usa arquitectura basada en eventos
    Cuando ocurre un evento de dominio
    Entonces:
      | Evento                     | Productor        | Consumidores (desacoplados) |
      | PrescriptionCreated        | PrescriptionDomain | PharmacyService, AuditLogger |
      | PatientRegistered          | PatientDomain     | ClinicalService, AuditLogger |
    Y el productor NO conoce a los consumidores
    Y se comunican a través del event bus

  # ─────────────────────────────────────────────────────────────
  # 4. VIOLACIONES COMUNES
  # ─────────────────────────────────────────────────────────────

  Escenario: Detección de violación de DIP
    Dado que se revisa código en busca de violaciones DIP
    Cuando se encuentra dependencia concreta
    Entonces se identifica:
      | Violación                   | Ejemplo              | Acción |
      | Servicio crea repositorio con `new` | (new SQLiteRepository()) | Inyectar |
      | Servicio importa infra directamente | (import ghe.infrastructure.*) | Usar interface |
    Y se corrige inyectando la abstracción
  