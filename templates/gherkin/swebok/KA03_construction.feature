# language: es
# @id GHE-SWEBOK-KA03-001
# @type practice
# @domain engineering
# @layer development
# @risk s2
# @owner dev-lead
# @status proposed
# @requirement PRACTICE-GHE-003
# @risk-control CTRL-SWEBOK-KA03
# @regulation N/A
@domain:engineering @type:practice @risk:s2 @status:proposed
Característica: SWEBOK KA-03 - Construcción de Software
  Como desarrollador del proyecto GHE
  Quiero seguir prácticas de construcción de software
  Para que el código sea claro, testeable y mantenible

  Regla: El código sigue estándares de coding

    Escenario: Estándares de Clojure
      Dado que se escribe código
      Cuando se verifica
      Entonces: kebab-case, docstrings, funciones puras, specs
      # @evidence EVID-SWEBOK-KA03-001

  Regla: El código se construye con TDD

    Escenario: TDD aplicado
      Dado que se implementa funcionalidad
      Cuando se verifica
      Entonces: test primero, código después, refactor, cobertura >95%
      # @evidence EVID-SWEBOK-KA03-002

  Regla: El código se revisa antes de merge

    Escenario: Code review completado
      Dado que se crea PR
      Cuando se revisa
      Entonces tiene review, no hay vulnerabilidades, tests pasan
      # @evidence EVID-SWEBOK-KA03-003

  Regla: Specs validan datos

    Escenario: Specs definidos
      Dado que se procesan datos médicos
      Cuando se valida
      Entonces cada tipo de dato tiene spec asociado
      # @evidence EVID-SWEBOK-KA03-004
