# language: es
# @id GHE-GIAC-021
# @type business-rule
# @domain security
# @layer wireless-security
# @risk s2
# @owner wireless-security-engineer
# @status proposed
# @requirement REQ-GIAC-021
# @risk-control CTRL-GIAC-021
# @regulation GIAC-GWSP SANS
@domain:sans_giac @type:business-rule @risk:s2 @status:proposed
Característica: GIAC GWSP — Seguridad Inalámbrica
  Como ingeniero de seguridad inalámbrica certificado GWSP
  Quiero metodología GWSP de seguridad WiFi
  Para que la red inalámbrica del hospital sea segura

  Regla: Red inalámbrica se audita

    Escenario: Auditoría de WiFi
      Dado que se audita red inalámbrica
      Cuando se ejecuta auditoría
      Entonces se verifica:
        | Elemento                    |
        | Puntos de acceso configurados|
        | Redes ocultas detectadas    |
        | Rogue AP identificados      |
        | Cobertura de señal          |
        | Vulnerabilidades WiFi       |

  Regla: Seguridad WiFi se implementa

    Escenario: Protección de red WiFi
      Dado que se protege red inalámbrica
      Cuando se implementa seguridad
      Entonces se verifica:
        | Elemento                    |
        | WPA3 Enterprise             |
        | 802.1X configurado          |
        | Segregación de VLAN         |
        | Certificate-based auth      |
        | Monitoreo continuo          |

  Regla: Ataques WiFi se detectan

    Escenario: Detección de ataques WiFi
      Dado que se monitorea red WiFi
      Cuando se detecta ataque
      Entonces se verifica:
        | Ataque                      | Detección              |
        | Evil twin                   | WIDS                   |
        | Deauthentication            | Monitoreo de tráfico   |
        | KRACK                       | Actualización           |
        | Brute force                 | Rate limiting          |
