# language: es
# @id GHE-GIAC-033
# @type business-rule
# @domain security
# @layer advanced-traffic
# @risk s1
# @owner senior-analyst
# @status proposed
# @requirement REQ-GIAC-033
# @risk-control CTRL-GIAC-033
# @regulation GIAC-GCIA-ADV SANS
@domain:sans_giac @type:business-rule @risk:s1 @status:proposed
Característica: GIAC GCIA — Análisis Avanzado de Tráfico Encriptado
  Como analista senior certificado GCIA
  Quiero análisis avanzado de tráfico encriptado
  Para que las comunicaciones encriptadas del hospital se analicen sin descifrar

  Regla: Análisis de metadatos

    Escenario: Análisis de tráfico cifrado
      Dado que tráfico está encriptado (TLS)
      Cuando se analiza metadatos
      Entonces se verifica:
        | Elemento                    |
        | Certificados utilizados     |
        | Patrones de handshake       |
        | Volúmenes de transferencia  |
        | Horarios de comunicación    |
        | Destinos frecuentes         |

  Regla: Detección de anomalías en tráfico cifrado

    Escenario: Detección de C2 en tráfico cifrado
      Dado que se sospecha de C2 en tráfico cifrado
      Cuando se analiza
      Entonces se verifica:
        | Elemento                    |
        | Beaconing patterns          |
        | Intervalos regulares        |
        | Volúmenes anómalos          |
        | Destinos nuevos             |
        | JA3/JA3S fingerprinting     |

  Regla: Análisis de JA3/JA3S

    Escenario: Fingerprinting de TLS
      Dado que se usa JA3/JA3S para fingerprinting
      Cuando se analiza
      Entonces se verifica:
        | Elemento                    |
        | Client hello fingerprint    |
        | Server hello fingerprint    |
        | Comparación con baseline    |
        | Detección de malware        |
        | Identificación de herramientas|

  Regla: Correlación de tráfico cifrado

    Escenario: Correlación avanzada
      Dado que se correlacionan múltiples fuentes
      Cuando se analiza tráfico cifrado
      Entonces se verifica:
        | Elemento                    |
        | DNS + tráfico TLS           |
        | Certificados + destinos     |
        | Timing + volúmenes          |
        | User agent + ja3            |
        | Patrones temporales         |
