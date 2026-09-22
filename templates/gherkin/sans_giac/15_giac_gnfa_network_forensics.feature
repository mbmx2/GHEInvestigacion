# language: es
# @id GHE-GIAC-015
# @type business-rule
# @domain security
# @layer network-forensics
# @risk s1
# @owner network-forensic-analyst
# @status proposed
# @requirement REQ-GIAC-015
# @risk-control CTRL-GIAC-015
# @regulation GIAC-GNFA SANS
@domain:sans_giac @type:business-rule @risk:s1 @status:proposed
Característica: GIAC GNFA — Análisis Forense de Red
  Como analista forense de red certificado GNFA
  Quiero metodología GNFA de análisis forense de red
  Para que los incidentes de red se analicen con precisión

  Regla: Captura de tráfico

    Escenario: Captura de paquetes
      Dado que se investiga incidente de red
      Cuando se captura tráfico
      Entonces se verifica:
        | Elemento                    |
        | Captura completa            |
        | Período de tiempo definido  |
        | Filtros apropiados          |
        | Almacenamiento seguro       |
        | Documentación completa      |

  Regla: Análisis de tráfico

    Escenario: Análisis de protocolos
      Dado que se analiza tráfico capturado
      Cuando se ejecuta análisis
      Entonces se verifica:
        | Elemento                    |
        | Protocolos identificados    |
        | Comunicaciones anómalas     |
        | Datos exfiltrados           |
        | C2 identificado             |
        | Timeline de comunicación    |

  Regla: Detección de exfiltración

    Escenario: Análisis de exfiltración
      Dado que se sospecha de exfiltración
      Cuando se analiza tráfico
      Entonces se verifica:
        | Elemento                    |
        | Volumen de datos anómalo    |
        | Destinos inusuales          |
        | Protocolos tunelizados      |
        | Encriptación inusual        |
        | Timing de transferencia     |

  Regla: Reporte de forense de red

    Escenario: Informe GNFA
      Dado que análisis está completo
      Cuando se genera informe
      Entonces incluye:
        | Sección                    |
        | Flujo de datos reconstruido|
        | Comunicaciones maliciosas  |
        | Evidencia de red           |
        | IoCs extraídos             |
        | Recomendaciones de defensa |
