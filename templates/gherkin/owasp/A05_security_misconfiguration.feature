# language: es
# OWASP Top 10 - A05: Security Misconfiguration
@status:proposed
@type:acceptance
@domain:general
# Configuración insegura por defecto o incompleta
Característica: A05 - Configuración Insegura (OWASP Top 10)
  Como responsable de seguridad del proyecto GHE
  Quiero configurar el sistema de forma segura
  Para eliminar vectores de ataque por configuración

  # ─────────────────────────────────────────────────────────────
  # 1. CONFIGURACIÓN SEGURA POR DEFECTO
  # ─────────────────────────────────────────────────────────────

  Escenario: Configuración segura al instalar
    Dado que se instala GHE por primera vez
    Cuando se ejecuta configuración inicial
    Entonces:
      | Configuración              | Valor seguro          |
      | Puerto por defecto         | 3000 (no expuesto)    |
      | Bind address               | 127.0.0.1 (local)     |
      | Debug mode                 | false en producción   |
      | Admin password             | Requiere cambio inmediato |
      | TLS habilitado             | true                  |
      | CORS restrictivo           | Solo origins permitidos |
      | Headers de seguridad       | Habilitados           |

  Escenario: Deshabilitar funcionalidades innecesarias
    Dado que se evalúa attack surface
    Cuando se revisa configuración
    Entonces:
      | Funcionalidad              | Estado                |
      | Debug endpoints            | Deshabilitados        |
      | Stack traces en errores    | Ocultos en producción |
      | Default credentials        | Eliminadas            |
      | Directorio listing         | Deshabilitado         |
      | Server version header      | Oculto                |
      | Email de error expuesto    | Oculto                |

  # ─────────────────────────────────────────────────────────────
  # 2. HEADERS DE SEGURIDAD HTTP
  # ─────────────────────────────────────────────────────────────

  Escenario: Headers de seguridad HTTP
    Dado que se configuran headers de seguridad
    Cuando se verifica
    Entonces:
      | Header                     | Valor                 |
      | Strict-Transport-Security  | max-age=31536000; includeSubDomains |
      | X-Content-Type-Options     | nosniff               |
      | X-Frame-Options            | DENY                  |
      | X-XSS-Protection           | 1; mode=block         |
      | Content-Security-Policy     | default-src 'self'    |
      | Referrer-Policy             | strict-origin-when-cross-origin |
      | Permissions-Policy          | camera=(), microphone=() |
      | Cache-Control              | no-store, no-cache    |

  # ─────────────────────────────────────────────────────────────
  # 3. CONFIGURACIÓN DE BASE DE DATOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Configuración segura de SQLite
    Dado que se configura SQLite
    Cuando se establece configuración
    Entonces:
      | Parámetro                  | Valor seguro          |
      | WAL mode                   | Habilitado            |
      | Encryption                 | AES-256 (SQLCipher)   |
      | Foreign keys               | Habilitadas           |
      | Journal mode               | WAL                   |
      | Busy timeout               | 5000ms                |
      | Archivo de BD              | Permisos restrictivos |
      | Directorio                 | Fuera de web root     |

  # ─────────────────────────────────────────────────────────────
  # 4. CONFIGURACIÓN DE SERVIDOR
  # ─────────────────────────────────────────────────────────────

  Escenario: Configuración de servidor de aplicación
    Dado que se configura el servidor
    Cuando se verifica
    Entonces:
      | Parámetro                  | Valor seguro          |
      | Worker threads             | Limitado              |
      | Timeouts                   | Configurados          |
      | Max request size           | Limitado              |
      | Graceful shutdown          | Habilitado            |
      | Access logs                | Habilitados           |
      | Error logs                 | Habilitados           |
  