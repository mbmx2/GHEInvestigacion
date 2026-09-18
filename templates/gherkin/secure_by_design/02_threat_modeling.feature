# language: es
# Secure by Design - Threat Modeling
# MODELADO DE AMENAZAS: Identificar amenazas ANTES de implementar
Característica: Threat Modeling (Secure by Design - GHE)
  Como arquitecto de seguridad del proyecto GHE
  Quiero modelar amenazas desde el diseño
  Para identificar y mitigar riesgos antes de implementar

  # ─────────────────────────────────────────────────────────────
  # 1. METODOLOGÍA STRIDE
  # ─────────────────────────────────────────────────────────────

  Escenario: Análisis STRIDE por componente
    Dado que se aplica STRIDE a cada componente
    Cuando se evalúa
    Entonces se documenta:
      | Componente                 | S | T | R | I | D | E | Controles           |
      | Patient API                | M | M | B | A | B | M | Auth + Audit + Hash |
      | Consultation API           | B | M | M | A | B | M | Auth + RBAC + Hash  |
      | Pharmacy Module            | B | A | M | A | B | B | RBAC + Audit + Cifrado |
      | Authentication             | A | M | B | M | M | A | Rate limit + Lockout |
      | Database (SQLite)          | B | M | M | A | B | B | Cifrado + Backup    |
      | Sync Engine                | M | M | M | M | M | M | TLS + Hash + Audit  |
      | WhatsApp Integration       | M | M | M | M | B | B | TLS + Validación    |

  Escenario: Controles por categoría STRIDE
    Dado que se definen controles para cada amenaza
    Cuando se implementa
    Entonces:
      | Amenaza (S)                | Control              |
      | Spoofing                   | Autenticación robusta + MFA futuro |
      | Tampering                  | Integridad SHA-256 + auditoría |
      | Repudiation                | Audit log inmutable  |
      | Information Disclosure     | Cifrado + RBAC       |
      | Denial of Service          | Rate limiting + validación |
      | Elevation of Privilege     | RBAC estricto + validación |

  # ─────────────────────────────────────────────────────────────
  # 2. DATABUS ANALYSIS
  # ─────────────────────────────────────────────────────────────

  Escenario: Análisis de flujo de datos
    Dado que se mapea flujo de datos sensible
    Cuando se analiza
    Entonces:
      | Flujo                      | Datos sensibles      | Controles            |
      | Paciente → UI              | Nombre, CURP         | TLS, RBAC            |
      | UI → API                   | Datos de consulta    | TLS, validación      |
      | API → Domain               | Datos clínicos       | Validación dominio   |
      | Domain → Repository        | Datos persistidos    | Cifrado AES-256      |
      | Repository → SQLite        | Datos en disco       | SQLCipher            |
      | Domain → EventPublisher    | Eventos de dominio   | Hash SHA-256         |
      | Domain → AuditLogger       | Logs de auditoría    | Append-only + Hash   |

  # ─────────────────────────────────────────────────────────────
  # 3. MATRIZ DE RIESGOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Evaluación de riesgos
    Dado que se evalúa cada amenaza
    Cuando se calcula riesgo
    Entonces se genera matriz:
      | Amenaza                    | Probabilidad | Impacto | Riesgo | Mitigación |
      | Acceso no autorizado       | Alta         | Alto    | Crítico| RBAC + Cifrado |
      | SQL Injection              | Media        | Alto    | Alto   | Parameterized queries |
      | Pérdida de datos           | Baja         | Crítico | Alto   | Backup + Cifrado |
      | Fallo de autenticación     | Media        | Alto    | Alto   | Rate limiting + Lockout |
      | Manipulación de logs       | Baja         | Alto    | Medio  | Hash encadenado |
      | Exfiltración de datos      | Baja         | Crítico | Alto   | Cifrado + Monitoreo |

  # ─────────────────────────────────────────────────────────────
  # 4. ABUSTRIDE
  # ─────────────────────────────────────────────────────────────

  Escenario: Análisis de abuse cases
    Dado que se identifican abuse cases
    Cuando se documenta
    Entonces:
      | Abuse Case                 | Motivación           | Defensa               |
      | Robar expedientes          | Vender datos         | Cifrado + RBAC + Audit |
      | Manipular prescripciones   | Obtener drogas       | Firma + Audit         |
      | Acceder a otros pacientes  | Curiosidad/venganza  | RBAC por registro     |
      | Sobrecargar sistema        | Negar servicio       | Rate limiting         |
      | Manipular inventario       | Robo/fraude          | Audit + Dual control  |
  