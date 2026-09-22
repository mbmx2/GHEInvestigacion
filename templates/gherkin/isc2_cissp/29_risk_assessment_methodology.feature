# language: es
# @id GHE-CISSP-029
# @type business-rule
# @domain security
# @layer risk-assessment
# @risk s1
# @owner risk-analyst
# @status proposed
# @requirement REQ-CISSP-029
# @risk-control CTRL-CISSP-029
# @regulation CISSP-D1 ISC2
@domain:isc2_cissp @type:business-rule @risk:s1 @status:proposed
Característica: CISSP — Metodología de Evaluación de Riesgos
  Como analista de riesgos
  Quiero metodología de evaluación de riesgos conforme CISSP
  Para que los riesgos se midan con criterios consistentes y repetibles

  Regla: Evaluación cuantitativa se aplica

    Escenario: Pérdida Esperada Anual (ALE)
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
        | Costo del control (ALEc)    |
        | Valor del control (ALEs)    |
        | Beneficio neto (ALEs - ALEc)|
        | ROI del control             |
        | Valor residual del riesgo   |

    Escenario: Factor de exposición
      Dado que se calcula factor de exposición
      Cuando se evalúa
      Entonces se usa: FE = Tiempo expuesto / Tiempo total
      Y se multiplica por valor del activo

  Regla: Evaluación cualitativa se aplica

    Escenario: Matriz de probabilidad-impacto
      Dado que no hay datos cuantitativos
      Cuando se evalúa cualitativamente
      Entonces se usa matriz:
        | Impacto\Probabilidad | Baja  | Media | Alta  |
        | Catastrófico         | Alto  | Crítico| Crítico|
        | Mayor               | Medio | Alto   | Crítico|
        | Menor               | Bajo  | Medio  | Alto   |
        | Insignificante      | Bajo  | Bajo   | Medio  |

    Escenario: Análisis de amenazas
      Dado que se analizan amenazas
      Cuando se identifican
      Entonces se clasifican:
        | Tipo de amenaza       | Ejemplo                     |
        | Natural              | Terremoto, inundación       |
        | Humana no intencional| Error humano, accidente     |
        | Humana intencional   | Robo, sabotaje, fraude      |
        | Ambiental            | Fuego, fallo eléctrico      |
        | Técnica              | Fallo de software, hardware |

  Regla: Riesgos se priorizan

    Escenario: Ranking de riesgos
      Dado que múltiples riesgos están evaluados
      Cuando se priorizan
      Entonces se usa criterio compuesto:
        | Criterio                    | Peso   |
        | Impacto potencial           | 40%    |
        | Probabilidad de ocurrencia  | 30%    |
        | Velocidad de propagación    | 15%    |
        | Detección难易               | 15%    |

  Regla: Registro de riesgos se mantiene

    Escenario: Registro de riesgos formal
      Dado que se gestiona registro de riesgos
      Cuando se actualiza
      Entonces se verifica:
        | Campo                    |
        | ID único                 |
        | Descripción del riesgo   |
        | Propietario              |
        | Evaluación actual        |
        | Estado de tratamiento    |
        | Fecha de revisión        |
