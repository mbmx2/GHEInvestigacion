# language: es
# @id GHE-SWEBOK-KA09-001
# @type practice
# @domain engineering
# @layer process
# @risk s2
# @owner architect
# @status proposed
# @requirement PRACTICE-GHE-009
# @risk-control CTRL-SWEBOK-KA09
# @regulation N/A
@domain:engineering @type:practice @risk:s2 @status:proposed
Característica: SWEBOK KA-09 - Modelos y Métodos
  Como arquitecto del proyecto GHE
  Quiero aplicar modelos y métodos apropiados
  Para que el diseño sea robusto y mantenible

  Regla: Se usa DDD para bounded contexts

    Escenario: Bounded contexts definidos
      Dado que se modela el dominio
      Cuando se identifican contextos
      Entonces: Patient, Clinical, Obstetric, Pharmacy, Prescription, Reporting
      # @evidence EVID-SWEBOK-KA09-001

  Regla: Se usa Arquitectura Hexagonal

    Escenario: Hexagonal aplicada
      Dado que se verifica arquitectura
      Cuando se evalúa
      Entonces: domain sin dependencias, ports como interfaces, adapters para infra
      # @evidence EVID-SWEBOK-KA09-002

  Regla: Se usa Spec Driven Design

    Escenario: Specs definidos
      Dado que se procesan datos médicos
      Cuando se valida
      Entonces cada tipo tiene spec con clojure.spec
      # @evidence EVID-SWEBOK-KA09-003

  Regla: Se usa Event-Driven Architecture

    Escenario: Eventos de dominio
      Dado que ocurren cambios en el dominio
      Cuando se emiten eventos
      Entonces: PatientRegistered, ConsultationCompleted, PrescriptionCreated
      # @evidence EVID-SWEBOK-KA09-004
