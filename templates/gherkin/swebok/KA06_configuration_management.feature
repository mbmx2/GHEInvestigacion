# language: es
# @id GHE-SWEBOK-KA06-001
# @type practice
# @domain engineering
# @layer development
# @risk s2
# @owner dev-lead
# @status proposed
# @requirement PRACTICE-GHE-006
# @risk-control CTRL-SWEBOK-KA06
# @regulation N/A
@domain:engineering @type:practice @risk:s2 @status:proposed
Característica: SWEBOK KA-06 - Gestión de Configuración
  Como responsable de CM del proyecto GHE
  Quiero gestión de configuración con Git
  Para que cada cambio sea rastreable

  Regla: Todo archivo está versionado

    Escenario: Archivo versionado
      Dado que se crea archivo
      Cuando se guarda
      Entonces está en Git con commit descriptivo
      # @evidence EVID-SWEBOK-KA06-001

    Escenario: Archivo sin versionar
      Dado que se detecta archivo sin Git
      Cuando se audita
      Entonces se agrega y se documenta
      # @evidence EVID-SWEBOK-KA06-001-N

  Regla: Commits siguen convención

    Escenario: Convención de commits
      Dado que se crea commit
      Cuando se escribe mensaje
      Entonces sigue formato: type(scope): description
      # @evidence EVID-SWEBOK-KA06-002

  Regla: Branches se gestionan

    Escenario: Gestión de branches
      Dado que se trabaja en nueva funcionalidad
      Cuando se crea branch
      Entonces se crea desde develop con nombre descriptivo
      Y se merge después de review
