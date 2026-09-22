# language: es
# @id GHE-ISACA-CRISC-004
# @type business-rule
# @domain risk
# @layer response
# @risk s1
# @owner risk-director
# @status proposed
# @requirement REQ-CRISC-004
# @risk-control CTRL-CRISC-004
# @regulation CRISC ISACA
@domain:isaca @type:business-rule @risk:s1 @status:proposed
Característica: CRISC — Respuesta a Riesgos y Mitigación
  Como gestor de riesgos
  Quiero responder y mitigar riesgos de TI conforme CRISC
  Para que los riesgos identificados se reduzcan a niveles aceptables

  Regla: Estrategias de respuesta se documentan

    Escenario: Selección de estrategia
      Dado que riesgo requiere respuesta
      Cuando se selecciona estrategia
      Entonces se evalúa:
        | Estrategia   | Criterio de selección         |
        | Mitigar      | Riesgo alto, control posible  |
        | Transferir   | Tercero puede gestionar mejor |
        | Aceptar      | Costo excesivo, impacto bajo  |
        | Evitar       | Actividad no esencial         |

  Regla: Planes de mitigación se implementan

    Escenario: Plan de mitigación detallado
      Dado que se selecciona estrategia de mitigación
      Cuando se crea plan
      Entonces incluye:
        | Campo                    |
        | Acciones específicas     |
        | Recursos necesarios      |
        | Presupuesto              |
        | Responsable              |
        | Fecha de cierre          |
        | Criterios de éxito       |
        | Indicadores de progreso  |

    Escenario: Mitigación de riesgo de datos
      Dado que riesgo es pérdida de datos
      Cuando se implementa mitigación
      Entonces se aplica:
        | Medida                      |
        | Respaldo automático diario  |
        | Prueba de restauración      |
        | Encriptación en reposo      |
        | Control de acceso por rol   |
        | Monitoreo de integridad     |

  Regla: Control residual se evalúa

    Escenario: Evaluación de riesgo residual
      Dado que mitigación está implementada
      Cuando se evalúa riesgo residual
      Entonces se verifica:
        | Elemento                    |
        | Riesgo residual aceptable   |
        | Costo de mitigación vs beneficio|
        | Nuevos riesgos introducidos |
        | Efectividad del control     |

  Regla: Seguimiento de planes es continuo

    Escenario: Monitoreo de progreso
      Dado que plan de mitigación está activo
      Cuando se monitorea progreso
      Entonces se verifica:
        | Elemento                    |
        | Hitos alcanzados            |
        | Presupuesto ejecutado       |
        | Fecha de cierre estimada    |
        | Obstáculos identificados    |
        | Acciones correctivas        |

  Regla: Lecciones aprendidas se capturan

    Escenario: Cierre de tratamiento
      Dado que tratamiento está completo
      Cuando se cierra
      Entonces se documenta:
        | Elemento                    |
        | Resultados obtenidos        |
        | Lecciones aprendidas        |
        | Efectividad real vs esperada|
        | Mejoras para futuro         |
