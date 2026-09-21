# language: es
# Hexagonal Architecture - Ports (Interfaces)
@status:proposed
# @requirement:PRACTICE-GHE-001
@type:acceptance
@domain:general
# PUERTOS: Contratos que define el dominio para interactuar con el exterior
Característica: Ports - Contratos del Dominio (Arquitectura Hexagonal)
  Como arquitecto del proyecto GHE
  Quiero que el dominio defina puertos (interfaces)
  Para desacoplar la lógica de negocio de la infraestructura

  # ─────────────────────────────────────────────────────────────
  # 1. PUERTOS DE ENTRADA (Driving Ports)
  # ─────────────────────────────────────────────────────────────

  Escenario: Definición de puertos de entrada
    Dado que el dominio necesita recibir comandos
    Cuando se definen puertos de entrada
    Entonces cada puerto es una interface:
      | Puerto                      | Operaciones           |
      | PatientUseCase             | registerPatient, findPatient, updatePatient |
      | ConsultationUseCase        | startConsultation, addNote, completeConsultation |
      | PrescriptionUseCase        | createPrescription, signPrescription |
      | TriageUseCase              | classifyRisk, recordVitalSigns |
      | ReportingUseCase           | generateReport, getStatistics |
    Y cada puerto define QUÉ puede hacer el sistema
    Y NO define CÓMO se hace

  Escenario: Puertos como protocolos (Clojure)
    Dado que se usan protocols de Clojure para puertos
    Cuando se definen
    Entonces:
      | Protocol                    | Métodos              |
      | PatientUseCase              | register, find, update, delete |
      | ConsultationUseCase         | start, addNote, complete |
      | PrescriptionUseCase         | create, sign, findByPatient |
      | InventoryUseCase            | checkStock, dispense, getLowStock |
    Y el dominio solo conoce los protocols
    Y NO conoce las implementaciones concretas

  # ─────────────────────────────────────────────────────────────
  # 2. PUERTOS DE SALIDA (Driven Ports)
  # ─────────────────────────────────────────────────────────────

  Escenario: Definición de puertos de salida
    Dado que el dominio necesita persistir datos y enviar eventos
    Cuando se definen puertos de salida
    Entonces cada puerto es una interface:
      | Puerto                      | Operaciones           |
      | PatientRepository           | save, findById, findByCURP, findAll |
      | ConsultationRepository      | save, findById, findByPatient |
      | PrescriptionRepository      | save, findById, findByConsultation |
      | EventPublisher              | publish (eventos de dominio) |
      | AuditLogger                 | log (acciones de auditoría) |
      | NotificationService         | sendUrgentAlert, sendReminder |
    Y cada puerto define QUÉ necesita el dominio
    Y la infraestructura define CÓMO se cumple

  # ─────────────────────────────────────────────────────────────
  # 3. SEPARACIÓN DE PUERTOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Verificación de separación de puertos
    Dado que se verifican puertos de entrada vs salida
    Cuando se analiza dirección
    Entonces:
      | Tipo de puerto              | Dirección | Ejemplo |
      | Input (Driving)            | Hacia el dominio | UseCase |
      | Output (Driven)            | Desde el dominio | Repository |
    Y los puertos de entrada NO implementan lógica de persistencia
    Y los puertos de salida NO contienen lógica de negocio

  Escenario: Verificación de que puertos son puros
    Dado que se verifica pureza de puertos
    Cuando se revisa código
    Entonces:
      | Criterio                   | Estado    |
      | Puerto solo define interface | ✅       |
      | Puerto NO importa implementación | ✅   |
      | Puerto NO tiene dependencias externas | ✅ |
      | Puerto es testeable con mock | ✅        |
  