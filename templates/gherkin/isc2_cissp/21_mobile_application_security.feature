# language: es
# @id GHE-CISSP-021
# @type business-rule
# @domain security
# @layer mobile-security
# @risk s2
# @owner mobile-security-engineer
# @status proposed
# @requirement REQ-CISSP-021
# @risk-control CTRL-CISSP-021
# @regulation CISSP-D8 ISC2
@domain:isc2_cissp @type:business-rule @risk:s2 @status:proposed
Característica: CISSP — Seguridad de Aplicaciones Móviles
  Como ingeniero de seguridad móvil
  Quiero seguridad de apps móviles conforme CISSP
  Para que las aplicaciones móviles del hospital sean seguras

  Regla: Desarrollo móvil seguro se aplica

    Escenario: Principios de desarrollo móvil seguro
      Dado que se desarrolla app móvil para hospital
      Cuando se aplican principios
      Entonces se verifica:
        | Principio                  |
        | Autenticación robusta      |
        | Cifrado de datos locales   |
        | Comunicación segura        |
        | Almacenamiento seguro      |
        | Validación de entrada      |
        | Protección contra ingeniería inversa|

  Regla: Almacenamiento seguro en móvil

    Escenario: Datos en dispositivo móvil
      Dado que app almacena datos en dispositivo
      Cuando se verifica
      Entonces se verifica:
        | Elemento                    |
        | Cifrado de datos locales   |
        | Keychain/Keystore seguro    |
        | Sin datos en logs           |
        | Sin datos en backup         |
        | Borrado remoto posible      |

  Regla: Comunicación móvil se protege

    Escenario: TLS en app móvil
      Dado que app móvil comunica con servidor
      Cuando se verifica
      Entonces se verifica:
        | Elemento                    |
        | TLS 1.3 obligatorio         |
        | Certificate pinning         |
        | Sin excepciones de certificados|
        | Validación de hostname      |
        | Protección contra MITM      |

  Regla: Publicación se gestiona

    Escenario: App en store
      Dado que app está en store público
      Cuando se gestiona
      Entonces se verifica:
        | Elemento                    |
        | Secrets no embebidos       |
        | Código ofuscado             |
        | Análisis de seguridad       |
        | Plan de actualización       |
        | Monitoreo de vulnerabilidades|

  Regla: MDM se integra

    Escenario: Gestión de dispositivo móvil
      Dado que hospital usa MDM
      Cuando se gestiona dispositivo
      Entonces se verifica:
        | Elemento                    |
        | Política de dispositivo     |
        | Acceso condicional          |
        | Borrado remoto              |
        | Geolocalización             |
        | Segmentación de red         |
