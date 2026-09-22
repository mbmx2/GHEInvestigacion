# language: es
# @id GHE-ISACA-CGEIT-002
# @type business-rule
# @domain governance
# @layer value
# @risk s2
# @owner governance-director
# @status proposed
# @requirement REQ-CGEIT-002
# @risk-control CTRL-CGEIT-002
# @regulation CGEIT ISACA
@domain:isaca @type:business-rule @risk:s2 @status:proposed
Característica: CGEIT — Realización de Beneficios de TI
  Como director de TI
  Quiero que la inversión en TI genere beneficios medibles
  Para que cada proyecto TI demuestre valor concreto al hospital

  Regla: Beneficios se definen antes de aprobar proyecto

    Escenario: Business case con beneficios
      Dado que se presenta business case de proyecto TI
      Cuando se definen beneficios
      Entonces se especifican:
        | Tipo de beneficio          | Ejemplo                       |
        | Financiero                 | Reducción de costos operativos|
        | Operacional                | Mayor eficiencia en procesos  |
        | Cumplimiento               | Cumplimiento de NOM-024       |
        | Estratégico                | Mejora en calidad de atención |
        | Riesgo                     | Reducción de incidentes       |

    Escenario: Métricas de beneficios
      Dado que beneficios están definidos
      Cuando se establecen métricas
      Entonces se define:
        | Beneficio                  | Métrica               | Meta    |
        | Reducción tiempo espera   | Minutos promedio      | -30%    |
        | Menos errores médicos     | Errores/mes           | -50%    |
        | Mayor adherencia          | % pacientes controlados| +20%   |
        | Ahorro de inventario      | Costo mensual         | -15%    |

  Regla: Tracking de benefits es continuo

    Escenario: Seguimiento post-implementación
      Dado que proyecto está en producción
      Cuando se monitorean beneficios
      Entonces se verifica:
        | Elemento                    |
        | Beneficio esperado vs real  |
        | Fecha objetivo de realiza   |
        | Desviaciones identificadas  |
        | Acciones correctivas        |

  Regenario: Realización parcial
      Dado que beneficio no se alcanza完全mente
      Cuando se evalúa
      Entonces se investiga:
        | Elemento                    |
        | Causa de desviación         |
        | Factores externos           |
        | Ajuste de expectativas      |
        | Lecciones para futuros proyectos|

  Regla: Beneficios no intencionales se capturan

    Escenario: Beneficios colaterales
      Dado que proyecto genera beneficios no esperados
      Cuando se identifican
      Entonces se documentan para:
        | Propósito                   |
        | Justificar inversión futura |
        | Compartir con otros proyectos|
        | Mejorar estimaciones        |
