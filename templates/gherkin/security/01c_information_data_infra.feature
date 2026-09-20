# language: es
Característica: Pentest - Información, Datos e Infraestructura
@status:proposed
@type:acceptance
@domain:security
  Como tester de seguridad del hospital
  Quiero verificar que no se exponga información ni datos sensibles
  Para proteger privacidad de pacientes y seguridad del hospital

  Contexto:
    Dado que el sistema está activo
    Y que el usuario tiene rol de tester de seguridad

  Escenario: Exposición de información
    Dado que se busca información expuesta
    Cuando se evalúa
    Entonces NO se expone:
      | Información               | Estado    |
      | Stack traces              | Ocultos    |
      | Versión del software      | Oculta     |
      | Rutas internas            | No accesibles |
      | Datos de debug            | No en producción |
      | .git expuesto             | No accesible |

  Escenario: Headers de seguridad
    Dado que se verifican headers HTTP
    Cuando se inspeccionan
    Entonces:
      | Header                    | Estado  |
      | Strict-Transport-Security | ✅       |
      | X-Content-Type-Options    | ✅       |
      | X-Frame-Options           | ✅       |
      | Content-Security-Policy   | ✅       |

  Escenario: Cifrado de datos
    Dado que se verifica cifrado
    Cuando se evalúa
    Entonces:
      | Capa                      | Método  | Estado |
      | Reposo                    | AES-256 | ✅     |
      | Tránsito                  | TLS 1.3 | ✅     |
      | Passwords                 | bcrypt  | ✅     |

  Escenario: Protección de datos sensibles
    Dado que se busca datos sensibles expuestos
    Cuando se evalúa
    Entonces NO se expone:
      | Dato                       | Estado  |
      | CURP en logs              | Ofuscada |
      | Passwords en respuestas   | Nunca    |
      | Datos de pacientes en errores | No   |

  Escenario: API Security
    Dado que se audita API
    Cuando se evalúa
    Entonces:
      | Verificación              | Estado  |
      | Autenticación requerida   | ✅       |
      | Rate limiting             | ✅       |
      | Validación de input       | ✅       |
      | CORS configurado          | ✅       |
