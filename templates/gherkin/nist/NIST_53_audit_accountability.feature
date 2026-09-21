# language: es
# @id GHE-NIST-53-AU-001
# @type compliance
# @domain security
# @layer infrastructure
# @risk s1
# @owner security-lead
# @status proposed
# @requirement NIST-53-AU
# @risk-control CTRL-NIST-53-AU
# @regulation NOM-024
@domain:security @type:compliance @risk:s1 @status:proposed
Característica: NIST 800-53 - Auditoría y Responsabilidad (AU)
  Como responsable de seguridad del hospital
  Quiero auditoría completa según NIST 800-53
  Para que cada acción sea rastreable

  Regla: AU-2: Eventos de auditoría definidos

    Escenario: Eventos auditados
      Dado que se definen eventos de auditoría
      Cuando se verifica
      Entonces: login/logout, acceso datos, crear/modificar, permisos, denegados, reportes
      # @evidence EVID-NIST-53-AU-001

    Escenario: Evento no auditado
      Dado que se detecta acción sin registro
      Cuando se audita
      Entonces: se agrega a lista de eventos requeridos
      # @evidence EVID-NIST-53-AU-001-N

  Regla: AU-3: Contenido de registros

    Escenario: Registro completo
      Dado que se registra evento
      Cuando se verifica contenido
      Entonces: timestamp, user ID, acción, entidad, resultado, IP
      # @evidence EVID-NIST-53-AU-002

  Regla: AU-4: Protección de registros

    Escenario: Registros protegidos
      Dado que se almacenan logs
      Cuando se verifica
      Entonces: append-only, hash SHA-256, permisos restrictivos
      # @evidence EVID-NIST-53-AU-003

    Escenario: Intento de alterar log
      Dado que se intenta modificar un log
      Cuando se verifica
      Entonces: se detecta y se alerta
      # @evidence EVID-NIST-53-AU-003-N

  Regla: AU-5: Retención de registros

    Escenario: Retención documentada
      Dado que se define retención
      Cuando se verifica
      Entonces: audit log 10 años, system log 1 año
      # @evidence EVID-NIST-53-AU-004

  # @invariante INV-53-AU-001: No hay acción sin registro en auditoría
  Regla: Toda acción se registra

    Escenario: Acción sin registro
      Dado que se detecta acción sin audit log
      Cuando se audita
      Entonces se investiga y se registra retroactivamente
      # @evidence EVID-NIST-53-AU-005
