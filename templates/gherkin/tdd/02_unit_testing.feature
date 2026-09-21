# language: es
# TDD - Unit Testing
@status:proposed
# @evidence:code
# @requirement:PRACTICE-GHE-001
@type:acceptance
@domain:general
# PRUEBAS UNITARIAS: Tests de funciones aisladas del dominio
Característica: Unit Testing con TDD (GHE)
  Como desarrollador del proyecto GHE
  Quiero escribir unit tests antes del código
  Para garantizar que cada función funciona correctamente

  # ─────────────────────────────────────────────────────────────
  # 1. ESCRITURA DE UNIT TESTS
  # ─────────────────────────────────────────────────────────────

  Escenario: Test de función pura del dominio
    Dado que se implementa cálculo de BMI
    Cuando se escribe unit test
    Entonces el test cubre:
      | Caso                        | Input           | Expected |
      | BMI normal                  | 70kg, 1.77m    | 22.5     |
      | BMI obesidad                | 120kg, 1.65m   | 44.1     |
      | BMI bajo peso               | 45kg, 1.70m    | 15.6     |
      | Datos inválidos (peso 0)    | 0kg, 1.70m     | nil      |
      | Datos inválidos (altura 0)  | 70kg, 0m       | nil      |
    Y el test NO usa base de datos
    Y el test tarda <10ms

  Escenario: Test de validación de entidad
    Dado que se implementa validación de Patient
    Cuando se escribe unit test
    Entonces el test cubre:
      | Caso                        | Input           | Expected |
      | Paciente válido             | Todos los campos| Válido   |
      | Nombre vacío                | ""              | Error    |
      | CURP inválida               | "ABC"           | Error    |
      | Fecha nacimiento futura     | 2030-01-01      | Error    |
      | Sexo inválido               | "X"             | Error    |
    Y cada caso es un test independiente

  Escenario: Test de value object
    Dado que se implementa BloodType value object
    Cuando se escribe unit test
    Entonces el test cubre:
      | Caso                        | Input           | Expected |
      | Tipo válido                 | "O+"            | Válido   |
      | Tipo válido                 | "AB-"           | Válido   |
      | Tipo inválido               | "Z+"            | Error    |
      | Tipo nulo                   | nil             | Error    |
    Y BloodType es inmutable
    Y se compara por valor

  # ─────────────────────────────────────────────────────────────
  # 2. CONVENCIONES DE UNIT TESTS
  # ─────────────────────────────────────────────────────────────

  Escenario: Naming convention para tests
    Dado que se escriben tests
    Cuando se nombran
    Entonces se sigue convención:
      | Test                        | Nombre esperado    |
      | Función exitosa             | test-function-name-with-valid-input |
      | Función con error           | test-function-name-throws-on-invalid |
      | Edge case                   | test-function-name-edge-case |
      | Comportamiento             | test-function-name-behavior |
    Y cada test tiene nombre descriptivo

  Escenario: Estructura AAA (Arrange-Act-Assert)
    Dado que se escribe un test
    Cuando se estructura
    Entonces sigue patrón AAA:
      | Sección                     | Contenido          |
      | Arrange (Preparar)          | Datos de prueba, setup |
      | Act (Actuar)                | Llamar función     |
      | Assert (Afirmar)            | Verificar resultado|
    Y cada sección es clara y separada

  Escenario: Tests independientes
    Dado que se escriben múltiples tests
    Cuando se ejecutan en cualquier orden
    Entonces:
      | Criterio                   | Estado    |
      | Tests no dependen de otros tests | ✅  |
      | Tests no comparten estado  | ✅         |
      | Tests crean sus propios datos | ✅      |
      | Tests no dependen de ejecución previa | ✅ |

  # ─────────────────────────────────────────────────────────────
  # 3. TIPOS DE UNIT TESTS
  # ─────────────────────────────────────────────────────────────

  Escenario: Test de happy path
    Dado que se prueba el caso exitoso
    Cuando la función recibe input válido
    Entonces:
      | Test                        | Verificación      |
      | Función retorna resultado esperado | ✅      |
      | No lanza excepciones       | ✅         |
      | Resultado es del tipo correcto | ✅       |

  Escenario: Test de edge cases
    Dado que se prueba casos límite
    Cuando la función recieve boundary values
    Entonces se prueba:
      | Edge Case                   | Ejemplo           |
      | Valor mínimo                | Edad 0 años       |
      | Valor máximo                | Edad 120 años     |
      | Cadena vacía                | ""                |
      | Null                        | nil               |
      | Valor negativo              | -1                |
      | Número muy grande           | 999999            |

  Escenario: Test de error handling
    Dado que se prueba manejo de errores
    Cuando la función falla
    Entonces:
      | Test                        | Verificación      |
      | Excepción correcta se lanza | ✅                |
      | Mensaje de error claro      | ✅                |
      | Estado no se corrompe       | ✅                |
      | Recursos se liberan         | ✅                |

  # ─────────────────────────────────────────────────────────────
  # 4. MÉTRICAS DE UNIT TESTING
  # ─────────────────────────────────────────────────────────────

  Escenario: Métricas de calidad de unit tests
    Dado que se miden métricas de unit tests
    Cuando se evalúa calidad
    Entonces:
      | Métrica                    | Objetivo     | Actual |
      | Cobertura de código        | >95%         | 92%    |
      | Cobertura de branch        | >90%         | 88%    |
      | Tiempo de ejecución        | <5 min       | 3 min  |
      | Tests que fallan           | 0            | 0      |
      | Tests pendientes           | 0            | 0      |
      | Mutations survived         | <5%          | 3%     |
  