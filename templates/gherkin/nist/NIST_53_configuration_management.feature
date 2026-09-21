# language: es
# @id GHE-NIST-53-CM-001
# @type compliance
# @domain security
# @layer infrastructure
# @risk s2
# @owner dev-lead
# @status proposed
# @requirement NIST-53-CM
# @risk-control CTRL-NIST-53-CM
# @regulation NOM-024
@domain:security @type:compliance @risk:s2 @status:proposed
Característica: NIST 800-53 - Gestión de Configuración (CM)
  Como responsable de configuración del proyecto GHE
  Quiero gestión de configuración según NIST 800-53
  Para que cada cambio sea rastreable y controlado

  Regla: CM-2: Configuración base

    Escenario: Configuración baseline documentada
      Dado que se define configuración base
      Cuando se documenta
      Entonces cada componente tiene configuración estándar versionada
      # @evidence EVID-NIST-53-CM-001

    Escenario: Configuración sin versionar
      Dado que se detecta cambio de configuración sin Git
      Cuando se audita
      Entonces: se versiona retroactivamente y se documenta
      # @evidence EVID-NIST-53-CM-001-N

  Regla: CM-3: Control de cambios

    Escenario: Cambios controlados
      Dado que se modifica configuración
      Cuando se procesa
      Entonces: documentación, aprobación, verificación, rollback posible
      # @evidence EVID-NIST-53-CM-002

    Escenario: Cambio sin control
      Dado que se detecta cambio sin documentar
      Cuando se audita
      Entonces: se investiga y se implementa proceso de control
      # @evidence EVID-NIST-53-CM-002-N

  Regla: CM-6: Configuración de seguridad

    Escenario: Configuración segura verificada
      Dado que se verifica configuración de seguridad
      Cuando se audita
      Entonces: headers HTTP, TLS, CORS, permisos restrictivos
      # @evidence EVID-NIST-53-CM-003

    Escenario: Configuración insegura detectada
      Dado que se detecta configuración insegura
      Cuando se audita
      Entonces: se remedia inmediatamente
      # @evidence EVID-NIST-53-CM-003-N

  # @invariante INV-53-CM-001: Toda configuración está versionada
  Regla: Toda configuración está versionada

    Escenario: Configuración sin versionar
      Dado que se detecta configuración sin Git
      Cuando se audita
      Entonces: se agrega a Git y se documenta
      # @evidence EVID-NIST-53-CM-004

  Regla: CM-7: Mínimo de funcionalidad

    Escenario: Ataque surface reducido
      Dado que se evalúa attack surface
      Cuando se verifica
      Entonces: solo servicios necesarios habilitados
      # @evidence EVID-NIST-53-CM-005
