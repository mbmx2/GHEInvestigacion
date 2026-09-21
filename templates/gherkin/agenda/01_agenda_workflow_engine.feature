# language: es
# @id GHE-AGENDA-CORE-001
# @type acceptance
# @domain agenda
# @layer domain
# @risk s1
# @owner architect
# @status proposed
@domain:agenda @type:acceptance @risk:s1 @status:proposed
Característica: Agenda como Motor de Workflows
  Como director del hospital
  Quiero que la agenda digital sea el motor central de todos los flujos
  Para que cada evento médico detone automáticamente las tareas administrativas

  Contexto:
    Dado que el hospital tiene áreas clínicas y administrativas
    Y que la agenda digital es la herramienta principal

  Escenario: Evento de agenda dispara cascada de tareas
    Dado que se agenda una cirugía para el Dr. Ríos el viernes
    Cuando cambia el estado a :scheduled
    Entonces la agenda dispara subtareas:
      | Subtarea                    | Agente responsable |
      | Verificar stock de insumos | Agente inventario  |
      | Alertar si falta algo      | Agente farmacia    |
      | Validar preautorización    | Agente facturación |
      | Asignar quirófano          | Agente operaciones |
      | Asignar personal           | Agente RRHH        |
      | Notificar paciente         | Agente comunicación|

  Escenario: Cancellation dispara reversión
    Dado que una cirugía está :in-progress
    Cuando el paciente cancela
    Entonces la agenda revierte:
      | Subtarea                    | Acción |
      | Liberar quirófano          | Disponible |
      | Liberar personal           | Reasignable |
      | Notificar aseguradora      | Cancelar preauth |
      | Notificar paciente         | Confirmación |

  Escenario: Agenda como fuente de verdad
    Dado que múltiples áreas consultan la agenda
    Cuando se verifica
    Entonces:
      | Área                        | Qué consulta |
      | Clínica                    | Citas del médico |
      | Farmacia                   | Medicamentos programados |
      | Cirugía                    | Quirófanos disponibles |
      | Laboratorio               | Estudios pendientes |
      | Facturación               | Procedimientos realizados |
      | RRHH                       | Horarios del personal |
    Y todos ven la misma versión de la agenda (single source of truth)
