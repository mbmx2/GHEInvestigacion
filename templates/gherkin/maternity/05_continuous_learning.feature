# language: es
# FASE 5: Aprendizaje Continuo - Módulo Maternidad
Característica: Aprendizaje Continuo (GHE Maternidad)
  Como responsable de calidad de la maternidad
  Quiero que el sistema aprenda de cada paciente atendido
  Para que cada vez sea más preciso y útil

  # ─────────────────────────────────────────────────────────────
  # 1. FEEDBACK DEL MÉDICO
  # ─────────────────────────────────────────────────────────────

  Escenario: Registrar feedback de sugerencia
    Dado que el sistema sugiere "riesgo de preeclampsia 23%"
    Cuando el médico evalúa
    Entonces puede registrar:
      | Feedback                      | Acción del sistema |
      | "Correcto, voy a hacer más estudios" | Confirmar predicción |
      | "Incorrecto, no hay riesgo"  | Rechazar predicción |
      | "Parcialmente correcto"      | Ajustar modelo |

  Escenario: Feedback sobre guía clínica
    Dado que el sistema muestra protocolo de preeclampsia
    Cuando el médico completa pasos
    Entonces registra:
      | Campo                      | Valor              |
      | Pasos completados         | 6/6                |
      | Tiempo de atención        | 25 minutos         |
      | Outcome de la paciente    | Estable            |
      | Utilidad de la guía       | Alta (1-5: 5)      |

  # ─────────────────────────────────────────────────────────────
  # 2. OUTCOME TRACKING
  # ─────────────────────────────────────────────────────────────

  Escenario: Registrar outcome de predicción
    Dado que el sistema predijo preeclampsia con 23% de riesgo
    Cuando se registra el outcome real
    Entonces:
      | Predicción                  | Outcome real        |
      | Riesgo: 23% (alto)        | Sí desarrolló preeclampsia |
      | Resultado                  | Verdadero positivo  |
    Y el sistema actualiza métricas:
      | Métrica                    | Valor              |
      | Verdaderos positivos       | 8                  |
      | Falsos positivos           | 3                  |
      | Verdaderos negativos       | 45                 |
      | Falsos negativos           | 1                  |
      | Sensibilidad               | 89%                |
      | Especificidad              | 94%                |
      | PPV                        | 73%                |
      | NPV                        | 98%                |

  # ─────────────────────────────────────────────────────────────
  # 3. RE-ENTRENAMIENTO DE MODELOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Re-entrenamiento trimestral
    Dado que se acumulan datos de 3 meses
    Cuando se ejecuta re-entrenamiento
    Entonces:
      | Paso                       |
      | 1. Recopilar outcomes recientes |
      | 2. Re-entrenar modelo con nuevos datos |
      | 3. Comparar modelo viejo vs. nuevo |
      | 4. Si mejora → actualizar |
      | 5. Si no mejora → mantener actual |
      | 6. Documentar cambio |

  # ─────────────────────────────────────────────────────────────
  # 4. MÉTRICAS DE PERFORMANCE
  # ─────────────────────────────────────────────────────────────

  Escenario: Dashboard de performance de modelos
    Dado que se consulta dashboard de modelos
    Cuando se genera
    Entonces incluye:
      | Modelo                      | Pacientes | AUC  | Sensibilidad | Especificidad |
      | Preeclampsia                | 120       | 0.87 | 89%          | 94%           |
      | Parto prematuro             | 95        | 0.82 | 85%          | 88%           |
      | Diabetes gestacional        | 110       | 0.81 | 82%          | 90%           |
      | Depresión posparto          | 80        | 0.76 | 78%          | 85%           |
