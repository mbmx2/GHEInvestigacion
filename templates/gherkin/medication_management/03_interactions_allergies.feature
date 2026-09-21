# language: es
# @id GHE-MEDICATION-INTERACTION-001
# @type clinical
# @domain pharmacy
# @layer domain
# @risk s1
# @owner pharmacist
# @status proposed
# @requirement REQ-MEDICATION-INTERACTION
# @risk-control CTRL-MEDICATION-INTERACTION
# @regulation NOM-004
@domain:pharmacy @type:clinical @risk:s1 @status:proposed
Característica: Interacciones Medicamentosas y Alergias
  Como farmacéutico del hospital
  Quiero verificación automática de interacciones y alergias
  Para prevenir eventos adversos medicamentosos

  Regla: Toda prescripción se verifica contra alergias

    Escenario: Alergia detectada
      Dado que paciente tiene alergia a "Sulfonamida"
      Cuando se prescribe medicamento que contiene sulfonamida
      Entonces sistema BLOQUEA
      Y sugiere alternativa segura

  Regla: Interacciones se verifican automáticamente

    Escenario: Interacción detectada
      Dado que paciente toma "Warfarina"
      Cuando se prescribe "Ibuprofeno"
      Entonces alerta: "Riesgo de sangrado severo"
      Y sugiere: "Considerar paracetamol"

  Regla: Dosis se ajusta por función renal

    Escenario: Ajuste por función renal
      Dado que paciente tiene CrCl 30 mL/min
      Cuando se prescribe antibiótico renal
      Entonces sistema ajusta dosis
      Y muestra: "Dosis reducida por función renal"

  Regla: Verificación cruzada completa

    Escenario: Verificación completa antes de dispensar
      Dado que se va a dispensar medicamento
      Cuando se verifica
      Entonces:
        | Verificación              |
        | Alergias                  |
        | Interacciones            |
        | Dosis por peso           |
        | Función renal            |
        | Edad gestacional         |
        | Límite de controlado     |
