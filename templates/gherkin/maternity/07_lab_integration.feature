# language: es
# Laboratorio Integrado - Interpretación Automática
Característica: Integración de Laboratorio (GHE Maternidad)
  Como médico de la maternidad
  Quiero que el sistema interprete automáticamente resultados de laboratorio
  Para tomar decisiones más rápidas y precisas

  # ─────────────────────────────────────────────────────────────
  # 1. INTERPRETACIÓN AUTOMÁTICA
  # ─────────────────────────────────────────────────────────────

  Escenario: Interpretación de biometría hemática
    Dado que se recibe resultado de BHC
    Cuando el sistema interpreta
    Entonces clasifica:
      | Parámetro | Resultado | Interpretación | Acción |
      | Hb 9.8    | Bajo      | Anemia moderada en embarazo | Iniciar hierro IV |
      | Plaquetas 95,000 | Bajo | Trombocitopenia | Evaluar HELLP |
      | Leucocitos 15,000 | Alto | Leucocitosis | Evaluar infección |

  Escenario: Interpretación de química sanguínea
    Dado que se recibe química completa
    Cuando el sistema interpreta
    Entonces clasifica:
      | Parámetro | Resultado | Interpretación |
      | Glucosa 145 mg/dL | Alto | Sospecha diabetes gestacional → curva tolerancia |
      | Creatinina 0.8 | Alto para embarazo | Evaluar función renal |
      | Uric acid 5.2 | Alto | Asociado a preeclampsia |
      | AST 75 | Alto | HELLP si plaquetas bajas |

  # ─────────────────────────────────────────────────────────────
  # 2. ALERTAS DE VALORES CRÍTICOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Alerta de valor crítico de laboratorio
    Dado que se detecta valor crítico
    Cuando se evalúa
    Entonces:
      | Valor                       | Nivel       | Acción    |
      | Plaquetas <50,000          | 🔴 Crítico | Notificar médico inmediato |
      | AST >200                   | 🔴 Crítico | Notificar médico inmediato |
      | Hemoglobina <6             | 🔴 Crítico | Notificar médico inmediato |
      | Glucosa >300               | 🔴 Crítico | Notificar médico inmediato |
      | Creatinina >2.0            | 🔴 Crítico | Notificar médico inmediato |

  # ─────────────────────────────────────────────────────────────
  # 3. HISTORIAL DE TENDENCIAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Gráfica de tendencia de hemoglobina
    Dado que la paciente tiene múltiples BHC
    Cuando se muestra tendencia
    Entonces el sistema grafica:
      | Fecha        | Hb     | Observación |
      | Sem 12       | 11.5   | Normal      |
      | Sem 20       | 10.8   | Leve ↓      |
      | Sem 28       | 10.2   | Moderada ↓  |
      | Sem 32       | 9.8    | Moderada ↓  |
    Y alerta: "Tendencia descendente de Hb - evaluar causa"

  # ─────────────────────────────────────────────────────────────
  # 4. CORRELACIÓN CON DIAGNÓSTICOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Correlación de resultados con diagnósticos
    Dado que la paciente tiene HTA gestacional
    Cuando se revisan resultados
    Entonces el sistema verifica:
      | Parámetro | Asociación esperada | Estado |
      | Uric acid | Elevado en preeclampsia | Verificar |
      | Plaquetas | Bajas en HELLP | Verificar |
      | AST/ALT | Elevados en HELLP | Verificar |
      | Creatinina | Elevada en daño renal | Verificar |

  # ─────────────────────────────────────────────────────────────
  # 5. PANEL OBSTÉTRICO ESTÁNDAR
  # ─────────────────────────────────────────────────────────────

  Escenario: Panel de estudios por trimestre
    Dado que se solicitan estudios según trimestre
    Cuando se genera orden
    Entonces incluye:
      | Trimestre | Estudios                  |
      | 1 (sem 4-12) | BHC, glucosa, creatinina, VDRL, grupo/rh,HBsAg, TSH, Urocultivo |
      | 2 (sem 20-24) | BHC, glucosa, curva tolerancia, perfil lipídico |
      | 3 (sem 28-32) | BHC, glucosa, creatinina, uricemia, AST, plaquetas |
      | Pre-parto | BHC, coagulación, grupo/rh, VDRL |
  