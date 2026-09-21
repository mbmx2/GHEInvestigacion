# language: es
# @id GHE-AGENDA-AI-001
# @type business-rule
# @domain agenda
# @layer operations
# @risk s1
# @owner architect
# @status proposed
# @requirement REQ-AGENDA-003
# @risk-control CTRL-AGENDA-003
# @regulation NOM-024
@domain:agenda @type:business-rule @risk:s1 @status:proposed
Característica: Agentes de IA en la Agenda Digital
  Como director del hospital
  Quiero agentes de IA que monitoreen y asistan con la agenda
  Para automatizar tareas repetitivas sin comprometer seguridad

  # ─────────────────────────────────────────────────────────────
  # REGLA 1: Un agente puede LEER información de la agenda
  # ─────────────────────────────────────────────────────────────

  Regla: El agente puede consultar el estado de la agenda

    Escenario: Agente consulta disponibilidad de quirófanos
      Dado que hay 3 quirófanos registrados
      Cuando el agente verifica disponibilidad
      Entonces puede ver:
        | Quirófano | Estado actual | Próxima cirugía |
        | Sala 1    | Ocupada       | Colectomía 10:00 |
        | Sala 2    | Disponible    | Ninguna          |
        | Sala 3    | En limpieza   | Apendicectomía 14:00 |

  # ─────────────────────────────────────────────────────────────
  # REGLA 2: Un agente puede SUGERIR pero no EJECUTAR acciones críticas
  # ─────────────────────────────────────────────────────────────

  Regla: El agente sugiere reprogramación pero no la ejecuta

    Escenario: Agente sugiere alternativa ante conflicto
      Dado que hay dos cirugías programadas en el mismo quirófano
      Cuando el agente detecta el conflicto
      Entonces presenta alternativas al personal autorizado
      Y no modifica la agenda automáticamente
      Y espera aprobación explícita antes de ejecutar
      # @evidence EVID-AGENDA-020

    Escenario: Agente ejecuta acción de bajo riesgo automáticamente
      Dado que una cita fue cancelada por el paciente
      Cuando el agente detecta la cancelación
      Entonces puede automáticamente:
        | Acción de bajo riesgo      |
        | Liberar el espacio en agenda |
        | Enviar confirmación de cancelación |
        | Actualizar contador de citas |
      Y registra la acción ejecutada
      # @invariante "Acciones de bajo riesgo se ejecutan, acciones críticas esperan aprobación"

  # ─────────────────────────────────────────────────────────────
  # REGLA 3: El agente NUNCA puede modificar datos clínicos
  # ─────────────────────────────────────────────────────────────

  Regla: Los datos clínicos solo los modifica personal autorizado

    Escenario: Agente no modifica expediente clínico
      Dado que un agente detecta un resultado de laboratorio crítico
      Cuando notifica al médico
      Entonces el agente:
        | Acción                      | Permitido |
        | Notificar al médico       | ✅ Sí     |
        | Mostrar resultado         | ✅ Sí     |
        | Modificar diagnóstico     | ❌ No     |
        | Modificar tratamiento     | ❌ No     |
        | Cancelar cita             | ❌ No     |
        | Confirmar procedimiento   | ❌ No     |
      Y solo el personal clínico autorizado puede modificar datos clínicos

  # ─────────────────────────────────────────────────────────────
  # REGLA 4: El agente registra toda interacción
  # ─────────────────────────────────────────────────────────────

  Regla: Toda interacción del agente queda registrada

    Escenario: Agente procesa solicitud de usuario
      Dado que la recepcionista pide al agente buscar un hueco
      Cuando el agente procesa la solicitud
      Entonces se registra:
        | Campo                      |
        | Input del usuario         |
        | Acción sugerida           |
        | Acción ejecutada          |
        | Resultado                 |
        | Tiempo de respuesta       |
        | Datos sensibles filtrados |

  # ─────────────────────────────────────────────────────────────
  # REGLA 5: El agente opera dentro de límites claros
  # ─────────────────────────────────────────────────────────────

  Regla: Cada agente tiene un alcance definido

    Escenario: Agente de inventario solo gestiona stock
      Dado que se consulta al agente de inventario
      Cuando se le pide información de expedientes clínicos
      Entonces responde que no tiene acceso a esa información
      Y no intenta acceder a datos fuera de su alcance
      # @invariante "Cada agente solo accede a datos dentro de su dominio"

  Escenario: Agente conversacional procesa lenguaje natural
      Dado que la recepcionista dice "Busca hueco para el Dr. Ríos el viernes"
      Cuando el agente procesa la solicitud
      Entonces:
        | Paso                       |
        | 1. Interpreta la intención |
        | 2. Consulta agenda del Dr. Ríos |
        | 3. Filtra por viernes     |
        | 4. Muestra huecos disponibles |
        | 5. Si usuario confirma → agenda |
        | 6. Si no confirma → espera |
      Y registra la interacción completa
      # @evidence EVID-AGENDA-025

  # ─────────────────────────────────────────────────────────────
  # REGLA 6: El agente no puede acceder a datos sin autorización
  # ─────────────────────────────────────────────────────────────

  Regla: El agente opera bajo principio de mínimo privilegio

    Escenario: Agente no accede a datos de otros dominios
      Dado que el agente de agenda necesita verificar inventario
      Cuando solicita información de farmacia
      Entonces la farmacia solo comparte:
        | Dato compartido           | Dato NO compartido |
        | Stock de insumos          | Precios de compra  |
        | Disponibilidad            | Proveedores         |
      Y no accede a datos que no necesita

    Escenario: Agente opera con datos pseudonimizados
      Dado que el agente procesa información de pacientes
      Cuando necesita identificar un paciente
      Entonces usa ID interno, no CURP completa
      Y no almacena datos sensibles en sus logs
      # @invariante "El agente nunca almacena CURP, diagnósticos completos o passwords"
