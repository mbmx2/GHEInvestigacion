# language: es
# @id GHE-CMMI-CM-001
# @type compliance
# @domain process
# @layer support
# @risk s2
# @owner dev-lead
# @status proposed
# @requirement CMMI-CM
# @risk-control CTRL-CMMI-CM
# @regulation N/A
@domain:process @type:compliance @risk:s2 @status:proposed
Característica: CMMI - Gestión de Configuración (CM)
  Como responsable de CM del proyecto GHE
  Quiero gestión de configuración según CMMI
  Para que cada cambio sea rastreable y controlado

  Regla: Todo elemento de configuración está identificado

    Escenario: Identificación de configuración
      Dado que se identifican elementos de configuración
      Cuando se registra
      Entonces:
        | Elemento                    | Método |
        | Código fuente              | Git    |
        | Documentos                | Git    |
        | Features Gherkin          | Git    |
        | Configuración             | Git    |
        | Tests                     | Git    |
      # @evidence EVID-CMMI-CM-001

  Regla: Los cambios se controlan

    Escenario: Control de cambios
      Dado que se solicita un cambio
      Cuando se evalúa
      Entonces:
        | Paso                       |
        | Documentar el cambio       |
        | Evaluar impacto           |
        | Aprobar antes de implementar |
        | Implementar con review    |
        | Verificar que no rompe    |
      # @evidence EVID-CMMI-CM-002

  Regla: La configuración se audita

    Escenario: Auditoría de configuración
      Dado que se audita configuración
      Cuando se verifica
      Entonces:
        | Verificación              |
        | Cada CI tiene ID único   |
        | No hay duplicados        |
        | Versiones consistentes   |
        | Pendientes documentados  |
      # @evidence EVID-CMMI-CM-003

  Regla: El estado de configuración se reporta

    Escenario: Reporte de estado
      Dado que se genera reporte
      Cuando se consulta
      Entonces incluye:
        | Métrica                    |
        | CIs activos              |
        | CIs pendientes           |
        | Cambios este período     |
        | Auditorías realizadas    |
      # @evidence EVID-CMMI-CM-004
