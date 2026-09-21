# language: es
# @id GHE-ASVS-V3-001
# @type compliance
# @domain security
# @layer domain
# @risk s2
# @owner security-lead
# @status proposed
# @requirement ASVS-V3
# @risk-control CTRL-ASVS-V3
# @regulation NOM-024
@domain:security @type:compliance @risk:s2 @status:proposed
Característica: V3 - Gestión de Sesiones
  Como responsable de seguridad del proyecto GHE
  Quiero que las sesiones sean seguras
  Para prevenir secuestro de sesión y acceso no autorizado

  Regla: V3.1 - Generación de identificadores de sesión seguros

    Escenario: Token de sesión seguro
      Dado que se genera sesión
      Cuando se crea token
      Entonces:
        | Criterio                   | Estado |
        | Token aleatorio (crypto)  | ✅      |
        | Longitud suficiente        | ✅ (256 bits) |
        | Sin información sensible  | ✅      |
        | No predecible             | ✅      |

  Regla: V3.2 - Gestión de sesión

    Escenario: Expiración de sesión
      Dado que usuario tiene sesión activa
      Cuando pasan 30 minutos de inactividad
      Entonces sesión se expira
      Y se redirige a login
      Y se registra logout automático

    Escenario: Invalidación al logout
      Dado que usuario cierra sesión
      Cuando ejecuta logout
      Entonces:
        | Acción                    |
        | Token invalidado          |
        | Sesión eliminada          |
        | Cookies limpiadas         |
        | Evento registrado         |

  Regla: V3.3 - Protección contra secuestro de sesión

    Escenario: Protección contra session fixation
      Dado que usuario inicia sesión
      Cuando se autentica
      Entonces sistema genera token nuevo (no reutiliza anterior)

    Escenario: Protección contra session hijacking
      Dado que se verifica seguridad de sesión
      Entonces:
        | Medida                     |
        | HttpOnly cookie           |
        | Secure flag               |
        | SameSite=Strict           |
        | Token en header, no URL   |
        | Binding a IP/User-Agent   |
