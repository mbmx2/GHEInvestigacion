# language: es
# @id GHE-ISACA-COBIT-003
# @type business-rule
# @domain governance
# @layer performance
# @risk s2
# @owner governance-director
# @status proposed
# @requirement REQ-COBIT-003
# @risk-control CTRL-COBIT-003
# @regulation COBIT-2019
@domain:isaca @type:business-rule @risk:s2 @status:proposed
Característica: COBIT 2019 — Gestión de Desempeño de TI
  Como director de TI
  Quiero medir y gestionar el desempeño de TI conforme COBIT 2019
  Para que la inversión en TI demuestre valor tangible al hospital

  Regla: Capacidad de procesos se evalúa

    Escenario: Niveles de capacidad COBIT
      Dado que se evalúa capacidad de un proceso de TI
      Cuando se mide contra niveles COBIT
      Entonces se clasifica:
        | Nivel | Descripción                        |
        | 0     | Proceso incompleto                 |
        | 1     | Proceso realizado                  |
        | 2     | Proceso gestionado                 |
        | 3     | Proceso establecido                |
        | 4     | Proceso predecible                 |
        | 5     | Proceso en mejora continua         |

    Escenario: Evaluación de proceso crítico
      Dado que se evalúa proceso GOV05 (Política de TI)
      Cuando se mide capacidad
      Entonces se verifica:
        | Criterio                      | Nivel mínimo |
        | Política documentada          | Nivel 2      |
        | Política comunicada           | Nivel 2      |
        | Política monitoreada          | Nivel 3      |
        | Política optimizada           | Nivel 4      |

  Regla: KPIs de procesos se definen

    Escenario: Indicadores de desempeño de procesos
      Dado que se definen KPIs para procesos TI
      Cuando se monitorean
      Entonces se mide:
        | Proceso           | KPI                         | Meta    |
        | GOV01             | Evaluaciones completadas    | 100%    |
        | AED08             | SLAs cumplidos              | >95%    |
        | AED11             | Incidentes de seguridad     | <5/mes  |
        | AED15             | Tiempo de resolución        | <4h     |
        | AED23             | Pruebas de continuidad      | 2/año   |

  Regla: Benchmarking se realiza

    Escenario: Comparación con pares
      Dado que se realiza benchmarking
      Cuando se comparan métricas
      Entonces se usa:
        | Fuente                       |
        | Estándares de la industria   |
        | Resultados de pares          |
        | Mejores prácticas COBIT      |
        | Objetivos del hospital       |

  Regla: Desempeño se reporta a gobierno

    Escenario: Reporte de desempeño trimestral
      Dado que comité necesita visibilidad
      Cuando se genera reporte de desempeño
      Entonces incluye:
        | Sección                    |
        | Resumen de capacidad       |
        | Tendencias de KPIs         |
        | Procesos por debajo de meta|
        | Acciones correctivas       |
        | Inversión en mejoras       |
