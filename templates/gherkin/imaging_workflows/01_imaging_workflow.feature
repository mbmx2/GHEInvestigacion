# language: es
# @id GHE-IMAGING-001
# @type business-rule
# @domain imaging
# @layer clinical
# @risk s1
# @owner radiology-director
# @status proposed
# @requirement REQ-IMAGING-001
# @risk-control CTRL-IMAGING-001
# @regulation NOM-024
@domain:imaging @type:business-rule @risk:s1 @status:proposed
Característica: Flujo de Imagenología
  Como director de imagenología
  Quiero flujo completo desde solicitud hasta interpretación
  Para que cada estudio sea rastreado y reportes lleguen a tiempo

  Regla: Toda solicitud genera orden

    Escenario: Solicitud genera orden
      Dado que médico solicita estudio de imagen
      Cuando se genera orden
      Entonces se asigna ID único, tipo de estudio, indicación, urgencia
      # @evidence EVID-IMG-001

  Regla: Radiólogo interpreta y reporta

    Escenario: Interpretación con BI-RADS
      Dado que se realiza estudio
      Cuando radiólogo interpreta
      Entonces genera reporte con hallazgos y clasificación BI-RADS
      Y vincula al expediente
      # @evidence EVID-IMG-002

    Escenario: Hallazgo incidental
      Dado que se detecta hallazgo no esperado
      Cuando se evalúa
      Entonces se documenta y se sugiere estudio complementario
      # @evidence EVID-IMG-003

  Regla: Protección radiológica es obligatoria

    Escenario: Verificación de protección
      Dado que se realiza estudio con radiación
      Entonces verifica: indicación justificada, protección gonadal, parámetros optimizados
      # @evidence EVID-IMG-004
      # @invariante INV-IMG-001

  Regla: Imagenología opera offline

    Escenario: Estudio sin internet
      Dado que no hay conexión
      Cuando se realiza estudio
      Entonces se procesa localmente y se sincroniza después
      # @evidence EVID-IMG-005
