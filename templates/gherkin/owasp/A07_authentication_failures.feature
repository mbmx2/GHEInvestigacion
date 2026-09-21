# language: es
# @id GHE-SEC-OWASP-A07-001
# @type security
# @domain security
# @layer domain
# @risk s2
# @owner security-lead
# @status proposed
# @requirement OWASP-A07
# @risk-control CTRL-OWASP-A07
# @regulation NOM-024
@domain:security @type:security @risk:s2 @status:proposed
Característica: OWASP A07 - Fallos de Autenticación
  Como responsable de seguridad del hospital
  Quiero autenticación robusta
  Para prevenir acceso no autorizado

  Regla: Rate limiting en login

    Escenario: Bloqueo por intentos fallidos
      Dado que usuario falla 5 intentos de login
      Cuando se verifica
      Entonces:
        | Intentos | Acción |
        | 5        | Bloqueo 15 minutos |
        | 10       | Bloqueo 1 hora + notificar admin |
        | 20       | Bloqueo 24 horas + notificar admin |
      # @evidence EVID-ASVS-V2-001

  Regla: Sesiones seguras

    Escenario: Token de sesión seguro
      Dado que se genera sesión
      Cuando se verifica
      Entonces:
        | Verificación              | Estado |
        | Token aleatorio (crypto) | ✅      |
        | Expiración 30 min        | ✅      |
        | HttpOnly                  | ✅      |
        | Secure                    | ✅      |
        | SameSite                  | ✅      |
      # @evidence EVID-ASVS-V3-001

    Escenario: Session fixation prevenido
      Dado que usuario inicia sesión
      Cuando se autentica
      Entonces sistema genera token nuevo (no reutiliza anterior)

  Regla: Passwords seguros

    Escenario: Almacenamiento seguro
      Dado que se crea contraseña
      Cuando se almacena
      Entonces:
        | Medida                     |
        | bcrypt work factor ≥12   |
        | Salt único               |
        | Sin texto plano          |
      # @evidence EVID-ASVS-V2-002

    Escenario: Políticas de contraseña
      Dado que usuario crea contraseña
      Cuando se valida
      Entonces requiere: ≥8 caracteres, mayúscula, minúscula, número, especial

  Regla: Autenticación de factores múltiples (recomendado)

    Escenario: MFA para acceso administrativo
      Dado que administrador accede al sistema
      Entonces se recomienda MFA
      # @evidence EVID-ASVS-V2-003
