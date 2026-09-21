# language: es
# @id GHE-PMBOK-KA04-001
# @type practice
# @domain management
# @layer governance
# @risk s2
# @owner project-manager
# @status proposed
# @requirement PRACTICE-GHE-PMBOK-004
# @risk-control CTRL-PMBOK-KA04
# @regulation N/A
@domain:management @type:practice @risk:s2 @status:proposed
Característica: PMBOK KA-04 - Gestión de Costos
  Como director del proyecto GHE
  Quiero que los costos se controlen y reporten
  Para que el proyecto sea financieramente sostenible

  Regla: Todo presupuesto se documenta

    Escenario: Presupuesto definido
      Dado que se planifica presupuesto
      Cuando se documenta
      Entonces incluye: categorías, montos, responsable
      # @evidence EVID-PMBOK-KA04-001

  Regla: Los costos se comparan con el presupuesto

    Escenario: Control presupuestal
      Dado que se ejecuta gasto
      Cuando se compara con presupuesto
      Entonces se calcula CPI (Cost Performance Index)
      # @evidence EVID-PMBOK-KA04-002

  Regla: Las desviaciones se reportan

    Escenario: Desviación presupuestal
      Dado que hay desviación >10%
      Cuando se detecta
      Entonces se evalúa causa y se toma acción correctiva
      # @evidence EVID-PMBOK-KA04-003
