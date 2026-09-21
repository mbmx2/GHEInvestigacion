# language: es
# @id GHE-REPORTING-KPI-001
# @type business
# @domain reporting
# @layer operations
# @risk s2
# @owner admin-director
# @status proposed
# @requirement REQ-REPORTING-KPI
# @risk-control CTRL-REPORTING-KPI
# @regulation NOM-024
@domain:reporting @type:business @risk:s2 @status:proposed
Característica: Dashboard y KPIs
  Como director administrativo del hospital
  Quiero dashboard en tiempo real con KPIs
  Para tomar decisiones basadas en datos

  Regla: Dashboard se actualiza automáticamente

    Escenario: Dashboard en tiempo real
      Dado que se consulta dashboard
      Cuando se genera
      Entonces incluye:
        | KPI                         | Fuente |
        | Pacientes atendidos/hoy   | Agenda |
        | Consultas realizadas      | Consultas |
        | Camas ocupadas            | Hospitalización |
        | Ingresos del mes          | Facturación |
        | Egresos del mes           | Contabilidad |
        | Stock crítico             | Farmacia |
        | Emergencias activas       | Urgencias |

  Regla: KPIs se comparan con targets

    Escenario: KPI vs target
      Dado que se evalúa KPI
      Cuando se compara con target
      Entonces: verde si cumple, amarillo si se acerca, rojo si no cumple

  Regla: Alertas de KPI fuera de rango

    Escenario: KPI fuera de rango
      Dado que KPI está fuera de target
      Cuando se detecta
      Entonces: alerta + análisis de causa + acción correctiva
