# language: es
# @id GHE-MEDICATION-CONTROLLED-001
# @type clinical
# @domain pharmacy
# @layer domain
# @risk s1
# @owner pharmacist
# @status proposed
# @requirement REQ-MEDICATION-CONTROLLED
# @risk-control CTRL-MEDICATION-CONTROLLED
# @regulation NOM-004
@domain:pharmacy @type:clinical @risk:s1 @status:proposed
Característica: Medicamentos Controlados y Dispensación Especial
  Como farmacéutico del hospital
  Quiero control estricto de medicamentos controlados
  Para prevenir abuso y dependencia

  Regla: Medicamentos controlados tienen registro especial

    Escenario: Registro de estupefaciente
      Dado que se dispensa estupefaciente
      Cuando se procesa
      Entonces:
        | Campo                     |
        | Número de receta          |
        | Médico prescriptor        |
        | Cédula profesional        |
        | Cantidad exacta           |
        | Paciente                  |
        | Fecha y hora              |
        | Firma del dispensador    |

  Regla: Límites de stock se verifican

    Escenario: Stock de controlados
      Dado que se gestiona inventario de controlados
      Cuando se verifica
      Entonces stock no excede límite legal
      Y conciliación mensual con bitácora

  Regla: Doble verificación para controlados

    Escenario: Doble verificación
      Dado que se dispensa medicamento controlado
      Cuando se verifica
      Entonces dos profesionales verifican cantidad y destinatario
