# language: es
# Hexagonal Architecture - Domain Layer (Core)
# CAPA CENTRAL: Lógica de negocio pura, sin dependencias de infraestructura
Característica: Domain Layer - Capa Central (Arquitectura Hexagonal)
  Como arquitecto del proyecto GHE
  Quiero que la capa de dominio sea independiente de infraestructura
  Para garantizar que la lógica de negocio sea portable y testeable

  # ─────────────────────────────────────────────────────────────
  # 1. ENTIDADES DEL DOMINIO
  # ─────────────────────────────────────────────────────────────

  Escenario: Definición de entidades del dominio
    Dado que se definen entidades del dominio
    Cuando se modelan
    Entonces cada entidad tiene:
      | Entidad                     | Atributos clave       | Comportamiento        |
      | Patient                     | id, curp, name, birthDate | validate(), fullName() |
      | Consultation                | id, patientId, date, soapNotes | addNote(), complete() |
      | Prescription                | id, consultationId, medication, dosage | validate(), sign() |
      | Pregnancy                   | id, patientId, lmpDate, edd | calculateEDD(), gestationalAge() |
      | VitalSigns                  | id, consultationId, bp, hr, temp | classify() |
    Y cada entidad es inmutable (value object o entity con identity)

  Escenario: Entidades como records inmutables
    Dado que se usan records de Clojure para entidades
    Cuando se crea una entidad
    Entonces:
      | Criterio                   | Estado    |
      | Es inmutable               | ✅        |
      | Tiene identity (id)        | ✅        |
      | Tiene comportamiento de dominio | ✅    |
      | NO tiene lógica de persistencia | ✅   |
      | NO tiene dependencias externas | ✅    |

  # ─────────────────────────────────────────────────────────────
  # 2. VALUE OBJECTS
  # ─────────────────────────────────────────────────────────────

  Escenario: Definición de value objects
    Dado que se definen value objects del dominio
    Cuando se modelan
    Entonces:
      | Value Object                | Atributos             | Validación             |
      | CURP                        | value (string)        | Formato 18 caracteres  |
      | BloodType                   | value (string)        | Valores permitidos     |
      | BloodPressure               | systolic, diastolic   | Rangos válidos         |
      | GestationalAge              | weeks, days           | Rangos válidos         |
      | MedicationDose              | amount, unit, frequency | Positivo, no vacío   |
    Y son inmutables
    Y se comparan por valor, no por identidad

  # ─────────────────────────────────────────────────────────────
  # 3. EVENTOS DE DOMINIO
  # ─────────────────────────────────────────────────────────────

  Escenario: Definición de eventos de dominio
    Dado que se definen eventos de dominio
    Cuando ocurren cambios en el dominio
    Entonces se emiten eventos:
      | Evento                      | Datos que contiene    |
      | PatientRegistered           | patientId, timestamp  |
      | ConsultationStarted         | consultationId, patientId |
      | VitalSignsRecorded          | consultationId, values |
      | PrescriptionCreated         | prescriptionId, medication |
      | PrescriptionDispensed       | prescriptionId, lot   |
      | RiskLevelChanged            | patientId, oldLevel, newLevel |
    Y los eventos son inmutables
    Y son registrados en el event store del dominio

  # ─────────────────────────────────────────────────────────────
  # 4. REGLAS DE NEGOCIO
  # ─────────────────────────────────────────────────────────────

  Escenario: Reglas de negocio en el dominio
    Dado que se definen reglas de negocio
    Cuando se validan
    Entonces las reglas viven en el dominio:
      | Regla                       | Ubicación             |
      | La CURP debe tener 18 caracteres | CURP value object |
      | PA sistólica debe ser > diastólica | BloodPressure VO |
      | Edad gestacional entre 0-42 semanas | Pregnancy entity |
      | No se puede prescribir sin consulta | Prescription entity |
      | Medicamento no puede tener dosis 0 | MedicationDose VO |
    Y las reglas se ejecutan al crear/modificar entidades
    Y las reglas NO dependen de infraestructura

  Escenario: Validación en el dominio
    Dado que se valida una entidad del dominio
    Cuando la validación falla
    Entonces se lanza excepción de dominio:
      | Excepción                   | Causa                 |
      | InvalidCURPException        | CURP con formato incorrecto |
      | InvalidBloodPressureException | PA diastólica > sistólica |
      | InvalidGestationalAgeException | Edad gestacional fuera de rango |
      | PrescriptionWithoutConsultationException | Sin consulta asociada |
    Y las excepciones son del dominio, no de infraestructura
  