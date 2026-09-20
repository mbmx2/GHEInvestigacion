# language: es
# @id GHE-SEC-OWASP-A07-001
# @type security
# @domain security
# @layer api
# @risk s1
# @owner security-lead
# @status proposed
@domain:security @type:security @risk:s1 @status:proposed
Característica: A07 - Fallos de Autenticación (OWASP Top 10)
  Como responsable de seguridad del hospital
  Quiero autenticación robusta
  Para prevenir acceso no autorizado a datos de pacientes

  Contexto:
    Dado que el sistema tiene autenticación activa

  Escenario Outline: Rate limiting por intentos fallidos
    Dado que usuario falla login <intentos> veces
    Entonces sistema "<acción>"

    Ejemplos:
      | intentos | acción                              |
      | 1        | Permite siguiente intento          |
      | 3        | Muestra warning                     |
      | 5        | Bloquea 15 minutos                  |
      | 10       | Bloquea 1 hora + notifica admin     |
      | 20       | Bloquea 24 horas + notifica admin   |

  Escenario Outline: Token de sesión
    Dado que se evalúa token de sesión
    Entonces verifica "<criterio>" → "<estado>"

    Ejemplos:
      | criterio                  | estado    |
      | Expiración                | 30 min    |
      | HttpOnly                  | ✅         |
      | Secure                    | ✅         |
      | SameSite                  | Strict    |
      | No en URL                 | ✅         |

  Escenario: Fuerza bruta desde misma IP
    Dado que se detectan múltiples intentos desde misma IP
    Entonces sistema bloquea IP con fail2ban

  Escenario: Session fixation
    Dado que usuario inicia sesión
    Entonces sistema genera token nuevo (no reutiliza token anterior)
