# language: es
# @id GHE-GIAC-038
# @type business-rule
# @domain security
# @layer mitre-attack
# @risk s1
# @owner threat-hunter
# @status proposed
# @requirement REQ-GIAC-038
# @risk-control CTRL-GIAC-038
# @regulation GIAC-GCTI-MITRE SANS
@domain:sans_giac @type:business-rule @risk:s1 @status:proposed
Característica: GIAC GCTI — Integración con MITRE ATT&CK
  Como threat hunter certificado GCTI
  Quiero integración con MITRE ATT&CK
  Para que las defensas del hospital se midan contra marco ATT&CK

  Regla: Matriz ATT&CK se mapea

    Escenario: Mapeo de controles existentes
      Dado que hospital tiene controles de seguridad
      Cuando se mapean contra ATT&CK
      Entonces se verifica:
        | Elemento                    |
        | Tácticas cubiertas          |
        | Técnicas cubiertas          |
        | Sub-tecniques cubiertas     |
        | Brechas identificadas       |
        | Priorización de brechas     |

    Escenario: Cobertura por táctica
      Dado que se evalúa cobertura por táctica
      Cuando se analiza
      Entonces se verifica:
        | Táctica                     | Estado esperado          |
        | Initial Access              | Controles activos        |
        | Execution                   | Monitoreo configurado    |
        | Persistence                 | Detección implementada   |
        | Privilege Escalation        | Controles de acceso      |
        | Defense Evasion             | EDR + SIEM               |
        | Credential Access           | MFA + monitoring         |
        | Discovery                   | Anomaly detection        |
        | Lateral Movement            | Network segmentation     |
        | Collection                  | DLP configured           |
        | Exfiltration                | DLP + monitoring         |
        | Impact                      | Backup + recovery        |

  Regla: Threat hunting se basa en ATT&CK

    Escenario: Hunting basado en técnicas
      Dado que se inicia threat hunting
      Cuando se basa en ATT&CK
      Entonces se verifica:
        | Elemento                    |
        | Técnica objetivo seleccionada|
        | Hipótesis formulada          |
        | Datos de telemetry          |
        | Análisis ejecutado          |
        | Resultados documentados     |
        | Controles ajustados         |

  Regla: Detección se mide contra ATT&CK

    Escenario: Medición de detección
      Dado que se mide efectividad de detección
      Cuando se evalúa
      Entonces se verifica:
        | Métrica                     | Meta          |
        | Técnicas detectadas         | >80%          |
        | Tiempo de detección promedio | <1 hora       |
        | Falsos positivos            | <5%           |
        | Cobertura de tácticas       | >90%          |
