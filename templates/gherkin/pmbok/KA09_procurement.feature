# language: es
# @id GHE-PMBOK-KA09-001
# @type practice
# @domain management
# @layer governance
# @risk s2
# @owner project-manager
# @status proposed
# @requirement PRACTICE-GHE-PMBOK-009
# @risk-control CTRL-PMBOK-KA09
# @regulation N/A
@domain:management @type:practice @risk:s2 @status:proposed
Característica: PMBOK KA-09 - Gestión de Adquisiciones
  Como director del proyecto GHE
  Quiero que las adquisiciones se gestionen eficientemente
  Para obtener los mejores recursos al menor costo

  Regla: Toda compra tiene proceso documentado

    Escenario: Compra documentada
      Dado que se adquiere un bien
      Cuando se procesa
      Entonces: solicitud, cotización, aprobación, recepción, registro
      # @evidence EVID-PMBOK-KA09-001

  Regla: Proveedores se evalúan

    Escenario: Evaluación de proveedor
      Dado que se evalúa proveedor
      Cuando se califica
      Entonces: calidad, precio, servicio, cumplimiento
      # @evidence EVID-PMBOK-KA09-002

  Regla: Contratos se gestionan

    Escenario: Contrato documentado
      Dado que se firma contrato
      Cuando se registra
      Entonces: alcance, costos, SLA, vigencia
      # @evidence EVID-PMBOK-KA09-003
