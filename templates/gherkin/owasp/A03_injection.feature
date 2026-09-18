# language: es
# OWASP Top 10 - A03: Injection
# Inyección de código malicioso (SQL, NoSQL, OS, LDAP)
Característica: A03 - Inyección (OWASP Top 10)
  Como responsable de seguridad del proyecto GHE
  Quiero prevenir todas las formas de inyección
  Para proteger la integridad de datos y el sistema

  # ─────────────────────────────────────────────────────────────
  # 1. SQL INJECTION
  # ─────────────────────────────────────────────────────────────

  Escenario: Prevención de SQL Injection en búsquedas
    Dado que un usuario busca pacientes por nombre
    Cuando ingresa: "'; DROP TABLE patients; --"
    Entonces el sistema:
      | Acción                     | Estado    |
      | Parameterized queries      | ✅         |
      | Input sanitization         | ✅         |
      | No ejecuta SQL malicioso   | ✅         |
      | Retorna resultados normales| ✅         |
      | Tabla NO es eliminada      | ✅         |

  Escenario: Prevención de SQL Injection en login
    Dado que un atacante intenta inyección en login
    Cuando ingresa: "admin' OR '1'='1"
    Entonces el sistema:
      | Acción                     | Estado    |
      | Parameterized query        | ✅         |
      | Autenticación falla        | ✅         |
      | Acceso denegado            | ✅         |
      | Intento registrado         | ✅         |

  Escenario: Verificación de parameterized queries
    Dado que se revisa código de acceso a datos
    Cuando se verifica uso de queries
    Entonces:
      | Consulta                   | Método usado  | Seguro? |
      | Buscar paciente por CURP   | Parameterized | ✅      |
      | Buscar paciente por nombre | Parameterized | ✅      |
      | Insertar consulta          | Parameterized | ✅      |
      | Buscar por fecha           | Parameterized | ✅      |
    Y NO hay concatenación de strings en queries

  # ─────────────────────────────────────────────────────────────
  # 2. NOSQL INJECTION
  # ─────────────────────────────────────────────────────────────

  Escenario: Prevención de NoSQL Injection
    Dado que se usa SQLite (no NoSQL)
    Cuando se verifica
    Entonces:
      | Verificación               | Estado    |
      | SQLite usa SQL parameterized | ✅      |
      | No hay ORM vulnerable      | ✅         |
      | Input validado antes de query | ✅      |

  # ─────────────────────────────────────────────────────────────
  # 3. COMMAND INJECTION
  # ─────────────────────────────────────────────────────────────

  Escenario: Prevención de OS Command Injection
    Dado que el sistema genera reportes
    Cuando se procesa input del usuario
    Entonces:
      | Verificación               | Estado    |
      | No se ejecutan comandos del OS | ✅    |
      | No se usa `exec` con input | ✅         |
      | No se usa `shell` con input| ✅         |
      | Procesamiento es interno   | ✅         |

  # ─────────────────────────────────────────────────────────────
  # 4. LDAP INJECTION
  # ─────────────────────────────────────────────────────────────

  Escenario: Prevención de LDAP Injection
    Dado que el sistema no usa LDAP
    Cuando se verifica
    Entonces no aplica protección LDAP

  # ─────────────────────────────────────────────────────────────
  # 5. XSS (CROSS-SITE SCRIPTING)
  # ─────────────────────────────────────────────────────────────

  Escenario: Prevención de XSS reflejado
    Dado que un usuario ingresa script en campo de búsqueda
    Cuando busca: "<script>alert('XSS')</script>"
    Entonces el sistema:
      | Acción                     | Estado    |
      | Sanitiza output            | ✅         |
      | Escapa HTML                | ✅         |
      | Script NO se ejecuta       | ✅         |

  Escenario: Prevención de XSS almacenado
    Dado que se guarda script malicioso en notas clínicas
    Cuando otro usuario visualiza la nota
    Entonces el sistema:
      | Acción                     | Estado    |
      | Output encoding            | ✅         |
      | Content Security Policy    | ✅         |
      | Script NO se ejecuta       | ✅         |

  # ─────────────────────────────────────────────────────────────
  # 6. VALIDACIÓN DE ENTRADA
  # ─────────────────────────────────────────────────────────────

  Escenario: Validación de entrada en tiempo real
    Dado que el sistema valida todo input
    Cuando se procesa input
    Entonces:
      | Tipo de input              | Validación            |
      | CURP                       | Regex + longitud      |
      | Nombre                     | Solo letras, espacios |
      | Teléfono                   | Solo números          |
      | Email                      | Formato válido        |
      | Cantidad de medicamento    | Número positivo       |
      | Fecha                      | Formato válido        |
    Y input inválido es rechazado antes de procesar
  