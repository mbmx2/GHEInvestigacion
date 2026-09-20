# language: es
# OWASP Top 10 - A09: Security Logging and Monitoring Failures
@status:proposed
@type:acceptance
@domain:general
# Fallos en logging y monitoreo de seguridad
Característica: A09 - Fallos de Logging y Monitoreo (OWASP Top 10)
  Como responsable de seguridad del proyecto GHE
  Quiero implementar logging y monitoreo robustos
  Para detectar y responder a incidentes de seguridad

  # ─────────────────────────────────────────────────────────────
  # 1. LOGGING DE SEGURIDAD
  # ─────────────────────────────────────────────────────────────

  Escenario: Eventos que deben registrarse
    Dado que se define qué eventos se registran
    Cuando ocurre un evento de seguridad
    Entonces se registra:
      | Evento                     | Registrado? |
      | Login exitoso              | ✅          |
      | Login fallido              | ✅          |
      | Bloqueo de cuenta          | ✅          |
      | Logout                     | ✅          |
      | Cambio de password         | ✅          |
      | Acceso a expediente        | ✅          |
      | Modificación de expediente | ✅          |
      | Creación de prescripción   | ✅          |
      | Dispensación de medicamento| ✅          |
      | Acceso denegado            | ✅          |
      | Error del sistema          | ✅          |
      | Cambio de permisos         | ✅          |

  Escenario: Contenido de cada log
    Dado que se genera un registro de log
    Cuando se crea la entrada
    Entonces incluye:
      | Campo                      | Obligatorio |
      | Timestamp (UTC)            | ✅          |
      | User ID                    | ✅          |
      | User role                  | ✅          |
      | Action                     | ✅          |
      | Entity type                | ✅          |
      | Entity ID                  | ✅          |
      | IP address                 | ✅          |
      | User agent                 | ✅          |
      | Result (success/failure)   | ✅          |
      | Details (JSON)             | ✅          |
      | Hash SHA-256               | ✅          |

  # ─────────────────────────────────────────────────────────────
  # 2. INTEGRIDAD DEL LOG
  # ─────────────────────────────────────────────────────────────

  Escenario: Protección de integridad del log
    Dado que se protege integridad del audit log
    Cuando se registra entrada
    Entonces:
      | Protección                 | Estado    |
      | Hash SHA-256 por entrada   | ✅         |
      | Cadena de hash (chain)     | ⚠️ Pendiente |
      | Escritura append-only      | ✅         |
      | Permisos restrictivos      | ✅         |
      | Backup del log             | ✅         |
    Y el log NO puede ser modificado sin dejar rastro

  Escenario: Verificación periódica de integridad
    Dado que se verifica integridad del log
    Cuando se ejecuta verificación
    Entonces:
      | Verificación               | Estado    |
      | Todos los hashes coinciden | Pendiente |
      | No hay entradas faltantes  | Pendiente |
      | No hay entradas corruptas  | Pendiente |
    Y se ejecuta semanalmente

  # ─────────────────────────────────────────────────────────────
  # 3. MONITOREO Y ALERTAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Alertas de seguridad
    Dado que se configuran alertas de seguridad
    Cuando se detecta actividad sospechosa
    Entonces:
      | Evento                     | Alerta    |
      | 5+ logins fallidos en 5 min| ⚠️ Alta   |
      | Login desde IP nueva       | ⚠️ Media  |
      | Acceso fuera de horario    | ⚠️ Media  |
      | Modificación masiva        | ⚠️ Alta   |
      | Intento de escalada de privilegios | ⚠️ Crítica |
      | Error de sistema           | ⚠️ Media  |

  Escenario: Retención de logs
    Dado que se define política de retención
    Cuando se gestiona ciclo de vida de logs
    Entonces:
      | Tipo de log                | Retención |
      | Audit log                  | 10 años   |
      | System log                 | 1 año     |
      | Access log                 | 6 meses   |
      | Error log                  | 1 año     |
  