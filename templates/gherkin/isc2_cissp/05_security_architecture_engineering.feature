# language: es
# @id GHE-CISSP-005
# @type business-rule
# @domain security
# @layer architecture
# @risk s1
# @owner security-architect
# @status proposed
# @requirement REQ-CISSP-005
# @risk-control CTRL-CISSP-005
# @regulation CISSP-D3 ISC2
@domain:isc2_cissp @type:business-rule @risk:s1 @status:proposed
Característica: CISSP Dominio 3 — Arquitectura y Diseño de Seguridad
  Como arquitecto de seguridad
  Quiero arquitectura de seguridad conforme CISSP Domain 3
  Para que la seguridad esté integrada en el diseño del sistema desde el inicio

  Regla: Modelo de seguridad se selecciona

    Escenario: Selección de modelo de seguridad
      Dado que se diseña seguridad del sistema
      Cuando se selecciona modelo
      Entonces se consideran:
        | Modelo                     | Aplicabilidad  |
        | Bell-LaPadula              | Confidencialidad|
        | Biba                       | Integridad      |
        | Clark-Wilson               | Integridad comercial|
        | Brewer-Nash                | Muros de fuego  |
        | Graham-Denning            | Controles de acceso|

    Escenario: Principios de diseño seguro
      Dado que se aplican principios de diseño
      Cuando se implementan
      Entonces se verifica:
        | Principio                  |
        | Defensa en profundidad     |
        | Mínimo privilegio          |
        | Separación de deberes      |
        | Fail secure                |
        | Separación de funciones    |
        | Moderación económica       |
        | Diseño abierto             |
        | Factoración psicológica    |
        | Reutilización cero         |

  Regla: Arquitectura de seguridad se documenta

    Escenario: Documentación de arquitectura
      Dado que se documenta arquitectura de seguridad
      Cuando se crea diagrama
      Entonces incluye:
        | Componente                  |
        | Capas de seguridad          |
        | Puntos de control           |
        | Flujo de datos              |
        | Zonas de confianza          |
        | Controles en cada capa      |
        | Interfaces y的信任边界      |

  Regla: Controles de seguridad se implementan

    Escenario: Controles por capa
      Dado que se implementan controles de seguridad
      Cuando se verifica
      Entonces se verifica:
        | Capa       | Controles                        |
        | Física     | Acceso, monitoreo, cerraduras   |
        | Red        | Firewalls, segmentación, IDS   |
        | Sistema    | Hardening, parches, antimalware |
        | Aplicación | Validación, autenticación, auditoría|
        | Datos      | Cifrado, DLP, backup            |
        | Usuario    | Capacitación, políticas         |

  Regla: Diseño se revisa

    Escenario: Revisión de diseño de seguridad
      Dado que diseño está completo
      Cuando se revisa
      Entonces se verifica:
        | Elemento                    |
        | Requisitos cubiertos        |
        | Riesgos mitigados           |
        | Cumplimiento normativo      |
        | Complejidad aceptable       |
        | Aprobación del arquitecto   |
