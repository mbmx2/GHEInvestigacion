# language: es
# @id GHE-ISACA-CISM-003
# @type business-rule
# @domain security
# @layer incident
# @risk s1
# @owner security-director
# @status proposed
# @requirement REQ-CISM-003
# @risk-control CTRL-CISM-003
# @regulation CISM ISACA
@domain:isaca @type:business-rule @risk:s1 @status:proposed
Característica: CISM — Gestión de Incidentes de Seguridad
  Como director de seguridad
  Quiero gestión de incidentes conforme CISM
  Para que los incidentes de seguridad se detecten, respondan y aprendan sistemáticamente

  Regla: Detección de incidentes es proactiva

    Escenario: Monitoreo de indicadores de compromiso
      Dado que sistema monitorea IoCs
      Cuando se detecta indicator
      Entonces se clasifica:
        | Tipo de IoC                  | Acción          |
        | IP maliciosa conocida        | Bloqueo inmediato|
        | Hash de malware              | Aislamiento      |
        | Dominio de phishing          | Bloqueo DNS      |
        | Comportamiento anómalo       | Investigación    |
        | Fuga de datos detectada      | Contención       |

  Regla: Respuesta a incidentes sigue marco CISM

    Escenario: Clasificación de incidente
      Dado que incidente es reportado
      Cuando se clasifica
      Entonces se asigna nivel:
        | Nivel    | Criterio                          |
        | P1       | Datos de pacientes comprometidos  |
        | P2       | Sistema clínico no disponible     |
        | P3       | Vulnerabilidad explotada sin daño |
        | P4       | Evento de seguridad menor         |

    Escenario: Contención de incidente P1
      Dado que incidente es clasificado P1
      Cuando se activa respuesta
      Entonces se ejecuta:
        | Paso | Acción                              |
        | 1    | Aislar sistemas afectados            |
        | 2    | Preservar evidencia                 |
        | 3    | Notificar a comité de seguridad     |
        | 4    | Activar plan de comunicación        |
        | 5    | Evaluar impacto en pacientes         |
        | 6    | Coordinar con autoridades si aplica  |

  Regla: Investigación forense preserva evidencia

    Escenario: Cadena de custodia
      Dado que se realiza investigación forense
      Cuando se recopila evidencia
      Entonces se documenta:
        | Elemento                    |
        | Quién recopiló             |
        | Cuándo se recopiló         |
        | Dónde se almacenó          |
        | Hash de integridad         |
        | Cadena de custodia completa|

  Regla: Recuperación post-incidente es verificada

    Escenario: Restauración de servicios
      Dado que incidente está contenido
      Cuando se restauran servicios
      Entonces se verifica:
        | Elemento                    |
        | Sistemas limpios de malware |
        | Accesos revocados si aplica |
        | Contraseñas rotadas         |
        | Integridad de datos verificada|
        | Monitoreo reforzado activado|

  Regla: Lecciones aprendidas se documentan

    Escenario: Post-mortem de incidente
      Dado que incidente está resuelto
      Cuando se realiza post-mortem
      Entonces se documenta:
        | Sección                    |
        | Timeline completo         |
        | Causa raíz                |
        | Efectividad de respuesta  |
        | Mejoras identificadas     |
        | Acciones correctivas      |
        | Actualización de playbook |

  Regla: Métricas de respuesta se miden

    Escenario: KPIs de gestión de incidentes
      Dado que se miden métricas de respuesta
      Cuando se consulta dashboard
      Entonces muestra:
        | Métrica                     | Meta          |
        | Tiempo de detección (MTTD)  | <30 minutos   |
        | Tiempo de respuesta (MTTR)  | <2 horas      |
        | Tiempo de contención        | <4 horas      |
        | Incidentes este mes         | Monitoreo     |
        | Post-mortems completados    | 100%          |
        | Mejoras implementadas       | >80%          |
