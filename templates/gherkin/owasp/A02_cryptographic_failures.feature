# language: es
# @id GHE-SEC-OWASP-A02-001
# @type security
# @domain security
# @layer infrastructure
# @risk s1
# @owner security-lead
# @status proposed
# @requirement OWASP-A02
# @risk-control CTRL-OWASP-A02
# @regulation NOM-024
@domain:security @type:security @risk:s1 @status:proposed
Característica: OWASP A02 - Fallos Criptográficos
  Como responsable de seguridad del hospital
  Quiero criptografía robusta
  Para que datos de pacientes no se expongan sin autorización

  Regla: Datos en reposo se cifran con AES-256

    Escenario: Cifrado de base de datos
      Dado que se almacenan datos de pacientes
      Cuando se verifica cifrado
      Entonces:
        | Capa                      | Método         | Estado |
        | Base de datos             | AES-256 (SQLCipher) | ✅  |
        | Backups                   | AES-256         | ✅     |
        | Archivos temporales       | Cifrado al eliminar | ✅  |
      # @evidence EVID-ASVS-V6-001

  Regla: Datos en tránsito se cifran con TLS 1.3

    Escenario: Comunicaciones cifradas
      Dado que se transmiten datos
      Cuando se verifica
      Entonces:
        | Canal                      | Protocolo  | Estado |
        | Cliente-Servidor          | TLS 1.3    | ✅     |
        | Sync-Cloud                | HTTPS      | ✅     |
      # @evidence EVID-ASVS-V6-002

  Regla: Passwords se almacenan con bcrypt

    Escenario: Hash seguro de contraseñas
      Dado que se crea o cambia contraseña
      Cuando se almacena
      Entonces:
        | Verificación              | Estado |
        | bcrypt work factor ≥12   | ✅      |
        | Salt único               | ✅      |
        | Sin texto plano          | ✅      |
      # @evidence EVID-ASVS-V6-003

  Regla: Claves de cifrado se gestionan de forma segura

    Escenario: Gestión de claves
      Dado que se gestionan claves
      Cuando se verifica
      Entonces:
        | Medida                     | Estado |
        | No hardcodeadas           | ✅      |
        | En variables de entorno   | ✅      |
        | Rotación periódica        | ⚠️ Futuro |
        | Backup seguro             | ✅      |
      # @evidence EVID-ASVS-V6-004

  Regla: Números aleatorios son criptográficamente seguros

    Escenario: Generador criptográfico
      Dado que se generan tokens, IDs, salts
      Cuando se crean
      Entonces se usa cryptographically secure random
      Y no se usa Math.random() ni equivalentes
      # @evidence EVID-ASVS-V6-005
