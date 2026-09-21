# language: es
# @id GHE-ISO14971-COMPONENT-001
# @type compliance
# @domain safety
# @layer governance
# @risk s1
# @owner risk-manager
# @status proposed
# @requirement REQ-ISO14971-COMPONENT
# @risk-control CTRL-ISO14971-COMPONENT
# @regulation NOM-024
@domain:safety @type:compliance @risk:s1 @status:proposed
Característica: ISO 14971 - Análisis por Componente
  Como responsable de riesgos del hospital
  Quiero análisis de riesgos por cada componente del sistema
  Para KDA cada componente tiene sus riesgos controlados

  Regla: Cada componente tiene análisis de riesgos

    Escenario: Análisis por componente
      Dado que se analiza componente
      Cuando se evalúa riesgos
      Entonces: peligros, secuencias, daño posible, severidad, probabilidad, control, verificación

  Regla: Riesgos residuales se documentan

    Escenario: Riesgo residual
      Dado que se aplica control
      Cuando se evalúa riesgo residual
      Entonces: riesgo residual aceptable o se requiere acción adicional

  Regla: Beneficio-riesgo se evalúa

    Escenario: Beneficio > riesgo
      Dado que se evalúa componente
      Cuando se compara beneficio con riesgo
      Entonces: beneficio supera riesgo residual

  Regla: Riesgos nuevos se detectan

    Escenario: Nuevo riesgo detectado
      Dado que se detecta nuevo riesgo
      Cuando se registra
      Entonces: se evalúa, se mitiga, se documenta
