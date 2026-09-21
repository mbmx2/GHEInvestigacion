# language: es
# @id GHE-AGENDA-CASCADE-001
# @type acceptance
# @domain agenda
# @layer domain
# @risk s1
# @owner architect
# @status proposed
@domain:agenda @type:acceptance @risk:s1 @status:proposed
Característica: Cascada de Tareas desde la Agenda
  Como administrador del hospital
  Quiero que cada evento de agenda genere subtareas automáticas
  Para que ningún paso se olvide en la atención al paciente

  Contexto:
    Dado que la agenda es el motor de workflows
    Y que cada evento médico tiene consecuencias administrativas

  Escenario: Cirugía programada dispara verificaciones
    Dado que se programa una colecistectomía
    Cuando se activa la tarea
    Entonces la agenda verifica:
      | Verificación               | Agente |
      | Stock de instrumental quirúrgico | Inventario |
      | Anestésicos disponibles    | Farmacia |
      | Quirófano limpio           | Limpieza |
      | Personal asignado          | RRHH     |
      | Preautorización de seguro  | Facturación |
      | Ayuno del paciente         | Enfermería |
    Y si falta algo → alerta + alternativas

  Escenario: Consulta programada genera seguimiento
    Dado que el paciente acude a control prenatal
    Cuando se completa la consulta
    Entonces la agenda programa:
      | Seguimiento                | Plazo |
      | Próximo control            | 4 semanas |
      | Estudios pendientes        | Según protocolo |
      | Recordatorio al paciente   | 48h antes |
      | Actualización de inventario| Medicamentos usados |

  Escenario: Laboratorio genera resultado
    Dado que se procesa un estudio de laboratorio
    Cuando el resultado está disponible
    Entonces la agenda:
      | Acción                    |
      | Notifica al médico        |
      | Registra en expediente    |
      | Alerta si valor crítico   |
      | Programa seguimiento      |

  Escenario: Emergencia interrumpe agenda
    Dado que llega una emergencia obstétrica
    Cuando se activa protocolo
    Entonces la agenda:
      | Acción                    |
      | Reorganiza citas afectadas |
      | Notifica a pacientes reprogramados |
      | Asigna recursos de emergencia |
      | Registra como evento urgente |
