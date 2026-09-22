# language: es
# @id GHE-ISACA-CRISC-012
# @type business-rule
# @domain risk
# @layer assessment
# @risk s1
# @owner risk-director
# @status proposed
# @requirement REQ-CRISC-012
# @risk-control CTRL-CRISC-012
# @regulation CRISC ISACA
@domain:isaca @type:business-rule @risk:s1 @status:proposed
Característica: CRISC — Evaluación de Riesgos de TI
  Como evaluador de riesgos
  Quiero evaluar riesgos de TI sistemáticamente conforme CRISC
  Para que los riesgos se midan con criterios consistentes y objetivos

  Regla: Evaluación cuantitativa se aplica

    Escenario: Pérdida esperada anual (ALE)
      Dado que se evalúa riesgo cuantitativamente
      Cuando se calcula ALE
      Entonces se usa: ALE = ARO × SLE
      Y se clasifica:
        | ALE             | Clasificación |
        | >$100,000       | Crítico       |
        | $50,000-$100,000| Alto          |
        | $10,000-$50,000 | Medio         |
        | <$10,000        | Bajo          |

    Escenario: Análisis de costo-beneficio de control
      Dado que se evalúa implementar un control
      Cuando se compara costo vs beneficio
      Entonces se verifica:
        | Elemento                    |
        | Costo del control           |
        | Reducción de ALE esperada   |
        | ROI del control             |
        | Valor residual del riesgo   |

  Regla: Evaluación cualitativa se aplica

    Escenario: Matriz de probabilidad-impacto
      Dado que no hay datos cuantitativos suficientes
      Cuando se evalúa cualitativamente
      Entonces se usa matriz:
        | Impacto\Probabilidad | Baja  | Media | Alta  |
        | Catastrófico         | Alto  | Crítico| Crítico|
        | Mayor               | Medio | Alto   | Crítico|
        | Menor               | Bajo  | Medio  | Alto   |
        | Insignificante      | Bajo  | Bajo   | Medio  |

  Regla: Riesgos de terceros se evalúan

    Escenario: Evaluación de proveedores
      Dado que hospital depende de proveedores TI
      Cuando se evalúa riesgo de tercero
      Entonces se verifica:
        | Elemento                    |
        | Dependencia del proveedor   |
        | Concentración de riesgo     |
        | Alternativas disponibles    |
        | SLA y garantías             |
        | Seguro del proveedor        |

  Regla: Riesgos acumulativos se evalúan

    Escenario: Análisis de riesgo acumulativo
      Dado que múltiples riesgos pueden materializarse
      Cuando se evalúa riesgo acumulativo
      Entonces se verifica:
        | Elemento                    |
        | Correlación entre riesgos   |
        | Escenarios combinados       |
        | Impacto total potencial     |
        | Capacidad de absorción      |
