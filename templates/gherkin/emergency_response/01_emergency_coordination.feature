# language: es
# @id GHE-EMER-001
# @type safety
# @domain emergency
# @layer clinical
# @risk s0
# @owner medical-director
# @status proposed
# @requirement REQ-EMER-001
# @risk-control CTRL-EMER-001
# @regulation NOM-004
@domain:emergency @type:safety @risk:s0 @status:proposed
Característica: Gestión Coordinada de Emergencias
  Como director médico
  Quiero protocolos de emergencia coordinados entre áreas
  Para que las emergencias se atiendan de forma rápida y segura

  Regla: Toda emergencia activa protocolo

    Escenario: Emergencia obstétrica
      Dado que llega paciente con emergencia obstétrica
      Cuando se activa protocolo
      Entonces sistema notifica a todo el equipo, libera recursos, genera orden, registra tiempos
      # @evidence EVID-EMER-001

  Regla: Emergencias tienen prioridad sobre agenda

    Escenario: Emergencia interrumpe agenda
      Dado que hay citas programadas
      Cuando llega emergencia
      Entonces emergencia toma prioridad, citas se reevalúan, pacientes se notifican
      # @evidence EVID-EMER-002

  Regla: Todo personal es notificado

    Escenario: Notificación de emergencia
      Dado que se activa protocolo
      Cuando se notifica
      Entonces:
        | Personal              | Método     |
        | Equipo urgencias      | Inmediato  |
        | Director médico       | Inmediato  |
        | Cirujano de guardia   | Inmediato  |
        | Farmacia              | Según necesidad |
      # @evidence EVID-EMER-003

  Regla: Emergencias se documentan completamente

    Escenario: Documentación de emergencia
      Dado que se atiende emergencia
      Cuando se completa
      Entonces documenta: hora llegada, tiempo respuesta, tipo, tratamiento, outcome, tiempo total
      # @evidence EVID-EMER-004

  Regla: Sistema funciona durante emergencias

    Escenario: Emergencia sin internet
      Dado que hay emergencia y no hay conexión
      Cuando se activa protocolo
      Entonces sistema funciona 100% offline
      Y genera documentación completa
      # @evidence EVID-EMER-005
