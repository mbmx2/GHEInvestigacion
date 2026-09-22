# language: es
# @id GHE-CISSP-037
# @type business-rule
# @domain security
# @layer log-review
# @risk s1
# @owner soc-lead
# @status proposed
# @requirement REQ-CISSP-037
# @risk-control CTRL-CISSP-037
# @regulation CISSP-D6 ISC2 NOM-024
@domain:isc2_cissp @type:business-rule @risk:s1 @status:proposed
Característica: CISSP — Revisión de Logs y Monitoreo de Seguridad
  Como líder de SOC
  Quiero revisión de logs conforme CISSP
  Para que los eventos de seguridad se detecten mediante análisis de logs

  Regla: Logs se recopilan de todas las fuentes

    Escenario: Fuentes de log obligatorias
      Dado que se configuran fuentes de log
      Cuando se recopilan
      Entonces se incluyen:
        | Fuente                      |
        | Sistema operativo           |
        | Aplicaciones GHE            |
        | Base de datos               |
        | Firewall                    |
        | IDS/IPS                     |
        | Sistema de autenticación    |
        | Dispositivos de red         |
        | Aplicaciones de seguridad   |

    Escenario: Formato de log estandarizado
      Dado que logs se recopilan
      Cuando se normalizan
      Entonces se verifica:
        | Campo                       |
        | Timestamp ISO-8601          |
        | Fuente del evento           |
        | Severidad                   |
        | Usuario/actor               |
        | Acción realizada            |
        | Recurso afectado            |
        | Resultado                   |
        | IP de origen                |

  Regla: Logs se protegen

    Escenario: Integridad de logs
      Dado que logs son evidencia
      Cuando se almacenan
      Entonces se verifica:
        | Elemento                    |
        | Append-only storage         |
        | Hash de integridad          |
        | Cifrado en reposo           |
        | Acceso restringido          |
        | Retención documentada       |

  Regla: Revisión de logs es periódica

    Escenario: Revisión manual de logs
      Dado que se revisan logs periódicamente
      Cuando se ejecuta revisión
      Entonces se verifica:
        | Frecuencia                  |Qué se revisa           |
        | Diaria                      | Logins fallidos        |
        | Semanal                     | Accesos masivos        |
        | Mensual                     | Cambios de configuración|
        | Trimestral                  | Revisión completa      |

    Escenario: Análisis automatizado
      Dado que SIEM analiza logs automáticamente
      Cuando se detecta anomalía
      Entonces se verifica:
        | Elemento                    |
        | Reglas de correlación activas|
        | Alertas configuradas        |
        | Falsos positivos minimizados|
        | Tiempo de respuesta medido  |

  Regla: Retención de logs cumple normativa

    Escenario: Política de retención de logs
      Dado que se definen políticas de retención
      Cuando se aplican
      Entonces se verifica:
        | Tipo de log                 | Retención mínima |
        | Seguridad                   | 1 año            |
        | Auditoría                   | 5 años           |
        | Aplicación                  | 90 días          |
        | Red                         | 30 días          |
        | Acceso a datos sensibles    | 2 años           |
