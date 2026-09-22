# language: es
# @id GHE-CISSP-020
# @type business-rule
# @domain security
# @layer security-monitoring
# @risk s1
# @owner soc-analyst
# @status proposed
# @requirement REQ-CISSP-020
# @risk-control CTRL-CISSP-020
# @regulation CISSP-D7 ISC2
@domain:isc2_cissp @type:business-rule @risk:s1 @status:proposed
Característica: CISSP — Monitoreo de Seguridad y Análisis de Eventos
  Como analista SOC
  Quiero monitoreo de seguridad continuo conforme CISSP
  Para que los eventos de seguridad se detecten y respondan a tiempo

  Regla: SIEM se configura correctamente

    Escenario: Fuentes de log en SIEM
      Dado que SIEM recopila logs
      Cuando se configuran fuentes
      Entonces se incluyen:
        | Fuente                      |
        | Firewalls                   |
        | IDS/IPS                     |
        | Servidores de autenticación |
        | Sistemas de aplicación      |
        | Antimalware                 |
        | Dispositivos de red         |
        | Sistemas operativos         |

    Escenario: Reglas de correlación
      Dado que SIEM tiene reglas de correlación
      Cuando se configuran
      Entonces se incluyen:
        | Regla                       |
        | Múltiples fallos de login   |
        | Acceso fuera de horario     |
        | Cambio de configuración     |
        | Actividad de malware        |
        | Exfiltración de datos       |
        | Acceso a datos masivo       |

  Regla: Análisis de seguridad es continuo

    Escenario: Threat hunting
      Dado que equipo de seguridad realiza threat hunting
      Cuando se ejecuta
      Entonces se verifica:
        | Elemento                    |
        | Hipótesis basadas en amenazas|
        | Datos de telemetry          |
        | Herramientas de análisis    |
        | Resultados documentados     |
        | Controles ajustados         |

  Regla: Métricas de monitoreo se miden

    Escenario: KPIs de SOC
      Dado que se miden métricas de SOC
      Cuando se consulta dashboard
      Entonces muestra:
        | Métrica                     | Meta          |
        | MTTD (Mean Time to Detect) | <30 minutos   |
        | MTTR (Mean Time to Respond)| <2 horas      |
        | Falsos positivos           | <5%           |
        | Cobertura de logs          | >95%          |
        | Alertas investigadas       | 100%          |
        | Incidentes escalados       | Monitoreo     |

  Regla: Análisis forense se soporta

    Escenario: Herramientas forenses disponibles
      Dado que SOC requiere herramientas forenses
      Cuando se verifica
      Entonces están disponibles:
        | Herramienta                 | Uso           |
        | Captura de paquetes         | Análisis de red|
        | Volcado de memoria          | Análisis RAM  |
        | Análisis de disco           | Imagen forense|
        | Análisis de malware         | Análisis de amenazas|
        | Timeline analysis           | Cronología    |
