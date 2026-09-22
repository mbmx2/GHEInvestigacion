# language: es
# @id GHE-ISACA-CGEIT-003
# @type business-rule
# @domain governance
# @layer risk
# @risk s2
# @owner governance-director
# @status proposed
# @requirement REQ-CGEIT-003
# @risk-control CTRL-CGEIT-003
# @regulation CGEIT ISACA
@domain:isaca @type:business-rule @risk:s2 @status:proposed
Característica: CGEIT — Optimización de Riesgos de TI
  Como director de gobernanza
  Quiero optimizar riesgos de TI conforme CGEIT
  Para que los riesgos de TI se gestionen dentro del apetito de riesgo organizacional

  Regla: Apetito de riesgo se define

    Escenario: Definición de apetito
      Dado que comité de gobierno define apetito de riesgo
      Cuando se establece
      Entonces se define para cada dimensión:
        | Dimensión                  | Apetito                  |
        | Cumplimiento normativo     | 100%                     |
        | Disponibilidad de sistemas | >99.5%                   |
        | Integridad de datos        | Cero tolerancia          |
        | Confidencialidad           | Según clasificación      |
        | Continuidad del negocio    | RTO <4 horas             |

  Regla: Riesgos se evalúan contra apetito

    Escenario: Comparación con apetito
      Dado que riesgo está evaluado
      Cuando se compara con apetito
      Entonces se clasifica:
        | Situación     | Acción                          |
        | Dentro        | Monitoreo                       |
        | Fuera         | Mitigación obligatoria          |
        | En el límite  | Evaluar y documentar            |

  Regla: Riesgos se optimizan

    Escenario: Optimización de portafolio de riesgos
      Dado que se gestionan múltiples riesgos
      Cuando se optimiza portafolio
      Entonces se verifica:
        | Elemento                    |
        | Concentración de riesgos    |
        | Diversificación             |
        | Costo total de riesgo       |
        | Cobertura de mitigación     |
        | Nuevas oportunidades de riesgo|

  Regla: Cambios en apetito se documentan

    Escenario: Cambio de apetito de riesgo
      Dado que apetito de riesgo cambia
      Cuando se actualiza
      Entonces se documenta:
        | Elemento                    |
        | Justificación del cambio    |
        | Aprobación del comité       |
        | Impacto en riesgos existentes|
        | Comunicación a stakeholders  |
