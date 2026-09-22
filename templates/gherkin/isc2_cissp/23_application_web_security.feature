# language: es
# @id GHE-CISSP-023
# @type business-rule
# @domain security
# @layer application-firewall
# @risk s1
# @owner appsec-engineer
# @status proposed
# @requirement REQ-CISSP-023
# @risk-control CTRL-CISSP-023
# @regulation CISSP-D4 ISC2 OWASP
@domain:isc2_cissp @type:business-rule @risk:s1 @status:proposed
Característica: CISSP — Seguridad de Aplicaciones Web y APIs
  Como ingeniero de seguridad de aplicaciones
  Quiero seguridad de apps web y APIs conforme CISSP
  Para que las interfaces web de GHE sean seguras contra ataques

  Regla: Validación de entrada se implementa

    Escenario: Sanitización de entrada
      Dado que aplicación recibe datos de usuario
      Cuando se procesa entrada
      Entonces se verifica:
        | Elemento                    |
        | Validación de tipo          |
        | Validación de longitud      |
        | Sanitización de HTML        |
        | Parameterized queries       |
        | WAF configurado             |

    Escenario: Prevención de inyección SQL
      Dado que aplicación consulta base de datos
      Cuando se construye query
      Entonces se verifica:
        | Elemento                    |
        | Prepared statements         |
        | Sin concatenación de queries |
        | Validación de parámetros    |
        | Principio de mínimo privilegio BD|

  Regla: Gestión de sesiones se asegura

    Escenario: Sesiones seguras
      Dado que usuario tiene sesión activa
      Cuando se gestiona sesión
      Entonces se verifica:
        | Elemento                    |
        | Token aleatorio y único     |
        | Timeout de inactividad      |
        | Regeneración post-login     |
        | Invalidación al logout      |
        | Secure/HttpOnly flags       |

  Regla: Protección contra ataques web

    Escenario: Prevención de XSS
      Dado que aplicación renderiza contenido
      Cuando se procesa output
      Entonces se verifica:
        | Elemento                    |
        | Output encoding             |
        | Content Security Policy     |
        | X-Content-Type-Options      |
        | X-Frame-Options             |

    Escenario: Prevención de CSRF
      Dado que aplicación procesa formularios
      Cuando se protege contra CSRF
      Entonces se verifica:
        | Elemento                    |
        | Token CSRF por formulario   |
        | SameSite cookie             |
        | Origin/Referer validation   |
        | Double submit cookie        |

  Regla: Seguridad de APIs se implementa

    Escenario: Seguridad de REST API
      Dado que GHE expone APIs REST
      Cuando se aseguran
      Entonces se verifica:
        | Elemento                    |
        | Autenticación obligatoria   |
        | Rate limiting               |
        | Input validation            |
        | Output filtering            |
        | Logging de accesos          |
        | Versionado de API           |
