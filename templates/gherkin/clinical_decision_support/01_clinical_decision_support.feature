# language: es
# @id GHE-CDS-001
# @type business-rule
# @domain clinical
# @layer domain
# @risk s1
# @owner medical-director
# @status proposed
# @requirement REQ-CDS-001
# @risk-control CTRL-CDS-001
# @regulation NOM-004
@domain:clinical @type:business-rule @risk:s1 @status:proposed
Característica: Soporte de Decisión Clínica (CDS)
  Como médico del hospital
  Quiero alertas automáticas basadas en reglas clínicas
  Para prevenir errores de prescripción y detectar complicaciones

  Regla: El sistema verifica interacciones medicamentosas

    Escenario: Interacción detectada
      Dado que paciente toma Warfarina
      Cuando médico prescribe Ibuprofeno
      Entonces sistema genera alerta con riesgo "Mayor riesgo de sangrado"
      Y sugiere alternativa "Paracetamol"
      # @evidence EVID-CDS-001

    Escenario: Medicamento contraindicado en embarazo
      Dado que paciente está embarazada de 35 semanas
      Cuando médico prescribe Ibuprofeno
      Entonces sistema bloquea prescripción
      Y exige justificación documentada
      # @evidence EVID-CDS-002
      # @invariante INV-CDS-001

  Regla: El sistema valida dosis según peso

    Escenario: Sobredosis potencial
      Dado que paciente pesa 45 kg
      Cuando se prescribe dosis para 70 kg
      Entonces sistema alerta sobredosis
      Y calcula dosis correcta por peso
      # @evidence EVID-CDS-003

  Regla: Detecta valores de laboratorio críticos

    Escenario: Potasio crítico
      Dado que resultado muestra K = 6.2 mEq/L
      Cuando se procesa resultado
      Entonces alerta CRÍTICA inmediata
      Y notifica al médico
      # @evidence EVID-CDS-004

  Regla: Sugiere seguimiento según guías

    Escenario: Falta seguimiento en diabetes
      Dado que paciente diabético no tiene HbA1c en 6 meses
      Cuando se revisa expediente
      Entonces alerta y sugiere solicitar HbA1c
      # @evidence EVID-CDS-005
