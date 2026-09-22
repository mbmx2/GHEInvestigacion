# language: es
# @id GHE-GIAC-016
# @type business-rule
# @domain security
# @layer osint
# @risk s2
# @owner osint-analyst
# @status proposed
# @requirement REQ-GIAC-016
# @risk-control CTRL-GIAC-016
# @regulation GIAC-GOSINT SANS
@domain:sans_giac @type:business-rule @risk:s2 @status:proposed
Característica: GIAC GOSINT — Inteligencia de Fuentes Abiertas
  Como analista OSINT certificado GOSINT
  Quiero metodología GOSINT de inteligencia de fuentes abiertas
  Para que la información pública se利用e para seguridad

  Regla: Recopilación OSINT

    Escenario: Técnicas de OSINT
      Dado que se recopila inteligencia de fuentes abiertas
      Cuando se ejecutan técnicas
      Entonces se verifica:
        | Fuente                       | Técnica         |
        | Redes sociales               | Perfilado       |
        | Motores de búsqueda          | Dorking         |
        | Registros DNS                | Enumeración     |
        | WHOIS                         | Propiedad       |
        | Paste sites                  | Monitoreo       |
        | Dark web                     | Vigilancia      |

  Regla: Análisis OSINT

    Escenario: Correlación de datos
      Dado que datos OSINT son recopilados
      Cuando se correlacionan
      Entonces se verifica:
        | Elemento                    |
        | Perfil completo construido  |
        | Amenazas identificadas      |
        | Vulnerabilidades expuestas  |
        | Información privilegiada    |
        | Patrones de comportamiento  |

  Regla: OSINT para seguridad

    Escenario: OSINT defensivo
      Dado que se usa OSINT para defensa
      Cuando se ejecuta
      Entonces se verifica:
        | Elemento                    |
        | Exposición de datos         |
        | Phishing proyectado         |
        | Brand protection            |
        | Due diligence de proveedores|
        | Monitoreo de amenazas       |
