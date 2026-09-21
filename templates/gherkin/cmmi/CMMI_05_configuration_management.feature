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
      Dado que se identifican elementos
      Cuando se registra
      Entonces cada CI tiene ID único y método de almacenamiento
      # @evidence EVID-CMMI-CM-001

    Escenario: CI sin identificar
      Dado que se detecta archivo sin versionar
      Cuando se verifica
      Entonces se agrega a Git y se documenta
      # @evidence EVID-CMMI-CM-001-N

  Regla: Los cambios se controlan

    Escenario: Control de cambios completo
      Dado que se solicita un cambio
      Cuando se evalúa
      Entonces se documenta, se aprueba, se implementa con review, se verifica
      # @evidence EVID-CMMI-CM-002

    Escenario: Cambio sin control
      Dado que se detecta cambio sin documentar
      Cuando se audita
      Entonces se registra como incidente de configuración
      # @evidence EVID-CMMI-CM-002-N

  # @invariante INV-CM-001: Todo archivo está versionado en Git
  Regla: Todo archivo está versionado

    Escenario: Archivo sin versionar
      Dado que se detecta archivo nuevo sin Git
      Cuando se verifica
      Entonces se agrega a Git y se documenta
      # @evidence EVID-CMMI-CM-003

  Regla: La configuración se audita

    Escenario: Auditoría de configuración
      Dado que se audita configuración
      Cuando se verifica
      Entonces: CIs tienen ID, no hay duplicados, versiones consistentes, pendientes documentados
      # @evidence EVID-CMMI-CM-004

  # @invariante INV-CM-002: No hay duplicados de configuración
  Regla: No hay duplicados

    Escenario: Duplicado detectado
      Dado que se detecta archivo duplicado
      Cuando se audita
      Entonces se evalúa cuál es el canonical
      Y se elimina el duplicado
      Y se documenta la decisión
      # @evidence EVID-CMMI-CM-005

  Regla: El estado se reporta

    Escenario: Reporte de estado
      Dado que se genera reporte
      Cuando se consulta
      Entonces incluye: CIs activos, pendientes, cambios este período, auditorías
      # @evidence EVID-CMMI-CM-006
