# language: es
# @id GHE-FIN-001
# @type business-rule
# @domain finance
# @layer operations
# @risk s2
# @owner finance-director
# @status proposed
# @requirement REQ-FIN-001
# @risk-control CTRL-FIN-001
# @regulation NOM-024
@domain:finance @type:business-rule @risk:s2 @status:proposed
Característica: Gestión Financiera y Facturación
  Como director financiero
  Quiero que cada servicio sea facturado correctamente
  Para que el hospital sea financieramente sostenible

  Regla: Todo servicio genera cargo correspondiente

    Escenario: Consulta genera cargo
      Dado que paciente recibe consulta médica
      Cuando se completa consulta
      Entonces se genera cargo con monto según tabla de costos
      # @evidence EVID-FIN-001

    Escenario: Procedimiento con código CUPS
      Dado que se realiza procedimiento quirúrgico
      Cuando se documenta
      Entonces se asigna código CUPS y se calcula costo
      # @evidence EVID-FIN-002

  Regla: Pagos se registran y concilian

    Escenario: Pago registrado
      Dado que paciente realiza pago
      Cuando se procesa
      Entonces se registra: monto, método, referencia, cargo cubierto, saldo
      # @evidence EVID-FIN-003

    Escenario: Conciliación de pagos
      Dado que se realizan múltiples pagos
      Cuando se concilian
      Entonces se verifica saldo correcto
      # @evidence EVID-FIN-004

  Regla: Seguros se verifican antes del servicio

    Escenario: Verificación de cobertura
      Dado que paciente tiene seguro
      Cuando se programa servicio
      Entonces se verifica cobertura y se informa copago
      # @evidence EVID-FIN-005

    Escenario: Paciente sin seguro
      Dado que paciente no tiene seguro
      Cuando recibe servicio
      Entonces se registra como pago directo con costo total
      # @evidence EVID-FIN-006

  Regla: Facturación opera offline

    Escenario: Cargo sin internet
      Dado que no hay conexión
      Cuando se registra cargo
      Entonces se almacena localmente y se sincroniza después
      # @evidence EVID-FIN-007
