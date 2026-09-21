# language: es
# @id GHE-SEC-OWASP-A03-001
# @type security
# @domain security
# @layer domain
# @risk s1
# @owner security-lead
# @status proposed
# @requirement OWASP-A03
# @risk-control CTRL-OWASP-A03
# @regulation NOM-024
@domain:security @type:security @risk:s1 @status:proposed
Característica: OWASP A03 - Inyección
  Como responsable de seguridad del hospital
  Quiero prevenir todas las formas de inyección
  Para que datos de pacientes no sean manipulados

  Regla: Se usa parameterized queries 100% del tiempo

    Escenario: Prevención de SQL injection
      Dado que se procesa input del usuario
      Cuando se ejecuta consulta SQL
      Entonces se usa parameterized query
      Y NO se concatena input en queries
      Y input con ' OR '1'='1' es rechazado
      # @evidence EVID-ASVS-V5-001

  Regla: Output se sanitiza contra XSS

    Escenario: Prevención de XSS
      Dado que se renderiza contenido del usuario
      Cuando se muestra
      Entonces se sanitiza output
      Y se usa Content Security Policy
      # @evidence EVID-ASVS-V5-002

  Regla: Se previene CSRF

    Escenario: Protección CSRF
      Dado que se procesa petición POST
      Cuando se verifica
      Entonces:
        | Verificación              | Estado |
        | Token CSRF requerido      | ✅      |
        | SameSite cookie           | ✅      |
      # @evidence EVID-ASVS-V5-003
