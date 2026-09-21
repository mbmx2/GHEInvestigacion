# language: es
# @id GHE-SEC-OWASP-A09-001
# @type security
# @domain security
# @layer infrastructure
# @risk s2
# @owner security-lead
# @status proposed
# @requirement OWASP-A09
# @risk-control CTRL-OWASP-A09
# @regulation NOM-024
@domain:security @type:security @risk:s2 @status:proposed
Característica: OWASP A09 - Fallos de Logging y Monitoreo
  Como responsable de seguridad del hospital
  Quiero logging robusto y monitoreo continuo
  Para detectar incidentes y tener evidencia para auditoría

  Regla: Eventos de seguridad se registran

    Escenario: Audit log completo
      Dado que ocurre evento de seguridad
      Cuando se registra
      Entonces incluye: timestamp UTC, user ID, acción, resultado, IP, hash SHA-256
      # @evidence EVID-ASVS-V7-001

  Regla: Datos sensibles no se registran

    Escenario: Protección de datos en logs
      Dado que se genera log
      Cuando se verifica
      Entonces NO se registra: CURP completa, passwords, tokens, diagnósticos completos
      # @evidence EVID-ASVS-V7-002

  Regla: Logs son inmutables

    Escenario: Integridad de logs
      Dado que se almacenan logs
      Cuando se verifica
      Entonces: append-only, hash SHA-256 por entrada, permisos restrictivos
      # @evidence EVID-ASVS-V7-003

  Regla: Retención de logs

    Escenario: Política de retención
      Dado que se gestiona retención
      Entonces: audit log 10 años, system log 1 año, access log 6 meses
      # @evidence EVID-ASVS-V7-004
