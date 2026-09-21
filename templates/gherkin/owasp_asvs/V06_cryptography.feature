# language: es
# @id GHE-ASVS-V6-001
# @type compliance
# @domain security
# @layer infrastructure
# @risk s1
# @owner security-lead
# @status proposed
# @requirement ASVS-V6
# @risk-control CTRL-ASVS-V6
# @regulation NOM-024
@domain:security @type:compliance @risk:s1 @status:proposed
Característica: V6 - Criptografía Almacenada
  Como responsable de seguridad del proyecto GHE
  Quiero que los datos sensibles estén cifrados correctamente
  Para que la información de pacientes no sea accesible sin autorización

  Regla: V6.1 - Uso de criptografía

    Escenario: Cifrado de datos en reposo
      Dado que se almacenan datos sensibles
      Cuando se cifra
      Entonces:
        | Capa                      | Algoritmo |
        | Base de datos             | AES-256 (SQLCipher) |
        | Backups                   | AES-256 |
        | Archivos temporales       | Cifrado al eliminar |
      Y se usa modo de operación seguro (GCM o CBC con IV)

    Escenario: Cifrado de datos en tránsito
      Dado que se transmiten datos
      Cuando se envían
      Entonces:
        | Canal                      | Protocolo |
        | Cliente-Servidor          | TLS 1.3   |
        | Servidor-Cloud            | TLS 1.3   |
        | Sync                       | HTTPS     |

  Regla: V6.2 - Gestión de claves

    Escenario: Almacenamiento seguro de claves
      Dado que se gestionan claves de cifrado
      Cuando se almacenan
      Entonces:
        | Medida                     |
        | Claves en variables de entorno |
        | Claves diferentes por entorno |
        | No hardcodeadas           |
        | Backup seguro             |
        | Rotación periódica        |

  Regla: V6.3 - Hash de contraseñas

    Escenario: Almacenamiento de contraseñas
      Dado que se crea o cambia contraseña
      Cuando se almacena
      Entonces:
        | Medida                     |
        | bcrypt con work factor ≥12 |
        | Salt único por contraseña |
        | Sin reversión posible     |
        | Nunca en texto plano      |

  Regla: V6.4 - Generación de números aleatorios

    Escenario: Uso de generador criptográfico
      Dado que se generan tokens, IDs, salts
      Cuando se crean
      Entonces se usa cryptographically secure random
      Y no se usa Math.random() ni equivalentes
