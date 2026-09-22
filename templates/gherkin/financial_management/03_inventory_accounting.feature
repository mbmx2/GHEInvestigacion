# language: es
# @id GHE-FIN-003
# @type business-rule
# @domain financial-management
# @layer inventory
# @risk s2
# @owner finance-director
# @status proposed
# @requirement REQ-FIN-003
# @risk-control CTRL-FIN-003
# @regulation NOM-024
@domain:financial_management @type:business-rule @risk:s2 @status:proposed
Característica: Contabilidad de Inventario y Costos
  Como director financiero
  Quiero trazabilidad de costos por paciente y procedimiento
  Para tomar decisiones financieras informadas

  Regla: Costo por paciente se registra

    Escenario: Costo acumulado de estancia
      Dado que paciente está hospitalizado
      Cuando se consulta costo acumulado
      Entonces desglosa:
        | Concepto              | Costo     |
        | Estancia hospitalaria  | Por día   |
        | Procedimientos         | Por evento|
        | Medicamentos           | Por dosis |
        | Laboratorio            | Por estudio|
        | Imagenología           | Por estudio|
        | Cirugía                | Por procedimiento|
        | Alimentación           | Por día   |

    Escenario: Costo por diagnóstico agrupado (GDG)
      Dado que se agrupan pacientes por diagnóstico
      Cuando se calcula costo promedio
      Entonces muestra:
        | Diagnóstico           | Costo promedio | Casos |
        | Parto normal          | $X             | N     |
        | Cesárea               | $X             | N     |
        | Preeclampsia severa   | $X             | N     |

  Regla: Inventario de farmacia tiene costos

    Escenario: Valoración de inventario
      Dado que se ejecuta inventario de farmacia
      Cuando se valora
      Entonces calcula:
        | Campo                 |
        | Costo total del stock |
        | Costo por categoría   |
        | Medicamentos caducados|
        | Pérdidas registradas  |
        | Rotación de inventario|

    Escenario: Alerta de stock bajo con costo
      Dado que medicamento tiene stock mínimo
      Cuando se detecta
      Entonces muestra: cantidad, costo de reposo, proveedor, tiempo de entrega

  Regla: Presupuesto se monitorea

    Escenario: Ejecución presupuestal mensual
      Dado que es fin de mes
      Cuando se genera reporte presupuestal
      Entonces compara:
        | Concepto        | Presupuesto | Ejecutado | Varianza |
        | Nómina           | $X          | $Y        | %        |
        | Medicamentos     | $X          | $Y        | %        |
        | Equipamiento     | $X          | $Y        | %        |
        | Mantenimiento    | $X          | $Y        | %        |

  Regla: Facturación a aseguradoras

    Escenario: Paquete de gastos por aseguradora
      Dado que paciente tiene seguro médico
      Cuando se factura
      Entonces se genera paquete con:
        | Campo                 |
        | Código de servicio    |
        | Descripción           |
        | Cantidad              |
        | Precio unitario       |
        | Total                 |
        | Código de autorización|

    Escenario: Rechazo de aseguradora
      Dado que aseguradora rechaza claim
      Cuando se notifica
      Entonces se registra motivo de rechazo
      Y se asigna a revisión de facturación
      Y se genera nota de crédito si aplica

  Regla: Contabilidad opera offline

    Escenario: Registro de gasto sin conexión
      Dado que no hay conexión
      Cuando se registra gasto
      Entonces se almacena localmente
      Y se sincroniza con contador al reconectar
