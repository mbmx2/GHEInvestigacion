# language: es
# @id GHE-SEC-OWASP-A08-001
# @type security
# @domain security
# @layer domain
# @risk s1
# @owner security-lead
# @status proposed
# @requirement OWASP-A08
# @risk-control CTRL-OWASP-A08
# @regulation NOM-024
@domain:security @type:security @risk:s1 @status:proposed
Característica: OWASP A08 - Fallos de Integridad de Datos
  Como responsable de seguridad del hospital
  Quiero integridad de datos garantizada
  Para que no se manipulen expedientes ni resultados

  Regla: Datos médicos son inmutables después de firma

    Escenario: Nota firmada no se modifica
      Dado que nota médica ha sido firmada
      Cuando se intenta modificar
      Entonces modificación es rechazada
      Y se sugiere nota de adendum
      # @evidence EVID-ASVS-A08-001
      # @invariante INV-A08-001

  Regla: Hash de integridad por registro

    Escenario: Integridad verificable
      Dado que se guarda registro clínico
      Cuando se calcula hash SHA-256
      Entonces el hash se verifica en cada lectura
      Y si no coincide se alerta
      # @evidence EVID-ASVS-A08-002

  Regla: Recetas médicas tienen firma digital

    Escenario: Firma de receta
      Dado que médico genera receta
      Cuando se firma
      Entonces:
        | Verificación              | Estado |
        | Firma electrónica         | ✅      |
        | Timestamp inmutable       | ✅      |
        | Hash de integridad        | ✅      |
        | No modificable después    | ✅      |
      # @evidence EVID-ASVS-A08-003

  Regla: Sync no sobrescribe datos más recientes silenciosamente

    Escenario: Protección post-sync
      Dado que se sincronizan datos
      Cuando hay conflicto
      Entonces se resuelve con última escritura
      Y ambas versiones se conservan para auditoría
      # @evidence EVID-ASVS-A08-004
