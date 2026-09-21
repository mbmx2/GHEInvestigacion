# language: es
# @id GHE-CMMI-DAR-001
# @type compliance
# @domain process
# @layer support
# @risk s2
# @owner tech-lead
# @status proposed
# @requirement CMMI-DAR
# @risk-control CTRL-CMMI-DAR
# @regulation N/A
@domain:process @type:compliance @risk:s2 @status:proposed
Característica: CMMI - Análisis y Resolución de Decisiones (DAR)
  Como tech lead del proyecto GHE
  Quiero que las decisiones técnicas se analicen formalmente
  Para que cada decisión sea justificada, documentada y trazable

  Regla: Decisiones significativas se documentan como ADR

    Escenario: ADR completo
      Dado que se toma decisión técnica significativa
      Cuando se documenta
      Entonces incluye:
        | Sección                   |
        | Estado (propuesto/aceptado) |
        | Contexto                 |
        | Decisión                  |
        | Consecuencias (positivas/negativas) |
        | Alternativas descartadas  |
        | Fecha y autor            |
      # @evidence EVID-CMMI-DAR-001

  Regla: Las alternativas se evalúan formalmente

    Escenario: Evaluación de alternativas
      Dado que se evalúan alternativas
      Cuando se comparan
      Entonces se usan criterios:
        | Criterio                   |
        | Costo                     |
        | Riesgo                    |
        | Calidad                   |
        | Mantenibilidad            |
        | Cumplimiento normativo    |
      # @evidence EVID-CMMI-DAR-002

  Regla: Las decisiones se revisan periódicamente

    Escenario: Revisión de ADRs
      Dado que se revisan ADRs
      Cuando se evalúa
      Entonces cada ADR tiene:
        | Verificación              |
        | Sigue siendo válido       |
        | No hay nuevas alternativas|
        | Consecuencias correctas   |
      # @evidence EVID-CMMI-DAR-003

  Regla: Decisiones pendientes se escalan

    Escenario: Escalamiento de decisión
      Dado que hay decisión sin resolver
      Cuando se detecta
      Entonces se escala a director apropiado
      Y se documenta el bloqueo
      # @evidence EVID-CMMI-DAR-004
