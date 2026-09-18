# language: es
# FASE 1: Validación en Tiempo Real - Módulo Maternidad
Característica: Validación Automática para Embarazo (GHE Maternidad)
  Como médico del proyecto GHE
  Quiero que el sistema valide automáticamente cada dato que registro
  Para que nunca pase un error que ponga en riesgo a la madre o al bebé

  # ─────────────────────────────────────────────────────────────
  # 1. VALIDACIÓN DE SIGNOS VITALES POR TRIMESTRE
  # ─────────────────────────────────────────────────────────────

  Escenario: Validar PA en contexto obstétrico
    Dado que se registra presión arterial en paciente embarazada
    Cuando se valida contra valores por trimestre
    Entonces:
      | PA registrada | Edad gestacional | Resultado    | Nivel       |
      | 118/72        | 20 semanas       | ✅ Normal    | Info        |
      | 135/88        | 28 semanas       | ⚠️ Elevada   | Advertencia |
      | 145/92        | 30 semanas       | ⚠️ PA gestacional | Advertencia |
      | 160/100       | 32 semanas       | ❌ Severa    | Bloqueo     |
      | 170/110       | 25 semanas       | ❌ Emergencia| Bloqueo     |

  Escenario: Validar hemoglobina por trimestre
    Dado que se registra Hb en paciente embarazada
    Cuando se valida
    Entonces:
      | Hb     | Trimestre | Resultado    | Nivel       |
      | 12.5   | 1         | ✅ Normal    | Info        |
      | 10.2   | 2         | ⚠️ Anemia    | Advertencia |
      | 8.5    | 3         | ⚠️ Moderada  | Advertencia |
      | 6.8    | 2         | ❌ Severa    | Bloqueo     |

  Escenario: Validar glucosa en embarazo
    Dado que se registra glucosa en embarazada
    Cuando se valida
    Entonces:
      | Glucosa | Contexto       | Resultado    | Nivel       |
      | 85      | Ayunas         | ✅ Normal    | Info        |
      | 105     | Ayunas         | ⚠️ Alto      | Advertencia |
      | 145     | 1h post 50g    | ⚠️ Positivo  | Advertencia |
      | 200     | Ayunas         | ❌ Diabetes  | Bloqueo     |

  Escenario: Validar TSH en embarazo
    Dado que se registra TSH en embarazada
    Cuando se valida
    Entonces:
      | TSH  | Trimestre | Resultado    | Nivel       |
      | 1.5  | 1         | ✅ Normal    | Info        |
      | 3.2  | 1         | ⚠️ Alto 1T   | Advertencia |
      | 3.8  | 2         | ⚠️ Alto 2T   | Advertencia |
      | 5.5  | 1         | ❌ Crítico   | Bloqueo     |

  Escenario: Validar creatinina en embarazo
    Dado que se registra creatinina en embarazada
    Cuando se valida
    Entonces:
      | Cr   | Resultado    | Nivel       | Explicación                          |
      | 0.5  | ✅ Normal    | Info        | Normal en embarazo                   |
      | 0.8  | ⚠️ Elevada   | Advertencia | "Creatinina alta para embarazada - evaluar función renal" |
      | 1.2  | ❌ Anormal   | Bloqueo     | "Creatinina muy alta - IRA/ERC en embarazada" |

  # ─────────────────────────────────────────────────────────────
  # 2. VALIDACIÓN DE MEDICAMENTOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Bloquear medicamento contraindicado
    Dado que el médico prescribe Ibuprofeno
    Cuando la paciente tiene 35 semanas de gestación
    Entonces el sistema bloquea:
      | Alerta                          |
      | ❌ IBUPROFENO CONTRAINDICADO >32 semanas |
      | Riesgo: Cierre prematuro del conducto arterioso |
      | Alternativa: Paracetamol        |
    Y requiere justificación documentada para proceder

  Escenario: Bloquear IECA en embarazada
    Dado que el médico prescribe Enalapril
    Cuando la paciente está embarazada
    Entonces el sistema bloquea:
      | Alerta                          |
      | ❌ IECA CONTRAINDICADO EN EMBARAZO |
      | Riesgo: Displasia renal fetal, oligohidramnios |
      | Alternativa: Labetalol          |

  Escenario: Verificar dosis de paracetamol
    Dado que el médico prescribe Paracetamol 1000mg cada 4 horas
    Cuando se calcula dosis diaria
    Entonces:
      | Dosis diaria | Límite    | Resultado    |
      | 6000mg       | 4000mg    | ❌ Excede máximo |

  # ─────────────────────────────────────────────────────────────
  # 3. VALIDACIÓN CRUZADA
  # ─────────────────────────────────────────────────────────────

  Escenario: Detectar combinación peligrosa
    Dado que la paciente toma Warfarina
    Cuando el médico prescribe Aspirina
    Entonces el sistema alerta:
      | Alerta                          |
      | ⚠️ INTERACCIÓN: Warfarina + Aspirina |
      | Riesgo: Sangrado severo         |
      | Recomendar: Evaluar riesgo-beneficio |

  Escenario: Detectar tendencia preocupante
    Dado que la paciente ha tenido PA creciente en 3 controles
    Cuando se evalúa tendencia
    Entonces:
      | Control  | PA       |
      | Semana 20 | 118/72  |
      | Semana 24 | 128/80  |
      | Semana 28 | 135/88  |
      | Alerta: "Tendencia ascendente de PA - vigilar preeclampsia" |

  # ─────────────────────────────────────────────────────────────
  # 4. JUSTIFICACIÓN OBLIGATORIA
  # ─────────────────────────────────────────────────────────────

  Escenario: Justificación para medicamento bloqueado
    Dado que el sistema bloquea una prescripción
    Cuando el médico insiste
    Entonces el sistema requiere:
      | Campo                      | Obligatorio |
      | Justificación clínica     | Sí          |
      | Beneficio esperado        | Sí          |
      | Riesgo aceptado           | Sí          |
      | Firma del médico          | Sí          |
    Y la justificación se registra en audit log
