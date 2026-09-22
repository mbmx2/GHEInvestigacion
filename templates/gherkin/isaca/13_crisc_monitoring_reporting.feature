# language: es
# @id GHE-ISACA-CRISC-013
# @type business-rule
# @domain risk
# @layer monitoring
# @risk s1
# @owner risk-director
# @status proposed
# @requirement REQ-CRISC-013
# @risk-control CTRL-CRISC-013
# @regulation CRISC ISACA
@domain:isaca @type:business-rule @risk:s1 @status:proposed
Característica: CRISC — Monitoreo y Reporte de Riesgos y Controles
  Como gerente de riesgos
  Quiero monitoreo y reporte continuo de riesgos conforme CRISC
  Para que la dirección tenga visibilidad real-time del perfil de riesgo

  Regla: Indicadores clave de riesgo (KRI) se definen

    Escenario: Definición de KRIs
      Dado que se definen indicadores de riesgo
      Cuando se establecen umbrales
      Entonces se define:
        | KRI                         | Umbral verde| Umbral rojo |
        | Incidentes de seguridad    | 0-2/mes     | >5/mes      |
        | Vulnerabilidades abiertas  | <5 críticas | >15 críticas|
        | Cambios sin aprobar        | 0           | >0          |
        | Fallos de backup           | 0           | >1          |
        | Tiempo de inactividad      | <30 min     | >2 horas    |
        | Accesos denegados          | <10/día     | >50/día     |

  Regla: Dashboard de riesgos opera en tiempo real

    Escenario: Tablero ejecutivo de riesgos
      Dado que dirección consulta dashboard de riesgos
      Cuando se visualiza
      Entonces muestra:
        | Sección                    |
        | Resumen del perfil de riesgo|
        | Mapa de calor de riesgos   |
        | Estado de KRIs             |
        | Controles críticos         |
        | Planes de tratamiento      |
        | Tendencias                 |

    Escenario: Alertas automáticas
      Dado que KRI excede umbral rojo
      Cuando se detecta
      Entonces se genera alerta:
        | Acción                    |
        | Notificación al propietario|
        | Escalamiento si persiste  |
        | Registro en log de eventos|
        | Acción correctiva inmediata|

  Regla: Reportes se generan automáticamente

    Escenario: Reporte mensual de riesgos
      Dado que es fin de mes
      Cuando se genera reporte
      Entonces incluye:
        | Sección                    |
        | Riesgos nuevos            |
        | Riesgos cerrados          |
        | Estado de KRIs            |
        | Controles evaluados       |
        | Acciones pendientes       |
        | Recomendaciones           |

    Escenario: Reporte trimestral a gobierno
      Dado que comité necesita visibilidad
      Cuando se genera reporte ejecutivo
      Entonces incluye:
        | Sección                    |
        | Resumen ejecutivo          |
        | Top 10 riesgos            |
        | Tendencias de 12 meses    |
        | Benchmarking               |
        | Inversión en mitigación   |
        | Recomendaciones estratégicas|

  Regla: Monitoreo es continuo

    Escenario: Monitoreo 24/7
      Dado que riesgos pueden materializarse en cualquier momento
      Cuando se monitorean KRIs
      Entonces se verifica:
        | Elemento                    |
        | Frecuencia de monitoreo    |
        | Alertas configuradas       |
        | Escalamiento definido      |
        | Respuesta documentada      |
