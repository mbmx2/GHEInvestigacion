# language: es
# @id GHE-CISSP-016
# @type business-rule
# @domain security
# @layer cloud-security
# @risk s2
# @owner cloud-architect
# @status proposed
# @requirement REQ-CISSP-016
# @risk-control CTRL-CISSP-016
# @regulation CISSP-D3 ISC2
@domain:isc2_cissp @type:business-rule @risk:s2 @status:proposed
Característica: CISSP — Seguridad en Cloud Computing
  Como arquitecto cloud
  Quiero seguridad en cloud conforme CISSP
  Para que el uso de cloud en hospital sea seguro y conforme

  Regla: Modelo de responsabilidad se entiende

    Escenario: Shared responsibility model
      Dado que hospital usa servicios cloud
      Cuando se evalúa responsabilidad
      Entonces se verifica:
        | Capa       | Responsabilidad del hospital    |
        | Datos      | Hospital (100%)                 |
        | Aplicación | Hospital (IaaS) / Provider (SaaS)|
        | Sistema operativo| Hospital (IaaS) / Provider (PaaS)|
        | Infraestructura| Provider                       |
        | Red        | Provider                       |

  Regla: Seguridad de datos en cloud

    Escenario: Cifrado de datos en cloud
      Dado que datos se almacenan en cloud
      Cuando se protegen
      Entonces se verifica:
        | Elemento                    |
        | Cifrado en reposo activado  |
        | Cifrado en tránsito (TLS)   |
        | Gestión de claves propia    |
        | Key rotation program        |
        | Acceso a logs de auditoría  |

    Escenario: Residencia de datos
      Dado que datos de pacientes están en cloud
      Cuando se verifica residencia
      Entonces se verifica:
        | Elemento                    |
        | Región de almacenamiento    |
        | Cumplimiento de residencia  |
        | Restricciones de transferencia|
        | Backup en región apropiada  |

  Regla: Controles de acceso en cloud

    Escenario: IAM en cloud
      Dado que se gestiona acceso en cloud
      Cuando se configura
      Entonces se verifica:
        | Elemento                    |
        | MFA obligatorio             |
        | Principio de menor privilegio|
        | Service accounts restringidas|
        | Logging de accesos          |
        | Rotation de credenciales    |

  Regla: Seguridad de contenedores

    Escenario: Seguridad de imágenes Docker
      Dado que se usan contenedores en cloud
      Cuando se construyen imágenes
      Entonces se verifica:
        | Elemento                    |
        | Base image oficial          |
        | Escaneo de vulnerabilidades |
        | Sin root user               |
        | Secrets no hardcodeados     |
        | Health checks configurados  |
