# language: es
# @id GHE-AGENDA-RDD-001
# @type acceptance
# @domain agenda
# @layer development
# @risk s2
# @owner dev-lead
# @status proposed
# @requirement REQ-AGENDA-005
# @regulation N/A
@domain:agenda @type:acceptance @risk:s2 @status:proposed
Característica: REPL-Driven Development para la Agenda
  Como desarrollador del proyecto GHE
  Quiero iterar sobre la lógica de la agenda en entorno interactivo
  Para probar comportamientos sin reiniciar el sistema

  # ─────────────────────────────────────────────────────────────
  # REGLA 1: Toda lógica de agente debe ser probable en entorno vivo
  # ─────────────────────────────────────────────────────────────

  Regla: El comportamiento de la agenda debe ser evaluable en tiempo real

    Escenario: Probar función de reprogramación en entorno vivo
      Dado que se tiene el estado actual de la agenda
      Cuando se evalúa una función de reprogramación
      Entonces se puede ver el resultado inmediatamente
      Y si el resultado es incorrecto se modifica y re-evalúa
      Y no se necesita reiniciar el sistema
      # @evidence EVID-AGENDA-040

    Escenario: Simular escenario completo
      Dado que se simula un día completo de agenda
      Cuando se ejecuta en entorno vivo
      Entonces se puede observar:
        | Paso                       |
        | Carga del estado actual   |
        | Simulación de llegadas    |
        | Respuesta del sistema     |
        | Cascada de tareas         |
        | Resultado final           |
      Y se puede modificar el escenario y re-ejecutar

    Escenario: Probar edge case de dos cirugías simultáneas
      Dado que se quiere probar qué pasa si dos cirugías se solapan
      Cuando se crea el escenario en entorno vivo
      Entonces se verifica:
        | Verificación              |
        | Detección del solapamiento |
        | Alerta generada           |
        | Sugerencia de resolución  |
        | Sin corrupción de datos   |

  # ─────────────────────────────────────────────────────────────
  # REGLA 2: Las pruebas en entorno vivo no deben afectar datos reales
  # ─────────────────────────────────────────────────────────────

  Regla: Las simulaciones usan datos ficticios

    Escenario: Simulación con datos de prueba
      Dado que se ejecuta una simulación
      Cuando se verifica
      Entonces:
        | Verificación              | Estado  |
        | Datos son ficticios       | ✅       |
        | No modifican producción   | ✅       |
        | Se pueden repetir         | ✅       |
        | Son reversibles           | ✅       |
