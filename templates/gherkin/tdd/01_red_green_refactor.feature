# language: es
# TDD - Ciclo Red-Green-Refactor
# EL CICLO FUNDAMENTAL: Escribir test → Falla → Escribir código → Pasa → Refactorizar
Característica: Ciclo Red-Green-Refactor (TDD)
  Como desarrollador del proyecto GHE
  Quiero seguir el ciclo TDD en cada funcionalidad
  Para producir código probado, limpio y mantenible

  # ─────────────────────────────────────────────────────────────
  # 1. FASE RED (Test que falla)
  # ─────────────────────────────────────────────────────────────

  Escenario: Escribir test antes del código
    Dado que se va a implementar nueva funcionalidad
    Cuando se escribe el test primero
    Entonces:
      | Paso                       |
      | 1. Entender el requisito   |
      | 2. Escribir test que falle |
      | 3. Ejecutar test (RED)     |
      | 4. Verificar que falla     |
      | 5. NO escribir código aún  |
    Y el test debe fallar por la razón correcta
    Y el test documenta QUÉ se espera, no CÓMO se hace

  Escenario: Ejemplo RED - Calcular edad gestacional
    Dado que se implementa cálculo de edad gestacional
    Cuando se escribe el test primero
    Entonces el test dice:
      | Test                        | Input                | Expected  |
      | "Calcula edad gestacional desde FUR" | FUR: 2024-01-01, Fecha actual: 2024-05-01 | 17 semanas |
    Y el test falla porque la función aún no existe
    Y el error es: "Function calculate-gestational-age not found"

  Escenario: Ejemplo RED - Validar CURP
    Dado que se implementa validación de CURP
    Cuando se escribe el test primero
    Entonces el test dice:
      | Test                        | Input           | Expected  |
      | "CURP válida de 18 caracteres" | "GOGC531015MVZRRL04" | true |
      | "CURP inválida corta"      | "ABC123"        | false     |
    Y ambos tests fallan porque la función no existe

  # ─────────────────────────────────────────────────────────────
  # 2. FASE GREEN (Código que pasa)
  # ─────────────────────────────────────────────────────────────

  Escenario: Escribir código mínimo para pasar
    Dado que el test falla (RED)
    Cuando se escribe código mínimo
    Entonces:
      | Paso                       |
      | 1. Escribir solo lo necesario para pasar |
      | 2. NO agregar extras       |
      | 3. Ejecutar test (GREEN)   |
      | 4. Verificar que pasa      |
    Y el código puede ser "sucio" temporalmente
    Y la meta es que el test pase, no escribir código elegante

  Escenario: Ejemplo GREEN - Calcular edad gestacional
    Dado que el test falla
    Cuando se implementa función mínima
    Entonces:
      | Código                      |
      | (defn calculate-gestational-age [lmp-date current-date] |
      |   (let [weeks (-> (java.time.Period/between lmp-date current-date) .getDays (/ 7) int)] |
      |     weeks))                |
    Y el test pasa (GREEN)
    Y la función funciona correctamente

  # ─────────────────────────────────────────────────────────────
  # 3. FASE REFACTOR (Mejorar código)
  # ─────────────────────────────────────────────────────────────

  Escenario: Refactorizar sin romper tests
    Dado que el test pasa (GREEN)
    Cuando se refactoriza el código
    Entonces:
      | Paso                       |
      | 1. Identificar code smells |
      | 2. Mejorar estructura      |
      | 3. Extraer funciones       |
      | 4. Nombrar mejor           |
      | 5. Ejecutar tests (siguen pasando) |
      | 6. Repetir hasta limpio    |
    Y los tests NO deben fallar durante refactor
    Y el comportamiento externo NO cambia

  Escenario: Ejemplo REFACTOR - Calcular edad gestacional
    Dado que el test pasa con código básico
    Cuando se refactoriza
    Entonces:
      | Refactor                    |
      | Extraer cálculo de semanas a función separada |
      | Agregar validación de entrada |
      | Mejorar nombres de variables |
      | Agregar docstring           |
    Y el test sigue pasando después de refactor
    Y el código es más legible y mantenible

  # ─────────────────────────────────────────────────────────────
  # 4. CICLO COMPLETO
  # ─────────────────────────────────────────────────────────────

  Escenario: Ciclo TDD completo para una funcionalidad
    Dado que se implementa "Registrar paciente con validación de CURP"
    Cuando se ejecuta ciclo TDD
    Entonces el flujo es:
      | Iteración | RED              | GREEN            | REFACTOR        |
      | 1         | Test CURP válida | Implementar validación básica | — |
      | 2         | Test CURP inválida| Agregar regex    | Extraer regex   |
      | 3         | Test CURP null   | Agregar null check | —            |
      | 4         | Test CURP 17 chars| Agregar longitud | Unificar validación |
      | 5         | Test integración | Conectar con repository | Limpiar |
    Y cada iteración es un mini-ciclo de 5-10 minutos
    Y al final hay código limpio, probado y funcional

  Escenario: Verificación de que TDD produce diseño emergente
    Dado que se usa TDD para diseñar
    Cuando se completa la implementación
    Entonces el diseño emerge:
      | Diseño emergente            |
      | Funciones pequeñas y puras  |
      | Interfaces claras           |
      | Bajo acoplamiento           |
      | Alta cohesión               |
      | Fácil de testear            |
      | Fácil de mantener           |
  