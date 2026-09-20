# language: es
# @id GHE-SEC-OWASP-A01-001
# @type security
# @domain security
# @layer api
# @risk s1
# @owner security-lead
# @status proposed
@domain:security @type:security @risk:s1 @status:proposed
Característica: A01 - Control de Acceso (OWASP Top 10)
  Como responsable de seguridad del hospital
  Quiero controles de acceso robustos
  Para que solo personal autorizado acceda a datos de pacientes

  Contexto:
    Dado que el sistema tiene RBAC activo
    Y que existen roles: admin, doctor, nurse, pharmacy, reception

  Escenario Outline: Acceso por módulo y rol
    Dado que un usuario con rol "<rol>" accede a "<módulo>"
    Entonces el sistema permite: "<resultado>"
    Y registra en audit log

    Ejemplos:
      | rol        | módulo                    | resultado |
      | admin      | Ver expediente completo   | Sí        |
      | doctor     | Ver expediente completo   | Sí        |
      | nurse      | Ver expediente completo   | Parcial   |
      | pharmacy   | Ver expediente completo   | No        |
      | reception  | Ver expediente completo   | No        |
      | admin      | Configurar sistema        | Sí        |
      | doctor     | Prescribir medicamentos   | Sí        |
      | nurse      | Registrar signos vitales  | Sí        |
      | pharmacy  | Sur medicamentos          | Sí        |
      | reception | Registrar paciente        | Sí        |

  Escenario Outline: Denegación de acceso no autorizado
    Dado que usuario con rol "<rol>" intenta "<acción>"
    Entonces sistema retorna "<respuesta>"

    Ejemplos:
      | rol        | acción                        | respuesta  |
      | reception  | Ver expediente completo       | 403        |
      | nurse      | Prescribir medicamentos       | 403        |
      | pharmacy  | Crear consulta                | 403        |
      | reception  | Modificar expediente médico   | 403        |

  Escenario: Protección contra IDOR
    Dado que usuario intenta acceder a expediente ajeno vía manipulación de ID
    Entonces sistema:
      | Verificación              | Estado  |
      | Valida token              | ✅       |
      | Verifica permiso          | ✅       |
      | Retorna 403               | ✅       |
      | No retorna datos          | ✅       |
      | Registra en audit log     | ✅       |

  Escenario: Expiración de sesión
    Dado que usuario tiene sesión activa
    Cuando pasan 30 min de inactividad
    Entonces sistema expira sesión y redirige a login

  Escenario: Logout seguro
    Dado que usuario cierra sesión
    Cuando ejecuta logout
    Entonces sistema invalida token, limpia cookies y registra evento
