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
  Para lidiar con riesgos de forma formal y documentada

  Regla: RA-1: Proceso de gestión de riesgos

    Escenario: Proceso documentado
      Dado que se gestiona riesgo
      Cuando se documenta
      Entonces incluye: identificación, análisis, evaluación, tratamiento, monitoreo

  Regla: RA-2: Evaluación de riesgos

    Escenario: Evaluación periódica
      Dado que se evalúan riesgos
      Cuando se ejecuta evaluación
      Entonces se usa matriz de severidad × probabilidad

  Regla: RA-3: Mitigación de riesgos

    Escenario: Mitigación implementada
      Dado que se identifica riesgo alto
      Cuando se mitiga
      Entonces: control documentado, responsable asignado, fecha de verificación

  Regla: RA-5: Vulnerabilidades de seguridad

    Escenario: Escaneo de vulnerabilidades
      Dado que se ejecuta escaneo
      Cuando se completa
      Entonces: vulnerabilidades clasificadas, remediación planificada

  # @invariante INV-RA-001: No hay riesgo sin tratamiento
  Regla: Todo riesgo tiene tratamiento

    Escenario: Riesgo sin tratamiento
      Dado que se detecta riesgo sin plan
      Cuando se audita
      Entonces se asigna tratamiento y responsable
