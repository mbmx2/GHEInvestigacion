# language: es
# @id GHE-ASVS-V4-001
# @type compliance
# @domain security
# @layer domain
# @risk s1
# @owner security-lead
# @status proposed
# @requirement ASVS-V4
# @risk-control CTRL-ASVS-V4
# @regulation NOM-024
@domain:security @type:compliance @risk:s1 @status:proposed
Característica: V4 - Control de Acceso
  Como responsable de seguridad del proyecto GHE
  Quiero control de acceso robusto
  Para que cada usuario solo acceda a lo que necesita

  Regla: V4.1 - Principios de control de acceso

    Escenario: Principio de mínimo privilegio
      Dado que se asigna rol a usuario
      Cuando se verifica acceso
      Entonces solo tiene acceso a datos y funciones necesarias para su rol
      # @evidence EVID-ASVS-V4-001

    Escenario: Denegación por defecto
      Dado que un usuario intenta acceder a recurso no asignado
      Cuando se verifica
      Entonces acceso es denegado
      Y se registra el intento
      # @evidence EVID-ASVS-V4-002

  Regla: V4.2 - Acceso basado en atributos

    Escenario: RBAC por rol
      Dado que se verifica acceso por rol
      Cuando se evalúa
      Entonces:
        | Rol            | Expediente | Farmacia | Admin | Auditoría |
        | Admin          | ✅         | ✅       | ✅     | ✅        |
        | Doctor         | ✅ (asignados) | ❌   | ❌     | ❌        |
        | Nurse          | ⚠️ (parcial) | ❌      | ❌     | ❌        |
        | Pharmacy       | ❌          | ✅       | ❌     | ❌        |
        | Reception      | ❌          | ❌       | ❌     | ❌        |
        | Auditor        | ❌          | ❌       | ❌     | Solo logs |

  Regla: V4.3 - Control de acceso a nivel de registro

    Escenario: Acceso por paciente asignado
      Dado que doctor solo atiende ciertos pacientes
      Cuando intenta ver paciente no asignado
      Entonces acceso es denegado
      Y se registra el intento

  Regla: V4.4 - Gestión de credenciales

    Escenario: Cambio de contraseña
      Dado que usuario cambia contraseña
      Cuando se ejecuta
      Entonces todas las sesiones activas se invalidan

    Escenario: Cuenta inactiva
      Dado que cuenta no se usa por 90 días
      Cuando se detecta
      Entonces cuenta se desactiva
      Y se notifica al administrador

  Regla: V4.5 - Control de acceso por IP (recomendado)

    Escenario: Restricción de acceso por IP
      Dado que se configura acceso
      Cuando se verifica
      Entonces acceso se limita a IPs de la red hospitalaria
      Y accesos externos requieren VPN
