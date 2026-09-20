# language: es
# TDD - Test Design Patterns
@status:proposed
@type:acceptance
@domain:general
# PATRONES DE DISEÑO DE TESTS: Estrategias para tests mantenibles
Característica: Patrones de Diseño de Tests (TDD - GHE)
  Como desarrollador del proyecto GHE
  Quiero aplicar patrones de diseño de tests
  Para crear tests mantenibles y expresivos

  # ─────────────────────────────────────────────────────────────
  # 1. ARRANGE-ACT-ASSERT (AAA)
  # ─────────────────────────────────────────────────────────────

  Escenario: Patrón AAA
    Dado que se escribe test con patrón AAA
    Cuando se estructura
    Entonces:
      | Sección                     | Contenido          |
      | Arrange                     | Preparar datos, crear objetos |
      | Act                         | Ejecutar operación |
      | Assert                      | Verificar resultado|
    Y cada sección tiene una sola responsabilidad
    Y no hay lógica de negocio en Assert

  # ─────────────────────────────────────────────────────────────
  # 2. GIVEN-WHEN-THEN (BDD)
  # ─────────────────────────────────────────────────────────────

  Escenario: Patrón Given-When-Then
    Dado que se escribe test con patrón BDD
    Cuando se estructura
    Entonces:
      | Sección                     | Contenido          |
      | Given                       | Contexto inicial   |
      | When                        | Acción             |
      | Then                        | Resultado esperado |
    Y el test lee como una historia
    Y es comprensible por stakeholders no técnicos

  # ─────────────────────────────────────────────────────────────
  # 3. ACTUAL vs EXPECTED
  # ─────────────────────────────────────────────────────────────

  Escenario: Patrón Actual vs Expected
    Dado que se escribe test con este patrón
    Cuando se verifica resultado
    Entonces:
      | Componente                  | Contenido          |
      | actual                      | Resultado de la función |
      | expected                    | Resultado esperado |
      | comparison                  | =, >, <, contains  |
    Y el error muestra ambos valores
    Y facilita debugging

  # ─────────────────────────────────────────────────────────────
  # 4. TEST DOUBLES (Mocks, Stubs, Fakes)
  # ─────────────────────────────────────────────────────────────

  Escenario: Uso de test doubles
    Dado que se necesita aislar componente
    Cuando se usa test double
    Entonces:
      | Test Double                 | Uso en GHE         |
      | Mock                        | Verificar interacciones |
      | Stub                        | Proveer datos fijos |
      | Fake                        | Implementación简化 |
      | Spy                        | Registrar llamadas  |
    Y los test doubles reemplazan dependencias reales
  