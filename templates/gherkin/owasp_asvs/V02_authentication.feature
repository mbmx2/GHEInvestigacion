# language: es
# @id GHE-ASVS-V2-001
# @type compliance
# @domain security
# @layer domain
# @risk s1
# @owner security-lead
# @status proposed
# @requirement ASVS-V2
# @risk-control CTRL-ASVS-V2
# @regulation NOM-024
@domain:security @type:compliance @risk:s1 @status:proposed
Característica: V2 - Autenticación
  Como responsable de seguridad del proyecto GHE
  Quiero que la autenticación sea robusta
  Para que solo usuarios autorizados accedan al sistema

  Regla: V2.1 - Controles de autenticación generales

    Escenario: Autenticación con credenciales
      Dado que un usuario intenta autenticarse
      Cuando ingresa usuario y password
      Entonces el sistema verifica credenciales contra hash bcrypt
      Y si son correctas genera token JWT
      Y registra evento de login exitoso
      # @evidence EVID-ASVS-V2-001

    Escenario: Bloqueo por intentos fallidos
      Dado que un usuario falla 5 intentos de login
      Cuando se detecta
      Entonces la cuenta se bloquea 15 minutos
      Y se notifica al administrador
      # @evidence EVID-ASVS-V2-002

  Regla: V2.2 - Gestión de autenticación

    Escenario: Almacenamiento seguro de contraseñas
      Dado que se crea o cambia contraseña
      Cuando se almacena
      Entonces se usa bcrypt con work factor ≥12
      Y NUNCA se almacena en texto plano
      Y se genera salt único por contraseña
      # @evidence EVID-ASVS-V2-003

    Escenario: Políticas de contraseña
      Dado que un usuario crea contraseña
      Cuando se valida
      Entonces se requiere:
        | Requisito                   |
        | Mínimo 8 caracteres        |
        | Al menos 1 mayúscula       |
        | Al menos 1 minúscula       |
        | Al menos 1 número         |
        | Al menos 1 especial       |
        | No contiene username      |
        | No es password común      |

  Regla: V2.3 - Autenticación de factores múltiples (recomendado)

    Escenario: MFA para acceso administrativo
      Dado que un administrador accede al sistema
      Cuando se verifica autenticación
      Entonces se requiere:
        | Factor                      | Estado |
        | Password                  | ✅      |
        | Token de segundo factor   | ⚠️ Futuro |

  Regla: V2.4 - Gestión de credenciales

    Escenario: Cambio de contraseña
      Dado que usuario solicita cambio
      Cuando se ejecuta
      Entonces:
        | Paso                       |
        | Verificar password actual |
        | Validar nuevo password    |
        | Hash con bcrypt           |
        | Guardar nuevo hash        |
        | Invalidar sesiones activas|
        | Notificar cambio          |

    Escenario: Sesiones
      Dado que se gestiona sesión
      Cuando se verifica
      Entonces:
        | Criterio                   | Estado |
        | Token con expiración      | ✅ (30 min) |
        | HttpOnly                  | ✅      |
        | Secure                    | ✅      |
        | SameSite                  | ✅      |
        | Invalidación en logout    | ✅      |
