# language: es
# @id GHE-GIAC-007
# @type business-rule
# @domain security
# @layer essentials
# @risk s1
# @owner security-analyst
# @status proposed
# @requirement REQ-GIAC-007
# @risk-control CTRL-GIAC-007
# @regulation GIAC-GSEC SANS
@domain:sans_giac @type:business-rule @risk:s1 @status:proposed
Característica: GIAC GSEC — Esenciales de Seguridad de la Información
  Como analista de seguridad
  Quiero fundamentos de seguridad conforme GSEC
  Para que la seguridad se base en conocimiento esencial verificado

  Regla: Fundamentos de seguridad se demuestran

    Escenario: Conceptos básicos de seguridad
      Dado que personal tiene certificación GSEC
      Cuando se evalúa conocimiento
      Entonces demuestra dominio de:
        | Tema                         |
        | Princios de seguridad (CIA) |
        | Tipos de controles          |
        | Modelos de amenazas         |
        | Gestión de riesgos          |
        | Cumplimiento normativo      |

    Escenario: Redes y comunicaciones
      Dado que GSEC cubre redes
      Cuando se evalúa conocimiento
      Entonces demuestra dominio de:
        | Tema                         |
        | Modelo OSI y TCP/IP         |
        | Dispositivos de red          |
        | Protocolos de seguridad      |
        | Seguridad de red             |
        | Monitoreo de tráfico         |

  Regla: Sistemas operativos se protegen

    Escenario: Seguridad de SO
      Dado que GSEC cubre sistemas operativos
      Cuando se evalúa conocimiento
      Entonces demuestra dominio de:
        | Tema                         |
        | Windows security             |
        | Linux/Unix security          |
        | Hardening de sistemas        |
        | Gestión de parches           |
        | Control de acceso            |

  Regla: Controles de seguridad se implementan

    Escenario: Controles esenciales
      Dado que GSEC cubre controles
      Cuando se implementan
      Entonces se verifica:
        | Tema                         |
        | Control de acceso lógico     |
        | Seguridad de contraseñas     |
        | Encriptación                 |
        | Firewalls                    |
        | IDS/IPS                      |
        | Gestión de vulnerabilidades  |
