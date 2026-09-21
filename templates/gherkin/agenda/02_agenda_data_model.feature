# language: es
# @id GHE-AGENDA-EVENT-001
# @type contract
# @domain agenda
# @layer domain
# @risk s1
# @owner architect
# @status proposed
@domain:agenda @type:contract @risk:s1 @status:proposed
Característica: Modelo de Datos de la Agenda como Mapas Puros
  Como desarrollador Clojure del proyecto GHE
  Quiero que la agenda se represente como mapas inmutables
  Para que los agentes de IA puedan procesar el estado de forma funcional

  Contexto:
    Dado que Clojure es funcional y orientado a datos
    Y que la agenda es el motor de workflows

  Escenario: Estructura de un evento en la agenda
    Dado que se crea un evento en la agenda
    Cuando se define como mapa Clojure
    Entonces tiene:
      | Campo                      | Tipo |
      | :appointment/id           | uuid |
      | :appointment/patient      | map con patient/id y patient/name |
      | :appointment/type         | keyword (:surgery, :consultation, :lab) |
      | :appointment/status       | keyword (:scheduled, :in-progress, :completed) |
      | :appointment/resource-requirements | map con room, staff, supplies |
      | :appointment/billing      | map con insurance-provider, pre-auth |
      | :appointment/clinical-data| map con diagnóstico, procedimiento |
      | :appointment/created-at   | inst |
      | :appointment/updated-at   | inst |

  Escenario: Transformación de estados
    Dado que un evento tiene estado :scheduled
    Cuando cambia a :in-progress
    Entonces el sistema:
      | Acción                          |
      | Actualiza :appointment/status |
      | Registra timestamp de cambio |
      | Emite evento :appointment-status-changed |
      | Dispara subtareas según el tipo |

  Escenario: Inmutabilidad de la agenda
    Dado que se modifica un evento
    Cuando se aplica assoc
    Entonces el mapa original NO se modifica
    Y se crea un nuevo mapa con el cambio
    Y el timestamp se actualiza
    Y el evento anterior queda en historial

  Escenario: Consistencia de la agenda
    Dado que dos agentes modifican la agenda simultáneamente
    Cuando se resuelve conflicto
    Entonces se usa transacción:
      | Paso                       |
      | 1. Leer estado actual      |
      | 2. Calcular resultado      |
      | 3. Verificar invariantes   |
      | 4. Escribir nuevo estado   |
      | 5. Registrar en historial  |
