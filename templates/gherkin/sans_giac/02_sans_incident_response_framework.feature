# language: es
# @id GHE-SANS-002
# @type business-rule
# @domain security
# @layer incident-response
# @risk s1
# @owner ir-manager
# @status proposed
# @requirement REQ-SANS-002
# @risk-control CTRL-SANS-002
# @regulation SANS-IR NIST-800-61
@domain:sans_giac @type:business-rule @risk:s1 @status:proposed
Característica: SANS — Framework de Respuesta a Incidentes
  Como gerente de respuesta a incidentes
  Quiero framework SANS de respuesta a incidentes
  Para que los incidentes se gestionen con metodología probada

  Regla: Preparación es continua

    Escenario: Equipo de respuesta preparado
      Dado que hospital tiene equipo de respuesta
      Cuando se prepara
      Entonces se verifica:
        | Elemento                    |
        | Equipo definido y entrenado |
        | Herramientas disponibles    |
        | Procedimientos documentados |
        | Comunicación planificada    |
        | Legal contactado            |

    Escenario: Herramientas de respuesta listas
      Dado que se verifican herramientas
      Cuando se prepara respuesta
      Entonces se verifica:
        | Herramienta                 | Uso           |
        | Forensic toolkit            | Análisis      |
        | Network capture             | Red           |
        | Malware analysis            | Análisis      |
        | Incident tracking           | Gestión       |

  Regla: Detección y análisis

    Escenario: Identificación de indicadores de compromiso
      Dado que se detecta posible incidente
      Cuando se analiza
      Entonces se verifica:
        | Elemento                    |
        | IoCs identificados          |
        | Alcance determinado         |
        | Severidad clasificada       |
        | Evidencia preservada        |
        | Timeline reconstruida       |

    Escenario: Análisis de impacto
      Dado que incidente está identificado
      Cuando se evalúa impacto
      Entonces se verifica:
        | Elemento                    |
        | Sistemas afectados          |
        | Datos comprometidos         |
        | Impacto en pacientes        |
        | Impacto en operaciones      |
        | Requisitos de notificación  |

  Regla: Contención, erradicación, recuperación

    Escenario: Estrategia de contención
      Dado que se define estrategia de contención
      Cuando se implementa
      Entonces se verifica:
        | Elemento                    |
        | Contención a corto plazo    |
        | Contención a largo plazo    |
        | Evidencia preservada        |
        | Servicios críticos mantenidos|

    Escenario: Erradicación de amenaza
      Dado que contención está establecida
      Cuando se erradica amenaza
      Entonces se verifica:
        | Elemento                    |
        | Causa raíz identificada     |
        | Amenaza completamente removida|
        | Sistemas verificados limpios |
        | Parches aplicados           |

  Regla: Lecciones aprendidas se documentan

    Escenario: Post-incidente
      Dado que incidente está resuelto
      Cuando se realiza post-mortem
      Entonces se documenta:
        | Sección                    |
        | Timeline completo          |
        | Efectividad de respuesta   |
        | Mejoras identificadas      |
        | Actualización de playbook  |
        | Comunicación a stakeholders|
