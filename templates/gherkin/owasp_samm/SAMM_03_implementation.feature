# language: es
# @id GHE-SAMM-IMPL-001
# @type compliance
# @domain security
# @layer development
# @risk s1
# @owner dev-lead
# @status proposed
# @requirement SAMM-IMPLEMENTATION
# @risk-control CTRL-SAMM-IMPL
# @regulation NOM-024
@domain:security @type:compliance @risk:s1 @status:proposed
Característica: SAMM Implementation - Build y Deployment Seguro
  Como desarrollador del proyecto GHE
  Quiero construcción y despliegue seguros
  Para que no se introduzcan vulnerabilidades durante el desarrollo

  Regla: El código se construye de forma reproducible y segura

    Escenario: Build reproducible
      Dado que se ejecuta build
      Cuando se verifica
      Entonces build es determinista, lockfile committeado, análisis estático OK
      # @evidence EVID-SAMM-IMPL-001

    Escenario: Build fallido
      Dado que el build falla
      Cuando se detecta
      Entonces NO se despliega
      Y se notifica al equipo
      # @evidence EVID-SAMM-IMPL-001-N

  # @invariante INV-IMPL-001: No se despliega código sin tests pasando
  Regla: No se despliega sin tests que pasen

    Escenario: Despliegue bloqueado por tests fallidos
      Dado que hay tests fallidos
      Cuando se intenta desplegar
      Entonces el despliegue es bloqueado
      Y se notifica la causa
      # @evidence EVID-SAMM-IMPL-002

    Escenario: Despliegue con tests pasando
      Dado que todos los tests pasan
      Cuando se despliega
      Entonces el despliegue se ejecuta exitosamente
      # @evidence EVID-SAMM-IMPL-002-P

  Regla: El código se revisa antes de merge

    Escenario: Code review completado
      Dado que se crea PR
      Cuando se revisa
      Entonces tiene al menos 1 aprobación
      Y no hay vulnerabilidades críticas
      # @evidence EVID-SAMM-IMPL-003

    Escenario: PR merge sin review
      Dado que se intenta merge sin review
      Cuando se detecta
      Entonces el merge es bloqueado
      # @evidence EVID-SAMM-IMPL-003-N

  # @invariante INV-IMPL-002: El despliegue siempre incluye rollback
  Regla: Cada despliegue tiene plan de rollback

    Escenario: Despliegue con rollback
      Dado que se despliega nueva versión
      Cuando se verifica
      Entonces se verifica que el rollback es posible
      Y se prueba el rollback en staging
      # @evidence EVID-SAMM-IMPL-004

  Regla: La configuración de seguridad se gestiona como código

    Escenario: Configuración versionada
      Dado que se modifica configuración de seguridad
      Cuando se aplica
      Entonces se versiona en Git, se hace code review, se testea
      # @evidence EVID-SAMM-IMPL-005

    Escenario: Configuración sin versionar
      Dado que se cambia configuración sin versionar
      Cuando se detecta
      Entonces se genera alerta y se versiona retroactivamente
      # @evidence EVID-SAMM-IMPL-005-N
