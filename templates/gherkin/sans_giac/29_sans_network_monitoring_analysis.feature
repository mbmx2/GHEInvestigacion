# language: es
# @id GHE-SANS-029
# @type business-rule
# @domain security
# @layer network-monitoring
# @risk s1
# @owner network-security-analyst
# @status proposed
# @requirement REQ-SANS-029
# @risk-control CTRL-SANS-029
# @regulation SANS-NETMON
@domain:sans_giac @type:business-rule @risk:s1 @status:proposed
Característica: SANS — Monitoreo y Análisis de Red
  Como analista de seguridad de red
  Quiero monitoreo de red conforme SANS
  Para que el tráfico de red del hospital se monitoree continuamente

  Regla: Captura de tráfico se configura

    Escenario: Puntos de captura
      Dado que se configuran puntos de captura de red
      Cuando se implementa monitoreo
      Entonces se verifica:
        | Punto de captura            | Ubicación              |
        | Perímetro de red            | Después de firewall    |
        | Zona DMZ                    | Antes de servidores    |
        | Red interna                 | Segmentos críticos     |
        | Red de gestión              | Infraestructura TI     |
        | Red inalámbrica             | Puntos de acceso       |

    Escenario: Configuración de IDS/IPS
      Dado que se configuran sensores de intrusión
      Cuando se implementa
      Entonces se verifica:
        | Elemento                    |
        | Firmas actualizadas         |
        | Reglas personalizadas       |
        | Modo inline o promiscuo     |
        | Logging habilitado          |
        | Alertas configuradas        |

  Regla: Análisis de tráfico es continuo

    Escenario: Detección de anomalías
      Dado que se analiza tráfico de red
      Cuando se detecta anomalía
      Entonces se verifica:
        | Tipo de anomalía            | Acción                  |
        | Escaneo de puertos          | Bloqueo IP              |
        | Tráfico anómalo             | Investigación           |
        | Intento de explotación      | Bloqueo + alerta        |
        | Exfiltración de datos       | Contención              |
        | DDoS                        | Mitigación              |

  Regla: NetFlow se analiza

    Escenario: Análisis de flujo
      Dado que se recopilan datos de flujo
      Cuando se analizan
      Entonces se verifica:
        | Elemento                    |
        | Patrones de comunicación    |
        | Volúmenes anómalos          |
        | Horarios inusuales          |
        | Destinos externos           |
        | Protocolos no estándar      |

  Regla: Monitoreo de segmentos críticos

    Escenario: Red de dispositivos médicos
      Dado que hospital tiene red de dispositivos médicos
      Cuando se monitorea
      Entonces se verifica:
        | Elemento                    |
        | Tráfico de dispositivos     |
        | Comunicaciones C2 sospechosas|
        | Cambios de configuración    |
        | Firmware no autorizado      |
        | Comportamiento anómalo      |
