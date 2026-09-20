# language: es
# OWASP Top 10 - A04: Insecure Design
@status:proposed
@type:acceptance
@domain:general
# Diseño inseguro que no considera amenazas desde el inicio
Característica: A04 - Diseño Inseguro (OWASP Top 10)
  Como arquitecto de seguridad del proyecto GHE
  Quiero integrar seguridad desde el diseño (Security by Design)
  Para prevenir vulnerabilidades arquitectónicas

  # ─────────────────────────────────────────────────────────────
  # 1. THREAT MODELING
  # ─────────────────────────────────────────────────────────────

  Escenario: Modelado de amenazas (STRIDE)
    Dado que se realiza threat modeling de GHE
    Cuando se evalúa cada componente
    Entonces se identifican amenazas:
      | Componente                 | Spoofing | Tampering | Repudiation | Info Disclosure | DoS | Elevation |
      | Patient API                | Media    | Media     | Baja        | Alta            | Baja | Media     |
      | Pharmacy Module            | Baja     | Alta      | Media       | Alta            | Baja | Baja      |
      | Authentication             | Alta     | Media     | Baja        | Media           | Media | Alta    |
      | Database (SQLite)          | Baja     | Media     | Media       | Alta            | Baja | Baja      |
      | Sync Engine                | Media    | Media     | Media       | Media           | Media | Media   |

  Escenario: Controles de seguridad por amenaza
    Dado que se definen controles para cada amenaza
    Cuando se implementa
    Entonces:
      | Amenaza                    | Control implementado   |
      | Spoofing                   | Autenticación robusta + MFA futuro |
      | Tampering                  | Integridad SHA-256 + auditoría |
      | Repudiation                | Audit log inmutable   |
      | Info Disclosure            | Cifrado + RBAC        |
      | DoRate of Service          | Rate limiting + validación |
      | Elevation of Privilege     | RBAC estricto         |

  # ─────────────────────────────────────────────────────────────
  # 2. DISEÑO SEGURO DE API
  # ─────────────────────────────────────────────────────────────

  Escenario: Rate limiting en endpoints
    Dado que se implementa rate limiting
    Cuando un cliente envía muchas peticiones
    Entonces:
      | Endpoint                   | Límite                | Acción al exceder |
      | POST /api/auth/login       | 5 intentos/min        | Bloquear 15 min   |
      | GET /api/patients          | 100 req/min           | 429 Too Many      |
      | POST /api/consultations    | 50 req/min            | 429 Too Many      |
      | POST /api/prescriptions    | 30 req/min            | 429 Too Many      |

  Escenario: Validación de Content-Type
    Dado que se reciben peticiones HTTP
    Cuando se valida Content-Type
    Entonces:
      | Content-Type permitido     | Acción                |
      | application/json           | Procesar              |
      | application/x-www-form-urlencoded | Procesar      |
      | text/html                  | Rechazar              |
      | application/xml            | Rechazar (XXE risk)   |

  # ─────────────────────────────────────────────────────────────
  # 3. SEGREGACIÓN DE DATOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Segregación de datos por tenant
    Dado que el sistema maneja datos de múltiples pacientes
    Cuando se accede a datos
    Entonces:
      | Verificación               | Estado    |
      | Cada paciente tiene datos aislados | ✅ |
      | No hay acceso cruzado entre pacientes | ✅ |
      | Queries filtran por patient_id | ✅      |
      | Datos no se mezclan en cache  | ✅       |

  Escenario: Principio de mínimo privilegio en datos
    Dado que cada rol accede solo a datos necesarios
    Cuando se verifica
    Entonces:
      | Rol                         | Datos que ve         |
      | Doctor                      | Solo sus pacientes   |
      | Nurse                       | Solo pacientes asignados |
      | Pharmacy                    | Solo recetas, no diagnósticos |
      | Reception                   | Solo datos demográficos |
      | Admin                       | Todos (con auditoría)|
  