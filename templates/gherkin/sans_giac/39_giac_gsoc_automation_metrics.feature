# language: es
# @id GHE-GIAC-039
# @type business-rule
# @domain security
# @layer soc-automation
# @risk s1
# @owner soc-engineer
# @status proposed
# @requirement REQ-GIAC-039
# @risk-control CTRL-GIAC-039
# @regulation GIAC-GSOC-AUTO SANS
@domain:sans_giac @type:business-rule @risk:s1 @status:proposed
Característica: GIAC GSOC — Automatización y Métricas de SOC
  Como ingeniero SOC certificado GSOC
  Quiero automatización y métricas avanzadas de SOC
  Para que el SOC opere con máxima eficiencia

  Regla: SOAR se integra

    Escenario: Playbooks automatizados
      Dado que SOC tiene plataforma SOAR
      Cuando se configuran playbooks
      Entonces se verifica:
        | Playbook                    | Automatización           |
        | Triaje de alertas           | Clasificación automática |
        | Contención de malware       | Cuarentena automática    |
        | Bloqueo de IPs              | Bloqueo automático       |
        | Enrichment de IoCs          | Consulta automática      |
        | Notificaciones              | Envío automático         |

  Regla: Métricas avanzadas se miden

    Escenario: KPIs avanzados de SOC
      Dado que se miden métricas avanzadas
      Cuando se consulta dashboard
      Entonces se verifica:
        | Métrica                     | Meta          |
        | MTTD                        | <15 minutos   |
        | MTTR                        | <1 hora       |
        | Alertas por analista/día    | <50           |
        | Cobertura de detección      | >95%          |
        | Falsos positivos            | <3%           |
        | Alertas automatizadas       | >60%          |

  Regla: Automatización de respuesta

    Escenario: Respuesta autónoma
      Dado que alerta está clasificada como auto-response
      Cuando se ejecuta playbook
      Entonces se verifica:
        | Elemento                    |
        | Respuesta en <5 minutos     |
        | Sin intervención humana     |
        | Evidencia documentada       |
        | Escalamiento si aplica      |
        | Métrica registrada          |

  Regla: Investigación automatizada

    Escenario: Enrichment automático
      Dado que alerta requiere investigación
      Cuando se ejecuta enrichment
      Entonces se verifica:
        | Elemento                    |
        | Consulta de IoCs            |
        | Geo-localización            |
        | Reputation check            |
        | Contexto de activo          |
        | Historial de incidentes     |
