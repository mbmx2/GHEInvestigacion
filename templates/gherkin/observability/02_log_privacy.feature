# language: es
# @id GHE-OBS-LOG-001
# @type audit
# @domain security
# @layer infrastructure
# @risk s2
# @owner security-lead
# @status proposed
@domain:security @type:audit @risk:s2 @status:proposed
Característica: Privacidad de Logs y Telemetría
  Como responsable de protección de datos del hospital
  Quiero que los logs no expongan datos sensibles
  Para cumplir LFPDPPP y proteger privacidad de pacientes

  Contexto:
    Dado que el sistema genera logs
    Y que los logs pueden contener información sensible

  Escenario Outline: Datos que NO se deben registrar en logs
    Dado que se registra una operación
    Entonces "<dato>" NO debe aparecer en logs

    Ejemplos:
      | dato                          |
      | CURP completa               |
      | Password hasheado           |
      | Token de sesión             |
      | Datos clínicos completos    |
      | Payloads de prescripciones  |
      | Dirección IP completa       |
      | Nombres completos en claro  |

  Escenario Outline: Datos que SÍ se deben registrar
    Dado que se registra una operación
    Entonces "<dato>" SÍ debe aparecer en logs

    Ejemplos:
      | dato                          |
      | Acción (CREATE/READ/UPDATE/DELETE) |
      | Entity type                 |
      | Entity ID (no CURP)        |
      | User ID + rol              |
      | Timestamp UTC              |
      | Resultado (success/error)  |
      | IP últimos octetos         |
      | Hash SHA-256               |

  Escenario: Verificación de integridad de logs
    Dado que se verifica integridad del audit log
    Cuando se ejecuta verificación
    Entonces:
      | Verificación              | Estado  |
      | Cada entrada tiene hash   | ✅       |
      | Hash encadenado           | ⚠️ Pendiente |
      | Append-only               | ✅       |
      | Permisos restrictivos     | ✅       |
