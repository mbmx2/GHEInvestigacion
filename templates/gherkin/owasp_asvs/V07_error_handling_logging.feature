# language: es
# @id GHE-ASVS-V7-001
# @type compliance
# @domain security
# @layer domain
# @risk s2
# @owner security-lead
# @status proposed
# @requirement ASVS-V7
# @risk-control CTRL-ASVS-V7
# @regulation NOM-024
@domain:security @type:compliance @risk:s2 @status:proposed
Característica: V7 - Manejo de Errores y Logging
  Como responsable de seguridad del proyecto GHE
  Quiero que los errores se manejen de forma segura y se registren adecuadamente
  Para que no se exponga información sensible y se pueda auditar

  Regla: V7.1 - Manejo de errores

    Escenario: Error no expone información sensible
      Dado que ocurre un error interno
      Cuando se maneja
      Entonces:
        | Información que NO se expone |
        | Stack trace completo      |
        | Versión del software      |
        | Rutas internas            |
        | Query SQL                 |
        | Datos de configuración    |
      Y se muestra mensaje genérico al usuario
      Y se registra error detallado en log interno

  Regla: V7.2 - Logging de seguridad

    Escenario: Eventos de seguridad se registran
      Dado que ocurre evento de seguridad
      Cuando se registra
      Entonces incluye:
        | Campo                      |
        | Timestamp (UTC)           |
        | User ID                   |
        | Acción realizada          |
        | Resultado (éxito/error)  |
        | IP address               |
        | Hash de integridad        |

    Escenario: Datos sensibles no se registran
      Dado que se genera log
      Cuando se verifica contenido
      Entonces NO se registra:
        | Dato                       |
        | CURP completa             |
        | Passwords                |
        | Tokens                   |
        | Datos clínicos completos |

  Regla: V7.3 - Protección de logs

    Escenario: Logs protegidos contra manipulación
      Dado que se almacenan logs
      Cuando se verifica
      Entonces:
        | Medida                     |
        | Append-only               |
        | Hash SHA-256 por entrada  |
        | Permisos restrictivos     |
        | Backup cifrado            |

  Regla: V7.4 - Retención de logs

    Escenario: Política de retención
      Dado que se gestiona retención
      Cuando se evalúa
      Entonces:
        | Tipo de log               | Retención |
        | Audit log                 | 10 años   |
        | System log                | 1 año     |
        | Access log                | 6 meses   |
