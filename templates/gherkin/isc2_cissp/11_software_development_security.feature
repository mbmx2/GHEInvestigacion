# language: es
# @id GHE-CISSP-011
# @type business-rule
# @domain security
# @layer software-dev
# @risk s1
# @owner secure-dev-lead
# @status proposed
# @requirement REQ-CISSP-011
# @risk-control CTRL-CISSP-011
# @regulation CISSP-D8 ISC2 IEC-62304
@domain:isc2_cissp @type:business-rule @risk:s1 @status:proposed
Característica: CISSP Dominio 8 — Seguridad en Desarrollo de Software
  Como líder de desarrollo seguro
  Quiero seguridad integrada en SDLC conforme CISSP Domain 8
  Para que el software médico sea seguro desde el diseño hasta la producción

  Regla: Seguridad se integra en SDLC

    Escenario: Fases del SDLC con seguridad
      Dado que se desarrolla software médico
      Cuando se ejecuta SDLC
      Entonces se verifica seguridad en cada fase:
        | Fase       | Actividad de seguridad            |
        | Requisitos| Identificación de amenazas         |
        | Diseño    | Modelado de amenazas, arquitectura |
        | Construcción| Código seguro, revisiones       |
        | Pruebas   | SAST, DAST, pen testing           |
        | Despliegue| Configuración segura               |
        | Operación | Monitoreo, parches                 |

  Regla: coding seguro se aplica

    Escenario: Prácticas de coding seguro
      Dado que desarrollador escribe código
      Cuando se aplican prácticas
      Entonces se verifica:
        | Práctica                    |
        | Validación de entrada        |
        | Codificación de salida       |
        | Parameterized queries       |
        | Gestión de errores           |
        | Logging sin datos sensibles  |
        | Autenticación robusta        |
        | Control de acceso            |

    Escenario: OWASP Top 10 se mitig
      Dado que se revisa código contra OWASP
      Cuando se evalúa
      Entonces se verifica mitigación de:
        | Vulnerabilidad               | Mitigación              |
        | A01 Broken Access Control   | RBAC, validación        |
        | A02 Cryptographic Failures  | Cifrado fuerte          |
        | A03 Injection                | Parameterized queries   |
        | A04 Insecure Design          | Threat modeling         |
        | A05 Security Misconfiguration| Hardening              |
        | A06 Vulnerable Components    | Dependency scanning     |
        | A07 Authentication Failures  | MFA, rate limiting      |
        | A08 Data Integrity           | Signing, verification   |
        | A09 Logging Failures         | Audit logging           |
        | A10 SSRF                     | Input validation        |

  Regla: Dependencias se gestionan

    Escenario: Análisis de dependencias
      Dado que software usa dependencias externas
      Cuando se analizan
      Entonces se verifica:
        | Elemento                    |
        | CVEs conocidos              |
        | Licencias compatibles       |
        | Actualizaciones disponibles |
        | Alternativas seguras        |

  Regla: DevSecOps se implementa

    Escenario: Pipeline de seguridad
      Dado que se ejecuta pipeline CI/CD
      Cuando se integra seguridad
      Entonces se verifica:
        | Herramienta | Fase           | Acción                    |
        | SAST       | Build          | Escaneo estático          |
        | DAST       | Staging        | Escaneo dinámico          |
        | SCA        | Build          | Análisis de composición   |
        | Container  | Build          | Escaneo de imagen         |
        | IaC        | Deploy         | Validación de configuración|
        | Secret     | Build          | Detección de secretos     |
