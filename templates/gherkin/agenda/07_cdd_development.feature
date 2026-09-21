# language: es
# @id GHE-AGENDA-CDD-001
# @type acceptance
# @domain agenda
# @layer development
# @risk s2
# @owner dev-lead
# @status review
# @requirement REQ-AGENDA-007
# @regulation N/A
@domain:agenda @type:acceptance @risk:s2 @status:review
Característica: Conversation-Driven Development para la Agenda
  Como desarrollador del proyecto GHE
  Quiero registrar y analizar conversaciones reales con la agenda
  Para mejorar el comportamiento de los agentes de IA

  Regla: Las interacciones con agentes quedan registradas

    Escenario: Registro de conversación con agente
      Dado que la recepcionista habla con el agente de agenda
      Cuando se procesa la interacción
      Entonces se registra:
        | Campo                      |
        | Input del usuario         |
        | Acción que intentó el agente |
        | Resultado                 |
        | Tiempo de respuesta       |
        | Datos sensibles filtrados |
      # @evidence EVID-AGENDA-090: Interacción completa registrada

  Regla: Las fallas del agente se analizan para mejorar

    Escenario: Agente no procesa correctamente una solicitud
      Dado que el agente no pudo interpretar una solicitud ambigua
      Cuando se analiza la conversación
      Entonces se identifica:
        | Elemento                   |
        | Input que causó el fallo  |
        | Respuesta incorrecta      |
        | Causa probable del fallo  |
        | Mejora sugerida           |
      # @evidence EVID-AGENDA-091: Análisis de fallo + mejora sugerida

    Escenario: Agente procesa incorrectamente por ambigüedad
      Dado que el usuario dice "reprograma algo del martes"
      Cuando el agente interpreta
      Entonces el agente solicita aclaración sobre qué reprogramar
      Y no ejecuta ninguna acción
      Y espera respuesta antes de continuar
      # @evidence EVID-AGENDA-092: Aclaración solicitada + sin acción

  Regla: Las mejoras se prueban antes de implementarse

    Escenario: Probar prompt mejorado con datos reales
      Dado que se mejoró el prompt del agente
      Cuando se prueba con conversaciones anteriores
      Entonces se compara rendimiento
      Y solo se aprueba si es superior
      # @evidence EVID-AGENDA-093: Comparación + decisión documentada

  Regla: Las conversaciones no exponen datos sensibles

    Escenario: Registro filtra datos sensibles
      Dado que se registra una conversación con el agente
      Cuando se almacena
      Entonces los datos sensibles se filtran:
        | Dato                       | Tratamiento |
        | CURP                      | Ofuscada     |
        | Nombre del paciente       | Solo ID       |
        | Diagnósticos              | No incluidos  |
        | Medicamentos              | No incluidos  |
      # @evidence EVID-AGENDA-094: Datos sensibles filtrados verificablemente

    Escenario: Historial de conversaciones es consultable
      Dado que se tienen conversaciones registradas
      Cuando se consulta el historial
      Entonces se puede filtrar por:
        | Filtro                     |
        | Fecha                     |
        | Tipo de interacción       |
        | Resultado                 |
        | Agente involucrado        |
      Y se protegen datos sensibles
      # @evidence EVID-AGENDA-095: Historial consultable + protección verificada
