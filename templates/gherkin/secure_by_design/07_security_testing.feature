# language: es
# Secure by Design - Security Testing
# TESTING DE SEGURIDAD: Verificar que la seguridad funciona
Característica: Testing de Seguridad (Secure by Design - GHE)
  Como responsable de seguridad del proyecto GHE
  Quiero probar los controles de seguridad
  Para verificar que protegen contra amenazas

  # ─────────────────────────────────────────────────────────────
  # 1. PRUEBAS DE SEGURIDAD ESTÁTICAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Análisis estático de código (SAST)
    Dado que se ejecuta análisis estático
    Cuando se escanea código
    Entonces:
      | Herramienta                | Qué detecta          |
      | Linting (clj-kondo)       | Code smells, bugs    |
      | SonarQube                  | Vulnerabilidades     |
      | Dependency check           | CVEs en dependencias |
    Y no hay vulnerabilidades críticas

  Escenario: Revisión de código de seguridad
    Dado que se realiza code review de seguridad
    Cuando se revisa código
    Entonces se verifica:
      | Criterio                   | Estado    |
      | Parameterized queries      | ✅         |
      | Input validation           | ✅         |
      | Output encoding            | ✅         |
      | Proper error handling      | ✅         |
      | No hardcoded secrets       | ✅         |
      | Secure defaults            | ✅         |

  # ─────────────────────────────────────────────────────────────
  # 2. PRUEBAS DE SEGURIDAD DINÁMICAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Pruebas de penetración (pentest)
    Dado que se realiza pentest básico
    Cuando se ejecuta
    Entonces se prueban:
      | Vector de ataque           | Resultado esperado   |
      | SQL Injection              | Bloqueado            |
      | XSS reflejado              | Bloqueado            |
      | XSS almacenado             | Bloqueado            |
      | CSRF                       | Token requerido      |
      | Authentication bypass      | Denegado             |
      | Authorization bypass       | Denegado             |
      | Session hijacking          | Protegido            |
      | Directory traversal        | Bloqueado            |
      | File inclusion             | Bloqueado            |

  Escenario: Pruebas OWASP ZAP
    Dado que se ejecuta OWASP ZAP
    Cuando se escanea aplicación
    Entonces:
      | Severidad                  | Cantidad esperada    |
      | High                       | 0                    |
      | Medium                     | <5                   |
      | Low                        | <10                  |
      | Informational              | Documentar           |

  # ─────────────────────────────────────────────────────────────
  # 3. PRUEBAS DE SEGURIDAD MANUALES
  # ─────────────────────────────────────────────────────────────

  Escenario: Checklist de seguridad manual
    Dado que se realiza revisión manual de seguridad
    Cuando se verifica
    Entonces:
      | Criterio                   | Estado    |
      | Login seguro               | ✅         |
      | Logout funciona            | ✅         |
      | Sesiones expiran           | ✅         |
      | Passwords hasheados        | ✅         |
      | Datos cifrados en reposo   | ✅         |
      | Datos cifrados en tránsito | ✅         |
      | Audit log funciona         | ✅         |
      | RBAC funciona              | ✅         |
      | Rate limiting funciona     | ✅         |
      | Headers de seguridad       | ✅         |

  Escenario: Prueba de regresión de seguridad
    Dado que se corrige vulnerabilidad
    Cuando se verifica fix
    Entonces:
      | Paso                       |
      | 1. Escribir test que reproduzca la vulnerabilidad |
      | 2. Verificar que el test falla |
      | 3. Implementar fix         |
      | 4. Verificar que el test pasa |
      | 5. Agregar test de regresión |
      | 6. Ejecutar pentest completo |

  # ─────────────────────────────────────────────────────────────
  # 4. MONITOREO DE SEGURIDAD
  # ─────────────────────────────────────────────────────────────

  Escenario: Monitoreo continuo de seguridad
    Dado que se monitorea seguridad en producción
    Cuando se detecta anomalía
    Entonces:
      | Evento                     | Acción    |
      | 5+ logins fallidos         | Alerta    |
      | Intento de inyección       | Alerta + bloqueo |
      | Acceso fuera de horario    | Alerta    |
      | Modificación masiva        | Alerta    |
      | Error de sistema           | Alerta    |
  