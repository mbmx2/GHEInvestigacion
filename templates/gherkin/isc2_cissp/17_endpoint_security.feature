# language: es
# @id GHE-CISSP-017
# @type business-rule
# @domain security
# @layer endpoint
# @risk s2
# @owner endpoint-admin
# @status proposed
# @requirement REQ-CISSP-017
# @risk-control CTRL-CISSP-017
# @regulation CISSP-D7 ISC2
@domain:isc2_cissp @type:business-rule @risk:s2 @status:proposed
Característica: CISSP — Seguridad de Endpoints y Dispositivos
  Como administrador de endpoints
  Quiero seguridad de endpoints conforme CISSP
  Para que todos los dispositivos del hospital estén protegidos

  Regla: Hardening de endpoints se aplica

    Escenario: Configuración segura de workstation
      Dado que se configura workstation médica
      Cuando se aplica hardening
      Entonces se verifica:
        | Elemento                    |
        | SO actualizado              |
        | Antimalware activo          |
        | Firewall habilitado         |
        | Puertos innecesarios off    |
        | Cuentas por defecto off     |
        | Cifrado de disco            |
        | Bloqueo automático          |

    Escenario: Hardening de servidor
      Dado que se configura servidor
      Cuando se aplica hardening
      Entonces se verifica:
        | Elemento                    |
        | Benchmark CIS aplicado      |
        | Servicios innecesarios off  |
        | SSH hardening               |
        | Logging habilitado          |
        | Fail2ban configurado        |
        | Actualizaciones automáticas |

  Regla: Gestión de parches de endpoints

    Escenario: Parches de seguridad
      Dado que endpoints requieren parches
      Cuando se gestionan
      Entonces se verifica:
        | Elemento                    |
        | Parches críticos en <24h   |
        | Parches regulares mensuales |
        | Prueba antes de deploy       |
        | Rollback planificado        |
        | Reporte de cumplimiento     |

  Regla: BYOD se gestiona

    Escenario: Dispositivos personales
      Dado que personal usa dispositivos personales
      Cuando se permite acceso
      Entonces se verifica:
        | Elemento                    |
        | Política BYOD documentada   |
        | MDM configurado             |
        | Acceso segmentado           |
        | Datos separados             |
        | Capacidad de borrado remoto |

  Regla: Dispositivos IoT médico se protegen

    Escenario: Seguridad de dispositivos médicos conectados
      Dado que hospital tiene dispositivos IoT médico
      Cuando se gestionan
      Entonces se verifica:
        | Elemento                    |
        | Inventario completo         |
        | Segmentación de red         |
        | Actualizaciones gestionadas |
        | Credenciales por defecto cambiadas|
        | Monitoreo de anomalías      |
