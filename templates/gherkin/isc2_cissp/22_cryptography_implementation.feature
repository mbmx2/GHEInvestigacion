# language: es
# @id GHE-CISSP-022
# @type business-rule
# @domain security
# @layer crypto-implementation
# @risk s1
# @owner crypto-engineer
# @status proposed
# @requirement REQ-CISSP-022
# @risk-control CTRL-CISSP-022
# @regulation CISSP-D3 ISC2 NOM-151
@domain:isc2_cissp @type:business-rule @risk:s1 @status:proposed
Característica: CISSP — Implementación Criptográfica en GHE
  Como ingeniero criptográfico
  Quiero implementación criptográfica robusta en GHE
  Para que la criptografía proteja datos en cada capa del sistema

  Regla: Cifrado en reposo se implementa

    Escenario: SQLite cifrado
      Dado que GHE usa SQLite como BD principal
      Cuando se cifra
      Entonces se verifica:
        | Elemento                    |
        | SQLCipher con AES-256       |
        | Clave derivada de contraseña|
        | Clave no almacenada en disco|
        | Backup también cifrado      |
        | Rendimiento aceptable       |

    Escenario: Archivos cifrados
      Dado que GHE almacena archivos (imágenes, documentos)
      Cuando se cifran
      Entonces se verifica:
        | Elemento                    |
        | Cifrado AES-256-GCM         |
        | Clave por archivo           |
        | Metadatos protegidos        |
        | Acceso controlado           |

  Regla: Cifrado en tránsito se implementa

    Escenario: Comunicación cliente-servidor
      Dado que cliente GHE comunica con servidor
      Cuando se protege comunicación
      Entonces se verifica:
        | Elemento                    |
        | TLS 1.3 obligatorio         |
        | Certificados válidos        |
        | HSTS habilitado             |
        | Perfect forward secrecy     |
        | Cipher suites modernas      |

    Escenario: Sincronización offline cifrada
      Dado que GHE sincroniza datos offline
      Cuando se transmite información
      Entonces se verifica:
        | Elemento                    |
        | Cifrado end-to-end          |
        | Firma de integridad         |
        | Prevención de replay        |
        | Nonce único por transacción |

  Regla: Gestión de claves se implementa

    Escenario: Key management en GHE
      Dado que GHE gestiona claves criptográficas
      Cuando se implementa
      Entonces se verifica:
        | Elemento                    |
        | Derivación PBKDF2/Argon2    |
        | Rotación de claves programada|
        | Almacenamiento seguro       |
        | Destrucción segura          |
        | Registro de operaciones     |

  Regla: Firma digital se aplica

    Escenario: Firma de recetas médicas
      Dado que GHE genera recetas electrónicas
      Cuando se firma
      Entonces se verifica:
        | Elemento                    |
        | Firma digital válida        |
        | Certificado vigente         |
        | Timestamp confiable         |
        | No repudio                  |
        | Verificación independiente  |
