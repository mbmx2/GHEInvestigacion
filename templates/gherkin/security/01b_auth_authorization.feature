# language: es
Característica: Pentest - Autenticación y Autorización
@status:proposed
@type:acceptance
@domain:security
  Como tester de seguridad del hospital
  Quiero probar autenticación y autorización
  Para asegurar que solo usuarios autorizados acceden a datos de pacientes

  Contexto:
    Dado que el sistema está activo
    Y que el usuario tiene rol de tester de seguridad

  Escenario: Fuerza bruta
    Dado que se prueba fuerza bruta contra login
    Cuando se envían múltiples intentos
    Entonces el sistema resiste:
      | Intentos                   | Acción del sistema |
      | 5 intentos fallidos       | Bloqueo 15 min     |
      | 20 intentos               | Notificar admin    |
      | Rate limiting             | 5 req/min por IP   |

  Escenario: Session management
    Dado que se evalúa gestión de sesiones
    Cuando se verifica
    Entonces:
      | Verificación              | Estado  |
      | Token invalida al logout  | ✅       |
      | Sesión expira 30 min      | ✅       |
      | Token no en URL           | ✅       |
      | Cookie HttpOnly+Secure    | ✅       |

  Escenario: IDOR (Insecure Direct Object Reference)
    Dado que se prueba acceso a recursos ajenos
    Cuando se manipulan IDs
    Entonces el sistema resiste:
      | Técnica                   | Resultado |
      | Cambiar patient-id en URL | 403       |
      | Acceder a expediente ajeno| 403       |
      | Escalar privilegios      | 403       |
