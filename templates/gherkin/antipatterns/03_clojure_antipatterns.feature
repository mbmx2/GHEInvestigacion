# language: es
# Anti-Patrones de Código Clojure
Característica: Anti-Patrones de Código (GHE)
  Como desarrollador del proyecto GHE
  Quiero identificar anti-patrones específicos de Clojure
  Para mantener código limpio y mantenible

  # ─────────────────────────────────────────────────────────────
  # 1. MUTACIÓN EXCESIVA
  # ─────────────────────────────────────────────────────────────

  Escenario: Detectar uso excesivo de atoms
    Dado que se analiza uso de mutable state
    Cuando se busca `atom`, `ref`, `agent`
    Entonces se identifica si:
      | Anti-patrón                | Problema         |
      | Múltiples atoms en una función | Difícil de testear |
      | Atoms para datos que deberían ser inmutables | No idiomático |
      | Swap excesivo             | Race conditions  |
    Y se corrige: "Usar maps/records inmutables, atoms solo si es necesario"

  Escenario: Detectar mutable state innecesario
    Dado que se busca `swap!` en dominio
    Cuando se analiza
    Entonces:
      | Anti-patrón                | Alternativa      |
      | (swap! app-db update-in [:patients id :name] str " Jr.") | Usar transducers |
      | Múltiples atoms compartidos | Un solo atom con estructura clara |
      | Atom como cache          | Usar memoize       |

  # ─────────────────────────────────────────────────────────────
  # 2. MACROS EXCESIVAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Detectar uso excesivo de macros
    Dado que se analiza uso de macros
    Cuando se cuentan
    Entonces se identifica si:
      | Anti-patrón                | Problema         |
      | Macros para todo          | Difícil de debug  |
      | Macros que podrían ser funciones | Complejidad innecesaria |
      | Macros anidadas          | ilegible          |
    Y se corrige: "Usar funciones cuando sea posible, macros solo para metaprogramación"

  # ─────────────────────────────────────────────────────────────
  # 3. NAMESPACE SICKNESS
  # ─────────────────────────────────────────────────────────────

  Escenario: Detectar namespaces excesivos
    Dado que se analiza estructura de namespaces
    Cuando se cuentan
    Entonces se identifica si:
      | Anti-patrón                | Problema         |
      | >30 namespaces            | Difícil de navegar |
      | Namespaces con 1 función  | Granularidad excesiva |
      | Namespaces >500 líneas    | Demasiado grande |
    Y se corrige: "Reorganizar en bounded contexts cohesivos"

  # ─────────────────────────────────────────────────────────────
  # 4. THREAD MACROS ANIDADAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Detectar threading excesivo
    Dado que se analiza uso de `->` y `->>`
    Cuando se evalúa legibilidad
    Entonces se identifica si:
      | Anti-patrón                | Problema         |
      | >10 pasos en threading    | Difícil de seguir |
      | Threading con side effects | No funcional      |
      | Threading anidado         | ilegible          |
    Y se corrige: "Extraer pasos intermedios a funciones nombradas"

  # ─────────────────────────────────────────────────────────────
  # 5. DOOM BALLS
  # ─────────────────────────────────────────────────────────────

  Escenario: Detectar doom balls (nested let)
    Dado que se analiza estructura de `let`
    Cuando se evalúa
    Entonces se identifica si:
      | Anti-patrón                | Problema         |
      | >5 niveles de anidamiento | ilegible          |
      | Let con múltiples binding| Difícil de seguir |
    Y se corrige: "Extraer a funciones, usar threading"

  # ─────────────────────────────────────────────────────────────
  # 6. SIDE EFFECTS EN DOMINIO
  # ─────────────────────────────────────────────────────────────

  Escenario: Detectar side effects en domain layer
    Dado que se analiza capa de dominio
    Cuando se busca IO, DB, HTTP
    Entonces se identifica si:
      | Anti-patrón                | Problema         |
      | Dominio hace consultas DB | Acoplamiento     |
      | Dominio hace HTTP calls   | No testeable      |
      | Dominio escribe archivos  | No seguro         |
    Y se corrige: "Mover IO a adapters, dominio puro"

  # ─────────────────────────────────────────────────────────────
  # 7. RE-REDEFINICIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Detectar redefinición excesiva
    Dado que se analiza uso de `defn` después de `deftest`
    Cuando se busca
    Entonces se identifica si:
      | Anti-patrón                | Problema         |
      | Re-definir funciones en tests | Flaky tests |
      | Re-definir vars en producción | Peligroso    |
    Y se corrige: "Usar `with-redefs` en tests, nunca en producción"

  # ─────────────────────────────────────────────────────────────
  # 8. NIL PUNTING
  # ─────────────────────────────────────────────────────────────

  Escenario: Detectar nil punting
    Dado que se analiza manejo de nil
    Cuando se busca `(some? x)` o `(when x ...)`
    Entonces se identifica si:
      | Anti-patrón                | Problema         |
      | Nil silencioso propagándose| Errores tardíos  |
      | `(when x (do-something x))` | Oculta bugs   |
    Y se corrige: "Usar `cond->` o `some->`, validar nil explícitamente"

  # ─────────────────────────────────────────────────────────────
  # 9. STRING KEYWORDS
  # ─────────────────────────────────────────────────────────────

  Escenario: Detectar uso de keywords como strings
    Dado que se analiza uso de strings como keys
    Cuando se busca `{"key" value}` en vez de `{:key value}`
    Entonces se identifica si:
      | Anti-patrón                | Problema         |
      | Strings como map keys     | No idiomático    |
      | Comparaciones con strings | Lento, frágil    |
    Y se corrige: "Usar keywords :key en vez de strings"

  # ─────────────────────────────────────────────────────────────
  # 10. FALTA DE SPEC
  # ─────────────────────────────────────────────────────────────

  Escenario: Detectar falta de specs
    Dado que se analiza uso de clojure.spec
    Cuando se verifica
    Entonces se identifica si:
      | Anti-patrón                | Problema         |
      | Sin specs en funciones públicas | Sin validación |
      | Sin specs en datos de dominio   | Sin contratos |
      | Sin generative testing   | Sin edge cases   |
    Y se corrige: "Definir specs para toda función pública y dato de dominio"
