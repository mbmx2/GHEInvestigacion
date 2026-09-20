# language: es
# OWASP Top 10 - A02: Cryptographic Failures
@status:proposed
@type:acceptance
@domain:general
# Fallos en criptografía que exponen datos sensibles
Característica: A02 - Fallos Criptográficos (OWASP Top 10)
  Como responsable de seguridad del proyecto GHE
  Quiero implementar criptografía robusta
  Para proteger datos sensibles de pacientes

  # ─────────────────────────────────────────────────────────────
  # 1. CIFRADO DE DATOS EN REPOSO
  # ─────────────────────────────────────────────────────────────

  Escenario: Cifrado de base de datos SQLite
    Dado que la base de datos contiene datos de pacientes
    Cuando se almacena información
    Entonces los datos están cifrados:
      | Capa                       | Método              | Estado |
      | Base de datos completa     | SQLCipher AES-256   | ✅     |
      | Tabla patients             | Columnas sensibles  | ✅     |
      | Tabla consultations        | Notas clínicas      | ✅     |
      | Tabla prescriptions        | Medicamentos        | ✅     |
      | Backups                    | Archivos cifrados   | ✅     |

  Escenario: Cifrado de datos sensibles específicos
    Dado que se almacenan datos clasificados como sensibles
    Cuando se guarda cada tipo
    Entonces:
      | Tipo de dato               | Cifrado             | Estado |
      | CURP                       | AES-256             | ✅     |
      | Nombre completo            | AES-256             | ✅     |
      | Datos de salud             | AES-256             | ✅     |
      | Historial médico           | AES-256             | ✅     |
      | Alergias                   | AES-256             | ✅     |
      | Diagnósticos               | AES-256             | ✅     |

  # ─────────────────────────────────────────────────────────────
  # 2. CIFRADO DE DATOS EN TRÁNSITO
  # ─────────────────────────────────────────────────────────────

  Escenario: Comunicaciones cifradas
    Dado que el sistema se comunica vía red
    Cuando se transmiten datos
    Entonces:
      | Capa                       | Protocolo           | Estado |
      | Cliente → Servidor         | TLS 1.3             | ✅     |
      | Servidor → Base de datos   | Local (SQLite)      | ✅ N/A |
      | Sync → Cloud               | HTTPS + TLS 1.3     | ✅     |
      | WhatsApp → Paciente        | Envelope encryption  | ✅     |

  Escenario: Certificados TLS
    Dado que se usan certificados TLS
    Cuando se verifica configuración
    Entonces:
      | Verificación               | Estado    |
      | Certificado válido         | ✅         |
      | No expirado                | ✅         |
      | Firma SHA-256 o superior   | ✅         |
      | HSTS habilitado            | ✅         |
      | Redirección HTTP → HTTPS   | ✅         |

  # ─────────────────────────────────────────────────────────────
  # 3. HASH DE PASSWORDS
  # ─────────────────────────────────────────────────────────────

  Escenario: Almacenamiento seguro de passwords
    Dado que se almacenan passwords de usuarios
    Cuando se guarda un password
    Entonces:
      | Verificación               | Estado    |
      | NUNCA en texto plano       | ✅         |
      | Hash con bcrypt            | ✅         |
      | Work factor >= 12          | ✅         |
      | Salt único por password    | ✅         |
      | Sin reversión posible      | ✅         |

  Escenario: Verificación de password
    Dado que un usuario inicia sesión
    Cuando se verifica el password
    Entonces:
      | Verificación               | Estado    |
      | Se compara contra hash     | ✅         |
      | Tiempo constante (bcrypt)  | ✅         |
      | No se retorna hash         | ✅         |
      | No se almacena en logs     | ✅         |

  # ─────────────────────────────────────────────────────────────
  # 4. GESTIÓN DE CLAVES
  # ─────────────────────────────────────────────────────────────

  Escenario: Gestión de claves de cifrado
    Dado que se gestionan claves de cifrado
    Cuando se implementa gestión
    Entonces:
      | Práctica                   | Estado    |
      | Claves no hardcodeadas     | ✅         |
      | Claves en variables de entorno | ✅     |
      | Claves rotadas periódicamente | ⚠️ Pendiente |
      | Claves diferentes por entorno | ✅       |
      | Backup de claves seguro    | ✅         |
  