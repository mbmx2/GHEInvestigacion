# language: es
# @id GHE-ISACA-COBIT-007
# @type business-rule
# @domain governance
# @layer investment
# @risk s2
# @owner governance-director
# @status proposed
# @requirement REQ-COBIT-007
# @risk-control CTRL-COBIT-007
# @regulation COBIT-2019
@domain:isaca @type:business-rule @risk:s2 @status:proposed
Característica: COBIT 2019 — Gestión de Inversiones de TI (GOV06)
  Como director financiero
  Quiero gestionar inversiones de TI conforme COBIT
  Para que cada inversión en tecnología genere valor y se justifique

  Regla: Proyectos TI se evalúan financieramente

    Escenario: Análisis costo-beneficio
      Dado que se evalúa proyecto de TI
      Cuando se calcula ROI
      Entonces se incluyen:
        | Elemento                    |
        | Costos de implementación    |
        | Costos operativos anuales   |
        | Beneficios esperados        |
        | Ahorro cuantificable        |
        | Período de recuperación     |
        | Valor actual neto (VAN)     |
        | Tasa interna de retorno     |

    Escenario: Evaluación de alternativas
      Dado que hay múltiples opciones de inversión
      Cuando se comparan
      Entonces se usa criterio compuesto:
        | Criterio                    | Peso   |
        | ROI                         | 30%    |
        | Alineación estratégica      | 25%    |
        | Riesgo                      | 20%    |
        | Tiempo de implementación    | 15%    |
        | Cumplimiento normativo      | 10%    |

  Regla: Portafolio de inversiones se gestiona

    Escenario: Priorización de portafolio
      Dado que se gestionan múltiples inversiones
      Cuando se priorizan
      Entonces se verifica:
        | Elemento                    |
        | Balance entre iniciativas   |
        | Capacidad de ejecución      |
        | Dependencias entre proyectos|
        | Ventanas de oportunidad     |
        | Restricciones presupuestales|

  Regla: Inversión se monitorea

    Escenario: Seguimiento de inversión
      Dado que proyecto está en ejecución
      Cuando se monitorea inversión
      Entonces se verifica:
        | Elemento                    |
        | Presupuesto vs real         |
        | Hitos alcanzados            |
        | Beneficios parciales        |
        | Desviaciones y causas       |
        | Decisión de continuar/detener|

  Regla: Post-mortem financiero se realiza

    Escenario: Evaluación post-implementación
      Dado que inversión está completa
      Cuando se evalúa resultado financiero
      Entonces se compara:
        | Elemento                    |
        | Inversión real vs estimada  |
        | Beneficios reales vs esperados|
        | ROI real vs proyectado      |
        | Lecciones para futuras inversiones|
