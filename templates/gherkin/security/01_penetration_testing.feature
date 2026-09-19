# language: es
# Black Hacking y Pruebas de Penetración
Característica: Pruebas de Penetración (GHE Security)
  Como responsable de seguridad del proyecto GHE
  Quiero simular ataques reales contra el sistema
  Para descubrir vulnerabilidades antes de que los atacantes las encuentren

  # ─────────────────────────────────────────────────────────────
  # 1. FASE DE RECONOCIMIENTO
  # ─────────────────────────────────────────────────────────────

  Escenario: Reconocimiento externo
    Dado que se inicia prueba de penetración
    Cuando se realiza reconocimiento
    Entonces se verifica:
      | Técnica                     | Qué buscar |
      | Enumeración de subdominios| Endpoints expuestos |
      | Escaneo de puertos        | Servicios abiertos |
      | Fingerprinting tecnológico| Stack tecnológico   |
      | Búsqueda de información   | Archivos expuestos, headers |
      | OSINT                     | Información pública relevante |

  Escenario: Reconocimiento interno
    Dado que se tiene acceso interno
    Cuando se evalúa
    Entonces se verifica:
      | Área                        | Qué auditar |
      | Configuración del servidor | Hardening   |
      | Configuración de red       | Firewalls, segmentación |
      | Configuración de BD        | Permisos, cifrado |
      | Configuración de logs      | Auditabilidad     |

  # ─────────────────────────────────────────────────────────────
  # 2. VULNERABILIDADES WEB
  # ─────────────────────────────────────────────────────────────

  Escenario: Testing de SQL Injection
    Dado que se prueba SQL injection
    Cuando se envían payloads
    Entonces se verifica que el sistema resista:
      | Payload                   | Resultado esperado |
      | ' OR '1'='1              | Rechazado           |
      | '; DROP TABLE patients;--| Rechazado           |
      | ' UNION SELECT * FROM users--| Rechazado      |
      | 1' AND SLEEP(5)--        | Sin delay           |
      | admin'--                 | Autenticación falla |

  Escenario: Testing de XSS
    Dado que se prueba Cross-Site Scripting
    Cuando se envían payloads
    Entonces el sistema resista:
      | Payload                   | Resultado esperado |
      | <script>alert('XSS')</script> | Sanitizado    |
      | <img src=x onerror=alert(1)> | Sanitizado    |
      | javascript:alert(1)      | Bloqueado           |
      | <svg onload=alert(1)>    | Sanitizado          |

  Escenario: Testing de CSRF
    Dado que se prueba Cross-Site Request Forgery
    Cuando se evalúa
    Entonces se verifica:
      | Verificación              | Estado    |
      | Token CSRF en formularios | ✅         |
      | SameSite cookie           | ✅         |
      | Origin validation         | ✅         |

  Escenario: Testing de XXE
    Dado que se prueba XML External Entity
    Cuando se envía XML malicioso
    Entonces el sistema resista:
      | Payload                   | Resultado |
      | <!DOCTYPE foo [<!ENTITY xxe SYSTEM "file:///etc/passwd">]> | Bloqueado |

  # ─────────────────────────────────────────────────────────────
  # 3. VULNERABILIDADES DE AUTENTICACIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Testing de fuerza bruta
    Dado que se prueba fuerza bruta contra login
    Cuando se envían múltiples intentos
    Entonces el sistema resista:
      | Intentos fallidos         | Acción del sistema |
      | 5 intentos                | Bloqueo temporal 15 min |
      | 10 intentos               | Bloqueo 1 hora     |
      | 20 intentos               | Notificar admin    |
      | Rate limiting             | 5 req/min por IP   |

  Escenario: Testing de session management
    Dado que se evalúa gestión de sesiones
    Cuando se verifica
    Entonces:
      | Verificación              | Estado    |
      | Token se invalida al logout | ✅       |
      | Sesión expira por inactividad | ✅ (30 min) |
      | Token no se almacena en URL | ✅       |
      | Cookie HttpOnly           | ✅         |
      | Cookie Secure             | ✅         |
      | Cookie SameSite           | ✅         |

  # ─────────────────────────────────────────────────────────────
  # 4. VULNERABILIDADES DE AUTORIZACIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Testing de IDOR (Insecure Direct Object Reference)
    Dado que se prueba acceso a recursos ajenos
    Cuando se manipulan IDs
    Entonces el sistema resista:
      | Técnica                   | Resultado |
      | Cambiar patient-id en URL | 403 Forbidden |
      | Cambiar consultation-id   | 403 Forbidden |
      | Acceder a expediente ajeno| 403 Forbidden |
      | Escalar privilegios      | 403 Forbidden |

  Escenario: Testing de privilege escalation
    Dado que se prueba escalada de privilegios
    Cuando se intenta
    Entonces el sistema resista:
      | Técnica                   | Resultado |
      | Cambiar rol en request    | Rechazado |
      | Acceder a endpoints admin | 403 Forbidden |
      | Modificar permisos        | Rechazado |
      | Acceder a datos de otros  | 403 Forbidden |

  # ─────────────────────────────────────────────────────────────
  # 5. VULNERABILIDADES DE INFORMACIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Testing de exposición de información
    Dado que se busca información expuesta
    Cuando se evalúa
    Entonces se verifica que NO se exponga:
      | Información               | Estado    |
      | Stack traces              | Ocultos    |
      | Versión del software      | Oculta     |
      | Rutas internas            | No accesibles |
      | Configuración             | No visible |
      | Datos de debug            | No en producción |
      | Archivos de backup        | No accesibles |
      | .git expuesto             | No accesible |

  Escenario: Testing de headers de seguridad
    Dado que se verifican headers HTTP
    Cuando se inspeccionan
    Entonces:
      | Header                    | Estado    |
      | Strict-Transport-Security | ✅         |
      | X-Content-Type-Options    | ✅         |
      | X-Frame-Options           | ✅         |
      | Content-Security-Policy   | ✅         |
      | X-XSS-Protection          | ✅         |
      | Referrer-Policy           | ✅         |
      | Permissions-Policy        | ✅         |

  # ─────────────────────────────────────────────────────────────
  # 6. VULNERABILIDADES DE DATOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Testing de cifrado
    Dado que se verifica cifrado
    Cuando se evalúa
    Entonces:
      | Capa                      | Método    | Estado |
      | Datos en reposo           | AES-256   | ✅     |
      | Datos en tránsito         | TLS 1.3   | ✅     |
      | Passwords                 | bcrypt    | ✅     |
      | Backups                   | AES-256   | ✅     |
      | Cookies                   | HttpOnly+Secure | ✅ |

  Escenario: Testing de protección de datos
    Dado que se busca exposición de datos sensibles
    Cuando se evalúa
    Entonces se verifica que NO se exponga:
      | Dato                       | Estado    |
      | CURP en logs              | Ofuscada   |
      | Passwords en respuestas   | Nunca       |
      | Datos de pacientes en errores | No      |
      | Tokens en URLs            | No         |
      | Información de debug      | No en producción |

  # ─────────────────────────────────────────────────────────────
  # 7. VULNERABILIDADES DE INFRAESTRUCTURA
  # ─────────────────────────────────────────────────────────────

  Escenario: Testing de configuración de servidor
    Dado que se audita configuración
    Cuando se evalúa
    Entonces:
      | Verificación              | Estado    |
      | Puertos innecesarios cerrados | ✅     |
      | Servicios innecesarios deshabilitados | ✅ |
      | Permisos de archivos restrictivos | ✅    |
      | Actualizaciones de seguridad | ✅      |
      | Firewall configurado      | ✅         |

  Escenario: Testing de base de datos
    Dado que se audita base de datos
    Cuando se evalúa
    Entonces:
      | Verificación              | Estado    |
      | Cifrado en reposo         | ✅ (SQLCipher) |
      | Foreign keys habilitadas  | ✅         |
      | Permisos de usuario       | ✅         |
      | Sin acceso remoto directo | ✅         |
      | Backup cifrado            | ✅         |

  # ─────────────────────────────────────────────────────────────
  # 8. VULNERABILIDADES DE API
  # ─────────────────────────────────────────────────────────────

  Escenario: Testing de API
    Dado que se audita API REST
    Cuando se evalúa
    Entonces:
      | Verificación              | Estado    |
      | Autenticación requerida   | ✅         |
      | Rate limiting             | ✅         |
      | Validación de input       | ✅         |
      | Respuestas de error seguras | ✅       |
      | CORS configurado          | ✅         |
      | Versionado de API         | ✅         |

  # ─────────────────────────────────────────────────────────────
  # 9. REPORTES DE SEGURIDAD
  # ─────────────────────────────────────────────────────────────

  Escenario: Generación de reporte de pentest
    Dado que se completa prueba de penetración
    Cuando se genera reporte
    Entonces incluye:
      | Sección                   |
      | Resumen ejecutivo         |
      | Metodología utilizada     |
      | Vulnerabilidades encontradas |
      | Clasificación de severidad |
      | Evidencia (screenshots)   |
      | Recomendaciones de remediación |
      | Timeline de hallazgos     |
      | Conclusión                |
