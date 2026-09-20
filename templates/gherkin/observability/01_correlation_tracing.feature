# language: es
# Observabilidad y Correlación End-to-End
Característica: Observabilidad del Sistema (GHE)
  Como responsable de operaciones del hospital
  Quiero que cada operación sea rastreable de extremo a extremo
  Para diagnosticar problemas y garantizar trazabilidad

  # ─────────────────────────────────────────────────────────────
  # 1. CORRELACIÓN DE OPERACIONES
  # ─────────────────────────────────────────────────────────────

  Escenario: Correlation ID end-to-end
    Dado que se ejecuta una operación (ej: crear receta)
    Cuando se procesa
    Entonces cada capa registra el mismo correlation_id:
      | Capa                      | Dónde se registra |
      | UI                        | correlation_id en request |
      | API                       | correlation_id en log |
      | Domain                    | correlation_id en evento |
      | Database                  | correlation_id en audit_log |
      | Sync                      | correlation_id en outbox |
    Y el mismo ID permite rastrear la operación completa

  # ─────────────────────────────────────────────────────────────
  # 2. TRAZABILIDAD DE DATOS CLÍNICOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Trazabilidad de prescripción
    Dado que se crea una prescripción
    Cuando se rastrea su ciclo de vida
    Entonces se registra:
      | Hito                      | Timestamp | Usuario |
      | Creación de prescripción  | UTC       | Médico  |
      | Validación CDS            | UTC       | Sistema |
      | Firma electrónica         | UTC       | Médico  |
      | Envío a farmacia          | UTC       | Sistema |
      | Dispensación              | UTC       | Farmacéutico |
      | Verificación post-dispensación | UTC  | Sistema |
    Y cada hilo tiene hash de integridad

  # ─────────────────────────────────────────────────────────────
  # 3. PRIVACIDAD DE LOGS
  # ─────────────────────────────────────────────────────────────

  Escenario: Lo que NO se debe registrar
    Dado que se configuran logs
    Cuando se verifica
    Entonces NO se registra:
      | Dato                       | Estado |
      | CURP completa en logs      | ❌ Ofuscar |
      | Passwords                 | ❌ Nunca |
      | Tokens                    | ❌ Nunca |
      | Datos clínicos completos  | ❌ Solo IDs referenciados |
      | Payloads completos        | ❌ Solo metadatos    |

  Escenario: Lo que SÍ se debe registrar
    Dado que se configuran logs
    Cuando se verifica
    Entonces SÍ se registra:
      | Dato                       | Formato |
      | Acción realizada           | CREATE/READ/UPDATE/DELETE |
      | Entidad afectada           | patient_id (no CURP) |
      | Usuario                   | user_id + rol        |
      | Timestamp                 | UTC ISO 8601        |
      | Resultado                 | success/error       |
      | IP address                | Últimos octetos     |
      | Hash de integridad        | SHA-256             |

  # ─────────────────────────────────────────────────────────────
  # 4. MÉTRICAS Y ALERTAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Métricas de negocio
    Dado que se monitorea el sistema
    Cuando se consultan métricas
    Entonces se incluyen:
      | Métrica                    | Umbral |
      | Consultas por día          | >20    |
      | Tiempo promedio de consulta| <15 min|
      | Prescripciones generadas   | >10/día|
      | Medicamentos dispensados   | >20/día|
      | Pacientes nuevos           | >2/día |

  Escenario: Métricas de sistema
    Dado que se monitorea rendimiento
    Cuando se consulta dashboard
    Entonces:
      | Métrica                    | Umbral |
      | Tiempo respuesta API       | <200ms |
      | Tasa de errores            | <0.1%  |
      | Uptime                     | >99.9% |
      | Tamaño de BD               | <2GB   |
      | Cola de sync pendiente     | <100 ops|

  Escenario: Alertas automáticas
    Dado que se configuran alertas
    Cuando se detecta anomalía
    Entonces:
      | Condición                  | Alerta  |
      | Error rate >1%            | 🔴 Alta |
      | Tiempo respuesta >500ms   | 🟠 Media |
      | Sync queue >100           | 🟡 Baja  |
      | Login fallido >5 veces    | 🔴 Alta |
      | Backup fallido            | 🔴 Alta |
  