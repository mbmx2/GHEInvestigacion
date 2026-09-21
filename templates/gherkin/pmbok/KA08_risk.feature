# language: es
# @id GHE-PMBOK-KA08-001
# @type practice
# @domain management
# @layer governance
# @risk s1
# @owner risk-manager
# @status proposed
# @requirement PRACTICE-GHE-PMBOK-008
# @risk-control CTRL-PMBOK-KA08
# @regulation N/A
@domain:management @type:practice @risk:s1 @status:proposed
Característica: PMBOK KA-08 - Gestión de Riesgos
  Como responsable de riesgos del proyecto GHE
  Quiero que los riesgos se identifiquen y mitiquen
  Para que el proyecto no se vea afectado por eventos inesperados

  Regla: Todo riesgo se identifica y documenta

    Escenario: Riesgo registrado
      Dado que se identifica un riesgo
      Cuando se documenta
      Entonces tiene: descripción, probabilidad, impacto, mitigación, responsable
      # @evidence EVID-PMBOK-KA08-001

  Regla: Los riesgos se revisan periódicamente

    Escenario: Revisión trimestral
      Dado que es fin de trimestre
      Cuando se revisan riesgos
      Entonces cada riesgo tiene estado actualizado
      Y se identifican nuevos riesgos
      # @evidence EVID-PMBOK-KA08-002

  Regla: Los riesgos críticos tienen plan de contingencia

    Escenario: Plan de contingencia
      Dado que hay riesgo con impacto "crítico"
      Cuando se evalúa
      Entonces tiene plan de contingencia documentado
      # @evidence EVID-PMBOK-KA08-003

  # @invariante INV-KA08-001: No hay riesgo sin mitigación
  Regla: Todo riesgo tiene mitigación

    Escenario: Riesgo sin mitigación
      Dado que se detecta riesgo sin plan
      Cuando se audita
      Entonces se bloquea hasta definir mitigación
      # @evidence EVID-PMBOK-KA08-004
