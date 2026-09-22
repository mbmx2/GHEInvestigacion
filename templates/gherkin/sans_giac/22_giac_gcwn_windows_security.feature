# language: es
# @id GHE-GIAC-022
# @type business-rule
# @domain security
# @layer windows-security
# @risk s2
# @owner windows-admin
# @status proposed
# @requirement REQ-GIAC-022
# @risk-control CTRL-GIAC-022
# @regulation GIAC-GCWN SANS
@domain:sans_giac @type:business-rule @risk:s2 @status:proposed
Característica: GIAC GCWN — Seguridad de Windows
  Como administrador Windows certificado GCWN
  Quiero metodología GCWN de seguridad Windows
  Para que los sistemas Windows del hospital estén seguros

  Regla: Active Directory se protege

    Escenario: Seguridad de AD
      Dado que hospital usa Active Directory
      Cuando se protege
      Entonces se verifica:
        | Elemento                    |
        | Dominio protegido           |
        | GPOs de seguridad           |
        | Kerberos hardening          |
        | Tiered admin model          |
        | Monitoreo de AD             |

  Regla: Servidores Windows se hardening

    Escenario: Hardening de Windows Server
      Dado que se configuran servidores Windows
      Cuando se aplica hardening
      Entonces se verifica:
        | Elemento                    |
        | Benchmark CIS aplicado      |
        | Servicios innecesarios off  |
        | Firewall configurado        |
        | Logging habilitado          |
        | Parches actualizados        |

  Regla: Herramientas de seguridad Windows

    Escenario: Uso de herramientas nativas
      Dado que se usan herramientas Windows
      Cuando se implementan
      Entonces se verifica:
        | Herramienta                 | Uso           |
        | Windows Defender            | Antimalware   |
        | AppLocker                   | Control de apps|
        | BitLocker                   | Cifrado de disco|
        | Windows Firewall            | Filtrado      |
        | Event Viewer                | Logs          |
