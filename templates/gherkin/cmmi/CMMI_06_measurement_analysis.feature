# language: es
# @id GHE-CMMI-MA-001
# @type compliance
# @domain process
# @layer support
# @risk s2
# @owner qa-lead
# @status proposed
# @requirement CMMI-MA
# @risk-control CTRL-CMMI-MA
# @regulation N/A
@domain:process @type:compliance @risk:s2 @status:proposed
Característica: CMMI - Medición y Análisis (MA)
  Como responsable de métricas del proyecto GHE
  Quiero que las métricas se midan y analicen según CMMI
  Para que cada decisión se base en datos verificables

  Regla: Las métricas se definen antes de medir

    Escenario: Definición de métricas
      Dado que se establecen métricas del proyecto
      Cuando se definen
      Entonces incluyen:
        | Categoría                  | Métrica |
        | Calidad                    | Cobertura, defectos, deuda |
        | Productividad             | Velocity, lead time |
        | Proceso                   | Ciclo de cambios, revisión |
        | Seguridad                 | Vulnerabilidades, incidentes |
      # @evidence EVID-CMMI-MA-001

  Regla: Las métricas se recogen automáticamente

    Escenario: Recolección automática
      Dado que se ejecutan métricas
      Cuando se mide
      Entonces se usan herramientas automáticas:
        | Herramienta               | Métrica |
        | clojure.test              | Cobertura, tests |
        | clj-kondo                 | Code smells |
        | Git                       | Commits, PRs |
        | validate_features.sh      | Features |
      # @evidence EVID-CMMI-MA-002

  Regla: Las métricas se analizan periódicamente

    Escenario: Análisis mensual
      Dado que se analizan métricas
      Cuando se evalúa
      Entonces se compara con targets
      Y se identifican tendencias
      Y se generan acciones correctivas
      # @evidence EVID-CMMI-MA-003

  Regla: Las métricas se reportan

    Escenario: Reporte de métricas
      Dado que se genera reporte
      Cuando se consulta
      Entonces incluye:
        | Sección                   |
        | Estado actual vs. targets |
        | Tendencias                |
        | Acciones correctivas     |
        | Pronóstico               |
      # @evidence EVID-CMMI-MA-004
