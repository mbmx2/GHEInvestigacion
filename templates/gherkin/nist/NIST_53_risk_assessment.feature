# language: es
# @id GHE-NIST-53-RA-001
# @type compliance
# @domain security
# @layer governance
# @risk s1
# @owner risk-manager
# @status proposed
# @requirement NIST-53-RA
# @risk-control CTRL-NIST-53-RA
# @regulation NOM-024
@domain:security @type:compliance @risk:s1 @status:proposed
Característica: NIST 800-53 - Evaluación de Riesgos (RA)
  Como responsable de riesgos del hospital
  Quiero evaluación de riesgos según NIST 800-53
  Para lidiar con riesgos de forma formal

  Regla: RA-1: Proceso documentado

    Escenario: Proceso definido
      Dado que se gestiona riesgo
      Cuando se documenta
      Entonces: identificación, análisis, evaluación, tratamiento, monitoreo
      # @evidence EVID-NIST-53-RA-001

  Regla: RA-2: Evaluación periódica

    Escenario: Evaluación ejecutada
      Dado que se evalúan riesgos
      Cuando se ejecuta evaluación
      Entonces se usa matriz de severidad × probabilidad
      # @evidence EVID-NIST-53-RA-002

    Escenario: Evaluación no ejecutada
      Dado que no se ha evaluado riesgo en 6 meses
      Cuando se detecta
      Entonces: se programa evaluación inmediata
      # @evidence EVID-NIST-53-RA-002-N

  Regla: RA-3: Mitigación implementada

    Escenario: Riesgo mitiga do
      Dado que se identifica riesgo alto
      Cuando se mitiga
      Entonces: control documentado, responsable, fecha verificación
      # @evidence EVID-NIST-53-RA-003

    Escenario: Riesgo sin mitigar
      Dado que riesgo alto no tiene mitigación
      Cuando se audita
      Entonces: se escala y se bloquea hasta mitigar
      # @evidence EVID-NIST-53-RA-003-N

  # @invariante INV-53-RA-001: Todo riesgo tiene tratamiento
  Regla: Todo riesgo tiene tratamiento asignado

    Escenario: Riesgo sin tratamiento
      Dado que se detecta riesgo sin plan
      Cuando se audita
      Entonces: se asigna tratamiento y responsable antes de avanzar
      # @evidence EVID-NIST-53-RA-004

  Regla: RA-5: Vulnerabilidades de seguridad

    Escenario: Escaneo ejecutado
      Dado que se ejecuta escaneo de vulnerabilidades
      Cuando se completa
      Entonces: vulnerabilidades clasificadas, remediación planificada
      # @evidence EVID-NIST-53-RA-005
