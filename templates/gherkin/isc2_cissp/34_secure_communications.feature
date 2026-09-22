# language: es
# @id GHE-CISSP-034
# @type business-rule
# @domain security
# @layer secure-comms
# @risk s1
# @owner communications-security-engineer
# @status proposed
# @requirement REQ-CISSP-034
# @risk-control CTRL-CISSP-034
# @regulation CISSP-D4 ISC2
@domain:isc2_cissp @type:business-rule @risk:s1 @status:proposed
Característica: CISSP — Comunicaciones Seguras y Email Security
  Como ingeniero de comunicaciones
  Quiero comunicaciones seguras conforme CISSP
  Para que toda comunicación del hospital sea confidencial e íntegra

  Regla: Email se protege

    Escenario: Email cifrado
      Dado que hospital envía correos con datos sensibles
      Cuando se protege email
      Entonces se verifica:
        | Elemento                    |
        | S/MIME o PGP para cifrado   |
        | Firma digital de emails     |
        | DLP en gateway de correo     |
        | Anti-phishing configurado   |
        | Retención de emails         |

    Escenario: Protección contra phishing
      Dado que email es vector de ataque
      Cuando se protege
      Entonces se verifica:
        | Elemento                    |
        | SPF configurado             |
        | DKIM habilitado             |
        | DMARC en política reject    |
        | Anti-impersonation          |
        | Sandboxing de adjuntos      |

  Regla: Mensajería segura se implementa

    Escenario: App de mensajería para hospital
      Dado que personal necesita comunicarse
      Cuando usa mensajería
      Entonces se verifica:
        | Elemento                    |
        | Cifrado end-to-end          |
        | Autenticación de usuarios   |
        | Política de retención       |
        | Sin datos en servidores     |
        | Borrado remoto posible      |

  Regla: Comunicaciones VoIP se protegen

    Escenario: Llamadas VoIP seguras
      Dado que hospital usa VoIP
      Cuando se configura seguridad
      Entonces se verifica:
        | Elemento                    |
        | SRTP para cifrado de audio  |
        | TLS para signaling          |
        | Segmentación de red         |
        | Monitoreo de calidad        |
        | Grabación segura si aplica  |

  Regla: Comunicaciones de red se cifran

    Escenario: Comunicación entre sistemas
      Dado que sistemas GHE se comunican
      Cuando se protege comunicación
      Entonces se verifica:
        | Elemento                    |
        | TLS 1.3 obligatorio         |
        | mTLS entre servicios        |
        | Certificate pinning         |
        | Perfect forward secrecy     |
        | Monitoreo de certificados   |
