# language: es
# @id GHE-GIAC-034
# @type business-rule
# @domain security
# @layer mobile-forensics
# @risk s1
# @owner mobile-forensic-analyst
# @status proposed
# @requirement REQ-GIAC-034
# @risk-control CTRL-GIAC-034
# @regulation GIAC-GCFA-MOBILE SANS
@domain:sans_giac @type:business-rule @risk:s1 @status:proposed
Característica: GIAC GCFA — Forense de Dispositivos Móviles
  Como analista forense de móviles
  Quiero forense móvil conforme GCFA
  Para que dispositivos móviles del hospital se analicen forensemente

  Regla: Adquisición de móvil

    Escenario: Extracción de datos de móvil
      Dado que se necesita analizar dispositivo móvil
      Cuando se realiza adquisición
      Entonces se verifica:
        | Elemento                    |
        | Tipo de extracción          |
        | Adquisición física o lógica |
        | Cadena de custodia          |
        | Hash de integridad          |
        | Herramienta validada        |

  Regla: Análisis de datos móviles

    Escenario: Análisis de datos de aplicación
      Dado que se tiene imagen del móvil
      Cuando se analizan datos
      Entonces se verifica:
        | Elemento                    |
        | Mensajes (SMS, WhatsApp)    |
        | Llamadas                    |
        | Fotos y videos              |
        | Ubicación GPS               |
        | Datos de aplicación         |
        | Registros de navegador      |

  Regla: Análisis de comunicación

    Escenario: Análisis de apps de mensajería
      Dado que se analizan apps de mensajería
      Cuando se ejecuta análisis
      Entonces se verifica:
        | Elemento                    |
        | Mensajes cifrados           |
        | Metadatos de mensajes       |
        | Contactos                   |
        | Grupos                      |
        | Archivos compartidos        |
        | Patrones de comunicación    |
