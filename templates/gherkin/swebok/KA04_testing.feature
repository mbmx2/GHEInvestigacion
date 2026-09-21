# language: es
# @id GHE-SWEBOK-KA04-001
# @type practice
# @domain engineering
# @layer development
# @risk s2
# @owner qa-lead
# @status proposed
# @requirement PRACTICE-GHE-004
# @risk-control CTRL-SWEBOK-KA04
# @regulation N/A
@domain:engineering @type:practice @risk:s2 @status:proposed
Característica: SWEBOK KA-04 - Testing de Software
  Como responsable de QA del proyecto GHE
  Quiero testing completo y automatizado
  Para que cada cambio se verifique antes de producción

  Regla: TDD es obligatorio

    Escenario: TDD aplicado
      Dado que se implementa funcionalidad
      Cuando se verifica
      Entonces: test antes del código, cobertura >95% en dominio, PEAEH activo
      # @evidence EVID-SWEBOK-KA04-001

    Escenario: Código sin tests
      Dado que se detecta código sin tests
      Cuando se audita
      Entonces se bloquea merge
      # @evidence EVID-SWEBOK-KA04-001-N

  Regla: Cobertura de tests se mide

    Escenario: Métricas de cobertura
      Dado que se mide cobertura
      Cuando se ejecuta cloverage
      Entonces: dominio >95%, integración >90%, total >85%
      # @evidence EVID-SWEBOK-KA04-002

  Regla: PEAEH verifica calidad de tests

    Escenario: Meta-testing
      Dado que PEAEH verifica tests
      Cuando se ejecuta
      Entonces: tests determinísticos, independientes, con nombres descriptivos
      # @evidence EVID-SWEBOK-KA04-003

  Regla: No se libera sin tests pasando

    Escenario: Release bloqueado
      Dado que hay tests fallidos
      Cuando se intenta liberar
      Entonces se bloquea
      # @evidence EVID-SWEBOK-KA04-004
