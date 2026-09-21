# language: es
# @id GHE-AGENDA-DDD-001
# @type contract
# @domain agenda
# @layer development
# @risk s2
# @owner dev-lead
# @status proposed
@domain:agenda @type:contract @risk:s2 @status:proposed
Característica: Data-Driven Development para la Agenda
  Como desarrollador Clojure del proyecto GHE
  Quiero que la agenda se defina como datos puros
  Para que los agentes de IA puedan procesar el estado de forma funcional

  Contexto:
    Dado que Clojure representa todo como estructuras de datos inmutables
    Y que los agentes de IA necesitan leer y transformar estado

  Escenario: Agenda como mapa de datos puros
    Dado que se representa la agenda como mapa Clojure
    Cuando se inspecciona
    Entonces contiene:
      | Campo                      | Tipo |
      | :agenda/date              | inst |
      | :agenda/appointments      | vector de maps |
      | :agenda/resources         | map de recursos |
      | :agenda/constraints       | map de restricciones |

  Escenario: Agente lee estado de la agenda
    Dado que un agente necesita ver la agenda
    Cuando accede al estado
    Entonces puede:
      | Acción                    |
      | Obtener mapa completo     |
      | Filtrar por médico        |
      | Filtrar por tipo           |
      | Filtrar por estado         |
      | Calcular métricas         |

  Escenario: Agente modifica estado de la agenda
    Dado que un agente necesita reprogramar una cita
    Cuando modifica el estado
    Entonces usa operaciones puras:
      | Operación                  | Resultado |
      | assoc-in [:agenda/appointments 0 :status] :cancelled | Nuevo mapa |
      | update-in [:agenda/statistics :cancellations] inc | Contador +1 |
      | conj [:agenda/events] {:type :cancellation | Nuevo evento |

  Escenario: Validación de estado con clojure.spec
    Dado que se valida el estado de la agenda
    Cuando se ejecuta s/valid?
    Entonces:
      | Verificación              | Estado  |
      | Cada cita tiene campos requeridos | ✅ |
      | Estados son keywords válidos | ✅     |
      | Horarios no se solapan    | ✅       |
      | Recursos asignados existen | ✅       |
  