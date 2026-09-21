# language: es
# @id GHE-ASVS-V13-001
# @type compliance
# @domain security
# @layer infrastructure
# @risk s2
# @owner security-lead
# @status proposed
# @requirement ASVS-V13
# @risk-control CTRL-ASVS-V13
# @regulation NOM-024
@domain:security @type:compliance @risk:s2 @status:proposed
Característica: V13 - Configuración de la Aplicación
  Como responsable de seguridad del proyecto GHE
  Quiero que la configuración sea segura por defecto
  Para que no haya configuraciones inseguras que comprometan el sistema

  Regla: V13.1 - Seguridad por defecto

    Escenario: Configuración segura al instalar
      Dado que se instala GHE
      Cuando se configura
      Entonces:
        | Configuración             | Valor seguro |
        | Puerto                    | 3000 (no expuesto) |
        | Bind address              | 127.0.0.1   |
        | Debug mode                | Off en producción |
        | Admin password             | Requiere cambio |
        | TLS                       | Habilitado   |
        | CORS                      | Restrictivo  |
        | Headers seguridad         | Habilitados  |

  Regla: V13.2 - Deshabilitar funcionalidades innecesarias

    Escenario: Attack surface reducido
      Dado que se evalúa attack surface
      Cuando se verifica
      Entonces:
        | Funcionalidad             | Estado |
        | Debug endpoints           | Deshabilitados |
        | Stack traces              | Ocultos |
        | Default credentials       | Eliminadas |
        | Directory listing         | Deshabilitado |
        | Server version header     | Oculto |

  Regla: V13.3 - Configuración de headers HTTP

    Escenario: Headers de seguridad HTTP
      Dado que se configuran headers
      Cuando se inspeccionan
      Entonces:
        | Header                    | Valor |
        | Strict-Transport-Security | max-age=31536000 |
        | X-Content-Type-Options    | nosniff |
        | X-Frame-Options           | DENY |
        | Content-Security-Policy   | default-src 'self' |
        | X-XSS-Protection          | 1; mode=block |
        | Referrer-Policy           | strict-origin |
        | Permissions-Policy        | camera=(), microphone=() |
        | Cache-Control             | no-store, no-cache |

  Regla: V13.4 - Gestión de dependencias

    Escenario: Dependencias actualizadas
      Dado que se verifica dependencias
      Cuando se ejecuta escaneo
      Entonces:
        | Verificación              | Estado |
        | Sin vulnerabilidades críticas | ✅    |
        | Lockfile committeado      | ✅      |
        | Dependencias mínimas      | ✅      |

  Regla: V13.5 - Configuración de seguridad de base de datos

    Escenario: SQLite seguro
      Dado que se configura SQLite
      Cuando se verifica
      Entonces:
        | Configuración             |
        | SQLCipher AES-256         |
        | Foreign keys habilitadas  |
        | WAL mode habilitado       |
        | Permisos de archivo 600  |
        | Fuera de web root         |
        | Sin acceso remoto directo |

  Regenario: Configuración de seguridad de servidor
    Dado que se configura servidor
    Cuando se verifica
    Entonces:
      | Configuración             |
      | Puertos innecesarios cerrados |
      | Servicios innecesarios off |
      | SSH hardening             |
      | Fail2ban habilitado       |
      | Firewall configurado      |
      | Actualizaciones automáticas |
