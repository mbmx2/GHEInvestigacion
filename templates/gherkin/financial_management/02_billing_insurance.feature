# language: es
# @id GHE-FINANCIAL-BILLING-001
# @type business
# @domain finance
# @layer operations
# @risk s2
# @owner finance-director
# @status proposed
# @requirement REQ-FINANCIAL-BILLING
# @risk-control CTRL-FINANCIAL-BILLING
# @regulation NOM-024
@domain:finance @type:business @risk:s2 @status:proposed
Característica: Facturación y Seguros
  Como director financiero del hospital
  Quiero facturación automática y gestión de seguros
  Para que el hospital sea financieramente sostenible

  Regla: Todo servicio genera cargo automáticamente

    Escenario: Cargo generado
      Dado que paciente recibe servicio
      Cuando se completa servicio
      Entonces se genera cargo con código CUPS/código de servicio

  Regla: Seguros se verifican antes del servicio

    Escenario: Cobertura verificada
      Dado que paciente tiene seguro
      Cuando se programa servicio
      Entonces se verifica cobertura y copago

  Regla: Facturación se genera automáticamente

    Escenario: Factura generada
      Dado que se genera factura
      Cuando se verifica
      Entonces incluye: servicios, montos, descuentos, total, IVA

  Regla: Cuentas por cobrar se monitorean

    Escenario: Cuentas pendientes
      Dado que se revisan cuentas
      Cuando se evalúa
      Entonces: aging de cuentas, montos vencidos, acciones de cobro
