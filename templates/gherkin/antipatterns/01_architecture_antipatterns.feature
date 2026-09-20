# language: es
# Anti-Patrones de Arquitectura de Software
@status:proposed
@type:acceptance
@domain:quality
Característica: Anti-Patrones Arquitectónicos (GHE)
  Como arquitecto del proyecto GHE
  Quiero identificar y prevenir anti-patrones arquitectónicos
  Para que el sistema sea mantenible, escalable y seguro

  # ─────────────────────────────────────────────────────────────
  # 1. GOD OBJECT / GOD CLASS
  # ─────────────────────────────────────────────────────────────

  Escenario: Detectar God Object
    Dado que se analiza código en busca de God Objects
    Cuando se evalúa
    Entonces se identifica si:
      | Criterio                   | God Object?  |
      | Clase >500 líneas         | Sí           |
      | Clase >20 métodos         | Sí           |
      | Clase con >5 responsabilidades | Sí     |
      | Clase que cambia frecuentemente por múltiples razones | Sí |
    Y se corrige: "Separar en múltiples clases con responsabilidad única"

  Escenario: Detectar God Object en GHE
    Dado que se busca "PatientService" con 200 métodos
    Cuando se inspecciona
    Entonces se identifica:
      | Responsabilidades encontradas |
      | CRUD de pacientes            |
      | Búsqueda                     |
      | Validación                   |
      | Generación de reportes       |
      | Exportación                  |
      | Notificaciones               |
      | Estadísticas                 |
    Y se corrige: "Separar en PatientRepository, PatientService, PatientReportService, PatientNotificationService"

  # ─────────────────────────────────────────────────────────────
  # 2. SPAGHETTI CODE
  # ─────────────────────────────────────────────────────────────

  Escenario: Detectar Spaghetti Code
    Dado que se analiza flujo de código
    Cuando se evalúa
    Entonces se identifica si:
      | Criterio                   | Spaghetti?  |
      | Flujo de control difícil de seguir | Sí  |
      | Muchos saltos (goto, break anidados) | Sí |
      | Acoplamiento excesivo     | Sí           |
      | Sin separación de capas   | Sí           |
    Y se corrige: "Reestructurar en capas claras con flujo secuencial"

  # ─────────────────────────────────────────────────────────────
  # 3. BIG BALL OF MUD
  # ─────────────────────────────────────────────────────────────

  Escenario: Detectar Big Ball of Mud
    Dado que se analiza estructura del proyecto
    Cuando se evalúa
    Entonces se identifica si:
      | Criterio                   | Big Ball?    |
      | Sin arquitectura clara     | Sí           |
      | Todo acoplado a todo       | Sí           |
      | Difícil de entender        | Sí           |
      | Sin docs de diseño         | Sí           |
    Y se corrige: "Implementar arquitectura hexagonal con bounded contexts"

  # ─────────────────────────────────────────────────────────────
  # 4. SPOOF ANTI-PATTERN
  # ─────────────────────────────────────────────────────────────

  Escenario: Detectar código "spoof"
    Dado que se busca código que simula funcionalidad
    Cuando se evalúa
    Entonces se identifica si:
      | Criterio                   | Spoof?      |
      | Función retorna siempre lo mismo | Sí  |
      | Sin lógica real            | Sí           |
      | Test pasa pero no funciona | Sí           |
    Y se corrige: "Implementar funcionalidad real"

  # ─────────────────────────────────────────────────────────────
  # 5. LAVA FLOW
  # ─────────────────────────────────────────────────────────────

  Escenario: Detectar Lava Flow
    Dado que se analiza código antiguo
    Cuando se evalúa
    Entonces se identifica si:
      | Criterio                   | Lava Flow?   |
      | Código que nadie entiende  | Sí           |
      | Nadie se atreve a tocar    | Sí           |
      | Sin tests                  | Sí           |
      | Sin documentación          | Sí           |
    Y se corrige: "Escribir tests, documentar, refactorizar gradualmente"

  # ─────────────────────────────────────────────────────────────
  # 6. COPY-PASTE PROGRAMMING
  # ─────────────────────────────────────────────────────────────

  Escenario: Detectar Copy-Paste
    Dado que se busca código duplicado
    Cuando se ejecuta análisis de duplicación
    Entonces se identifica si:
      | Criterio                   | Copy-Paste?  |
      | Bloques de código idénticos| Sí           |
      | >3% duplicación            | Sí           |
      | Funciones casi idénticas   | Sí           |
    Y se corrige: "Extraer a función compartida, parametrizar diferencias"

  # ─────────────────────────────────────────────────────────────
  # 7. PREMATURE OPTIMIZATION
  # ─────────────────────────────────────────────────────────────

  Escenario: Detectar premature optimization
    Dado que se analiza código optimizado prematuramente
    Cuando se evalúa
    Entonces se identifica si:
      | Criterio                   | Premature?   |
      | Código complejo sin beneficio medible | Sí |
      | Optimización sin profile   | Sí           |
      | Micro-optimización         | Sí           |
    Y se corrigo: "Medir primero, optimizar después"

  # ─────────────────────────────────────────────────────────────
  # 8. MAGIC NUMBERS / STRINGS
  # ─────────────────────────────────────────────────────────────

  Escenario: Detectar magic numbers
    Dado que se busca números hardcodeados
    Cuando se inspecciona código
    Entonces se identifica:
      | Ejemplo                     | Problema       |
      | (if status == 3)           | ¿Qué es 3?     |
      | Thread.sleep(5000)         | ¿Por qué 5000? |
      | (if age > 65)              | ¿Por qué 65?   |
    Y se corrige: "Definir constantes con nombres descriptivos"

  # ─────────────────────────────────────────────────────────────
  # 9. FEATURE ENVY
  # ─────────────────────────────────────────────────────────────

  Escenario: Detectar Feature Envy
    Dado que se analiza acoplamiento entre clases
    Cuando se evalúa
    Entonces se identifica si:
      | Criterio                   | Feature Envy? |
      | Clase A usa excesivamente métodos de Clase B | Sí |
      | Clase A debería ser parte de Clase B | Sí |
    Y se corrige: "Mover método a la clase que más lo usa"

  # ─────────────────────────────────────────────────────────────
  # 10. SHOTGUN SURGERY
  # ─────────────────────────────────────────────────────────────

  Escenario: Detectar Shotgun Surgery
    Dado que se analiza esfuerzo de cambios
    Cuando se evalúa
    Entonces se identifica si:
      | Criterio                   | Shotgun?     |
      | Un cambio requiere modificar 5+ archivos | Sí |
      | Archivos no relacionados    | Sí          |
    Y se corrige: "Consolidar en módulo cohesivo"
