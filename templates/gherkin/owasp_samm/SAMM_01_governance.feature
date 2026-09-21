# language: es
# @id GHE-SAMM-GOV-001
# @type compliance
# @domain security
# @layer governance
# @risk s1
# @owner security-lead
# @status proposed
# @requirement SAMM-GOVERNANCE
# @risk-control CTRL-SAMM-GOV
# @regulation NOM-024
@domain:security @type:compliance @risk:s1 @status:proposed
Característica: SAMM Governance - Estrategia, Métricas y Cumplimiento
  Como responsable de seguridad del hospital
  Quiero que la gobernanza de seguridad sea documentada y medible
  Para que cada decisión de seguridad sea trazable y auditable

  Regla: La organización define una estrategia de seguridad

    Escenario: Estrategia documentada
      Dado que se define estrategia de seguridad para GHE
      Cuando se documenta
      Entonces incluye objetivos, métricas, periodo de revisión y responsables
      # @evidence EVID-SAMM-GOV-001

    Escenario: Estrategia no documentada
      Dado que NO existe estrategia de seguridad
      Cuando se verifica
      Entonces se detecta el vacío
      Y se genera alerta de gobernanza
      # @evidence EVID-SAMM-GOV-001-N

  Regla: Las métricas de seguridad se definen y miden

    Escenario: Métricas definidas
      Dado que se definen métricas
      Cuando se evalúa
      Entonces cada métrica tiene objetivo y frecuencia
      # @evidence EVID-SAMM-GOV-002

    Escenario: Métricas no definidas
      Dado que NO existen métricas de seguridad
      Cuando se verifica
      Entonces se detecta el vacío y se prioriza definirlas
      # @evidence EVID-SAMM-GOV-002-N

  Regla: Las métricas se revisan periódicamente

    Esquema del escenario: Revisión de métricas por frecuencia
      Dado que se revisan métricas de seguridad
      Cuando se ejecuta revisión cada "<frecuencia>"
      Entonces se compara contra "<objetivo>"
      Y se documenta "<resultado>"

      Ejemplos:
        | frecuencia | objetivo | resultado |
        | Semanal   | 0 incidencias | Verificar |
        | Mensual   | 100% tests pasar | Verificar |
        | Trimestral| >90% cobertura | Verificar |

  # @invariante INV-GOV-001: Siempre debe existir una estrategia de seguridad documentada
  Regla: La estrategia debe existir y estar actualizada

    Escenario: Verificación de existencia de estrategia
      Dado que se revisa gobernanza
      Cuando se verifica
      Entonces la estrategia existe, está fechada y tiene responsable asignado
      # @evidence EVID-SAMM-GOV-003

  Regla: Existe una política de seguridad documentada

    Escenario: Política completa
      Dado que se documenta política
      Cuando se verifica
      Entonces incluye: acceso, cifrado, logging, incidentes, privacidad
      # @evidence EVID-SAMM-GOV-004

    Escenario: Política incompleta
      Dado que la política falta un componente
      Cuando se verifica
      Entonces se identifica el componente faltante
      Y se genera acción correctiva
      # @evidence EVID-SAMM-GOV-004-N

  Regla: El cumplimiento normativo se verifica

    Escenario: Cumplimiento verificado
      Dado que se verifica cumplimiento
      Cuando se evalúa
      Entonces cada norma tiene estado documentado
      # @evidence EVID-SAMM-GOV-005

    Escenario: Incumplimiento detectado
      Dado que una norma no se cumple
      Cuando se detecta
      Entonces se genera plan de remediación con fecha límite
      # @evidence EVID-SAMM-GOV-005-N

  Regla: El personal recibe capacitación en seguridad

    Escenario: Programa de capacitación completo
      Dado que se ejecuta programa
      Cuando se verifica
      Entonces cada módulo tiene frecuencia y evidencia
      # @evidence EVID-SAMM-GOV-006

    Escenario: Capacitación incompleta
      Dado que un módulo no se ha ejecutado
      Cuando se verifica
      Entonces se detecta el vacío y se reprograma
      # @evidence EVID-SAMM-GOV-006-N

  Regla: Simulacros se ejecutan según calendario

    Escenario: Simulacros completos
      Dado que se ejecutan simulacros
      Cuando se verifica
      Entonces cada tipo tiene frecuencia y resultado documentado
      # @evidence EVID-SAMM-GOV-007

    Escenario: Simulacros pendientes
      Dado que un simulacro no se ha ejecutado
      Cuando se detecta
      Entonces se reprograma inmediatamente
      # @evidence EVID-SAMM-GOV-007-N
