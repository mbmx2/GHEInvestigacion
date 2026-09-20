# language: es
Característica: Validación Automática para Embarazo
  Como médico de GHE
  Quiero validación automática de cada dato
  Para prevenir errores que pongan en riesgo madre y bebé

  Contexto:
    Dado que el sistema está activo
    Y que se registran datos en paciente embarazada

  Escenario: Validar PA por trimestre
    Dado que se registra presión arterial
    Cuando se valida contra valores por trimestre
    Entonces:
      | PA      | Semana | Resultado         | Nivel       |
      | 118/72  | 20     | ✅ Normal         | Info        |
      | 135/88  | 28     | ⚠️ Elevada        | Advertencia |
      | 145/92  | 30     | ⚠️ PA gestacional | Advertencia |
      | 160/100 | 32     | ❌ Severa         | Bloqueo     |
      | 170/110 | 25     | ❌ Emergencia     | Bloqueo     |

  Escenario: Validar hemoglobina por trimestre
    Dado que se registra Hb
    Cuando se valida
    Entonces:
      | Hb    | Trim. | Resultado      | Nivel       |
      | 12.5  | 1     | ✅ Normal      | Info        |
      | 10.2  | 2     | ⚠️ Anemia      | Advertencia |
      | 8.5   | 3     | ⚠️ Moderada    | Advertencia |
      | 6.8   | 2     | ❌ Severa      | Bloqueo     |

  Escenario: Validar glucosa
    Dado que se registra glucosa
    Cuando se valida
    Entonces:
      | Glucosa | Contexto    | Resultado       | Nivel       |
      | 85      | Ayunas      | ✅ Normal       | Info        |
      | 105     | Ayunas      | ⚠️ Alto         | Advertencia |
      | 145     | 1h post 50g | ⚠️ Positivo     | Advertencia |
      | 200     | Ayunas      | ❌ Diabetes     | Bloqueo     |

  Escenario: Validar TSH
    Dado que se registra TSH
    Cuando se valida
    Entonces:
      | TSH | Trim. | Resultado     | Nivel       |
      | 1.5 | 1     | ✅ Normal     | Info        |
      | 3.2 | 1     | ⚠️ Alto 1T    | Advertencia |
      | 3.8 | 2     | ⚠️ Alto 2T    | Advertencia |
      | 5.5 | 1     | ❌ Crítico    | Bloqueo     |

  Escenario: Validar creatinina
    Dado que se registra creatinina
    Cuando se valida
    Entonces:
      | Cr  | Resultado        | Nivel       |
      | 0.5 | ✅ Normal        | Info        |
      | 0.8 | ⚠️ Elevada       | Advertencia |
      | 1.2 | ❌ Anormal       | Bloqueo     |

  Escenario: Bloquear ibuprofeno >32 semanas
    Dado que médico prescribe ibuprofeno a 35 semanas
    Entonces el sistema bloquea con:
      | Campo                     |
      | ❌ CONTRAINDICADO >32 sem |
      | Riesgo: cierre conducto   |
      | Alternativa: paracetamol  |
    Y requiere justificación documentada

  Escenario: Bloquear IECA en embarazada
    Dado que médico prescribe enalapril en embarazo
    Entonces el sistema bloquea con:
      | Campo                     |
      | ❌ IECA contraindicado    |
      | Riesgo: displasia renal   |
      | Alternativa: labetalol    |

  Escenario: Verificar dosis máxima
    Dado que médico prescribe paracetamol 1000mg cada 4h
    Entonces dosis diaria 6000mg > límite 4000mg → Bloqueo

  Escenario: Detectar interacción medicamentosa
    Dado que paciente toma warfarina
    Cuando médico prescribe aspirina
    Entonces alerta: ⚠️ Interacción → sangrado severo

  Escenario: Detectar tendencia de PA
    Dado que PA ha subido en 3 controles
    Cuando se evalúa tendencia
    Entonces:
      | Semana | PA      |
      | 20     | 118/72  |
      | 24     | 128/80  |
      | 28     | 135/88  |
    Y alerta: "Vigilar preeclampsia"

  Escenario: Justificación obligatoria
    Dado que sistema bloquea prescripción
    Cuando médico insiste
    Entonces requiere:
      | Campo                     | Obligatorio |
      | Justificación clínica     | Sí          |
      | Beneficio esperado        | Sí          |
      | Riesgo aceptado           | Sí          |
      | Firma                     | Sí          |
    Y registra en audit log
