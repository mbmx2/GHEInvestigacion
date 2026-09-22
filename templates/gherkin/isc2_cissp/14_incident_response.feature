# language: es
# @id GHE-CISSP-014
# @type business-rule
# @domain security
# @layer incident-response
# @risk s1
# @owner ir-lead
# @status proposed
# @requirement REQ-CISSP-014
# @risk-control CTRL-CISSP-014
# @regulation CISSP-D7 ISC2
@domain:isc2_cissp @type:business-rule @risk:s1 @status:proposed
Característica: CISSP — Respuesta a Incidentes de Seguridad
  Como líder de respuesta a incidentes
  Quiero respuesta a incidentes conforme CISSP Domain 7
  Para que los incidentes se gestionen de manera efectiva y consistente

  Regla: Equipo de respuesta se forma

    Escenario: CSIRT activado
      Dado que se detecta incidente de seguridad
      Cuando se activa CSIRT
      Entonces se verifica:
        | Rol                   | Responsabilidad         |
        | Líder de respuesta    | Coordinación general    |
        | Analista forense      | Investigación técnica   |
        | Legal                 | Asesoría legal          |
        | Comunicaciones        | Notificación externa    |
        | Negocio               | Impacto operativo       |

  Regla: Clasificación de incidentes

    Escenario: Niveles de severidad
      Dado que incidente es clasificado
      Cuando se asigna nivel
      Entonces se define:
        | Nivel | Criterio                          | Tiempo de respuesta |
        | P1    | Datos de pacientes comprometidos  | <1 hora             |
        | P2    | Sistema clínico no disponible     | <2 horas            |
        | P3    | Vulnerabilidad explotada sin daño | <4 horas            |
        | P4    | Evento de seguridad menor         | <24 horas           |

  Regla: Contención es inmediata

    Escenario: Contención de incidente
      Dado que incidente requiere contención
      Cuando se ejecuta
      Entonces se verifica:
        | Elemento                    |
        | Sistemas afectados aislados |
        | Evidencia preservada        |
        | Propagación contenida       |
        | Servicios críticos mantenidos|
        | Comunicación interna        |

  Regla: Investigación forense preserva evidencia

    Escenario: Cadena de custodia
      Dado que se realiza investigación forense
      Cuando se recopila evidencia
      Entonces se verifica:
        | Elemento                    |
        | Imagen forense con hash     |
        | Cadena de custodia          |
        | Herramientas validadas      |
        | Documentación completa      |
        | Análisis en entorno aislado |

  Regla: Lecciones aprendidas se documentan

    Escenario: Post-mortem
      Dado que incidente está resuelto
      Cuando se realiza post-mortem
      Entonces se documenta:
        | Sección                    |
        | Timeline completo          |
        | Causa raíz                 |
        | Efectividad de respuesta   |
        | Mejoras identificadas      |
        | Acciones correctivas       |
        | Actualización de playbook  |
