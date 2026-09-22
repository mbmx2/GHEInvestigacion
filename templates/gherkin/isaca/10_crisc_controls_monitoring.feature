# language: es
# @id GHE-ISACA-CRISC-002
# @type business-rule
# @domain risk
# @layer controls
# @risk s1
# @owner risk-director
# @status proposed
# @requirement REQ-CRISC-002
# @risk-control CTRL-CRISC-002
# @regulation CRISC ISACA
@domain:isaca @type:business-rule @risk:s1 @status:proposed
Característica: CRISC — Controles de TI y Monitoreo
  Como gestor de controles de TI
  Quiero monitoreo de controles conforme CRISC
  Para que los controles de TI sean efectivos y estén operativos continuamente

  Regla: Controles de TI se inventarian

    Escenario: Registro de controles
      Dado que se inventarian controles de TI
      Cuando se registra cada control
      Entonces se documenta:
        | Campo                    |
        | ID del control           |
        | Nombre descriptivo       |
        | Tipo (preventivo/detectivo/correctivo)|
        | Propietario del control  |
        | Frecuencia de operación  |
        | Evidencia de operación   |
        | Riesgo(s) mitigado(s)    |

    Escenario: Controles críticos del hospital
      Dado que se identifican controles críticos
      Cuando se clasifican
      Entonces se incluyen:
        | Control                       | Riesgo mitigado      |
        | Control de acceso por rol     | Acceso no autorizado |
        | Respaldo diario automático    | Pérdida de datos     |
        | Encriptación de datos         | Brecha de información|
        | Monitoreo de intrusiones      | Ataque no detectado  |
        | Gestión de cambios            | Cambios no controlados|
        | Plan de continuidad           | Interrupción prolongada|

  Regla: Evidencia de operación se recopila

    Escenario: Recopilación de evidencia
      Dado que control requiere evidencia
      Cuando se recopila
      Entonces se verifica:
        | Tipo de evidencia            |
        | Logs de sistema              |
        | Registros de aprobación      |
        | Capturas de pantalla         |
        | Informes generados           |
        | Registros de auditoría       |

    Escenario: Evidencia de control automatizado
      Dado que control opera automáticamente
      Cuando se recopila evidencia
      Entonces se verifica:
        | Elemento                    |
        | Timestamp de ejecución      |
        | Resultado esperado vs real  |
        | Excepciones manejadas       |
        | Disponibilidad del control  |

  Regla: Efectividad de controles se evalúa

    Escenario: Prueba de efectividad
      Dado que control tiene evidencia recopilada
      Cuando se evalúa efectividad
      Entonces se clasifica:
        | Efectividad | Criterio                        |
        | Efectivo    | Opera como se diseñó, sin excepciones |
        | Parcialmente efectivo | Opera pero con excepciones significativas |
        | No efectivo | No opera o no mitiga el riesgo  |

    Escenario: Controles inefectivos requieren acción
      Dado que control es clasificado como no efectivo
      Cuando se evalúa
      Entonces se activa:
        | Acción                        |
        | Investigación de causa raíz  |
        | Plan de remediación          |
        | Escalamiento a propietario   |
        | Timeline de corrección       |

  Regla: Monitoreo de controles es continuo

    Escenario: Dashboard de controles
      Dado que se consulta dashboard de controles
      Entonces muestra:
        | Métrica                     | Meta          |
        | Controles efectivos         | >95%          |
        | Controles probados este año | 100%          |
        | Evidencia completa          | 100%          |
        | Controles no efectivos      | <2            |
        | Tiempo promedio de remediación| <30 días     |

  Regla: Reporte de controles a gobierno

    Escenario: Reporte trimestral
      Dado que comité necesita visibilidad de controles
      Cuando se genera reporte CRISC
      Entonces incluye:
        | Sección                    |
        | Resumen de efectividad     |
        | Controles nuevos y removidos|
        | Excepciones significativas |
        | Planes de remediación      |
        | Recomendaciones de inversión|
