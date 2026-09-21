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
      Entonces:
        | Verificación              |
        | Cuentas individuales      |
        | Sin cuentas compartidas  |
        | Cuentas inactivas se deshabilitan |
        | Auditoría de cuentas     |

  Regla: AC-3: Control de acceso de acceso

    Escenario: Acceso basado en roles
      Dado que se verifica control de acceso
      Cuando se evalúa
      Entonces: RBAC implementado, mínimo privilegio, denegación por defecto

  Regla: AC-4: Control de acceso de acceso a datos

    Escenario: Acceso a datos de pacientes
      Dado que usuario accede a datos
      Cuando se verifica
      Entonces: solo accede a datos de pacientes asignados

  Regla: AC-6: Restricciones de acceso

    Escenario: Restricciones documentadas
      Dado que se definen restricciones
      Cuando se verifica
      Entonces: cada rol tiene permisos explícitos

  Regla: AC-7: Prevención de acceso no autorizado

    Escenario: Acceso denegado
      Dado que usuario sin permiso accede
      Cuando se detecta
      Entonces: acceso denegado, audit log, notificación
