# language: es
# @id GHE-CMMI-TS-001
# @type compliance
# @domain process
# @layer engineering
# @risk s1
# @owner architect
# @status proposed
# @requirement CMMI-TS
# @risk-control CTRL-CMMI-TS
# @regulation N/A
@domain:process @type:compliance @risk:s1 @status:proposed
Característica: CMMI - Solución Técnica (TS)
  Como arquitecto del proyecto GHE
  Quiero que la solución técnica siga prácticas CMMI
  Para que la arquitectura sea segura, mantenible y extensible

  Regla: La arquitectura se diseña antes de implementar

    Escenario: Diseño documentado
      Dado que se diseña componente
      Cuando se documenta
      Entonces incluye:
        | Elemento                    |
        | Arquitectura del componente |
        | Interfaces               |
        | Dependencias             |
        | Riesgos de diseño        |
        | Alternativas evaluadas   |
      # @evidence EVID-CMMI-TS-001

  Regla: El diseño se verifica contra requisitos

    Escenario: Verificación diseño-requisitos
      Dado que se tiene diseño
      Cuando se verifica
      Entonces cada requisito tiene componente de diseño asociado
      # @evidence EVID-CMMI-TS-002

  Regla: La implementación sigue estándares

    Escenario: Código según estándares
      Dado que se implementa componente
      Cuando se verifica
      Entonces se cumplen:
        | Estándar                   |
        | Clojure coding standards  |
        | SOLID principles          |
        | Arquitectura hexagonal    |
        | TDD                       |
        | Specs                     |
      # @evidence EVID-CMMI-TS-003

  Regla: La integración se verifica

    Escenario: Integración de componentes
      Dado que se integran componentes
      Cuando se verifica
      Entonces:
        | Verificación              |
        | Interfaces compatibles   |
        | Tests de integración pasan |
        | Sin regresiones          |
      # @evidence EVID-CMMI-TS-004
