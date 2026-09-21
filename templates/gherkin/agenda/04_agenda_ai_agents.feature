# language: es
# @id GHE-AGENDA-AI-001
# @type business-rule
# @domain agenda
# @layer operations
# @risk s1
# @owner architect
# @status review
# @requirement REQ-AGENDA-003
# @risk-control CTRL-AGENDA-003
# @regulation NOM-024
@domain:agenda @type:business-rule @risk:s1 @status:review
Característica: Agentes de IA en la Agenda Digital
  Como director del hospital
  Quiero agentes de IA que monitoreen y asistan con la agenda
  Para automatizar tareas repetitivas sin comprometer seguridad

  Regla: El agente puede consultar el estado de la agenda

    Escenario: Agente consulta disponibilidad de quirófanos
      Dado que hay 3 quirófanos registrados
      Cuando el agente verifica disponibilidad
      Entonces puede ver:
        | Quirófano | Estado actual | Próxima cirugía |
        | Sala 1    | Ocupada       | Colectomía 10:00 |
        | Sala 2    | Disponible    | Ninguna          |
        | Sala 3    | En limpieza   | Apendicectomía 14:00 |
      # @evidence EVID-AGENDA-050: Agente accede a datos de disponibilidad

    Escenario: Agente no puede acceder a datos clínicos
      Dado que se consulta al agente de agenda
      Cuando se le pide información de diagnósticos
      Entonces responde que no tiene acceso a esa información
      # @evidence EVID-AGENDA-051: Acceso denegado + respuesta informativa
      # @invariante INV-AGENDA-008

  Regla: El agente puede sugerir pero no ejecutar acciones críticas

    Escenario: Agente sugiere reprogramación
      Dado que hay dos cirugías programadas en el mismo quirófano
      Cuando el agente detecta el conflicto
      Entonces presenta alternativas al personal autorizado
      Y no modifica la agenda automáticamente
      Y espera aprobación explícita antes de ejecutar
      # @evidence EVID-AGENDA-052: Alternativas presentadas + sin modificación automática

    Escenario: Agente ejecuta acción de bajo riesgo
      Dado que una cita fue cancelada por el paciente
      Cuando el agente detecta la cancelación
      Entonces puede automáticamente liberar el espacio en agenda
      Y notificar la cancelación
      Y registra la acción ejecutada
      # @evidence EVID-AGENDA-053: Acción de bajo riesgo ejecutada + registrada

    Escenario: Agente rechaza ejecutar acción crítica
      Dado que el agente detecta una cirugía con riesgo
      Cuando se le pide cancelar la cirugía
      Entonces el agente no ejecuta la cancelación
      Y solicita aprobación de una persona autorizada
      Y documenta la solicitud
      # @evidence EVID-AGENDA-054: Acción rechazada + aprobación solicitada

  Regla: Los datos clínicos solo los modifica personal autorizado

    Escenario: Agente no modifica expediente clínico
      Dado que un agente detecta un resultado de laboratorio crítico
      Cuando notifica al médico
      Entonces el agente notifica y muestra el resultado
      Y no modifica diagnóstico ni tratamiento
      Y solo el personal clínico autorizado puede modificar datos clínicos
      # @evidence EVID-AGENDA-055: Notificación sin modificación

    Escenario: Agente sugiere acción que requiere aprobación clínica
      Dado que un agente detecta que un paciente necesita referencia
      Cuando el agente presenta la recomendación
      Entonces el agente no ejecuta la referencia
      Y solicita aprobación del médico tratante
      # @evidence EVID-AGENDA-056: Recomendación + solicitud de aprobación

  Regla: Toda interacción del agente queda registrada

    Escenario: Agente procesa solicitud de usuario
      Dado que la recepcionista pide al agente buscar un hueco
      Cuando el agente procesa la solicitud
      Entonces se registra:
        | Campo                      |
        | Input del usuario         |
        | Acción sugerida           |
        | Acción ejecutada (si aplica) |
        | Resultado                 |
        | Tiempo de respuesta       |
        | Datos sensibles filtrados |
      # @evidence EVID-AGENDA-057: Interacción completa registrada

  Regla: Cada agente tiene un alcance definido

    Escenario: Agente de inventario solo gestiona stock
      Dado que se consulta al agente de inventario
      Cuando se le pide información de expedientes clínicos
      Entonces responde que no tiene acceso a esa información
      Y no intenta acceder a datos fuera de su alcance
      # @evidence EVID-AGENDA-058: Acceso denegado por alcance

    Escenario: Agente conversacional interpreta lenguaje natural
      Dado que la recepcionista dice "Busca hueco para el Dr. Ríos el viernes"
      Cuando el agente procesa la solicitud
      Entonces interpreta la intención
      Y consulta la agenda del Dr. Ríos
      Y muestra huecos disponibles
      Y espera confirmación antes de agendar
      Y registra la interacción completa
      # @evidence EVID-AGENDA-059: Interpretación + consulta + confirmación pendiente

    Escenario: Agente ante ambigüedad
      Dado que el usuario dice "agenda algo para el martes" sin especificar médico
      Cuando el agente procesa la solicitud
      Entonces solicita aclaración al usuario
      Y no ejecuta ninguna acción
      Y espera respuesta antes de continuar
      # @evidence EVID-AGENDA-060: Solicitud de aclaración + sin acción

    Escenario: Agente ante error
      Dado que el agente no puede acceder a la agenda
      Cuando ocurre un error
      Entonces informa al usuario que no puede procesar la solicitud
      Y sugiere una alternativa (ej: llamar a recepción)
      Y registra el error
      # @evidence EVID-AGENDA-061: Error informado + alternativa + registro

  Regla: El agente opera bajo principio de mínimo privilegio

    Escenario: Agente no accede a datos innecesarios
      Dado que el agente de agenda necesita verificar inventario
      Cuando solicita información de farmacia
      Entonces farmacia solo comparte stock de insumos
      Y no comparte precios ni proveedores
      # @evidence EVID-AGENDA-062: Acceso mínimo verificado

    Escenario: Agente opera con datos pseudonimizados
      Dado que el agente procesa información de pacientes
      Cuando necesita identificar un paciente
      Entonces usa ID interno, no nombre completo ni CURP
      Y no almacena datos sensibles en sus logs
      # @evidence EVID-AGENDA-063: Pseudonimización verificada
      # @invariante INV-AGENDA-009

  Regla: El agente offline opera con datos locales

    Escenario: Agente funciona sin conectividad
      Dado que no hay conexión a internet
      Cuando el agente procesa una solicitud
      Entonces usa datos locales
      Y no accede a servicios externos
      Y registra la operación como local
      # @evidence EVID-AGENDA-064: Operación local sin servicios externos
