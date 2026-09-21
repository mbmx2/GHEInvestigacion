# language: es
# @id GHE-INTEGRATION-FHIR-001
# @type compliance
# @domain interoperability
# @layer infrastructure
# @risk s2
# @owner architect
# @status proposed
# @requirement REQ-INTEGRATION-FHIR
# @risk-control CTRL-INTEGRATION-FHIR
# @regulation NOM-024
@domain:interoperability @type:compliance @risk:s2 @status:proposed
Característica: Integración con IMSS/ISSSTE y FHIR
  Como arquitecto del hospital
  Quiero que GHE se integre con sistemas nacionales de salud
  Para que los datos fluyan entre instituciones

  Regla: Intercambio vía FHIR R4

    Escenario: Recurso FHIR válido
      Dado que se envía recurso FHIR
      Cuando se valida
      Entonces: estructura correcta, perfiles validados, autenticación OK

  Regla: Autenticación con sistemas externos

    Escenario: Autenticación verificada
      Dado que se conecta con IMSS
      Cuando se autentica
      Entonces: credenciales válidas, comunicación cifrada, transacción registrada

  Regla: Datos se sincronizan cuando hay conectividad

    Escenario: Sincronización offline
      Dado que no hay conexión con IMSS
      Cuando se genera reporte
      Entonces se encola y se envía al reconectar

  Regla: Se verifica integridad post-sync

    Escenario: Integridad verificada
      Dado que se completa sincronización
      Cuando se verifica
      Entonces: hash coincide, sin duplicados, sin datos perdidos
