# language: es
# @id GHE-INCIDENT-RESPONSE-CLASSIFY-001
# @type safety
# @domain security
# @layer operations
# @risk s1
# @owner security-lead
# @status proposed
# @requirement REQ-INCIDENT-CLASSIFY
# @risk-control CTRL-INCIDENT-CLASSIFY
# @regulation NOM-024
@domain:security @type:safety @risk:s1 @status:proposed
Característica: Clasificación y Respuesta a Incidentes
  Como responsable de seguridad del hospital
  Quiero clasificar y responder a incidentes de forma estructurada
  Para que cada incidente se maneje según su severidad

  Regla: Todo incidente se clasifica

    Escenario: Clasificación de incidente
      Dado que se detecta incidente
      Cuando se clasifica
      Entonces:
        | Severidad | Criterio |
        | S1 - Crítico | Brecha de datos, fallo de sistema |
        | S2 - Alto | Vulnerabilidad explotada |
        | S3 - Medio | Vulnerabilidad detectada |
        | S4 - Bajo | Anomalía menor |

  Regla: Tiempo de respuesta según severidad

    Escenario: Tiempo de respuesta
      Dado que se clasifica incidente
      Cuando se evalúa
      Entonces:
        | Severidad | Tiempo máximo |
        | S1 | Inmediato |
        | S2 | <1 hora |
        | S3 | <24 horas |
        | S4 | <7 días |

  Regla: Post-mortem obligatorio

    Escenario: Post-mortem ejecutado
      Dado que se completa respuesta a incidente
      Cuando se ejecuta post-mortem
      Entonces: causa raíz, acciones correctivas, lecciones, actualización de procesos

  Regla: Lecciones aprendidas se documentan

    Escenario: Lecciones documentadas
      Dado que se completa post-mortem
      Cuando se documenta
      Entonces: lección, acción preventiva, responsable, fecha de implementación
