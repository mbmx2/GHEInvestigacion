# language: es
# @id GHE-SANS-030
# @type business-rule
# @domain security
# @layer edr
# @risk s1
# @owner edr-engineer
# @status proposed
# @requirement REQ-SANS-030
# @risk-control CTRL-SANS-030
# @regulation SANS-EDR
@domain:sans_giac @type:business-rule @risk:s1 @status:proposed
Característica: SANS — Detección y Respuesta en Endpoints
  Como ingeniero EDR
  Quiero EDR conforme SANS
  Para que los endpoints del hospital se monitoreen y respondan a amenazas

  Regla: EDR se despliega

    Escenario: Cobertura de EDR
      Dado que se despliega solución EDR
      Cuando se implementa
      Entonces se verifica:
        | Elemento                    |
        | 100% de endpoints cubiertos |
        | Agentes actualizados         |
        | Políticas configuradas       |
        | Integración con SIEM         |
        | Respuesta remota habilitada  |

  Regla: Detección avanzada

    Escenario: Detección de comportamiento
      Dado que EDR monitorea comportamiento
      Cuando detecta anomalía
      Entonces se verifica:
        | Tipo de anomalía            | Acción                  |
        | Proceso malicioso           | Cuarentena + alerta     |
        | Inyección de procesos       | Bloqueo + investigación |
        | Credential dumping          | Contención + alerta     |
        | Lateral movement            | Aislamiento + alerta    |
        | Persistence                 | Eliminación + alerta    |

  Regla: Respuesta automatizada

    Escenario: Respuesta automática a amenazas
      Dado que EDR detecta amenaza
      Cuando se ejecuta respuesta
      Entonces se verifica:
        | Elemento                    |
        | Cuarentena automática       |
        | Proceso terminado           |
        | Archivo eliminado           |
        | Conexión bloqueada          |
        | Alerta generada             |

  Regla: Hunting proactivo

    Escenario: Threat hunting en endpoints
      Dado que equipo de seguridad realiza hunting
      Cuando se ejecuta
      Entonces se verifica:
        | Elemento                    |
        | Hipótesis basadas en amenazas|
        | Telemetry analizada          |
        | Indicadores personalizados   |
        | Resultados documentados      |
        | Controles ajustados          |
