# language: es
# @id GHE-NIST-SSDF-PW-001
# @type compliance
# @domain security
# @layer development
# @risk s1
# @owner dev-lead
# @status proposed
# @requirement NIST-SSDF-PW
# @risk-control CTRL-NIST-SSDF-PW
# @regulation NOM-024
@domain:security @type:compliance @risk:s1 @status:proposed
Característica: NIST SSDF PW - Producir Software Bien Asegurado
  Como desarrollador del proyecto GHE
  Quiero que el software se produzca con prácticas de seguridad
  Para que cada línea de código sea segura por construcción

  Regla: Se usan prácticas de desarrollo seguro

    Escenario: Prácticas verificadas
      Dado que se desarrolla código
      Cuando se verifica
      Entonces se cumplen:
        | Práctica                   |
        | TDD (tests antes del código) |
        | Code review obligatorio   |
        | Análisis estático         |
        | Validación de entrada     |
        | Sanitización de salida    |
        | Cifrado de datos sensibles |
      # @evidence EVID-NIST-SSDF-PW-001

  Regla: Los componentes se validan contra requisitos de seguridad

    Escenario: Validación de componentes
      Dado que se implementa componente
      Cuando se verifica
      Entonces cumple requisitos de seguridad del diseño
      # @evidence EVID-NIST-SSDF-PW-002

  Regla: Los errores de seguridad se corrigen antes de liberar

    Escenario: Error de seguridad detectado
      Dado que se detecta vulnerabilidad en código
      Cuando se clasifica
      Entonces:
        | Severidad | Acción |
        | Crítica | Corregir antes de merge |
        | Alta | Corregir antes de release |
        | Media | Registrar y planificar |
      # @evidence EVID-NIST-SSDF-PW-003

  Regla: El código se revisa antes de merge

    Escenario: Code review de seguridad
      Dado que se crea PR
      Cuando se revisa
      Entonces se verifica: sin SQL injection, sin XSS, sin secrets, input validado
      # @evidence EVID-NIST-SSDF-PW-004

  Regla: Los tests verifican seguridad

    Escenario: Tests de seguridad
      Dado que se ejecutan tests
      Cuando se verifica
      Entonces incluyen: tests de autenticación, autorización, validación, cifrado
      # @evidence EVID-NIST-SSDF-PW-005
