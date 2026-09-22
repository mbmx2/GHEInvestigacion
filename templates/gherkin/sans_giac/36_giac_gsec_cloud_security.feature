# language: es
# @id GHE-GIAC-036
# @type business-rule
# @domain security
# @layer gsec-cloud
# @risk s1
# @owner cloud-security-engineer
# @status proposed
# @requirement REQ-GIAC-036
# @risk-control CTRL-GIAC-036
# @regulation GIAC-GSEC-CLOUD SANS
@domain:sans_giac @type:business-rule @risk:s1 @status:proposed
Característica: GIAC GSEC — Seguridad en Cloud Computing
  Como ingeniero de seguridad cloud certificado GSEC
  Quiero seguridad cloud conforme GSEC
  Para que los servicios cloud del hospital estén protegidos

  Regla: Servicios cloud se protegen

    Escenario: Seguridad de IaaS
      Dado que hospital usa IaaS
      Cuando se protege
      Entonces se verifica:
        | Elemento                    |
        | VM hardening                |
        | Security groups            |
        | Network ACLs               |
        | Storage encryption         |
        | Access logging             |

    Escenario: Seguridad de PaaS
      Dado que hospital usa PaaS
      Cuando se protege
      Entonces se verifica:
        | Elemento                    |
        | Application security       |
        | Database security          |
        | Service-level controls     |
        | Dependency management      |
        | Logging and monitoring     |

    Escenario: Seguridad de SaaS
      Dado que hospital usa SaaS
      Cuando se protege
      Entonces se verifica:
        | Elemento                    |
        | Configuration management   |
        | Access controls            |
        | Data protection            |
        | Vendor risk assessment     |
        | Exit strategy              |

  Regla: Datos en cloud se protegen

    Escenario: Protección de datos en cloud
      Dado que datos sensibles están en cloud
      Cuando se protegen
      Entonces se verifica:
        | Elemento                    |
        | Encryption at rest         |
        | Encryption in transit      |
        | Key management             |
        | Access controls            |
        | DLP configured             |
