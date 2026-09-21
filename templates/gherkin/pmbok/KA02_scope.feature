# language: es
# @id GHE-PMBOK-KA02-001
# @type practice
# @domain management
# @layer governance
# @risk s2
# @owner project-manager
# @status proposed
# @requirement PRACTICE-GHE-PMBOK-002
# @risk-control CTRL-PMBOK-KA02
# @regulation N/A
@domain:management @type:practice @risk:s2 @status:proposed
Característica: PMBOK KA-02 - Gestión del Alcance
  Como director del proyecto GHE
  Quiero que el alcance esté claramente definido
  Para que no se incluyan funcionalidades no deseadas

  Regla: El alcance se documenta en scope

    Escenario: Alcance documentado
      Dado que se define alcance
      Cuando se documenta
      Entonces incluye: incluido, excluido, supuestos, restricciones
      # @evidence EVID-PMBOK-KA02-001

  Regla: EDT/WBS está definida

    Escenario: EDT completa
      Dado que se descompone el trabajo
      Cuando se verifica
      Entonces cada paquete tiene dueño, duración, dependencias
      # @evidence EVID-PMBOK-KA02-002

  Regla: Los cambios de alcance se controlan

    Escenario: Cambio controlado
      Dado que se solicita cambio de alcance
      Cuando se evalúa
      Entonces: análisis de impacto, aprobación del patrocinador, actualización EDT
      # @evidence EVID-PMBOK-KA02-003

  # @invariante INV-KA02-001: No se agrega funcionalidad sin aprobación
  Regla: No se agrega sin aprobación

    Escenario: Feature sin aprobación
      Dado que se detecta feature no aprobado
      Cuando se audita
      Entonces se marca como fuera de alcance y se solicita aprobación
      # @evidence EVID-PMBOK-KA02-004
