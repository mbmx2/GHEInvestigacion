# language: es
# @id GHE-SANS-031
# @type business-rule
# @domain security
# @layer cloud-framework
# @risk s1
# @owner cloud-security-architect
# @status proposed
# @requirement REQ-SANS-031
# @risk-control CTRL-SANS-031
# @regulation SANS-CLOUD
@domain:sans_giac @type:business-rule @risk:s1 @status:proposed
Característica: SANS — Framework de Seguridad en Cloud
  Como arquitecto de seguridad cloud
  Quiero framework SANS de seguridad cloud
  Para que la seguridad en cloud se base en mejores prácticas SANS

  Regla: Shared responsibility se documenta

    Escenario: Modelo de responsabilidad compartida
      Dado que hospital usa servicios cloud
      Cuando se documenta responsabilidad
      Entonces se verifica:
        | Capa       | Responsabilidad del hospital    |
        | Datos      | Hospital (100%)                 |
        | Aplicación | Hospital (IaaS) / Provider (SaaS)|
        | SO         | Hospital (IaaS) / Provider (PaaS)|
        | Infraestructura| Provider                       |
        | Red        | Provider                       |

  Regla: Controles cloud se implementan

    Escenario: Controles SANS para cloud
      Dado que se implementan controles cloud
      Cuando se configuran
      Entonces se verifica:
        | Control                       | Implementación          |
        | Identity & Access Management | RBAC + MFA              |
        | Data Protection              | Encryption + DLP        |
        | Infrastructure Security      | VPC + Security Groups   |
        | Workload Security            | Container + Serverless  |
        | Security Monitoring          | CloudTrail + GuardDuty  |
        | Incident Response            | Playbooks automatizados |

  Regla: Multi-cloud se gestiona

    Escenario: Seguridad multi-cloud
      Dado que hospital usa múltiples proveedores cloud
      Cuando se gestiona seguridad
      Entonces se verifica:
        | Elemento                    |
        | Política unificada          |
        | Herramientas multi-cloud    |
        | Visibilidad centralizada    |
        | Compliance consistente      |
        | Respuesta coordinada        |
