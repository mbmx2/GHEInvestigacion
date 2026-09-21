# language: es
# @id GHE-MEDICATION-001
# @type business-rule
# @domain pharmacy
# @layer domain
# @risk s1
# @owner pharmacy-director
# @status proposed
# @requirement REQ-MEDICATION-001
# @risk-control CTRL-MEDICATION-001
# @regulation NOM-004
@domain:pharmacy @type:business-rule @risk:s1 @status:proposed
Característica: Gestión de Medicamentos
  Como director de farmacia
  Quiero control completo del ciclo de vida de medicamentos
  Para que cada medicamento sea rastreado de compra a dispensación

  Regla: Todo medicamento tiene lote y caducidad

    Escenario: Recepción con trazabilidad
      Dado que llega mercancía de medicamentos
      Cuando se registra recepción
      Entonces se registra: medicamento, lote, caducidad, cantidad, proveedor, factura
      # @evidence EVID-MED-001

    Escenario: Medicamento caducado rechazado
      Dado que medicamento tiene caducidad vencida
      Cuando se intenta recepcionar
      Entonces recepción es rechazada y se informa al proveedor
      # @evidence EVID-MED-002
      # @invariante INV-MED-001

  Regla: Dispensación requiere receta válida

    Escenario: Dispensación exitosa
      Dado que existe receta firmada
      Cuando farmacia dispensa
      Entonces verifica: receta válida, medicamento correcto, lote válido, caducidad vigente
      Y descuenta inventario y registra dispensación
      # @evidence EVID-MED-003

    Escenario: Dispensación sin receta rechazada
      Dado que se intenta dispensar sin receta
      Cuando farmacia verifica
      Entonces dispensación es rechazada
      # @evidence EVID-MED-004
      # @invariante INV-MED-002

  Regla: Medicamentos controlados requieren registro especial

    Escenario: Estupefaciente con bitácora
      Dado que se dispensa estupefaciente
      Cuando se procesa
      Entonces se registra en bitácora: medicamento, cantidad, paciente, médico, fecha, receta
      Y se verifica stock no exceda límite legal
      # @evidence EVID-MED-005

  Regla: Inventario se actualiza en tiempo real

    Escenario: Descuento automático
      Dado que se dispensa medicamento
      Cuando se completa dispensación
      Entonces stock se decrementa inmediatamente
      Y se genera alerta si stock crítico
      # @evidence EVID-MED-006

  Regla: Farmacia opera offline

    Escenario: Dispensación sin internet
      Dado que no hay conexión
      Cuando farmacia dispensa
      Entonces dispensación se registra localmente
      Y se sincroniza al reconectar
      # @evidence EVID-MED-007

    Escenario: Inventario conciliado post-sync
      Dado que se reconecta después de dispensaciones offline
      Cuando se sincroniza
      Entonces se verifica consistencia de inventario
      # @evidence EVID-MED-008
