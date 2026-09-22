# language: es
# @id GHE-ISACA-CISA-001
# @type business-rule
# @domain audit
# @layer compliance
# @risk s2
# @owner audit-director
# @status proposed
# @requirement REQ-CISA-001
# @risk-control CTRL-CISA-001
# @regulation CISA ISACA
@domain:isaca @type:business-rule @risk:s2 @status:proposed
Característica: CISA — Proceso de Auditoría de Sistemas de Información
  Como auditor de TI
  Quiero seguir metodología CISA para auditorías de sistemas
  Para que las auditorías sean consistentes, objetivas y conformes a ISACA

  Regla: Planificación de auditoría sigue ciclo CISA

    Escenario: Inicio de auditoría de sistema médico
      Dado que se planifica auditoría de sistema GHE
      Cuando se inicia fase de planificación
      Entonces se define:
        | Elemento                    |
        | Alcance del sistema         |
        | Objetivos de auditoría      |
        | Criterios de evaluación     |
        | Recursos necesarios         |
        | Cronograma                  |
        | Riesgos de la auditoría     |

    Escenario: Evaluación preliminar
      Dado que se realiza evaluación preliminar
      Cuando se revisa documentación existente
      Entonces se evalúa:
        | Fuente                       | Qué buscar            |
        | Arquitectura del sistema     | Diseño y controles    |
        | Políticas de TI              | Cumplimiento          |
        | Registros de incidentes      | Historial de fallos   |
        | Certificaciones              | ISO, NOM, IEC         |
        | Contratos de proveedores     | SLAs y acuerdos       |

  Regla: Ejecución de auditoría usa técnicas CISA

    Escenario: Pruebas de controles generales de TI (ITGC)
      Dado que se ejecutan pruebas ITGC
      Cuando se evalúan controles
      Entonces se verifican:
        | Área de control              | Qué evaluar           |
        | Control de acceso lógico     | Roles, permisos, segregación|
        | Gestión de cambios           | Proceso de aprobación |
        | Continuidad del negocio      | Planes y pruebas      |
        | Operaciones de TI            | Monitoreo y respaldo  |

    Escenario: Pruebas de controles de aplicación
      Dado que se prueban controles de aplicación GHE
      Cuando se ejecutan pruebas
      Entonces se verifican:
        | Área de control              | Qué evaluar           |
        | Controles de entrada         | Validación de datos   |
        | Controles de proceso         | Integridad de cálculos|
        | Controles de salida          | Precisión de reportes |
        | Controles de interfaz        | Integridad entre sistemas|

  Regla: Hallazgos se documentan con evidencia

    Escenario: Documentación de hallazgo
      Dado que se identifica un hallazgo de auditoría
      Cuando se documenta
      Entonces incluye:
        | Campo                | Descripción                    |
        | Condición            | Qué se encontró                |
        | Criterio             | Qué debería ser                |
        | Causa                | Por qué existe la brecha       |
        | Evidencia            | Documentación de soporte       |
        | Riesgo asociado     | Impacto potencial              |
        | Recomendación        | Acción sugerida                |

    Escenario: Clasificación de hallazgos
      Dado que hallazgo está documentado
      Cuando se clasifica severidad
      Entonces se asigna:
        | Severidad | Criterio                          |
        | Crítico   | Riesgo inminente para pacientes   |
        | Mayor     | Brecha significativa de control   |
        | Menor     | Desviación sin impacto significativo|
        | Observación| Mejora recomendada               |

  Regla: Informe de auditoría se entrega a dirección

    Escenario: Informe ejecutivo
      Dado que auditoría está completa
      Cuando se genera informe
      Entonces incluye:
        | Sección                  |
        | Resumen ejecutivo        |
        | Alcance y metodología    |
        | Hallazgos clasificados   |
        | Recomendaciones priorizadas|
        | Plan de acción sugerido  |
        | Opinión de auditoría     |

  Regla: Seguimiento de recomendaciones es obligatorio

    Escenario: Plan de acción post-auditoría
      Dado que auditoría genera recomendaciones
      Cuando se crea plan de acción
      Entonces cada recomendación tiene:
        | Campo           |
        | Responsable     |
        | Fecha límite    |
        | Prioridad       |
        | Evidencia de cierre|
      Y se monitorea hasta cierre efectivo
