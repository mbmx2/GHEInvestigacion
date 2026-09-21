# language: es
# @id GHE-API-VERSIONING-001
# @type compliance
# @domain interoperability
# @layer api
# @risk s2
# @owner architect
# @status proposed
# @requirement REQ-API-VERSIONING
# @risk-control CTRL-API-VERSIONING
# @regulation NOM-024
@domain:interoperability @type:compliance @risk:s2 @status:proposed
Característica: API Design - Versionado y Paginación
  Como desarrollador de API del hospital
  Quiero APIs versionadas y paginadas
  Para que los clientes se adapten gradualmente

  Regla: API tiene versionado

    Escenario: Versionado implementado
      Dado que se accede a API
      Cuando se verifica
      Entonces: versionado en URL (/api/v1/), deprecación documentada

  Regla: Respuestas son paginadas

    Escenario: Paginación implementada
      Dado que se pide lista larga
      Cuando se procesa
      Entonces: paginación offset-based con total, page, limit

  Regla: Rate limiting activo

    Escenario: Rate limiting
      Dado que se envían muchas peticiones
      Cuando se verifica
      Entonces: límite por endpoint, 429 si excede

  Regla: API tiene documentación

    Escenario: Documentación OpenAPI
      Dado que se consulta documentación
      Cuando se verifica
      Entonces: OpenAPI spec actualizado con todos los endpoints
