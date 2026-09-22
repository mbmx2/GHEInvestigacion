# language: es
# @id GHE-SANS-005
# @type business-rule
# @domain security
# @layer threat-intel
# @risk s1
# @owner threat-intel-analyst
# @status proposed
# @requirement REQ-SANS-005
# @risk-control CTRL-SANS-005
# @regulation SANS-TI
@domain:sans_giac @type:business-rule @risk:s1 @status:proposed
Característica: SANS — Ciclo de Vida de Inteligencia de Amenazas
  Como analista de inteligencia de amenazas
  Quiero ciclo de vida SANS de threat intelligence
  Para que las amenazas se identifiquen, analicen y compartan proactivamente

  Regla: Recopilación de inteligencia

    Escenario: Fuentes de inteligencia
      Dado que se recopila inteligencia de amenazas
      Cuando se identifican fuentes
      Entonces se verifica:
        | Fuente                       | Tipo          |
        | OSINT                        | Abierta       |
        | Feeds de IoCs                | Táctica       |
        | Sector salud                 | Específica    |
        | Autoridades (CISA, HHS)      | Oficial       |
        | ISACs                        | Compartida    |
        | Dark web                     | Underground   |

  Regla: Análisis de inteligencia

    Escenario: Procesamiento de inteligencia
      Dado que datos de inteligencia son recopilados
      Cuando se procesan
      Entonces se verifica:
        | Elemento                    |
        | Validación de fuentes       |
        | Correlación de datos        |
        | Contextualización           |
        | Priorización                |
        | Clasificación de confiabilidad|

    Escenario: Análisis de amenazas al sector salud
      Dado que se analizan amenazas específicas
      Cuando se evalúa
      Entonces se monitorean:
        | Amenaza                       | Fuente        |
        | Ransomware hospitalario      | CISA, HHS     |
        | Phishing a personal médico  | ISACA, ENISA  |
        | Explotación de dispositivos  | FDA, ICS-CERT |
        | Insider threats              | Verizon DBIR  |
        | Estado-nación                | CISA alerts    |

  Regla: Inteligencia se distribuye

    Escenario: Difusión de inteligencia
      Dado que inteligencia está lista
      Cuando se distribuye
      Entonces se verifica:
        | Elemento                    |
        | Audiencia identificada      |
        | Formato apropiado           |
        | Acción recomendada          |
        | Timeliness                  |
        | Feedback solicitado         |

  Regla: Medición de efectividad

    Escenario: Métricas de inteligencia
      Dado que se mide efectividad
      Cuando se evalúa
      Entonces se verifica:
        | Métrica                     | Meta          |
        | Tiempo de detección         | ↓             |
        | Incidentes previstos        | ↑             |
        | Falsos positivos            | <10%          |
        | Acciones tomadas            | >80%          |
        | ROI de inteligencia         | Positivo      |
