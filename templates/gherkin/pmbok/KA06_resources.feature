# language: es
# @id GHE-PMBOK-KA06-001
# @type practice
# @domain management
# @layer governance
# @risk s2
# @owner project-manager
# @status proposed
# @requirement PRACTICE-GHE-PMBOK-006
# @risk-control CTRL-PMBOK-KA06
# @regulation N/A
@domain:management @type:practice @risk:s2 @status:proposed
Característica: PMBOK KA-06 - Gestión de Recursos Humanos
  Como director del proyecto GHE
  Quiero que el equipo tenga las competencias necesarias
  Para que cada miembro pueda contribuir efectivamente

  Regla: Los roles están definidos

    Escenario: Roles documentados
      Dado que se asignan roles
      Cuando se verifica
      Entonces cada rol tiene responsabilidades y competencias
      # @evidence EVID-PMBOK-KA06-001

  Regla: Las competencias se evalúan

    Escenario: Evaluación de competencias
      Dado que se evalúa al equipo
      Cuando se mide
      Entonces se identifican brechas y se planifica capacitación
      # @evidence EVID-PMBOK-KA06-002

  Regla: La capacitación se ejecuta

    Escenario: Capacitación completada
      Dado que se identifica brecha
      Cuando se ejecuta capacitación
      Entonces se verifica mejora en desempeño
      # @evidence EVID-PMBOK-KA06-003
