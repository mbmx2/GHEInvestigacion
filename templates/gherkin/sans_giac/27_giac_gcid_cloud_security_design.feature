# language: es
# @id GHE-GIAC-027
# @type business-rule
# @domain security
# @layer cloud-security-advanced
# @risk s1
# @owner cloud-security-architect
# @status proposed
# @requirement REQ-GIAC-027
# @risk-control CTRL-GIAC-027
# @regulation GIAC-GClD SANS
@domain:sans_giac @type:business-rule @risk:s1 @status:proposed
Característica: GIAC GClD — Diseño de Seguridad en Cloud
  Como arquitecto de seguridad cloud certificado
  Quiero metodología GClD de diseño cloud
  Para que la seguridad esté integrada en el diseño cloud desde el inicio

  Regla: Diseño de seguridad cloud

    Escenario: Arquitectura segura en cloud
      Dado que se diseña arquitectura cloud
      Cuando se aplica GClD
      Entonces se verifica:
        | Elemento                    |
        | Zero trust en cloud         |
        | Segmentación de VPC         |
        | Encryption at rest/transit  |
        | IAM robusto                 |
        | Logging centralizado        |

  Regla: Controles cloud se implementan

    Escenario: Controles nativos de cloud
      Dado que se implementan controles cloud
      Cuando se configuran
      Entonces se verifica:
        | Elemento                    |
        | Security groups            |
        | NACLs                       |
        | CloudTrail/config           |
        | GuardDuty/sentinel          |
        | KMS management              |

  Regla: Cumplimiento en cloud

    Escenario: Compliance cloud
      Dado que hospital usa cloud
      Cuando se verifica cumplimiento
      Entonces se verifica:
        | Elemento                    |
        | Residencia de datos         |
        | Cifrado obligatorio         |
        | Auditoría continua          |
        | Backup y recuperación       |
        | Incident response           |
