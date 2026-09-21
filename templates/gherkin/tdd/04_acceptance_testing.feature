# language: es
# TDD - Acceptance Testing
@status:proposed
# @evidence:code
# @requirement:PRACTICE-GHE-001
@type:acceptance
@domain:general
# PRUEBAS DE ACEPTACIÓN: Tests que validan requisitos desde la perspectiva del usuario
Característica: Acceptance Testing con TDD (GHE)
  Como stakeholder del proyecto GHE
  Quiero que los tests de aceptación validen requisitos
  Para garantizar que el sistema cumple lo que el usuario necesita

  # ─────────────────────────────────────────────────────────────
  # 1. ACCEPTANCE CRITERIA
  # ─────────────────────────────────────────────────────────────

  Escenario: Criterio de aceptación para registro de paciente
    Dado que se define criterio de aceptación
    Cuando se escribe test de aceptación
    Entonces el test valida:
      | Criterio                    | Verificado por test |
      | Paciente se registra con CURP | ✅              |
      | CURP se valida (18 chars)   | ✅                |
      | Nombre completo se guarda   | ✅                |
      | Fecha de nacimiento se guarda | ✅              |
      | Sexo se registra            | ✅                |
      | Paciente tiene ID único     | ✅                |
      | Timestamp se registra       | ✅                |

  Escenario: Criterio de aceptación para prescripción
    Dado que se define criterio de aceptación para prescripción
    Cuando se escribe test de aceptación
    Entonces el test valida:
      | Criterio                    | Verificado por test |
      | Médico puede prescribir     | ✅                |
      | Medicamento se selecciona   | ✅                |
      | Dosis se especifica         | ✅                |
      | Frecuencia se indica        | ✅                |
      | Cantidad se calcula         | ✅                |
      | Receta se firma digitalmente| ✅                |
      | Receta se envía a farmacia  | ✅                |

  # ─────────────────────────────────────────────────────────────
  # 2. GIVEN-WHEN-THEN
  # ─────────────────────────────────────────────────────────────

  Escenario: Formato Given-When-Then para acceptance tests
    Dado que se escriben acceptance tests
    Cuando se usan Given-When-Then
    Entonces:
      | Sección                     | Contenido          |
      | Given (Dado)               | Estado inicial, precondiciones |
      | When (Cuando)              | Acción del usuario |
      | Then (Entonces)            | Resultado esperado |
    Y cada escenario es una historia de usuario verificable

  Escenario: Ejemplo Given-When-Then
    Dado que el médico tiene pacientes registrados
    Cuando selecciona un paciente y crea consulta
    Entonces el sistema:
      | Verificación               |
      | Abre expediente del paciente |
      | Muestra historial previo    |
      | Permite crear nota SOAP     |
      | Guarda consulta con timestamp |
      | Vincula consulta al paciente|

  # ─────────────────────────────────────────────────────────────
  # 3. ACCEPTANCE TESTS CON GHERKIN
  # ─────────────────────────────────────────────────────────────

  Escenario: Acceptance test en formato Gherkin
    Dado que se escriben acceptance tests en Gherkin
    Cuando se usan feature files
    Entonces:
      | Feature                     | Escenarios          |
      | patient_registration        | 7                   |
      | prenatal_control            | 8                   |
      | pharmacy_dispensing         | 8                   |
      | prescription                | 8                   |
      | triage                      | 7                   |
    Y cada feature file es ejecutable
    Y cada escenario tiene pasos concretos

  Escenario: Acceptance tests ejecutables
    Dado que se ejecutan acceptance tests
    Cuando se corre suite completa
    Entonces:
      | Verificación               | Estado    |
      | Todos los escenarios pasan | ✅         |
      | Tiempo total < 30 min      | ✅         |
      | Cobertura de features > 90%| ✅         |
      | Sin escenarios pendientes  | ✅         |
  