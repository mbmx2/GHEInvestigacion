# language: es
# @id GHE-PMBOK-KA07-001
# @type practice
# @domain management
# @layer governance
# @risk s2
# @owner project-manager
# @status proposed
# @requirement PRACTICE-GHE-PMBOK-007
# @risk-control CTRL-PMBOK-KA07
# @regulation N/A
@domain:management @type:practice @risk:s2 @status:proposed
Característica: PMBOK KA-07 - Gestión de Comunicaciones
  Como director del proyecto GHE
  Quiero que las comunicaciones sean claras y oportunas
  Para que todos los stakeholders estén informados

  Regla: La matriz de comunicaciones está definida

    Escenario: Matriz documentada
      Dado que se define matriz de comunicaciones
      Cuando se verifica
      Entonces cada comunicación tiene: audiencia, canal, frecuencia, responsable
      # @evidence EVID-PMBOK-KA07-001

  Regla: Los stakeholders reciben información

    Escenario: Stakeholders informados
      Dado que hay cambios significativos
      Cuando se notifica
      Entonces todos los stakeholders relevantes reciben información
      # @evidence EVID-PMBOK-KA07-002

  Regla: Las comunicaciones se documentan

    Escenario: Comunicaciones registradas
      Dado que se comunica una decisión
      Cuando se registra
      Entonces: qué, quién, cuándo, por qué
      # @evidence EVID-PMBOK-KA07-003
