# language: es
# @id GHE-GIAC-018
# @type business-rule
# @domain security
# @layer cloud-security
# @risk s2
# @owner cloud-security-engineer
# @status proposed
# @requirement REQ-GIAC-018
# @risk-control CTRL-GIAC-018
# @regulation GIAC-GCSA SANS
@domain:sans_giac @type:business-rule @risk:s2 @status:proposed
Característica: GIAC GCSA — Automatización de Seguridad en Cloud
  como ingeniero de seguridad cloud certificado GCSA
  Quiero metodología GCSA de automatización en cloud
  Para que la seguridad en cloud sea automatizada y efectiva

  Regla: Seguridad de infraestructura como código

    Escenario: IaC seguridad
      Dado que se usa infraestructura como código
      Cuando se implementa
      Entonces se verifica:
        | Elemento                    |
        | Templates seguros           |
        | Escaneo de configuración    |
        | Secrets management          |
        | Versionado seguro           |
        | Peer review obligatorio     |

  Regla: Seguridad de contenedores

    Escenario: Seguridad de Kubernetes
      Dado que se usa Kubernetes
      Cuando se protege
      Entonces se verifica:
        | Elemento                    |
        | Network policies            |
        | Pod security standards      |
        | RBAC configurado            |
        | Secrets management          |
        | Runtime security            |

  Regla: Automatización de respuesta

    Escenario: SOAR en cloud
      Dado que se automatiza respuesta
      Cuando se implementa SOAR
      Entonces se verifica:
        | Elemento                    |
        | Playbooks automatizados     |
        | Respuesta a alertas         |
        | Contención automática       |
        | Escalamiento inteligente    |
        | Métricas de efectividad     |
