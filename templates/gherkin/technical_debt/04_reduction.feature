# language: es
# Deuda Técnica - Reducción
@status:proposed
# @evidence:code
@type:acceptance
@domain:general
# REDUCCIÓN: Estrategias para eliminar deuda técnica
Característica: Reducción de Deuda Técnica (GHE)
  Como equipo del proyecto GHE
  Quiero estrategias efectivas para reducir deuda técnica
  Para mejorar calidad sin perder velocidad

  # ─────────────────────────────────────────────────────────────
  # 1. ESTRATEGIAS DE REDUCCIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Estrategias de reducción
    Dado que se aplican estrategias de reducción
    Cuando se implementan
    Entonces:
      | Estrategia                  | Cuándo usarla        |
      | Refactorizar con TDD        | Cambios grandes      |
      | Boy Scout Rule             | En cada commit       |
      | Strangler Fig Pattern      | Módulos legacy       |
      | Branch by Abstraction      | Cambios incrementales|
      | Feature Flags              | Deshabilitar deuda   |
      | Dead Code Elimination      | Código no usado      |

  Escenario: Boy Scout Rule
    Dado que se aplica Boy Scout Rule
    Cuando se toca código con deuda
    Entonces:
      | Paso                       |
      | 1. Identificar deuda en el código que tocas |
      | 2. Mejorar algo pequeño    |
      | 3. Ejecutar tests          |
      | 4. Asegurar que sigue pasando |
      | 5. Commit con el cambio    |
    Y el código queda mejor de como lo encontraste

  Escenario: Refactorización con TDD
    Dado que se refactoriza módulo con deuda
    Cuando se usa TDD
    Entonces:
      | Paso                       |
      | 1. Escribir tests que cubran código actual |
      | 2. Verificar que tests pasan |
      | 3. Refactorizar incrementalmente |
      | 4. Ejecutar tests después de cada cambio |
      | 5. Si test falla → revertir último cambio |
      | 6. Repetir hasta limpio    |

  # ─────────────────────────────────────────────────────────────
  # 2. REFACTORIZACIÓN ESPECÍFICA
  # ─────────────────────────────────────────────────────────────

  Escenario: Refactorizar función larga
    Dado que se detecta función >50 líneas
    Cuando se refactoriza
    Entonces:
      | Paso                       |
      | 1. Identificar responsabilidades |
      | 2. Extraer funciones auxiliares |
      | 3. Renombrar para claridad |
      | 4. Ejecutar tests          |
      | 5. Verificar cobertura     |

  Escenario: Eliminar duplicación
    Dado que se detecta código duplicado
    Cuando se refactoring
    Entonces:
      | Paso                       |
      | 1. Identificar código duplicado |
      | 2. Extraer a función compartida |
      | 3. Parametrizar diferencias |
      | 4. Reemplazar instancias   |
      | 5. Ejecutar tests          |

  Escenario: Extraer bounded context
    Dado que se detecta acoplamiento excesivo
    Cuando se separa en bounded context
    Entonces:
      | Paso                       |
      | 1. Identificar límites naturales |
      | 2. Crear nuevo namespace    |
      | 3. Mover código relacionado |
      | 4. Definir interface (puerto)|
      | 5. Actualizar dependencias |
      | 6. Ejecutar tests          |

  # ─────────────────────────────────────────────────────────────
  # 3. GESTIÓN DURANTE REDUCCIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: No romper funcionalidad durante refactor
    Dado que se refactoriza código
    Cuando se ejecuta
    Entonces:
      | Regla                       |
      | Tests deben pasar siempre  |
      | No agregar features durante refactor |
      | Commit pequeño y frecuente |
      | Code review obligatorio    |
      | Rollback plan listo       |

  Escenario: Medir progreso de reducción
    Dado que se mide progreso
    Cuando se compara antes/después
    Entonces:
      | Métrica antes               | Métrica después      |
      | Complejidad: 8              | Complejidad: 4       |
      | Duplicación: 5%            | Duplicación: 1%      |
      | Cobertura: 85%             | Cobertura: 92%       |
      | Funciones >50 líneas: 5    | Funciones >50 líneas: 0 |
  