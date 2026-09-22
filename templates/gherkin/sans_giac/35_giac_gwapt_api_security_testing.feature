# language: es
# @id GHE-GIAC-035
# @type business-rule
# @domain security
# @layer api-security
# @risk s1
# @owner api-security-engineer
# @status proposed
# @requirement REQ-GIAC-035
# @risk-control CTRL-GIAC-035
# @regulation GIAC-GWAPT-API SANS
@domain:sans_giac @type:business-rule @risk:s1 @status:proposed
Característica: GIAC GWAPT — Pruebas de Seguridad de APIs
  Como pentester de APIs certificado GWAPT
  Quiero pruebas de seguridad de APIs conforme GWAPT
  Para que las APIs del hospital se prueben exhaustivamente

  Regla: APIs se identifican

    Escenario: Descubrimiento de APIs
      Dado que hospital expone APIs
      Cuando se descubren
      Entonces se verifica:
        | Elemento                    |
        | Endpoints documentados      |
        | Documentación OpenAPI/Swagger|
        | Versiones activas           |
        | Autenticación requerida     |
        | Datos sensibles expuestos   |

  Regla: Pruebas de autenticación API

    Escenario: Bypass de autenticación API
      Dado que se prueban controles de autenticación
      Cuando se ejecutan pruebas
      Entonces se verifica:
        | Vulnerabilidad               | Técnica                   |
        | Token bypass                 | Manipulación de headers   |
        | JWT vulnerabilities          | Algoritmo none, key confusion|
        | API key exposure             | Análisis de cliente       |
        | OAuth misconfiguration       | Redirect URI manipulation |
        | Rate limiting bypass         | Rotación de IP            |

  Regla: Pruebas de autorización API

    Escenario: BOLA en APIs
      Dado que se prueban controles de autorización
      Cuando se ejecutan pruebas
      Entonces se verifica:
        | Elemento                    |
        | IDOR                        |
        | BOLA                        |
        | Escalación de privilegios   |
        | Acceso a datos de otros usuarios|
        | Manipulación de parámetros  |

  Regla: Pruebas de inyección API

    Escenario: Inyección en APIs
      Dado que se prueban vulnerabilidades de inyección
      Cuando se ejecutan pruebas
      Entonces se verifica:
        | Elemento                    |
        | SQL injection en parámetros |
        | NoSQL injection             |
        | GraphQL injection           |
        | Command injection           |
        | SSRF via API                |

  Regla: Reporte de API

    Escenario: Informe de pentest API
      Dado que pruebas API están completas
      Cuando se genera informe
      Entonces incluye:
        | Sección                    |
        | Inventario de APIs         |
        | Vulnerabilidades OWASP API Top 10|
        | Evidencia con PoC          |
        | Recomendaciones específicas|
        | Plan de remediación        |
