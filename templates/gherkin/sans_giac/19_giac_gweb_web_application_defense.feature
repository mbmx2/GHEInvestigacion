# language: es
# @id GHE-GIAC-019
# @type business-rule
# @domain security
# @layer web-defense
# @risk s1
# @owner appsec-engineer
# @status proposed
# @requirement REQ-GIAC-019
# @risk-control CTRL-GIAC-019
# @regulation GIAC-GWEB SANS
@domain:sans_giac @type:business-rule @risk:s1 @status:proposed
Característica: GIAC GWEB — Defensa de Aplicaciones Web
  Como ingeniero de seguridad web certificado GWEB
  Quiero metodología GWEB de defensa web
  Para que las aplicaciones web del hospital sean defendidas efectivamente

  Regla: WAF se configura

    Escenario: Configuración de WAF
      Dado que aplicación web tiene WAF
      Cuando se configura
      Entonces se verifica:
        | Elemento                    |
        | Reglas OWASP activas        |
        | Custom rules configuradas   |
        | Modo de operación           |
        | Logging habilitado          |
        | Actualizaciones de reglas   |

  Regla: Seguridad de aplicaciones se defiende

    Escenario: Defensa contra inyección
      Dado que se defiende contra inyección
      Cuando se implementa defensa
      Entonces se verifica:
        | Elemento                    |
        | Input validation            |
        | Output encoding             |
        | Parameterized queries       |
        | WAF rules                   |
        | Security headers            |

  Regla: Monitoreo web se implementa

    Escenario: Monitoreo de aplicaciones web
      Dado que se monitorea aplicación web
      Cuando se implementa monitoreo
      Entonces se verifica:
        | Elemento                    |
        | Request logging             |
        | Error tracking              |
        | Performance monitoring      |
        | Security event correlation  |
        | Alertas configuradas        |
