# language: es
# @id GHE-SAMM-DES-001
# @type compliance
# @domain security
# @layer governance
# @risk s1
# @owner architect
# @status proposed
# @requirement SAMM-DESIGN
# @risk-control CTRL-SAMM-DESIGN
# @regulation NOM-024
@domain:security @type:compliance @risk:s1 @status:proposed
Característica: SAMM Design - Requisitos y Arquitectura de Seguridad
  Como arquitecto del proyecto GHE
  Quiero que la seguridad esté integrada en el diseño
  Para que cada componente sea seguro por construcción

  Regla: Cada feature tiene requisitos de seguridad

    Escenario: Requisitos documentados
      Dado que se define un feature
      Cuando se documenta
      Entonces incluye: autenticación, autorización, cifrado, auditoría
      # @evidence EVID-SAMM-DES-001

    Escenario: Feature sin requisitos de seguridad
      Dado que se define un feature SIN requisitos de seguridad
      Cuando se detecta
      Entonces se bloquea la implementación
      Y se solicitan requisitos de seguridad antes de continuar
      # @evidence EVID-SAMM-DES-001-N

  Regla: Los requisitos de seguridad son trazables

    Escenario: Trazabilidad completa
      Dado que se tiene requisito de seguridad
      Cuando se verifica trazabilidad
      Entonces se rastrea: requisito → feature → test → evidencia
      # @evidence EVID-SAMM-DES-002

    Escenario: Trazabilidad rota
      Dado que un requisito NO tiene test asociado
      Cuando se detecta
      Entonces se genera gap de trazabilidad
      Y se solicita crear el test
      # @evidence EVID-SAMM-DES-002-N

  # @invariante INV-DES-001: Toda arquitectura debe documentar decisiones de seguridad
  Regla: La arquitectura documenta decisiones de seguridad

    Escenario: ADRs de seguridad
      Dado que se toma decisión arquitectónica
      Cuando se documenta
      Entonces incluye: contexto, alternativas, decisión, controles, riesgos residuales
      # @evidence EVID-SAMM-DES-003

    Escenario: Decisión sin documentar
      Dado que se toma decisión de seguridad SIN documentar
      Cuando se detecta
      Entonces se genera alerta y se solicita documentar
      # @evidence EVID-SAMM-DES-003-N

  Regla: La segregación por confianza se verifica

    Escenario: Segregación correcta
      Dado que se separan componentes
      Cuando se verifica
      Entonces no hay dependencias de bajo a alto nivel
      # @evidence EVID-SAMM-DES-004

    Escenario: Segregación violada
      Dado que un componente de bajo nivel depende de uno de alto
      Cuando se detecta
      Entonces se genera alerta y se refactorea
      # @evidence EVID-SAMM-DES-004-N

  # @invariante INV-DES-002: Toda amenaza STRIDE debe tener un control asignado
  Regla: Cada amenaza tiene un control

    Escenario: Threat modeling completo
      Dado que se evalúa componente
      Cuando se hace threat modeling
      Entonces cada amenaza STRIDE tiene un control asignado
      # @evidence EVID-SAMM-DES-005

    Escenario: Amenaza sin control
      Dado que se detecta amenaza sin control
      Cuando se verifica
      Entonces se genera alerta y se diseña control antes de avanzar
      # @evidence EVID-SAMM-DES-005-N
