# language: es
# @id GHE-AGENDA-CASCADE-001
# @type business-rule
# @domain agenda
# @layer operations
# @risk s1
# @owner medical-director
# @status review
# @requirement REQ-AGENDA-002
# @risk-control CTRL-AGENDA-002
# @regulation NOM-024
@domain:agenda @type:business-rule @risk:s1 @status:review
Característica: Cascada de Tareas desde la Agenda
  Como administrador del hospital
  Quiero que cada evento de agenda genere subtareas automáticas
  Para que ningún paso se olvide en la atención al paciente

  Regla: Programar una cirugía genera subtareas de verificación

    Escenario: Cirugía programada genera verificación de insumos
      Dado que se programa una colecistectomía para el viernes
      Cuando la cirugía cambia a estado "programada"
      Entonces se generan subtareas automáticas:
        | Subtarea                    | Área responsable |
        | Verificar stock de kit quirúrgico | Farmacia |
        | Verificar anestésicos     | Farmacia            |
        | Verificar quirófano limpio| Limpieza            |
        | Verificar personal asignado | RRHH             |
        | Verificar preautorización | Facturación         |
      # @evidence EVID-AGENDA-030: 5 subtareas generadas con áreas asignadas

    Escenario: Faltan insumos críticos para cirugía
      Dado que se programa una cirugía
      Y el stock de anestésico es 0
      Cuando se generan las subtareas
      Entonces la subtarea de verificación de anestésicos muestra estado "crítico"
      Y se genera alerta urgente a farmacia
      Y se bloquea la confirmación de la cirugía
      # @evidence EVID-AGENDA-031: Alerta crítica + bloqueo de confirmación

    Escenario: Cancelación revierte subtareas
      Dado que una cirugía tiene subtareas generadas
      Cuando se cancela la cirugía
      Entonces todas las subtareas asociadas se cancelan
      Y los recursos asignados se liberan
      Y se notifica a las áreas afectadas
      # @evidence EVID-AGENDA-032: Subtareas canceladas + recursos liberados

  Regla: Completar una consulta genera tareas de seguimiento

    Escenario: Consulta de rutina genera seguimiento
      Dado que se completa una consulta de control prenatal
      Cuando se registra el resultado
      Entonces se programan subtareas:
        | Subtarea                    | Plazo |
        | Próximo control prenatal   | Según protocolo clínico |
        | Estudios pendientes        | Según indicación médica |
        | Recordatorio al paciente  | 48 horas antes del próximo control |
      # @evidence EVID-AGENDA-033: 3 subtareas programadas con plazos

    Escenario: Consulta de emergencia genera referencia
      Dado que se detecta una complicación en consulta
      Cuando se clasifica como emergencia
      Entonces se genera subtarea de referencia inmediata
      Y se notifica al área de referencia
      # @evidence EVID-AGENDA-034: Referencia generada + notificación

    Escenario: Seguimiento no se genera si consulta fue cancelada
      Dado que una consulta fue cancelada por el paciente
      Cuando se procesa la cancelación
      Entonces no se generan subtareas de seguimiento
      Y no se envían recordatorios al paciente
      # @evidence EVID-AGENDA-035: Sin subtareas generadas

  Regla: Una emergencia puede reorganizar la agenda priorizando

    Escenario: Emergencia interrumpe agenda programada
      Dado que hay citas programadas para las 10:00, 11:00 y 14:00
      Cuando llega una emergencia obstétrica a las 10:30
      Entonces la emergencia toma prioridad inmediata
      Y las citas de 10:00-12:00 se reevalúan
      Y se notifica a los pacientes afectados
      Y se registran los motivos de reprogramación
      # @evidence EVID-AGENDA-036: Reorganización + notificaciones + registro

    Escenario: Dos emergencias simultáneas compiten por recursos
      Dado que hay dos emergencias activas
      Y ambas requieren el mismo quirófano
      Cuando se evalúa asignación
      Entonces la más crítica (por escala de triaje) toma prioridad
      Y la segunda se reprograma o se deriva
      Y se documenta la decisión
      # @evidence EVID-AGENDA-037: Priorización + derivación + documentación

    Escenario: Cancelación de reprogramación por emergencia
      Dado que una cirugía fue reprogramada por emergencia
      Cuando la emergencia se resuelve antes de la reprogramación
      Entonces se restaura la cirugía original
      Y se notifica al paciente
      # @evidence EVID-AGENDA-038: Restauración + notificación
      # @invariante INV-AGENDA-007

  Regla: Un resultado de laboratorio disponible genera notificación

    Escenario: Resultado crítico genera alerta inmediata
      Dado que el laboratorio procesa una biometría hemática
      Y el resultado muestra hemoglobina de 6.0 g/dL
      Cuando el resultado queda disponible
      Entonces se genera alerta inmediata al médico solicitante
      Y se registra como "valor crítico"
      Y se notifica al sistema de auditoría
      # @evidence EVID-AGENDA-039: Alerta + registro crítico + auditoría

    Escenario: Resultado normal genera seguimiento
      Dado que el laboratorio procesa un urocultivo
      Y el resultado es negativo
      Cuando el resultado queda disponible
      Entonces se notifica al médico solicitante
      Y se registra como "resultado normal"
      # @evidence EVID-AGENDA-040: Notificación + registro

  Regla: Cada subtarea generada registra su origen

    Escenario: Auditoría de cascada
      Dado que una cirugía generó 5 subtareas
      Cuando se audita la cascada
      Entonces cada subtarea tiene:
        | Campo                      |
        | ID de subtarea            |
        | Evento que la generó      |
        | Fecha de generación       |
        | Área responsable          |
        | Estado actual             |
        | Relación con evento padre |
      # @evidence EVID-AGENDA-041: Trazabilidad completa de cascada

  Regla: La cascada opera offline

    Escenario: Generación de subtareas sin internet
      Dado que no hay conexión a internet
      Cuando se programa una cirugía
      Entonces las subtareas se generan localmente
      Y se marcan como pendientes de sincronización
      Y cuando se reconecta se sincronizan
      # @evidence EVID-AGENDA-042: Subtareas locales + estado pendiente

    Escenario: Sincronización de subtareas tras reconexión
      Dado que hay subtareas pendientes de sincronización
      Cuando se recupera la conexión
      Entonces las subtareas se sincronizan
      Y se verifica que no se duplicaron
      # @evidence EVID-AGENDA-043: Subtareas sincronizadas sin duplicación
