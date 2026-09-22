# language: es
# @id GHE-INT-003
# @type business-rule
# @domain integration
# @layer interoperability
# @risk s2
# @owner integration-lead
# @status proposed
# @requirement REQ-INT-003
# @risk-control CTRL-INT-003
# @regulation NOM-024 HL7v2
@domain:integration @type:business-rule @risk:s2 @status:proposed
Característica: Integración con Sistemas Legacy — ADT y HL7v2
  Como integrador de sistemas
  Quiero compatibilidad con sistemas legacy del hospital
  Para que GHE coexista con infraestructura existente

  Regla: Mensajes ADT se procesan

    Escenario: ADT A01 — Admisión
      Dado que sistema legacy envía ADT A01
      Cuando GHE recibe mensaje
      Entonces crea registro de admisión con:
        | Campo HL7v2        | Campo GHE         |
        | PID-3 (ID paciente)| Patient.id        |
        | PV1-2 (clase)      | Admission.class   |
        | PV1-3 (ubicación)  | Location.code     |
        | PV1-10 (hospital)  | Facility.id       |
      Y ACK se retorna al sistema legacy

    Escenario: ADT A03 — Alta
      Dado que sistema legacy envía ADT A03
      Cuando GHE recibe mensaje
      Entonces cierra admisión
      Y actualiza estado del paciente
      Y libera cama en sistema de ubicaciones

    Escenario: ADT A08 — Actualización
      Dado que sistema legacy envía ADT A08
      Cuando GHE recibe mensaje
      Entonces actualiza información del paciente
      Y mantiene historial de cambios

  Regla: HL7v2 se valida antes de procesar

    Escenario: Mensaje HL7v2 mal formado
      Dado que sistema legacy envía HL7v2 con campos obligatorios faltantes
      Cuando GHE valida mensaje
      Entonces rechaza con NAK
      Y registra error de validación
      Y notifica al integrador

    Escenario: Mensaje HL7v2 duplicado
      Dado que sistema legacy reenvía mismo mensaje
      Cuando GHE detecta MSH-10 duplicado
      Entonces ignora el mensaje duplicado
      Y retorna ACK sin procesar

  Regla: Resultados de laboratorio se reciben

    Escenario: ORU para resultados
      Dado que laboratorio envía ORU con resultado
      Cuando GHE recibe
      Entonces vincula resultado al expediente
      Y verifica si es valor crítico
      Y genera alerta si aplica

  Regla: Sincronización de catálogos

    Escenario: Actualización de catálogo de médicos
      Dado que sistema de RRHH actualiza lista de médicos
      Cuando envía actualización
      Entonces GHE sincroniza catálogo
      Y mantiene mapeo de códigos legacy → GHE

  Regla: Integración opera con tolerancia a fallos

    Escenario: Sistema legacy no responde
      Dado que GHE envía mensaje a sistema legacy
      Cuando no recibe ACK en 30 segundos
      Entonces reintenta 3 veces con backoff
      Y almacena mensaje en cola de retry
      Y procesa localmente si es posible

    Escenario: Sistema legacy fuera de servicio
      Dado que sistema legacy está caído
      Cuando llegan mensajes del sistema legacy
      Entonces GHE almacena en cola
      Y procesa cuando sistema se recupera
      # @evidence EVID-INT-LEGACY-001
