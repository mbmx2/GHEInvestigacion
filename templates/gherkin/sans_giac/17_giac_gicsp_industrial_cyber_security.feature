# language: es
# @id GHE-GIAC-017
# @type business-rule
# @domain security
# @layer ics-security
# @risk s1
# @owner ics-security-engineer
# @status proposed
# @requirement REQ-GIAC-017
# @risk-control CTRL-GIAC-017
# @regulation GIAC-GICSP SANS
@domain:sans_giac @type:business-rule @risk:s1 @status:proposed
Característica: GIAC GICSP — Seguridad de Sistemas Industriales
  Como ingeniero de seguridad ICS certificado GICSP
  Quiero metodología GICSP de seguridad industrial
  Para que dispositivos médicos y sistemas industriales del hospital estén protegidos

  Regla: Dispositivos médicos conectados se protegen

    Escenario: Seguridad de dispositivos IoT médico
      Dado que hospital tiene dispositivos conectados
      Cuando se gestionan
      Entonces se verifica:
        | Elemento                    |
        | Inventario de dispositivos  |
        | Segmentación de red         |
        | Actualizaciones gestionadas |
        | Credenciales por defecto    |
        | Monitoreo de anomalías      |

  Regla: Sistemas de control se protegen

    Escenario: Protección de sistemas de control
      Dado que hospital tiene sistemas de control
      Cuando se protegen
      Entonces se verifica:
        | Elemento                    |
        | Red de control separada     |
        | Acceso restringido          |
        | Monitoreo de tráfico        |
        | Respuesta a incidentes      |
        | Continuidad del negocio     |

  Regla: Protocolos industriales se aseguran

    Escenario: Seguridad de protocolos ICS
      Dado que se usan protocolos industriales
      Cuando se aseguran
      Entonces se verifica:
        | Elemento                    |
        | ModBus seguro               |
        | DNP3 seguro                 |
        | BACnet seguro               |
        | Monitoreo de tráfico        |
        | Detección de anomalías      |
