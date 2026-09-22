# language: es
# @id GHE-SANS-001
# @type business-rule
# @domain security
# @layer controls
# @risk s1
# @owner security-operations
# @status proposed
# @requirement REQ-SANS-001
# @risk-control CTRL-SANS-001
# @regulation SANS-CIS NIST-800-53
@domain:sans_giac @type:business-rule @risk:s1 @status:proposed
Característica: SANS — Controles Críticos de Seguridad (CIS Controls)
  Como director de seguridad
  Quiero implementar los 18 CIS Controls conforme SANS
  Para que la seguridad del hospital se base en controles priorizados y efectivos

  Regla: Controles básicos (1-6) se implementan primero

    Escenario: Inventario y control de activos
      Dado que se implementa CIS Control 1
      Cuando se ejecuta
      Entonces se verifica:
        | Elemento                    |
        | Inventario de activos de hardware|
        | Inventario de activos de software|
        | Inventario de servicios de red|
        | Inventario de información    |
        | Inventario de propietarios   |
        | Centrados en activos de datos|

    Escenario: Control de acceso y gestión de privilegios
      Dado que se implementa CIS Control 5
      Cuando se ejecuta
      Entonces se verifica:
        | Elemento                    |
        | Control de acceso establecido|
        | Cuentas administrativas gestionadas|
        | Acceso de empleados revisado  |
        | Acceso de proveedores revisado|
        | Registro de acceso mantenido  |

    Escenario: Auditoría y logs de seguridad
      Dado que se implementa CIS Control 8
      Cuando se ejecuta
      Entonces se verifica:
        | Elemento                    |
        | Logs de auditoría configurados|
        | Logs de trabajo centralizados|
        | Logs de intrusiones          |
        | Logs de cambios en IAM       |
        | Logs revisados periódicamente|

  Regla: Controles de midpoint (7-12) se implementan

    Escenario: Seguridad de continuo de email y navegador
      Dado que se implementa CIS Control 9
      Cuando se ejecuta
      Entonces se verifica:
        | Elemento                    |
        | Herramientas de seguridad de email|
        | Configuración de email seguro|
        | Separación de dominios de email|
        | Experiencia de usuario limpiada|

    Escenario: Seguridad de sistemas anti-malware
      Dado que se implementa CIS Control 10
      Cuando se ejecuta
      Entonces se verifica:
        | Elemento                    |
        | Anti-malware desplegado      |
        | Anti-malware actualizado     |
        | Escaneo automático activado  |
        | Centrado en activos de datos |

  Regla: Controles avanzados (13-18) se implementan

    Escenario: Seguridad de datos y gestión de información
      Dado que se implementa CIS Control 14
      Cuando se ejecuta
      Entonces se verifica:
        | Elemento                    |
        | Procesos de gestión de datos clasificados|
        | Retención de datos procesada |
        | Eliminación de datos segura  |
        | Enmascaramiento de datos     |
        | Encriptación de datos        |
        | Integridad de datos verificada|

    Escenario: Gestión de vulnerabilidades
      Dado que se implementa CIS Control 7
      Cuando se ejecuta
      Entonces se verifica:
        | Elemento                    |
        | Procesos de gestión de vulnerabilidades establecidos|
        | Escaneo de vulnerabilidades  |
        | Remediación de vulnerabilidades|
        | Protección de controles de red |
