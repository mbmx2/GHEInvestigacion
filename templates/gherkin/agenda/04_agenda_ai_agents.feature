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
Característica: Agentes de IA como Consultores Exclusivamente Informativos
  Como director del hospital
  Quiero agentes de IA que informen y asistan con la agenda
  Para que el personal humano tome decisiones mejor informadas

  Regla: El agente de IA no puede modificar el estado del sistema

    Escenario: El agente informa sobre disponibilidad
      Dado que existen quirófanos con diferentes estados
      Cuando el usuario solicita conocer la disponibilidad
      Entonces el agente muestra la información autorizada
      Y no modifica ningún dato
      Y registra la consulta realizada
      # @evidence EVID-AGENDA-050

    Escenario: El agente propone una reprogramación
      Dado que existe un conflicto de agenda
      Cuando el agente analiza el conflicto
      Entonces presenta una o más alternativas
      Y explica las consecuencias de cada alternativa
      Y no reprograma la cita
      Y no modifica la agenda
      Y deja la decisión al personal autorizado
      # @evidence EVID-AGENDA-051

  Regla: Las decisiones críticas pertenecen al personal humano

    Escenario: El agente detecta cirugía que requiere revisión
      Dado que una cirugía presenta conflicto o condición crítica
      Cuando el agente analiza la información
      Entonces informa el problema
      Y genera propuesta para revisión
      Y no confirma la cirugía
      Y no cancela la cirugía
      Y no modifica su programación
      Y notifica al responsable humano autorizado
      # @evidence EVID-AGENDA-052

    Escenario: El agente informa resultado crítico
      Dado que un resultado de laboratorio es crítico
      Cuando el agente lo detecta
      Entonces genera alerta con el resultado
      Y explica implicaciones
      Y recomienda acciones
      Y no modifica diagnóstico ni tratamiento
      # @evidence EVID-AGENDA-053

  Regla: El agente no puede comprometer recursos

    Escenario: El agente identifica necesidad de compra
      Dado que faltan insumos para procedimiento
      Cuando el agente analiza inventario
      Entonces informa la faltante
      Y puede generar propuesta de reposición
      Y no asigna presupuesto
      Y no aprueba la compra
      Y no crea orden de compra
      # @evidence EVID-AGENDA-054

  Regla: Una propuesta de IA nunca constituye una decisión ejecutada

    Escenario: El usuario solicita acción al agente
      Dado que la acción modificaría información o recursos
      Cuando el agente recibe la solicitud
      Entonces explica que no puede ejecutar la acción
      Y presenta información para que un humano decida
      Y no genera cambios persistentes
      # @evidence EVID-AGENDA-055

  Regla: El agente puede informar pero no ejecutar

    Escenario: Capacidades del agente
      Dado que el agente opera en el sistema
      Entonces puede:
        | Capacidad permitida        |
        | Consultar información      |
        | Informar resultados        |
        | Mostrar disponibilidad     |
        | Generar reportes           |
        | Detectar conflictos        |
        | Proponer horarios/recursos |
        | Explicar consecuencias     |
        | Señalar alertas            |
      Y no puede:
        | Capacidad prohibida        |
        | Crear/editar/eliminar datos|
        | Confirmar/cancelar cirugías|
        | Asignar recursos           |
        | Modificar expedientes      |
        | Autorizar compras          |
        | Cambiar protocolos         |
        | Cambiar permisos           |
        | Escribir datos persistentes|

  Regla: Toda interacción queda registrada

    Escenario: Agente procesa solicitud
      Dado que un usuario consulta al agente
      Cuando el agente procesa
      Entonces se registra:
        | Campo                      |
        | Input del usuario         |
        | Información consultada    |
        | Propuesta generada        |
        | Tiempo de respuesta       |
      Y no almacena datos sensibles en logs
      # @evidence EVID-AGENDA-056

  Regla: El agente opera bajo mínimo privilegio

    Escenario: Agente consulta disponibilidad
      Dado que se verifica acceso
      Entonces puede ver: quirófanos, horarios, citas
      Y no puede ver: diagnósticos, tratamientos, precios
      # @evidence EVID-AGENDA-057
      # @invariante INV-AGENDA-008

    Escenario: Agente opera con datos pseudonimizados
      Dado que agente necesita identificar paciente
      Cuando consulta
      Entonces usa ID interno, no nombre ni CURP
      Y no almacena datos sensibles en logs
      # @evidence EVID-AGENDA-058
      # @invariante INV-AGENDA-009

  Regla: Agente offline opera con datos locales

    Escenario: Funcionamiento sin conectividad
      Dado que no hay conexión
      Cuando agente procesa solicitud de consulta
      Entonces usa datos locales
      Y advierte que información puede no estar actualizada
      # @evidence EVID-AGENDA-059

  Regla: Agente ante errores y ambigüedad

    Escenario: Solicitud ambigua
      Dado que usuario dice "agenda algo para el martes" sin especificar médico
      Cuando agente procesa solicitud
      Entonces solicita aclaración
      Y no ejecuta ninguna acción
      Y espera respuesta
      # @evidence EVID-AGENDA-060

    Escenario: Error del sistema
      Dado que agente no puede acceder a la agenda
      Cuando ocurre error
      Entonces informa al usuario
      Y sugiere alternativa (llamar a recepción)
      Y registra el error
      # @evidence EVID-AGENDA-061

    Escenario: Información contradictoria
      Dado que agente detecta información inconsistente
      Cuando analiza discrepancia
      Entonces informa inconsistencia
      Y presenta ambas versiones
      Y no decide cuál es correcta
      # @evidence EVID-AGENDA-062
