# language: es
# @id GHE-GIAC-023
# @type business-rule
# @domain security
# @layer unix-security
# @risk s2
# @owner unix-admin
# @status proposed
# @requirement REQ-GIAC-023
# @risk-control CTRL-GIAC-023
# @regulation GIAC-GUNN SANS
@domain:sans_giac @type:business-rule @risk:s2 @status:proposed
Característica: GIAC GUNN — Seguridad Unix/Linux
  Como administrador Unix certificado GUNN
  Quiero metodología GUNN de seguridad Unix/Linux
  Para que los sistemas Unix del hospital estén seguros

  Regla: Sistemas Unix se hardening

    Escenario: Hardening de Linux
      Dado que se configuran servidores Linux
      Cuando se aplica hardening
      Entonces se verifica:
        | Elemento                    |
        | Benchmark CIS aplicado      |
        | Servicios innecesarios off  |
        | SSH hardening               |
        | Firewall configurado        |
        | Logging habilitado          |

  Regla: Control de acceso Unix

    Escenario: Gestión de usuarios Unix
      Dado que se gestiona acceso en Unix
      Cuando se configura
      Entonces se verifica:
        | Elemento                    |
        | Cuentas por defecto off    |
        | Contraseñas robustas        |
        | Sudo configurado            |
        | PAM configurado             |
        | Audit logging               |

  Regla: Monitoreo Unix

    Escenario: Monitoreo de sistemas Unix
      Dado que se monitorean sistemas Unix
      Cuando se implementa monitoreo
      Entonces se verifica:
        | Elemento                    |
        | OSSEC configurado           |
        | Fail2ban activo             |
        | File integrity monitoring   |
        | Log centralization          |
        | Alertas configuradas        |
