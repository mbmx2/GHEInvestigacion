# language: es
# @id GHE-CISSP-008
# @type business-rule
# @domain security
# @layer iam
# @risk s1
# @owner iam-admin
# @status proposed
# @requirement REQ-CISSP-008
# @risk-control CTRL-CISSP-008
# @regulation CISSP-D5 ISC2 NOM-024
@domain:isc2_cissp @type:business-rule @risk:s1 @status:proposed
Característica: CISSP Dominio 5 — Gestión de Identidades y Accesos (IAM)
  Como administrador de identidades
  Quiero IAM robusto conforme CISSP Domain 5
  Para que cada usuario acceda solo a lo que necesita

  Regla: Gestión del ciclo de vida de identidades

    Escenario: Provisioning de identidad
      Dado que nuevo empleado ingresa al hospital
      Cuando se crea identidad
      Entonces se verifica:
        | Elemento                    |
        | Aprobación del supervisor   |
        | Verificación de identidad   |
        | Rol asignado                |
        | Permisos mínimos            |
        | Fecha de expiración         |

    Escenario: Cambio de rol
      Dado que empleado cambia de部门
      Cuando se actualiza identidad
      Entonces se verifica:
        | Elemento                    |
        | Permisos anteriores removidos|
        | Nuevos permisos asignados   |
        | Aprobación del nuevo supervisor|
        | Registro del cambio         |

    Escenario: Baja de identidad
      Dado que empleado deja el hospital
      Cuando se desactiva identidad
      Entonces se verifica:
        | Elemento                    |
        | Desactivación inmediata     |
        | Revocación de credenciales  |
        | Cierre de sesiones activas  |
        | Transferencia de datos      |
        | Registro de baja            |

  Regla: Autenticación es multifactor

    Escenario: MFA obligatorio
      Dado que usuario accede al sistema
      Cuando se autentica
      Entonces se requiere:
        | Factor      | Ejemplo                     |
        | Conocimiento| Contraseña                   |
        | Poseión     | Token físico/móvil           |
        | Biometría   | Huella/rostro (opcional)    |

    Escenario: Autenticación adaptativa
      Dado que usuario accede desde ubicación inusual
      Cuando se evalúa riesgo
      Entonces se solicita:
        | Elemento                    |
        | Segundo factor adicional    |
        | Verificación de ubicación   |
        | Notificación al usuario     |

  Regla: Autorización usa RBAC

    Escenario: Modelo RBAC implementado
      Dado que sistema usa control de acceso basado en roles
      Cuando se asignan roles
      Entonces se verifica:
        | Rol                   | Permisos                    |
        | Médico                | Lectura/escritura expedientes|
        | Enfermera             | Escritura limitada, lectura |
        | Farmacéutico          | Dispensación, inventario    |
        | Administrador         | Reportes, configuración     |
        | Auditor               | Solo lectura                |

    Escenario: Separación de funciones
      Dado que funciones críticas requieren segregación
      Cuando se implementa
      Entonces se verifica:
        | Función                | Segregación                 |
        | Prescripción + dispensación| Usuarios diferentes      |
        | Creación + aprobación de cambios| Usuarios diferentes  |
        | Acceso + auditoría     | Roles separados             |

  Regla: Monitoreo de accesos es continuo

    Escenario: Detección de accesos anómalos
      Dado que sistema monitorea patrones de acceso
      Cuando detecta anomalía
      Entonces se verifica:
        | Tipo de anomalía         | Acción          |
        | Acceso fuera de horario  | Alerta info     |
        | Acceso masivo            | Bloqueo temporal|
        | Acceso desde ubicación   | Alerta crítica  |
        | inusual                   |                 |
        | Escalamiento de privilegios| Alerta crítica |
