# language: es
# OWASP Top 10 - A07: Identification and Authentication Failures
# Fallos en identificación y autenticación
Característica: A07 - Fallos de Autenticación (OWASP Top 10)
  Como responsable de seguridad del proyecto GHE
  Quiero implementar autenticación robusta
  Para prevenir acceso no autorizado

  # ─────────────────────────────────────────────────────────────
  # 1. AUTENTICACIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Inicio de sesión seguro
    Dado que un usuario intenta iniciar sesión
    Cuando ingresa credenciales
    Entonces el sistema:
      | Verificación               | Estado    |
      | Password hasheado con bcrypt | ✅       |
      | Work factor >= 12          | ✅         |
      | Intentos limitados (5)     | ✅         |
      | Bloqueo temporal (15 min)  | ✅         |
      | Rate limiting              | ✅         |
      | Mensaje genérico de error  | ✅         |
      | Logging de intentos        | ✅         |

  Escenario: Prevención de credential stuffing
    Dado que se detectan múltiples intentos fallidos
    Cuando se supera umbral
    Entonces el sistema:
      | Acción                     |
      | Bloquea cuenta temporalmente|
      | Notifica al usuario por canal seguro |
      | Registra evento sospechoso  |
      | Sugiere cambio de password |

  Escenario: Prevención de brute force
    Dado que un atacante intenta fuerza bruta
    Cuando ejecuta múltiples intentos
    Entonces el sistema:
      | Defensa                     | Implementada |
      | Rate limiting por IP       | ✅           |
      | Rate limiting por cuenta   | ✅           |
      | CAPTCHA después de 5 intentos | ✅        |
      | Bloqueo progresivo         | ✅           |
      | Account lockout            | ✅           |

  # ─────────────────────────────────────────────────────────────
  # 2. GESTIÓN DE PASSWORDS
  # ─────────────────────────────────────────────────────────────

  Escenario: Requisitos de password
    Dado que se definen requisitos de password
    Cuando un usuario crea o cambia password
    Entonces:
      | Requisito                   | Mínimo             |
      | Longitud                    | 8 caracteres       |
      | Mayúsculas                 | 1                  |
      | Minúsculas                 | 1                  |
      | Números                    | 1                  |
      | Caracteres especiales     | 1                  |
      | No contiene username       | ✅                  |
      | No es password común       | ✅ (lista verificada)|

  Escenario: Cambio de password
    Dado que un usuario cambia su password
    Cuando solicita cambio
    Entonces:
      | Paso                       |
      | Verificar password actual  |
      | Validar nuevo password     |
      | Hash nuevo password        |
      | Guardar nuevo hash         |
      | Invalidar sesiones activas |
      | Notificar cambio           |

  # ─────────────────────────────────────────────────────────────
  # 3. GESTIÓN DE SESIONES
  # ─────────────────────────────────────────────────────────────

  Escenario: Tokens de sesión seguros
    Dado que se generan tokens de sesión
    Cuando se crea token
    Entonces:
      | Criterio                   | Estado    |
      | Token aleatorio (crypto)   | ✅         |
      | Longitud suficiente        | ✅         |
      | Expiración configurada     | ✅ (30 min)|
      | Invalidación en logout     | ✅         |
      | Rotación de token          | ✅         |
      | No se almacena en URL      | ✅         |

  Escenario: Invalidación de sesión
    Dado que se invalida una sesión
    Cuando ocurre invalidación
    Entonces:
      | Causa                      | Acción    |
      | Logout manual              | Token invalidado |
      | Timeout de inactividad     | Token expirado   |
      | Cambio de password         | Todas las sesiones invalidadas |
      | Actividad sospechosa       | Sesión terminada |
  