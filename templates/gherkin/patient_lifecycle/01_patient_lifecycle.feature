# language: es
# @id GHE-PATIENT-LIFECYCLE-001
# @type business-rule
# @domain patient
# @layer domain
# @risk s1
# @owner medical-director
# @status proposed
# @requirement REQ-PATIENT-001
# @risk-control CTRL-PATIENT-001
# @regulation NOM-004
@domain:patient @type:business-rule @risk:s1 @status:proposed
Característica: Gestión del Ciclo de Vida del Paciente
  Como director médico del hospital
  Quiero que cada paciente tenga un ciclo de vida completo documentado
  Para que no se pierda información entre consultas ni se olvide seguimiento

  Regla: Todo paciente nuevo recibe un expediente con identificador único

    Escenario: Registro exitoso
      Dado que un paciente acude por primera vez
      Cuando el personal registra sus datos
      Entonces se genera expediente con ID único
      Y se validan campos obligatorios (nombre, CURP, fecha nacimiento, sexo)
      Y se registra fecha y hora de creación
      # @evidence EVID-PATIENT-001

    Escenario: Registro con CURP duplicada
      Dado que ya existe paciente con la misma CURP
      Cuando se intenta registrar otro
      Entonces el sistema rechaza el registro
      Y muestra el expediente existente
      # @evidence EVID-PATIENT-002
      # @invariante INV-PATIENT-001

  Regla: Todo paciente tiene plan de seguimiento activo

    Escenario: Plan se genera automáticamente
      Dado que un paciente recibe diagnóstico crónico
      Cuando se registra el diagnóstico
      Entonces el sistema genera plan de seguimiento
      Y agenda controles según protocolo
      # @evidence EVID-PATIENT-003

    Escenario: Seguimiento perdido genera alerta
      Dado que paciente no asiste a control programado
      Cuando se detecta inasistencia
      Entonces se genera alerta y se notifica al equipo
      # @evidence EVID-PATIENT-004

  Regla: El expediente es inmutable después de firmado

    Escenario: Nota firmada no puede modificarse
      Dado que nota médica ha sido firmada
      Cuando se intenta modificar
      Entonces la modificación es rechazada
      Y se sugiere crear nota de adendum
      # @evidence EVID-PATIENT-005
      # @invariante INV-PATIENT-002

  Regla: Todo paciente tiene derecho a acceder a su expediente

    Escenario: Paciente solicita copia
      Dado que paciente solicita copia de expediente
      Cuando se procesa
      Entonces se genera copia completa
      Y se entrega en formato legible
      # @evidence EVID-PATIENT-006

  Regla: Los datos se conservan según normativa

    Escenario: Conservación de expedientes
      Dado que se revisa política de retención
      Entonces:
        | Tipo de dato              | Retención mínima |
        | Expediente clínico        | 5 años             |
        | Consentimientos           | 5 años             |
        | Registro de auditoría     | 10 años            |
      # @evidence EVID-PATIENT-007

  Regla: El paciente puede solicitar eliminación de datos no obligatorios

    Escenario: Derecho de cancelación ARCO
      Dado que paciente solicita eliminación
      Cuando se evalúa
      Entonces se verifica si hay obligación legal de conservar
      Y si no hay obligación se ejecuta soft delete
      # @evidence EVID-PATIENT-008
