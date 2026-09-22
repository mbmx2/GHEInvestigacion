# language: es
# @id GHE-CISSP-035
# @type business-rule
# @domain security
# @layer pam
# @risk s1
# @owner pam-admin
# @status proposed
# @requirement REQ-CISSP-035
# @risk-control CTRL-CISSP-035
# @regulation CISSP-D5 ISC2
@domain:isc2_cissp @type:business-rule @risk:s1 @status:proposed
Característica: CISSP — Gestión de Accesos Privilegiados (PAM)
  Como administrador de accesos privilegiados
  Quiero PAM conforme CISSP
  Para que los accesos de administrador estén controlados y auditados

  Regla: Cuentas privilegiadas se gestionan

    Escenario: Inventario de cuentas privilegiadas
      Dado que existen cuentas con privilegios elevados
      Cuando se inventarian
      Entonces se verifica:
        | Elemento                    |
        | Todas las cuentas identificadas|
        | Propietario asignado        |
        | Propósito documentado       |
        | Expiración definida         |
        | Sin cuentas compartidas     |

    Escenario: Cuentas de servicio
      Dado que aplicaciones usan cuentas de servicio
      Cuando se gestionan
      Entonces se verifica:
        | Elemento                    |
        | Sin privilegios interactivos|
        | Contraseñas rotadas         |
        | Acceso restringido          |
        | Logging habilitado          |
        | Revisión trimestral         |

  Regla: Acceso privilegiado se graba

    Escenario: Grabación de sesiones privilegiadas
      Dado que administrador accede con privilegios
      Cuando se inicia sesión
      Entonces se verifica:
        | Elemento                    |
        | Sesión grabada              |
        | Timestamp y usuario         |
        | Comandos ejecutados         |
        | Almacenamiento seguro       |
        | Retención de grabaciones    |

  Regla: Acceso privilegiado se justifica

    Escenario: Solicitud de acceso privilegiado
      Dado que usuario requiere acceso privilegiado temporal
      Cuando solicita
      Entonces se verifica:
        | Elemento                    |
        | Justificación documentada   |
        | Aprobación del propietario  |
        | Duración limitada           |
        | Permisos mínimos necesarios |
        | Registro de actividad       |

  Regla: Just-In-Time access se implementa

    Escenario: Acceso temporal
      Dado que administrador necesita acceso temporal
      Cuando se activa
      Entonces se verifica:
        | Elemento                    |
        | Acceso por tiempo limitado  |
        | Permisos específicos        |
        | Auto-desactivación          |
        | Notificación al propietario |
        | Registro completo           |

  Regla: Revisión de accesos privilegiados

    Escenario: Auditoría de accesos privilegiados
      Dado que se revisan accesos privilegiados
      Cuando se audita
      Entonces se verifica:
        | Elemento                    |
        | Accesos activos             |
        | Usos no autorizados         |
        | Cuentas obsoletas           |
        | Excepciones pendientes      |
        | Acciones correctivas        |
