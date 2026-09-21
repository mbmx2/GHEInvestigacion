# language: es
# @id GHE-CDS-PAT-001
# @type clinical
# @domain clinical
# @layer domain
# @risk s1
# @owner medical-director
# @status proposed
# @requirement REQ-CDS-PAT
# @risk-control CTRL-CDS-PAT
# @regulation NOM-004
@domain:clinical @type:clinical @risk:s1 @status:proposed
Característica: CDS por Patología - Alergias
  Como médico del hospital
  Quiero que el CDS verifique alergias antes de cada prescripción
  Para que nunca se administre un medicamento alergénico

  Regla: Toda prescripción se verifica contra alergias del paciente

    Escenario: Alergia conocida detectada
      Dado que paciente tiene alergia a "Penicilina" (anafilaxia)
      Cuando médico prescribe "Amoxicilina"
      Entonces sistema BLOQUEA prescripción
      Y muestra: "ALERGIA CONOCIDA - Penicilina - Anafilaxia"
      Y sugiere alternativa: "Azitromicina" o "Cefalexina"
      # @evidence EVID-CDS-ALG-001

    Escenario: Alergia no detectada
      Dado que paciente NO tiene alergias registradas
      Cuando médico prescribe antibiótico
      Entonces sistema muestra advertencia: "Sin alergias registradas - verificar con paciente"
      # @evidence EVID-CDS-ALG-002

    Escenario: Alergia registrada pero prescripción ignorada
      Dado que médico insiste en prescribir medicamento alergénico
      Cuando se procede
      Entonces sistema requiere justificación documentada obligatoria
      Y registra en audit log con riesgo: "Prescripción con alergia conocida"
      # @evidence EVID-CDS-ALG-003

  Regla: Cada paciente tiene perfil de alergias actualizado

    Escenario: Perfil de alergias completo
      Dado que se registra alergia
      Cuando se guarda
      Entonces incluye:
        | Campo                     |
        | Sustancia                 |
        | Tipo (droga/alimento/otro)|
        | Reacción                  |
        | Severidad                 |
        | Fecha de primera reacción |
        | Confirmada por pruebas    |
