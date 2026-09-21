# language: es
# @id GHE-RPT-001
# @type business-rule
# @domain reporting
# @layer operations
# @risk s2
# @owner admin-director
# @status proposed
# @requirement REQ-RPT-001
# @risk-control CTRL-RPT-001
# @regulation NOM-024
@domain:reporting @type:business-rule @risk:s2 @status:proposed
Característica: Reportes y Analytics
  Como director administrativo
  Quiero reportes automáticos e indicadores en tiempo real
  Para tomar decisiones informadas

  Regla: Dashboard se actualiza en tiempo real

    Escenario: Dashboard muestra indicadores
      Dado que director consulta dashboard
      Entonces muestra: pacientes atendidos, citas, camas ocupadas, ingresos, stock crítico, emergencias
      # @evidence EVID-RPT-001

  Regla: Reportes según calendario

    Escenario: Reporte diario
      Dado que es fin de día
      Cuando se genera reporte
      Entonces incluye: resumen consultas, procedimientos, pacientes, ingresos, incidentes
      # @evidence EVID-RPT-002

    Escenario: Reporte mensual ejecutivo
      Dado que es fin de mes
      Cuando se genera reporte
      Entonces incluye: indicadores calidad, finanzas, productividad, comparativa, recomendaciones
      # @evidence EVID-RPT-003

  Regla: Reportes generan offline

    Escenario: Reporte sin internet
      Dado que no hay conexión
      Cuando se solicita reporte
      Entonces se genera con datos locales
      # @evidence EVID-RPT-004

  Regla: Reportes protegen datos sensibles

    Escenario: Datos ofuscados
      Dado que se genera reporte para dirección
      Cuando incluye datos de pacientes
      Entonces datos sensibles se ofuscan
      # @evidence EVID-RPT-005
