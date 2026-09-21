# language: es
# @id GHE-PMBOK-KA03-001
# @type practice
# @domain management
# @layer governance
# @risk s2
# @owner project-manager
# @status proposed
# @requirement PRACTICE-GHE-PMBOK-003
# @risk-control CTRL-PMBOK-KA03
# @regulation N/A
@domain:management @type:practice @risk:s2 @status:proposed
Característica: PMBOK KA-03 - Gestión del Cronograma
  Como director del proyecto GHE
  Quiero que el cronograma sea realista y medible
  Para que cada hito se cumpla a tiempo

  Regla: El cronograma tiene hitos definidos

    Escenario: Hitos documentados
      Dado que se planifica cronograma
      Cuando se verifica
      Entonces cada fase tiene fecha objetivo y criterio de salida
      # @evidence EVID-PMBOK-KA03-001

  Regla: El avance se mide contra el plan

    Escenario: Earned Value
      Dado que se mide avance
      Cuando se calcula EV/PV/AC
      Entonces se determina si está adelante o atrasado
      # @evidence EVID-PMBOK-KA03-002

  Regla: Las desviaciones se gestionan

    Escenario: Desviación >10%
      Dado que hay desviación significativa
      Cuando se detecta
      Entonces: causa raíz, acción correctiva, actualización de plan
      # @evidence EVID-PMBOK-KA03-003
