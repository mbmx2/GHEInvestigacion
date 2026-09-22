# language: es
# @id GHE-QUALITY-003
# @type business-rule
# @domain quality
# @layer compliance
# @risk s2
# @owner quality-director
# @status proposed
# @requirement REQ-QUALITY-003
# @risk-control CTRL-QUALITY-003
# @regulation NOM-024 NOM-206
@domain:quality @type:business-rule @risk:s2 @status:proposed
Característica: Envío Regulatorio y Reportes Normativos
  Como encargado de cumplimiento normativo
  Quiero automatizar reportes a autoridades sanitarias
  Para cumplir obligaciones de reporte sin sobrecarga operativa

  Regla: Reporte SUIVE se genera automáticamente

    Escenario: Generación semanal SUIVE
      Dado que es día de corte semanal
      Cuando se ejecuta generación de reporte SUIVE
      Entonces se capturan:
        | Campo                    |
        | Enfermedades reportables |
        | Casos nuevos             |
        | Defunciones              |
        | Hospitalizaciones       |
      Y se valida contra catálogo COFEPRIS

    Escenario: Error en formato SUIVE
      Dado que reporte tiene campos obligatorios vacíos
      Cuando se ejecuta validación
      Entonces se identifican errores
      Y se generan alertas para corrección antes del envío

  Regla: Reporte NOM-007 se genera mensual

    Escenario: Reporte de atención prenatal
      Dado que es primer día del mes
      Cuando se genera reporte NOM-007
      Entonces incluye:
        | Indicador                       |
        | Controles prenatales realizados |
        | Embarazadas de alto riesgo      |
        | Anemias detectadas              |
        | Sífilis y VIH reportados        |
        | Cobertura de ultrasonido        |
        | Partos institucionales          |

  Regla: COFEPRIS recibe reportes de dispositivos

    Escenario: Reporte de eventos adversos
      Dado que ocurre evento adverso con dispositivo médico
      Cuando se clasifica
      Entonces se genera reporte para COFEPRIS
      Y se incluye: descripción, consecuencias, acción correctiva

    Escenario: Reporte de recalls
      Dado que fabricante emite retiro de producto
      Cuando se notifica al hospital
      Entonces se verifica inventario afectado
      Y se retira del uso
      Y se reporta a COFEPRIS

  Regla: Cumplimiento fiscal se documenta

    Escenario: CFDI de servicios médicos
      Dado que paciente recibe servicio facturable
      Cuando se genera comprobante fiscal
      Entonces CFDI incluye: concepto, monto, impuestos, RFC
      Y se almacena para auditoría fiscal

  Regla: Reportes se generan offline

    Escenario: Generación sin conexión
      Dado que no hay conexión a internet
      Cuando se genera reporte regulatorio
      Entonces se almacena localmente
      Y se envía automáticamente al reconectar
      # @evidence EVID-QUALITY-REG-001
