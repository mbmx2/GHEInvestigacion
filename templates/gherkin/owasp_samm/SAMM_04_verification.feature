# language: es
# @id GHE-SAMM-VERIF-001
# @type compliance
# @domain security
# @layer development
# @risk s1
# @owner qa-lead
# @status proposed
# @requirement SAMM-VERIFICATION
# @risk-control CTRL-SAMM-VERIF
# @regulation NOM-024
@domain:security @type:compliance @risk:s1 @status:proposed
Característica: SAMM Verification - Evaluación, Testing y Penetration Testing
  Como responsable de QA del proyecto GHE
  Quiero verificación completa de seguridad
  Para que cada release sea seguro

  Regla: La arquitectura se evalúa contra requisitos de seguridad

    Escenario: Evaluación periódica
      Dado que se evalúa arquitectura
      Cuando se verifica
      Entonces ADRs están actualizados, segregación verificada, dependencias auditadas
      # @evidence EVID-SAMM-VERIF-001

    Escenario: Evaluación no realizada
      Dado que NO se ha evaluado arquitectura en 6 meses
      Cuando se detecta
      Entonces se programa evaluación inmediata
      # @evidence EVID-SAMM-VERIF-001-N

  Regla: Cada requisito de seguridad tiene test asociado

    Escenario: Trazabilidad completa
      Dado que se tiene requisito de seguridad
      Cuando se verifica
      Entonces tiene test asociado ejecutado en CI/CD
      # @evidence EVID-SAMM-VERIF-002

    Escenario: Requisito sin test
      Dado que un requisito de seguridad NO tiene test
      Cuando se detecta
      Entonces se bloquea la release hasta crear el test
      # @evidence EVID-SAMM-VERIF-002-N

  Regla: Se ejecutan pruebas de seguridad automatizadas

    Escenario: SAST en CI/CD
      Dado que se ejecuta pipeline
      Cuando se ejecuta SAST
      Entonces 0 vulnerabilidades críticas
      # @evidence EVID-SAMM-VERIF-003

    Escenario: DAST periódico
      Dado que se ejecuta DAST mensual
      Cuando se completa
      Entonces 0 hallazgos High/Critical
      # @evidence EVID-SAMM-VERIF-004

    Escenario: Pentest semestral
      Dado que se ejecuta pentest
      Cuando se completa
      Entonces se genera reporte con hallazgos, severidad y remediación
      # @evidence EVID-SAMM-VERIF-005

    Escenario: Pentest no realizado
      Dado que NO se ha ejecutado pentest en 6 meses
      Cuando se detecta
      Entonces se programa pentest inmediato
      # @evidence EVID-SAMM-VERIF-005-N

  Regla: Código de seguridad pasa por review

    Escenario: Review completado
      Dado que se modifica componente de seguridad
      Cuando se revisa
      Entonces tiene review por security-lead, análisis de impacto, tests de regresión
      # @evidence EVID-SAMM-VERIF-006

    Escenario: Review no realizado
      Dado que se merge sin review de seguridad
      Cuando se detecta
      Entonces se revierte el cambio
      Y se notifica al equipo
      # @evidence EVID-SAMM-VERIF-006-N
