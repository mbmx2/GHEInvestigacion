# language: es
# @id GHE-CISSP-038
# @type business-rule
# @domain security
# @layer config-management
# @risk s2
# @owner config-manager
# @status proposed
# @requirement REQ-CISSP-038
# @risk-control CTRL-CISSP-038
# @regulation CISSP-D7 ISC2
@domain:isc2_cissp @type:business-rule @risk:s2 @status:proposed
Característica: CISSP — Gestión de Configuración y Cambios
  Como gestor de configuración
  Quiero gestión de configuración y cambios conforme CISSP
  Para que los sistemas se mantengan en estado seguro documentado

  Regla: Configuración se baselinea

    Escenario: Baseline de configuración
      Dado que sistema está configurado correctamente
      Cuando se documenta baseline
      Entonces se verifica:
        | Elemento                    |
        | Configuración documentada   |
        | Versión del baseline        |
        | Fecha de establecimiento    |
        | Aprobación                  |
        | Herramienta de gestión      |

    Escenario: Desviación de baseline
      Dado que sistema se desvía del baseline
      Cuando se detecta
      Entonces se verifica:
        | Elemento                    |
        | Alerta automática           |
        | Evaluación del cambio       |
        | Aprobación o rollback       |
        | Actualización del baseline  |

  Regla: Cambios se controlan

    Escenario: Proceso de cambio
      Dado que se solicita cambio en sistema
      Cuando se evalúa
      Entonces se verifica:
        | Elemento                    |
        | Solicitud documentada       |
        | Análisis de impacto         |
        | Aprobación del cambio       |
        | Plan de implementación      |
        | Plan de rollback            |
        | Ventana de cambio           |

    Escenario: Cambio de emergencia
      Dado que cambio es de emergencia
      Cuando se ejecuta
      Entonces se verifica:
        | Elemento                    |
        | Aprobación verbal (post escrito)|
        | Registro del cambio         |
        | Revisión post-implementación|
        | Actualización de documentación|

  Regla: Gestión de parches se integra

    Escenario: Proceso de parches
      Dado que se identifica parche de seguridad
      Cuando se gestiona
      Entonces se verifica:
        | Elemento                    |
        | Evaluación de relevancia    |
        | Prueba en staging           |
        | Aprobación de cambio        |
        | Implementación en ventana   |
        | Verificación post-parche    |
        | Documentación               |

  Regla: Configuración se audita

    Escenario: Auditoría de configuración
      Dado que se audita configuración
      Cuando se ejecuta
      Entonces se verifica:
        | Elemento                    |
        | Cumplimiento con baseline   |
        | Configuraciones inseguras   |
        | Cuentas por defecto         |
        | Servicios innecesarios      |
        | Acciones correctivas        |
