# language: es
# @id GHE-CISSP-036
# @type business-rule
# @domain security
# @layer federation
# @risk s2
# @owner iam-architect
# @status proposed
# @requirement REQ-CISSP-036
# @risk-control CTRL-CISSP-036
# @regulation CISSP-D5 ISC2
@domain:isc2_cissp @type:business-rule @risk:s2 @status:proposed
Característica: CISSP — Federación, SSO y Directorios
  Como arquitecto de identidades
  Quiero federación y SSO conforme CISSP
  Para que la autenticación sea segura y conveniente

  Regla: SSO se implementa

    Escenario: Single Sign-On
      Dado que usuario accede a múltiples sistemas
      Cuando se implementa SSO
      Entonces se verifica:
        | Elemento                    |
        | Protocolo: SAML 2.0 o OIDC  |
        | Token seguro                |
        | Timeout de sesión           |
        | Invalidación centralizada   |
        | MFA integrado               |

  Regla: Federación se configura

    Escenario: Federación de identidades
      Dado que hospital tiene múltiples dominios
      Cuando se configura federación
      Entonces se verifica:
        | Elemento                    |
        | IdP central                 |
        | SPs configurados            |
        | Trust configurado           |
        | Atributos minimizados       |
        | Logout federado             |

  Regla: Directorio se protege

    Escenario: Seguridad de directorio
      Dado que hospital usa directorio (LDAP/AD)
      Cuando se protege
      Entonces se verifica:
        | Elemento                    |
        | Cifrado LDAPS               |
        | Bind credentials seguros    |
        | Auditoría de accesos        |
        | Replicación segura          |
        | Backup del directorio       |

  Regla: Autenticación de servicios se gestiona

    Escenario: mTLS entre servicios
      Dado que servicios se autentican mutuamente
      Cuando se configura mTLS
      Entonces se verifica:
        | Elemento                    |
        | Certificados por servicio   |
        | CA interna                  |
        | Rotación automática         |
        | Revocación inmediata        |
        | Monitoreo de certificados   |
