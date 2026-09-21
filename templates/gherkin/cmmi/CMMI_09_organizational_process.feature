# language: es
# @id GHE-CMMI-OPF-001
# @type compliance
# @domain process
# @layer governance
# @risk s2
# @owner process-lead
# @status proposed
# @requirement CMMI-OPF
# @risk-control CTRL-CMMI-OPF
# @regulation N/A
@domain:process @type:compliance @risk:s2 @status:proposed
Característica: CMMI - Enfoque de Procesos Organizacionales (OPF)
  Como responsable de procesos del proyecto GHE
  Quiero que los procesos se definan, estandaricen y mejoren continuamente
  Para que la organización aprenda de cada proyecto

  Regla: Los procesos están documentados

    Escenario: Procesos documentados
      Dado que se tiene un proceso
      Cuando se documenta
      Entonces incluye:
        | Elemento                    |
        | Propósito del proceso      |
        | Entradas y salidas        |
        | Roles y responsabilidades |
        | Criterios de calidad      |
        | Métricas                  |
      # @evidence EVID-CMMI-OPF-001

  Regla: Los procesos se estandarizan

    Escenario: Estandarización de procesos
      Dado que se tiene un proceso exitoso
      Cuando se estandariza
      Entonces se crea template reutilizable
      Y se documenta para uso en otros proyectos
      # @evidence EVID-CMMI-OPF-002

  Regla: Los procesos se mejoran continuamente

    Escenario: Mejora continua
      Dado que se ejecuta retrospectiva
      Cuando se identifican mejoras
      Entonces se implementan cambios
      Y se verifica efectividad
      Y se documenta la mejora
      # @evidence EVID-CMMI-OPF-003
