# language: es
Característica: Seguridad de Aplicación
@status:proposed
@type:acceptance
@domain:security
  Como desarrollador del proyecto GHE
  Quiero que el código sea seguro por diseño
  Para que cada línea proteja datos de pacientes

  Contexto:
    Dado que el sistema está activo
    Y que el usuario tiene rol de desarrollador

  Escenario: Seguridad de código
    Dado que se revisa código
    Cuando se verifica
    Entonces se cumple:
      | Práctica                       | Estado |
      | Parameterized queries 100%   | ✅      |
      | Input validation 100%        | ✅      |
      | Output encoding 100%         | ✅      |
      | Error handling seguro        | ✅      |
      | Sin secrets hardcodeados     | ✅      |
      | HTTPS forzado               | ✅      |

  Escenario: Autenticación segura
    Dado que se verifica autenticación
    Cuando se evalúa
    Entonces se cumple:
      | Medida                        |
      | Password hashing bcrypt     |
      | Rate limiting en login      |
      | Account lockout             |
      | Session timeout             |
      | Password policy             |

  Escenario: Autorización robusta
    Dado que se verifica autorización
    Cuando se evalúa
    Entonces se cumple:
      | Medida                        |
      | RBAC por roles              |
      | Validación en cada endpoint |
      | Principio de menor privilegio|
      | Auditoría de accesos        |
      | Tokens con expiración       |
