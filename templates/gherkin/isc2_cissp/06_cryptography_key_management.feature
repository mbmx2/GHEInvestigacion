# language: es
# @id GHE-CISSP-006
# @type business-rule
# @domain security
# @layer cryptography
# @risk s1
# @owner security-architect
# @status proposed
# @requirement REQ-CISSP-006
# @risk-control CTRL-CISSP-006
# @regulation CISSP-D3 ISC2 NOM-151
@domain:isc2_cissp @type:business-rule @risk:s1 @status:proposed
Característica: CISSP Dominio 3 — Criptografía y Gestión de Claves
  Como especialista en criptografía
  Quiero criptografía robusta conforme CISSP Domain 3
  Para que los datos estén protegidos mediante cifrado fuerte

  Regla: Algoritmos de cifrado se seleccionan

    Escenario: Cifrado simétrico
      Dado que se selecciona cifrado simétrico
      Cuando se evalúa opciones
      Entonces se usa:
        | Algoritmo  | Uso                            | Bits mínimos |
        | AES        | Datos en reposo               | 256          |
        | ChaCha20   | Datos en movimiento           | 256          |
        | 3DES       | Legacy (evitar)               | 112          |

    Escenario: Cifrado asimétrico
      Dado que se selecciona cifrado asimétrico
      Cuando se evalúa opciones
      Entonces se usa:
        | Algoritmo  | Uso                            | Bits mínimos |
        | RSA        | Firma digital, intercambio     | 2048         |
        | ECC        | Dispositivos limitados         | 256          |
        | Ed25519    | Firma moderna                  | 256          |

    Escenario: Hash y HMAC
      Dado que se necesita integridad de datos
      Cuando se selecciona algoritmo
      Entonces se usa:
        | Algoritmo  | Uso                            |
        | SHA-256    | Integridad general             |
        | SHA-384    | Datos altamente sensibles      |
        | HMAC-SHA256| Autenticación de mensajes      |
        | bcrypt     | Hash de contraseñas            |
        | Argon2     | Hash de contraseñas (moderno)  |

  Regla: Gestión de claves se implementa

    Escenario: Ciclo de vida de claves
      Dado que se gestionan claves criptográficas
      Cuando se gestiona ciclo de vida
      Entonces se verifica:
        | Fase       | Acción                          |
        | Generación | RNG criptográficamente seguro   |
        | Distribución| Canales seguros               |
        | Almacenamiento| HSM o vault seguro         |
        | Uso        | Control de acceso estricto      |
        | Rotación   | Período definido               |
        | Destrucción| Eliminación segura             |

    Escenario: Rotación de claves
      Dado que claves alcanzan período de rotación
      Cuando se rota
      Entonces se verifica:
        | Elemento                    |
        | Nueva clave generada        |
        | Antigua clave destruida     |
        | Datos re-cifrados si aplica |
        | Registro de rotación        |
        | Sin interrupción de servicio|

  Regla: Integridad de datos se verifica

    Escenario: Firmas digitales
      Dado que se requiere integridad y no repudio
      Cuando se aplica firma digital
      Entonces se verifica:
        | Elemento                    |
        | Algoritmo de firma válido   |
        | Certificado vigente         |
        | Cadena de confianza completa|
        | Timestamp confiable         |

  Regla: Protección de contraseñas

    Escenario: Almacenamiento seguro de contraseñas
      Dado que sistema almacena contraseñas
      Cuando se persisten
      Entonces se verifica:
        | Elemento                    |
        | Hash con sal único          |
        | Algoritmo: Argon2 o bcrypt  |
        | Salt generado por contraseña|
        | Sin contraseñas en texto plano|
        | Políticas de complejidad    |
