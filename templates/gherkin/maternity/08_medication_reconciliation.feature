# language: es
# Reconciliación de Medicamentos en Embarazo
Característica: Seguridad de Medicamentos (GHE Maternidad)
  Como médico de la maternidad
  Quiero que el sistema verifique cada prescripción contra el perfil de la paciente
  Para nunca cometer un error de medicación que afecte a la madre o al bebé

  # ─────────────────────────────────────────────────────────────
  # 1. VERIFICACIÓN AUTOMÁTICA
  # ─────────────────────────────────────────────────────────────

  Escenario: Verificación al prescribir
    Dado que el médico selecciona medicamento
    Cuando se genera receta
    Entonces el sistema verifica automáticamente:
      | Verificación               | Estado    |
      | ¿Es seguro en embarazo?    | ✅/❌     |
      | ¿Es seguro en esta semana? | ✅/❌     |
      | ¿Es seguro con peso actual?| ✅/❌     |
      | ¿Interactúa con otros meds?| ✅/❌/⚠️ |
      | ¿Dosis correcta para peso? | ✅/❌     |
      | ¿Requiere ajuste renal?    | ✅/❌     |

  # ─────────────────────────────────────────────────────────────
  # 2. BASE DE DATOS DE MEDICAMENTOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Consulta de seguridad de medicamento
    Dado que el médico busca "Paracetamol"
    Cuando consulta seguridad
    Entonces el sistema muestra:
      | Campo                      | Información       |
      | Nombre genérico            | Acetaminofén      |
      | Categoría FDA             | B (seguro)        |
      | Seguro en embarazo        | Sí                |
      | Dosis máxima              | 4g/día            |
      | Riesgo fetal              | Mínimo            |
      | Excreción en leche        | Baja              |
      | Alternativas              | Ibuprofeno <32sem |

  Escenario: Consulta de medicamento contraindicado
    Dado que el médico busca "Ibuprofeno"
    Cuando consulta seguridad
    Entonces el sistema muestra:
      | Campo                      | Información       |
      | Categoría FDA             | C/D (según trimestre) |
      | Seguro en embarazo        | SOLO <32 semanas   |
      | Riesgo                    | Cierre conducto arterioso |
      | Alternativas              | Paracetamol        |
      | Alerta                    | ❌ CONTRAINDICADO >32 semanas |

  # ─────────────────────────────────────────────────────────────
  # 3. VERIFICACIÓN DE INTERACCIONES
  # ─────────────────────────────────────────────────────────────

  Escenario: Detección de interacción medicamentosa
    Dado que la paciente toma Labetalol
    Cuando el médico prescribe Aspirina
    Entonces el sistema alerta:
      | Alerta                      |
      | ⚠️ INTERACCIÓN: Labetalol + Aspirina |
      | Efecto: Posible reducción de efecto antihipertensivo |
      | Severidad: Moderada |
      | Acción: Monitorear PA de cerca |

  # ─────────────────────────────────────────────────────────────
  # 4. AJUSTE POR PESO
  # ─────────────────────────────────────────────────────────────

  Escenario: Cálculo de dosis por peso
    Dado que la paciente pesa 55 kg
    Cuando se prescribe Ceftriaxona
    Entonces el sistema calcula:
      | Cálculo                     | Resultado       |
      | Dosis estándar             | 1-2g IV/día     |
      | Ajuste por peso            | 50mg/kg = 2.75g |
      | Dosis máxima               | 4g/día          |
      | Dosis recomendada          | 2g IV/día (máxima segura) |

  # ─────────────────────────────────────────────────────────────
  # 5. TRACKING DE ADHERENCIA
  # ─────────────────────────────────────────────────────────────

  Escenario: Registro de adherencia
    Dado que la paciente toma medicamentos diarios
    Cuando se registra adherencia
    Entonces el sistema calcula:
      | Medicamento | Dosis prescritas | Dosis tomadas | Adherencia |
      | Hierro      | 30               | 24            | 80%        |
      | Ácido fólico| 30               | 28            | 93%        |
      | Labetalol   | 60               | 55            | 92%        |
    Y alerta si adherencia <80%
  