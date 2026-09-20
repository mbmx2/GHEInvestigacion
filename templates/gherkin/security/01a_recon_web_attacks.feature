# language: es
Característica: Pentest - Reconocimiento y Vulnerabilidades Web
@status:proposed
@type:acceptance
@domain:security
  Como tester de seguridad del hospital
  Quiero simular reconocimiento y ataques web
  Para descubrir vulnerabilidades antes de los atacantes

  Contexto:
    Dado que el sistema está activo
    Y que el usuario tiene rol de tester de seguridad

  Escenario: Reconocimiento externo
    Dado que se inicia pentest
    Cuando se realiza reconocimiento
    Entonces se verifica:
      | Técnica                     | Qué buscar       |
      | Enumeración subdominios   | Endpoints expuestos|
      | Escaneo de puertos        | Servicios abiertos |
      | Fingerprinting            | Stack tecnológico  |
      | OSINT                     | Info pública       |

  Escenario: SQL Injection
    Dado que se prueba SQL injection
    Cuando se envían payloads
    Entonces el sistema resiste:
      | Payload                   | Resultado    |
      | ' OR '1'='1              | Rechazado    |
      | '; DROP TABLE patients;--| Rechazado    |
      | ' UNION SELECT *--        | Rechazado    |

  Escenario: Cross-Site Scripting (XSS)
    Dado que se prueba XSS
    Cuando se envían payloads
    Entonces el sistema resiste:
      | Payload                   | Resultado    |
      | <script>alert(1)</script> | Sanitizado   |
      | <img src=x onerror=alert(1)> | Sanitizado |
      | javascript:alert(1)      | Bloqueado    |

  Escenario: CSRF y XXE
    Dado que se prueba CSRF y XXE
    Cuando se evalúa
    Entonces:
      | Verificación              | Estado  |
      | Token CSRF en formularios | ✅       |
      | SameSite cookie           | ✅       |
      | XXE bloqueado             | ✅       |
