# language: es
# @id GHE-INT-001
# @type business-rule
# @domain integration
# @layer operations
# @risk s2
# @owner architect
# @status proposed
# @requirement REQ-INT-001
# @risk-control CTRL-INT-001
# @regulation NOM-024
@domain:integration @type:business-rule @risk:s2 @status:proposed
Característica: Integración con Sistemas Externos
  Como arquitecto del hospital
  Quiero que GHE se integre con sistemas externos de forma segura
  Para que los datos fluyan entre instituciones

  Regla: Integración requiere autenticación

    Escenario: Conexión con aseguradora
      Dado que se verifica cobertura
      Cuando se solicita información
      Entonces se autentica, se encripta comunicación, se registra transacción
      # @evidence EVID-INT-001

  Regla: Datos se intercambian en formato estándar

    Escenario: Intercambio vía FHIR
      Dado que se envía recurso FHIR
      Cuando se serializa
      Entonces se usa FHIR R4, se valida contra perfil, se envía por HTTPS
      # @evidence EVID-INT-002

    Escenario: Recepción de laboratorio externo
      Dado que laboratorio externo envía resultados
      Cuando se reciben
      Entonces se validan, se vinculan al expediente, se notifica al médico
      # @evidence EVID-INT-003

  Regla: Integración funciona offline con cola

    Escenario: Datos pendientes de envío
      Dado que se genera reporte para aseguradora
      Cuando no hay conexión
      Entonces se encola y se envía al reconectar
      # @evidence EVID-INT-004
