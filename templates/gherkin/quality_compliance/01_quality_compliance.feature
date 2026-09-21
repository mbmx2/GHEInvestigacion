# language: es
# @id GHE-QUALITY-001
# @type business-rule
# @domain quality
# @layer governance
# @risk s2
# @owner quality-director
# @status proposed
# @requirement REQ-QUALITY-001
# @risk-control CTRL-QUALITY-001
# @regulation NOM-024
@domain:quality @type:business-rule @risk:s2 @status:proposed
Característica: Gestión de Calidad y Cumplimiento
  Como director de calidad
  Quiero monitoreo continuo de indicadores de calidad
  Para cumplir normativas y mejorar atención

  Regla: Indicadores se miden continuamente

    Escenario: Dashboard de calidad
      Dado que se consulta dashboard
      Entonces muestra: infección nosocomial <5%, espera <30min, satisfacción >85%, error medicación <0.1%, protocolos >90%
      # @evidence EVID-QUAL-001

  Regla: Auditorías según normativa

    Escenario: Auditoría trimestral
      Dado que es fin de trimestre
      Cuando se ejecuta auditoría
      Entonces revisa: protocolos, documentación, seguridad, equipos, capacitación
      Y genera hallazgos y acciones correctivas
      # @evidence EVID-QUAL-002

  Regla: No conformidades tienen plan de acción

    Escenario: No conformidad detectada
      Dado que se detecta no conformidad
      Cuando se documenta
      Entonces genera plan de acción con responsable y fecha de cierre
      # @evidence EVID-QUAL-003

  Regla: Hospital cumple NOM-024

    Escenario: Verificación NOM-024
      Dado que se verifica cumplimiento
      Entonces se verifica: SGSI, SIS-CEX, integridad, confidencialidad, disponibilidad, trazabilidad
      # @evidence EVID-QUAL-004
