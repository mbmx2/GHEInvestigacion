# language: es
# @id GHE-ISACA-CGEIT-004
# @type business-rule
# @domain governance
# @layer resources
# @risk s2
# @owner governance-director
# @status proposed
# @requirement REQ-CGEIT-004
# @risk-control CTRL-CGEIT-004
# @regulation CGEIT ISACA
@domain:isaca @type:business-rule @risk:s2 @status:proposed
Característica: CGEIT — Optimización de Recursos de TI
  Como director de TI
  Quiero optimizar recursos de TI conforme CGEIT
  Para que la inversión en recursos de TI sea eficiente y efectiva

  Regla: Recursos de TI se inventarian

    Escenario: Inventario de recursos TI
      Dado que se inventarian recursos de TI
      Cuando se catalogan
      Entonces se incluyen:
        | Tipo de recurso             | Ejemplos                    |
        | Personal                    | Desarrolladores, admins     |
        | Infraestructura             | Servidores, red, almacenamiento|
        | Software                    | Licencias, herramientas     |
        | Datos                       | Bases de datos, archivos    |
        | Presupuesto                 | Asignación anual            |
        | Tiempo                      | Horas disponibles           |

  Regla: Asignación de recursos se optimiza

    Escenario: Priorización de asignación
      Dado que hay múltiples demandas de recursos
      Cuando se prioriza asignación
      Entonces se usa criterio:
        | Criterio                    | Peso   |
        | Alineación con estrategia   | 35%    |
        | Urgencia clínica            | 30%    |
        | ROI estimado                | 20%    |
        | Riesgo de no hacer          | 15%    |

    Escenario: Gestión de capacidad
      Dado que se planifica capacidad de TI
      Cuando se evalúa demanda futura
      Entonces se verifica:
        | Elemento                    |
        | Capacidad actual vs demanda |
        | Proyección de crecimiento   |
        | Plan de expansión           |
        | Inversión necesaria         |
        | Timeline de adquisición     |

  Regla: Talento TI se gestiona

    Escenario: Desarrollo de equipo TI
      Dado que se gestiona equipo TI
      Cuando se planifica desarrollo
      Entonces se verifica:
        | Elemento                    |
        | Competencias requeridas     |
        | Gap de habilidades          |
        | Plan de capacitación        |
        | Retención de talento        |
        | Sucesión en roles clave     |

  Regla: Costos de TI se optimizan

    Escenario: Análisis de costos
      Dado que se analizan costos de TI
      Cuando se optimizan
      Entonces se verifica:
        | Elemento                    |
        | Costo por servicio          |
        | Costo por usuario           |
        | Comparación con benchmarks  |
        | Oportunidades de ahorro     |
        | ROI de inversiones          |

  Regla: Proveedores se gestionan

    Escenario: Gestión de proveedores
      Dado que se gestionan proveedores de TI
      Cuando se evalúa desempeño
      Entonces se verifica:
        | Elemento                    |
        | SLA cumplidos               |
        | Calidad de servicio         |
        | Costo vs valor              |
        | Dependencia del proveedor   |
        | Plan de salida              |
