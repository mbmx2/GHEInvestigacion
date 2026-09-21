# language: es
# @id GHE-SWEBOK-KA02-001
# @type practice
# @domain engineering
# @layer process
# @risk s2
# @owner architect
# @status proposed
# @requirement PRACTICE-GHE-002
# @risk-control CTRL-SWEBOK-KA02
# @regulation N/A
@domain:engineering @type:practice @risk:s2 @status:proposed
Característica: SWEBOK KA-02 - Diseño de Software
  Como arquitecto del proyecto GHE
  Quiero que el diseño sea documentado, modular y seguro
  Para que el sistema sea mantenible y extensible

  Regla: El diseño se documenta antes de implementar

    Escenario: Diseño documentado
      Dado que se diseña componente
      Cuando se documenta
      Entonces incluye: arquitectura, interfaces, dependencias, alternativas evaluadas
      # @evidence EVID-SWEBOK-KA02-001

    Escenario: Diseño sin documentar
      Dado que se implementa sin diseño previo
      Cuando se detecta
      Entonces se marca como deuda técnica y se diseña retroactivamente
      # @evidence EVID-SWEBOK-KA02-001-N

  Regla: El diseño sigue principios SOLID

    Escenario: Principios SOLID verificados
      Dado que se revisa diseño
      Cuando se evalúa
      Entonces cada componente cumple SOLID: SRP, OCP, LSP, ISP, DIP
      # @evidence EVID-SWEBOK-KA02-002

  Regla: El diseño usa arquitectura hexagonal

    Escenario: Separación de capas
      Dado que se verifica arquitectura
      Cuando se evalúa
      Entonces dominio no depende de infraestructura
      # @evidence EVID-SWEBOK-KA02-003

  # @invariante INV-KA02-001: No hay dependencias de bajo a alto nivel
  Regla: No hay dependencias de bajo a alto nivel

    Escenario: Dependencia prohibida
      Dado que se detecta dependencia de infra a dominio
      Cuando se audita
      Entonces se refactorea
      # @evidence EVID-SWEBOK-KA02-004
