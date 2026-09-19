# language: es
# Seguridad General y Hardening
Característica: Seguridad General (GHE Security)
  Como responsable de seguridad del proyecto GHE
  Quiero measures de seguridad general para todo el sistema
  Para proteger contra amenazas conocidas y emergentes

  # ─────────────────────────────────────────────────────────────
  # 1. HARDENING DE SERVIDOR
  # ─────────────────────────────────────────────────────────────

  Escenario: Hardening de sistema operativo
    Dado que se configura el servidor
    Cuando se aplica hardening
    Entonces:
      | Medida                     | Estado |
      | Actualizaciones de seguridad | ✅     |
      | Servicios innecesarios deshabilitados | ✅ |
      | Puertos innecesarios cerrados | ✅    |
      | Permisos de archivos restrictivos | ✅ |
      | SSH hardening             | ✅         |
      | Fail2ban habilitado       | ✅         |
      | Firewall configurado      | ✅         |

  Escenario: Hardening de base de datos
    Dado que se configura SQLite
    Cuando se aplica hardening
    Entonces:
      | Medida                     |
      | Cifrado SQLCipher AES-256 |
      | Foreign keys habilitadas  |
      | WAL mode habilitado       |
      | Permisos de archivo 600   |
      | Fuera de web root         |
      | Sin acceso remoto directo |
      | Backup cifrado automático |

  # ─────────────────────────────────────────────────────────────
  # 2. SEGURIDAD DE APLICACIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Seguridad de código
    Dado que se revisa código por vulnerabilidades
    Cuando se verifica
    Entonces:
      | Práctica                   | Estado |
      | Parameterized queries     | ✅ 100% |
      | Input validation          | ✅ 100% |
      | Output encoding           | ✅ 100% |
      | Error handling seguro     | ✅         |
      | No secrets hardcodeados   | ✅         |
      | HTTPS forzado             | ✅         |

  Escenario: Seguridad de autenticación
    Dado que se verifica autenticación
    Cuando se evalúa
    Entonces:
      | Medida                     |
      | Password hashing bcrypt   |
      | Rate limiting en login    |
      | Account lockout           |
      | Session timeout           |
      | Multi-factor auth (futuro)|
      | Password policy           |

  Escenario: Seguridad de autorización
    Dado que se verifica autorización
    Cuando se evalúa
    Entonces:
      | Medida                     |
      | RBAC por roles            |
      | Validación en cada endpoint |
      | Principio de menor privilegio |
      | Auditoría de accesos      |
      | Tokens con expiración     |

  # ─────────────────────────────────────────────────────────────
  # 3. SEGURIDAD DE DATOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Protección de datos de pacientes
    Dado que se protegen datos sensibles
    Cuando se evalúa
    Entonces:
      | Capa                      | Medida |
      | Reposo                    | AES-256 |
      | Tránsito                  | TLS 1.3 |
      | Passwords                 | bcrypt |
      | Backups                   | AES-256 |
      | Logs                      | Sin datos sensibles |
      | Exportación               | Solo con autorización |

  Escenario: Cumplimiento LFPDPPP
    Dado que se cumple LFPDPPP
    Cuando se verifica
    Entonces:
      | Requisito                  | Estado |
      | Consentimiento informado  | ✅      |
      | Aviso de privacidad       | ✅      |
      | Derechos ARCO             | ✅      |
      | Minimización de datos     | ✅      |
      | Seguridad de datos        | ✅      |

  # ─────────────────────────────────────────────────────────────
  # 4. SEGURIDAD DE RED
  # ─────────────────────────────────────────────────────────────

  Escenario: Seguridad de red
    Dado que se configura red
    Cuando se verifica
    Entonces:
      | Medida                     |
      | Firewall habilitado       |
      | Puertos innecesarios cerrados |
      | IDS/IPS (si aplica)       |
      | Segmentación de red       |
      | VPN para acceso remoto    |

  Escenario: Seguridad WiFi
    Dado que se configura WiFi
    Cuando se verifica
    Entonces:
      | Medida                     |
      | WPA3 o WPA2-Enterprise    |
      | Password fuerte           |
      | Red de invitados separada |
      | MAC filtering             |
      | Monitoreo de intrusos     |

  # ─────────────────────────────────────────────────────────────
  # 5. GESTIÓN DE VULNERABILIDADES
  # ─────────────────────────────────────────────────────────────

  Escenario: Escaneo de vulnerabilidades
    Dado que se ejecuta escaneo
    Cuando se ejecuta herramienta
    Entonces:
      | Herramienta               | Frecuencia |
      | OWASP ZAP                 | Mensual    |
      | Dependency check          | Semanal    |
      | Nmap                      | Mensual    |
      | Nessus (si aplica)        | Mensual    |

  Escenario: Gestión de parches
    Dado que se detecta vulnerabilidad
    Cuando se gestiona
    Entonces:
      | Severidad                  | Tiempo de remediación |
      | Crítica                    | 24 horas       |
      | Alta                       | 7 días         |
      | Media                      | 30 días        |
      | Baja                       | Siguiente release |

  # ─────────────────────────────────────────────────────────────
  # 6. RESPUESTA A INCIDENTES
  # ─────────────────────────────────────────────────────────────

  Escenario: Protocolo de respuesta a incidentes
    Dado que se detecta incidente de seguridad
    Cuando se activa protocolo
    Entonces:
      | Paso                       | Tiempo |
      | 1. Detección y reporte    | Inmediato |
      | 2. Contención             | <15 min  |
      | 3. Erradicación           | <1 hora  |
      | 4. Recuperación           | <4 horas |
      | 5. Post-mortem            | <1 semana|

  Escenario: Escalamiento de incidentes
    Dado que se clasifica incidente
    Cuando se evalúa
    Entonces:
      | Severidad                  | Acción |
      | S1 - Brecha de datos      | Notificar a todos + autoridades |
      | S2 - Acceso no autorizado | Notificar admin + equipo |
      | S3 - Vulnerabilidad       | Remediar + documentar |
      | S4 - Anomalía             | Monitorear + investigar |

  # ─────────────────────────────────────────────────────────────
  # 7. SEGURIDAD EN DESARROLLO (DevSecOps)
  # ─────────────────────────────────────────────────────────────

  Escenario: Integración de seguridad en CI/CD
    Dado que se integra seguridad en pipeline
    Cuando se ejecuta
    Entonces:
      | Etapa                      | Herramienta |
      | Pre-commit                | Linting de seguridad |
      | Build                     | SAST (análisis estático) |
      | Post-build                | Dependency check |
      | Pre-deploy                | DAST (OWASP ZAP) |
      | Post-deploy               | Monitoreo continuo |

  Escenario: Revisiones de seguridad
    Dado que se realizan revisiones de código
    Cuando se revisa
    Entonces:
      | Criterio                   |
      | No hay SQL injection      |
      | No hay XSS               |
      | No hay secrets hardcodeados |
      | Input validado            |
      | Output codificado         |
      | Errores manejados         |

  # ─────────────────────────────────────────────────────────────
  # 8. SEGURIDAD DE DEPENDENCIAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Gestión de dependencias seguras
    Dado que se gestiona dependencias
    Cuando se verifica
    Entonces:
      | Medida                     | Frecuencia |
      | Escaneo de vulnerabilidades| Semanal    |
      | Actualización de parches  | Inmediata si crítico |
      | Lockfile                  | Committeado |
      | Análisis de licencias     | Mensual    |
      | Monitoreo de dependencias | Continuo   |

  # ─────────────────────────────────────────────────────────────
  # 9. SEGURIDAD DE BACKUPS
  # ─────────────────────────────────────────────────────────────

  Escenario: Seguridad de backups
    Dado que se protegen backups
    Cuando se verifica
    Entonces:
      | Medida                     |
      | Cifrado AES-256           |
      | Almacenamiento offsite    |
      | Acceso restringido        |
      | Prueba de restauración    |
      | Retención documentada     |

  # ─────────────────────────────────────────────────────────────
  # 10. CAPACITACIÓN EN SEGURIDAD
  # ─────────────────────────────────────────────────────────────

  Escenario: Programa de capacitación en seguridad
    Dado que se capacita al equipo
    Cuando se ejecuta
    Entonces:
      | Tema                       | Frecuencia |
      | Concientización general   | Anual      |
      | Phishing                  | Trimestral  |
      | Contraseñas seguras       | Anual      |
      | Uso seguro de sistemas    | Anual      |
      | Reporte de incidentes     | Anual      |
      | Simulacros de respuesta   | Semestral  |
