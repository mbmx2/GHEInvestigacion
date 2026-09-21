# language: es
# @id GHE-SWEBOK-KA11-001
# @type practice
# @domain engineering
# @layer governance
# @risk s2
# @owner tech-lead
# @status proposed
# @requirement PRACTICE-GHE-011
# @risk-control CTRL-SWEBOK-KA11
# @regulation N/A
@domain:engineering @type:practice @risk:s2 @status:proposed
Característica: SWEBOK KA-11 - Práctica Profesional
  Como miembro del equipo GHE
  Quiero seguir estándares profesionales
  Para mantener integridad y calidad en cada entrega

  Regla: Cada miembro conoce sus responsabilidades

    Escenario: Roles definidos
      Dado que se asigna rol
      Cuando se verifica
      Entonces tiene responsabilidades documentadas y能力 evaluada
      # @evidence EVID-SWEBOK-KA11-001

  Regla: La comunicación es efectiva

    Escenario: Comunicación clara
      Dado que se comunica una decisión
      Cuando se verifica
      Entonces: qué, por qué, quién, cuándo, evidencia
      # @evidence EVID-SWEBOK-KA11-002

  Regla: Se mantiene confidencialidad

    Escenario: Datos protegidos
      Dado que se procesan datos sensibles
      Cuando se verifica
      Entonces: sin exposición, acceso mínimo, auditoría
      # @evidence EVID-SWEBOK-KA11-003

  Regla: Se gestiona la deuda técnica

    Escenario: Deuda controlada
      Dado que se identifica deuda técnica
      Cuando se registra
      Entonces: priorizada, planificada, reducida en cada sprint
      # @evidence EVID-SWEBOK-KA11-004
