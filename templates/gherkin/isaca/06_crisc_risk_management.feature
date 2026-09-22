# language: es
# @id GHE-ISACA-CRISC-001
# @type business-rule
# @domain risk
# @layer governance
# @risk s1
# @owner risk-director
# @status proposed
# @requirement REQ-CRISC-001
# @risk-control CTRL-CRISC-001
# @regulation CRISC ISACA
@domain:isaca @type:business-rule @risk:s1 @status:proposed
Característica: CRISC — Gestión de Riesgos de TI
  Como gestor de riesgos de TI
  Quiero gestión de riesgos conforme CRISC/ISACA
  Para que los riesgos de TI se identifiquen, evalúen y mitiquen alineados con objetivos del negocio

  Regla: Identificación de riesgos de TI es continua

    Escenario: Identificación de riesgos en proyectos
      Dado que se inicia proyecto de TI en el hospital
      Cuando se ejecuta proceso de identificación
      Entonces se evalúan riesgos de:
        | Área                        | Riesgos típicos               |
        | Desarrollo de software     | Defectos, retrasos, alcance   |
        | Infraestructura            | Fallos, capacidad, obsolescencia|
        | Datos                      | Integridad, disponibilidad    |
        | Proveedores                | Dependencia, lock-in           |
        | Cambio organizacional      | Resistencia, capacitación     |

    Escenario: Mapa de riesgos de TI
      Dado que se genera mapa de riesgos
      Cuando se visualizan riesgos
      Entonces se muestran por:
        | Dimensión                   | Agrupación      |
        | Categoría de riesgo         | Operacional/estratégico |
        | Propietario del activo      | Por dominio     |
        | Nivel de impacto            | Crítico/alto/medio/bajo |
        | Estado de tratamiento       | Abierto/mitigado/aceptado|

  Regla: Evaluación de riesgos usa criterios del hospital

    Escenario: Evaluación cuantitativa de riesgos
      Dado que se evalúa riesgo de TI
      Cuando se calcula valor esperado
      Entonces se usa: Pérdida Esperada = Probabilidad × Impacto Monetario
      Y se clasifica contra apetito de riesgo

    Escenario: Evaluación cualitativa de riesgos
      Dado que no hay datos suficientes para cuantificación
      Cuando se evalúa cualitativamente
      Entonces se usa matriz de calor:
        | Impacto\Probabilidad | Baja  | Media | Alta  |
        | Crítico              | Medio | Alto  | Crítico|
        | Alto                 | Bajo  | Medio | Alto   |
        | Medio                | Bajo  | Bajo  | Medio  |

  Regla: Respuesta a riesgos se implementa

    Escenario: Selección de tratamiento
      Dado que riesgo requiere acción
      Cuando se selecciona tratamiento
      Entonces se documenta:
        | Campo                    |
        | Opción seleccionada      |
        | Plan de acción detallado |
        | Presupuesto asignado     |
        | Recursos necesarios      |
        | Fecha objetivo de cierre |
        | Criterios de éxito       |

    Escenario: Riesgo transferido a tercero
      Dado que se selecciona transferencia de riesgo
      Cuando se implementa
      Entonces se verifica:
        | Elemento                  |
        | Contrato de seguro        |
        | SLA de proveedor          |
        | Cobertura adecuada        |
        | Exclusiones documentadas  |

  Regla: Monitoreo de riesgos es continuo

    Escenario: Indicadores de riesgo
      Dado que se monitorean indicadores de riesgo (KRI)
      Cuando se revisan
      Entonces se verifican:
        | KRI                         | Umbral de alerta|
        | Incidentes de seguridad    | >3/mes          |
        | Fallos de sistema          | >2/semana       |
        | Tiempo de inactividad      | >1 hora         |
        | Vulnerabilidades abiertas  | >10 críticas    |
        | Cambios no aprobados       | >0              |

  Regla: Reporte de riesgos a dirección

    Escenario: Reporte ejecutivo trimestral
      Dado que comité de gobierno necesita visibilidad
      Cuando se genera reporte CRISC
      Entonces incluye:
        | Sección                    |
        | Resumen del perfil de riesgo|
        | Top 10 riesgos activos     |
        | Estado de planes de tratamiento|
        | Riesgos nuevos y cerrados  |
        | Recomendaciones de inversión|
        | Tendencias y proyecciones  |
