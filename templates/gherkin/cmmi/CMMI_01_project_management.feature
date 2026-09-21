# language: es
# @id GHE-CMMI-PP-001
# @type compliance
# @domain process
# @layer governance
# @risk s1
# @owner project-manager
# @status proposed
# @requirement CMMI-PP
# @risk-control CTRL-CMMI-PP
# @regulation N/A
@domain:process @type:compliance @risk:s1 @status:proposed
Característica: CMMI - Gestión de Proyectos (PP + PMC)
  Como director del proyecto GHE
  Quiero que la gestión del proyecto siga prácticas CMMI
  Para que cada entregable sea predecible, medible y controlado

  Regla: Todo proyecto tiene un plan documentado

    Escenario: Plan de proyecto completo
      Dado que se inicia una fase del proyecto
      Cuando se planifica
      Entonces incluye:
        | Elemento                    |
        | Alcance definido           |
        | Cronograma con hitos       |
        | Recursos asignados        |
        | Presupuesto estimado      |
        | Riesgos identificados    |
        | Dependencias             |
        | Criterios de aceptación  |
      # @evidence EVID-CMMI-PP-001

  Regla: El avance se mide y reporta

    Escenario: Seguimiento de avance
      Dado que el proyecto está en ejecución
      Cuando se mide avance
      Entonces se compara:
        | Métrica                    |
        | Avance real vs. planificado |
        | Presupuesto gastado vs. estimado |
        | Velocidad del equipo       |
        | Calidad del código        |
      # @evidence EVID-CMMI-PP-002

    Escenario: Desviación detectada
      Dado que hay desviación >10% del plan
      Cuando se detecta
      Entonces se evalúa causa
      Y se toma acción correctiva
      Y se actualiza el plan

  Regla: Los riesgos se gestionan continuamente

    Escenario: Registro de riesgos
      Dado que se identifica un riesgo
      Cuando se registra
      Entonces incluye:
        | Campo                      |
        | Descripción               |
        | Probabilidad              |
        | Impacto                   |
        | Mitigación                |
        | Responsable               |
        | Estado                    |
      # @evidence EVID-CMMI-PP-003

    Escenario: Revisión de riesgos
      Dado que se revisa register de riesgos
      Cuando se evalúa
      Entonces cada riesgo tiene:
        | Verificación              |
        | Estado actualizado        |
        | Mitigación implementada   |
        | Nuevos riesgos identificados |

  Regla: El cronograma se actualiza con cambios

    Escenario: Cambio de cronograma
      Dado que un entregable requiere más tiempo
      Cuando se evalúa impacto
      Entonces se actualiza cronograma
      Y se notifica a stakeholders
      Y se documenta la decisión
