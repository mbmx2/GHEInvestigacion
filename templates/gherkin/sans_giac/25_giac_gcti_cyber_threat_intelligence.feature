# language: es
# @id GHE-GIAC-025
# @type business-rule
# @domain security
# @layer threat-intel-advanced
# @risk s1
# @owner threat-intel-analyst
# @status proposed
# @requirement REQ-GIAC-025
# @risk-control CTRL-GIAC-025
# @regulation GIAC-GCTI SANS
@domain:sans_giac @type:business-rule @risk:s1 @status:proposed
Característica: GIAC GCTI — Inteligencia de Amenazas Cibernéticas
  Como analista de inteligencia certificado GCTI
  Quiero metodología GCTI de inteligencia de amenazas
  Para que la inteligencia sea accionable y predictiva

  Regla: Recopilación avanzada

    Escenario: Fuentes avanzadas de inteligencia
      Dado que se recopila inteligencia avanzada
      Cuando se ejecuta
      Entonces se verifica:
        | Fuente                       | Técnica         |
        | Dark web monitoring          | Vigilancia      |
        | Honeypots                    | Recopilación    |
        | Sinkholes                    | Análisis        |
        | Threat feeds                 | Correlación     |
        | ISACs                        | Compartida      |

  Regla: Análisis avanzado

    Escenario: Análisis de actores de amenaza
      Dado que se analizan actores de amenaza
      Cuando se ejecuta análisis
      Entonces se verifica:
        | Elemento                    |
        | Perfil del actor            |
        | Técnicas MITRE ATT&CK       |
        | Motivación                  |
        | Capacidad                   |
        | Infraestructura             |

  Regla: Inteligencia accionable

    Escenario: Threat intelligence para defensa
      Dado que inteligencia está lista
      Cuando se aplica a defensa
      Entonces se verifica:
        | Elemento                    |
        | Reglas IDS/IPS actualizadas |
        | Juegos de reglas WAF        |
        | Indicator hunting           |
        | Detección proactiva         |
        | Respuesta anticipada        |
