# language: es
# @id GHE-LAB-001
# @type business-rule
# @domain laboratory
# @layer clinical
# @risk s1
# @owner lab-director
# @status proposed
# @requirement REQ-LAB-001
# @risk-control CTRL-LAB-001
# @regulation NOM-024
@domain:laboratory @type:business-rule @risk:s1 @status:proposed
Característica: Flujo Completo de Laboratorio
  Como director de laboratorio
  Quiero un flujo completo desde solicitud hasta resultado
  Para que cada estudio sea rastreado y los resultados lleguen a tiempo

  Regla: Toda solicitud genera orden rastreable

    Escenario: Solicitud genera orden
      Dado que médico solicita estudio de laboratorio
      Cuando se genera la orden
      Entonces se asigna ID único, médico solicitante, paciente, prioridad
      # @evidence EVID-LAB-001

  Regla: Resultados críticos se notifican inmediatamente

    Escenario: Valor crítico genera alerta
      Dado que resultado es valor crítico
      Cuando se detecta
      Entonces alerta inmediata al médico
      Y no libera resultado hasta confirmación
      # @evidence EVID-LAB-002

    Escenario: Resultado normal se libera
      Dado que resultado es normal
      Cuando se verifica
      Entonces resultado se libera automáticamente
      # @evidence EVID-LAB-003

  Regla: Todo resultado se vincula al expediente

    Escenario: Resultado vinculado
      Dado que se libera resultado
      Cuando se procesa
      Entonces se vincula al expediente con fecha y responsable
      # @evidence EVID-LAB-004

  Regla: Muestras tienen trazabilidad completa

    Escenario: Trazabilidad
      Dado que se toma muestra
      Cuando se procesa
      Entonces se registra: quién, cuándo, tipo, calidad, transporte
      # @evidence EVID-LAB-005

  Regla: Laboratorio opera offline

    Escenario: Procesamiento sin internet
      Dado que no hay conexión
      Cuando se procesa muestra
      Entonces se procesa localmente y se sincroniza después
      # @evidence EVID-LAB-006
