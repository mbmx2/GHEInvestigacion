# language: es
# @id GHE-GIAC-010
# @type business-rule
# @domain security
# @layer intrusion-analysis
# @risk s1
# @owner ir-analyst
# @status proposed
# @requirement REQ-GIAC-010
# @risk-control CTRL-GIAC-010
# @regulation GIAC-GCIA SANS
@domain:sans_giac @type:business-rule @risk:s1 @status:proposed
Característica: GIAC GCIA — Análisis de Intrusiones
  Como analista de intrusiones certificado GCIA
  Quiero metodología GCIA de análisis de intrusiones
  Para que las intrusiones se detecten y analicen con precisión

  Regla: Análisis de tráfico de red

    Escenario: Captura y análisis de paquetes
      Dado que se sospecha de intrusión
      Cuando se captura tráfico
      Entonces se verifica:
        | Elemento                    |
        | Captura completa            |
        | Análisis de protocolos      |
        | Detección de anomalías      |
        | Correlación con IoCs        |
        | Extracción de evidencia     |

  Regla: Análisis de logs

    Escenario: Correlación de logs
      Dado que se analizan múltiples fuentes de log
      Cuando se correlacionan
      Entonces se verifica:
        | Elemento                    |
        | Timeline unificada          |
        | Patrones de acceso          |
        | Actividad sospechosa        |
        | Pivoting entre sistemas     |
        | Indicadores de compromiso   |

  Regla: Técnicas de análisis

    Escenario: Análisis de malware en red
      Dado que se detecta tráfico malicioso
      Cuando se analiza
      Entonces se verifica:
        | Elemento                    |
        | Análisis de C2              |
        | Detección de exfiltración   |
        | Protocolos tunelizados      |
        | Evasión de detección        |
        | Firmas de amenazas          |

  Regla: Reporte de análisis

    Escenario: Informe de intrusión
      Dado que análisis está completo
      Cuando se genera informe
      Entonces incluye:
        | Sección                    |
        | Timeline de intrusión      |
        | Técnicas del atacante      |
        | Sistemas comprometidos     |
        | Evidencia recolectada      |
        | Recomendaciones de defensa |
