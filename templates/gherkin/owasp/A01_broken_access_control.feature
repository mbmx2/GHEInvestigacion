# language: es
# @id GHE-SEC-OWASP-A01-001
# @type security
# @domain security
# @layer api
# @risk s1
# @owner security-lead
# @status proposed
# @requirement OWASP-A01
# @risk-control CTRL-OWASP-A01
# @regulation NOM-024
@domain:security @type:security @risk:s1 @status:proposed
Característica: OWASP A01 - Control de Acceso Roto
  Como responsable de seguridad del hospital
  Quiero controles de acceso robustos
  Para que solo personal autorizado acceda a datos de pacientes

  Regla: Todo usuario tiene un rol asignado que determina su acceso

    Escenario: Acceso por módulo y rol
      Dado que un usuario con rol "<rol>" accede a "<módulo>"
      Entonces sistema permite: "<resultado>"
      Y registra en audit log

      Ejemplos:
        | rol        | módulo                | resultado |
        | admin      | Ver expediente        | Sí        |
        | doctor     | Ver expediente        | Sí        |
        | nurse      | Ver expediente        | Parcial   |
        | pharmacy   | Ver expediente        | No        |
        | reception  | Ver expediente        | No        |
        | doctor     | Prescribir            | Sí        |
        | pharmacy  | Sur medicamentos      | Sí        |
        | reception | Registrar paciente    | Sí        |

    Escenario: Denegación de acceso no autorizado
      Dado que usuario con rol "<rol>" intenta "<acción>"
      Entonces sistema retorna "<respuesta>"

      Ejemplos:
        | rol        | acción                    | respuesta  |
        | reception  | Ver expediente completo   | 403        |
        | nurse      | Prescribir medicamentos   | 403        |
        | pharmacy  | Crear consulta            | 403        |
        | reception  | Modificar expediente      | 403        |
      # @evidence EVID-ASVS-A01-001

  Regla: El acceso a nivel de registro se verifica

    Escenario: Protección contra IDOR
      Dado que usuario intenta acceder a expediente ajeno vía manipulación de ID
      Entonces sistema:
        | Verificación              | Estado  |
        | Valida token              | ✅       |
        | Verifica permiso          | ✅       |
        | Retorna 403               | ✅       |
        | No retorna datos          | ✅       |
        | Registra en audit log     | ✅       |
      # @evidence EVID-ASVS-A01-002
      # @invariante INV-A01-001

  Regla: La sesión expira por inactividad

    Escenario: Expiración de sesión
      Dado que usuario tiene sesión activa
      Cuando pasan 30 minutos sin actividad
      Entonces sistema expira sesión y redirige a login
      Y registra el evento de expiración

    Escenario: Logout seguro
      Dado que usuario cierra sesión
      Cuando ejecuta logout
      Entonces:
        | Acción                    |
        | Invalida token           |
        | Limpia cookies           |
        | Registra evento          |
