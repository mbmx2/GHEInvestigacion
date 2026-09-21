# language: es
# @id GHE-DOMAIN-EVENTS-CONTEXTS-001
# @type compliance
# @domain development
# @layer domain
# @risk s2
# @owner architect
# @status proposed
# @requirement REQ-DOMAIN-EVENTS
# @risk-control CTRL-DOMAIN-EVENTS
# @regulation N/A
@domain:development @type:compliance @risk:s2 @status:proposed
Característica: Eventos de Dominio por Bounded Context
  Como arquitecto del proyecto GHE
  Quiero eventos de dominio definidos por cada bounded context
  Para que la comunicación entre contextos sea desacoplada

  Regla: Cada bounded context tiene eventos propios

    Escenario: Eventos definidos
      Dado que se identifican bounded contexts
      Cuando se definen eventos
      Entonces:
        | Bounded Context | Eventos |
        | Patient | PatientRegistered, PatientUpdated |
        | Clinical | ConsultationStarted, ConsultationCompleted |
        | Obstetric | PrenatalVisitRecorded, RiskLevelChanged |
        | Pharmacy | PrescriptionCreated, MedicationDispensed |
        | Prescription | PrescriptionCreated, PrescriptionSigned |

  Regla: Los eventos son inmutables

    Escenario: Evento inmutable
      Dado que se publica un evento
      Cuando se modifica
      Entonces el evento original NO se modifica
      Y se crea un nuevo evento

  Regla: Los eventos tienen integridad verificable

    Escenario: Integridad de evento
      Dado que se crea un evento
      Cuando se verifica
      Entonces tiene hash SHA-256, timestamp, correlación_id

  Regla: Los eventos se persisten

    Escenario: Evento persistido
      Dado que se publica un evento
      Cuando se persiste
      Entonces: append-only, inmutable, con hash encadenado
