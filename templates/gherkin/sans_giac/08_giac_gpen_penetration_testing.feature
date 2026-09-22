# language: es
# @id GHE-GIAC-008
# @type business-rule
# @domain security
# @layer pentest
# @risk s1
# @owner pentester
# @status proposed
# @requirement REQ-GIAC-008
# @risk-control CTRL-GIAC-008
# @regulation GIAC-GPEN SANS
@domain:sans_giac @type:business-rule @risk:s1 @status:proposed
Característica: GIAC GPEN — Prueba de Penetración Avanzada
  Como pentester certificado
  Quiero metodología GPEN de pruebas de penetración
  Para que las pruebas sean avanzadas,éticas y efectivas

  Regla: Reconocimiento avanzado

    Escenario: Recopilación de información
      Dado que pentester realiza reconocimiento
      Cuando ejecuta técnicas GPEN
      Entonces se verifica:
        | Técnica                      |
        | OSINT avanzado               |
        | Enumeración de dominios      |
        | Fingerprinting de servicios  |
        | Social engineering           |
        | Reconocimiento de red        |

  Regla: Explotación avanzada

    Escenario: Explotación de vulnerabilidades
      Dado que vulnerabilidades están identificadas
      Cuando se explotan con técnicas GPEN
      Entonces se verifica:
        | Técnica                      |
        | Metasploit framework         |
        | Explotación personalizada    |
        | Escalación de privilegios    |
        | Post-explotación             |
        | Persistencia                 |

  Regla: Post-explotación

    Escenario: Análisis post-explotación
      Dado que explotación fue exitosa
      Cuando se analiza post-explotación
      Entonces se verifica:
        | Elemento                    |
        | Datos accedidos             |
        | Alcance determinado         |
        | Privilegios obtenidos       |
        | Movimiento lateral          |
        | Exfiltración simulada       |

  Regla: Reporte y remediación

    Escenario: Informe GPEN
      Dado que pentest está completo
      Cuando se genera informe
      Entonces incluye:
        | Sección                    |
        | Metodología detallada      |
        | Vulnerabilidades con CVSS  |
        | Evidencia de explotación   |
        | Recomendaciones accionables|
        | Plan de remediación        |
