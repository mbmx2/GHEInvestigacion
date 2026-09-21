# language: es
# @id GHE-NIST-53-AC-001
# @type compliance
# @domain security
# @layer domain
# @risk s1
# @owner security-lead
# @status proposed
# @requirement NIST-53-AC
# @risk-control CTRL-NIST-53-AC
# @regulation NOM-024
@domain:security @type:compliance @risk:s1 @status:proposed
Característica: NIST 800-53 - Control de Acceso (AC)
  Como responsable de seguridad del hospital
  Quiero controles de acceso basados en NIST 800-53
  Para que cada usuario solo acceda a lo que necesita

  Regla: AC-2: Gestión de cuentas de usuario

    Escenario: Cuentas gestionadas
      Dado que se gestionan cuentas
      Cuando se verifica
      Entonces: cuentas individuales, sin compartidas, inactivas deshabilitadas, auditoría
      # @evidence EVID-NIST-53-AC-001

    Escenario: Cuenta compartida detectada
      Dado que se detecta cuenta compartida
      Cuando se audita
      Entonces se deshabilita y se asigna cuenta individual
      # @evidence EVID-NIST-53-AC-001-N

  Regla: AC-3: Control de acceso basado en roles

    Escenario: RBAC implementado
      Dado que se verifica control de acceso
      Cuando se evalúa
      Entonces: mínimo privilegio, denegación por defecto, auditoría
      # @evidence EVID-NIST-53-AC-002

    Escenario: Acceso sin RBAC
      Dado que se detecta acceso sin verificación de rol
      Cuando se audita
      Entonces: acceso denegado y se registra intento
      # @evidence EVID-NIST-53-AC-002-N

  Regla: AC-4: Control de acceso a datos de pacientes

    Escenario: Acceso a datos asignados
      Dado que usuario accede a datos de pacientes
      Cuando se verifica
      Entonces: solo accede a pacientes asignados
      # @evidence EVID-NIST-53-AC-003

    Escenario: Acceso a datos no asignados
      Dado que usuario accede a datos de paciente no asignado
      Cuando se verifica
      Entonces: acceso denegado + audit log
      # @evidence EVID-NIST-53-AC-003-N

  # @invariante INV-53-AC-001: Todo acceso se registra
  Regla: Todo acceso se audita

    Escenario: Auditoría de acceso
      Dado que se accede a recurso
      Cuando se registra
      Entonces: user ID, acción, entidad, resultado, timestamp, IP
      # @evidence EVID-NIST-53-AC-004
