# language: es
# @id GHE-ISACA-CISA-004
# @type business-rule
# @domain audit
# @layer governance
# @risk s2
# @owner audit-director
# @status proposed
# @requirement REQ-CISA-004
# @risk-control CTRL-CISA-004
# @regulation CISA ISACA
@domain:isaca @type:business-rule @risk:s2 @status:proposed
Característica: CISA — Procesos de Negocio para TI y Gobernanza
  Como auditor de TI
  Quiero auditar procesos de negocio para TI conforme CISA
  Para que TI soporte efectivamente los procesos clínicos y administrativos

  Regla: Procesos de negocio se documentan

    Escenario: Mapa de procesos del hospital
      Dado que se documentan procesos del hospital
      Cuando se mapean
      Entonces se incluyen:
        | Proceso                     | Dependencia de TI  |
        | Registro de pacientes       | Alta               |
        | Control prenatal            | Alta               |
        | Prescripción médica         | Crítica            |
        | Dispensación de farmacia    | Crítica            |
        | Laboratorio                 | Alta               |
        | Imagenología                | Alta               |
        | Cirugía                     | Media              |
        | Facturación                 | Alta               |
        | Nómina                      | Media              |
        | Inventario                  | Media              |
        | Reportes regulatorios       | Alta               |

  Regla: Alineación TI-procesos se evalúa

    Escenario: Evaluación de alineación
      Dado que se evalúa alineación TI-procesos
      Cuando se revisa
      Entonces se verifica:
        | Proceso                     | Soporte TI actual  |
        | Registro de pacientes       | Sistema funcional  |
        | Control prenatal            | App móvil offline  |
        | Prescripción                | Receta electrónica |
        | Farmacia                    | Inventario digital |
        | Laboratorio                 | Interfaz HL7       |
        | Imagenología                | PACS integrado     |

  Regla: Controles de proceso se auditan

    Escenario: Auditoría de controles por proceso
      Dado que se auditan controles de procesos críticos
      Cuando se evalúan
      Entonces se verifica:
        | Proceso                     | Controles clave              |
        | Prescripción                | Validación de dosis, alergias|
        | Farmacia                    | Dispensación con receta       |
        | Laboratorio                 | Valores críticos alertados   |
        | Cirugía                    | Checklist preoperatoria       |
        | Facturación                 | Conciliación con clinical    |

  Regla: Métricas de proceso se miden

    Escenario: KPIs de procesos TI
      Dado que se miden métricas de procesos
      Cuando se consulta dashboard
      Entonces muestra:
        | Proceso                     | KPI                    | Meta  |
        | Registro                    | Tiempo promedio        | <5min |
        | Prescripción                | Errores detectados     | <0.1% |
        | Farmacia                    | Stockout               | <2%   |
        | Laboratorio                 | Tiempo de resultado    | <24h  |
        | Imagenología                | Tiempo de reporte      | <24h  |
        | Facturación                 | Rechagos de aseguradora| <5%   |
