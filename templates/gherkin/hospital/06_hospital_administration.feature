# language: es
# Administración Hospitalaria
@status:proposed
@type:acceptance
@domain:hospital
Característica: Gestión Administrativa (GHE Hospital)
  Como director administrativo del hospital
  Quiero workflows de gestión administrativa
  Para que el hospital opere de forma eficiente y sostenible

  # ─────────────────────────────────────────────────────────────
  # 1. GESTIÓN DE PERSONAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Control de asistencia
    Dado que se controla asistencia del personal
    Cuando se registra
    Entonces el sistema captura:
      | Campo                     |
      | Entrada (hora)           |
      | Salida (hora)            |
      | Horas trabajadas         |
      | Horas extras             |
      | Faltas                   |
      | Permisos                 |

  Escenario: Gestión de turnos
    Dado que se organizan turnos
    Cuando se planifica
    Entonces el sistema gestiona:
      | Turno                      | Horario       |
      | Matutino                   | 7:00-15:00    |
      | Vespertino                 | 15:00-23:00   |
      | Nocturno                   | 23:00-7:00    |
    Y verifica:
      | Regla                       |
      | Máximo 5 turnos consecutivos |
      | Mínimo 12h entre turnos    |
      | Descanso semanal obligatorio |

  Escenario: Nómina
    Dado que se calcula nómina mensual
    Cuando se procesa
    Entonces el sistema incluye:
      | Concepto                   |
      | Sueldo base               |
      | Horas extras              |
      | Bonificaciones           |
      | Deducciones (IMSS, ISR)  |
      | Neto a pagar             |

  # ─────────────────────────────────────────────────────────────
  # 2. GESTIÓN FINANCIERA
  # ─────────────────────────────────────────────────────────────

  Escenario: Control de ingresos
    Dado que se registran ingresos
    Cuando se clasifican
    Entonces:
      | Fuente                     |
      | Consultas médicas         |
      | Procedimientos quirúrgicos|
      | Hospitalización           |
      | Farmacia                  |
      | Laboratorio               |
      | Seguros                   |
      | Donativos                 |

  Escenario: Control de egresos
    Dado que se registran egresos
    Cuando se clasifican
    Entonces:
      | Categoría                  |
      | Nómina del personal       |
      | Medicamentos             |
      | Insumos médicos          |
      | Servicios (luz, agua)    |
      | Mantenimiento            |
      | Capacidad instalada      |
      | Seguros                  |

  Escenario: Presupuesto mensual
    Dado que se elabora presupuesto
    Cuando se compara
    Entonces:
      | Concepto                  | Presupuesto | Real    | Variación |
      | Nómina                    | $150,000    | $148,000| -1.3%    |
      | Medicamentos             | $80,000     | $82,000 | +2.5%    |
      | Insumos                  | $30,000     | $28,000 | -6.7%    |
      | Servicios               | $25,000     | $24,500 | -2.0%    |
      | Total                    | $285,000    | $282,500| -0.9%    |

  # ─────────────────────────────────────────────────────────────
  # 3. GESTIÓN DE COMPRAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Proceso de compra
    Dado que se necesita adquirir un producto
    Cuando se inicia proceso
    Entonces:
      | Paso                       |
      | 1. Solicitud de compra    |
      | 2. Cotización (3 proveedores) |
      | 3. Evaluación y selección |
      | 4. Aprobación             |
      | 5. Orden de compra        |
      | 6. Recepción y verificación |
      | 7. Registro en inventario |

  # ─────────────────────────────────────────────────────────────
  # 4. GESTIÓN DE INFRAESTRUCTURA
  # ─────────────────────────────────────────────────────────────

  Escenario: Mantenimiento de infraestructura
    Dado que se programa mantenimiento
    Cuando se ejecuta
    Entonces:
      | Actividad                  | Frecuencia  |
      | Eléctrico preventivo      | Mensual     |
      | Hidráulico preventivo     | Mensual     |
      | Aire acondicionado        | Mensual     |
      | Gas medicinal              | Mensual     |
      | Extintores                 | Semestral   |
      | Capacitación personal      | Trimestral  |

  Escenario: Registro de fallas
    Dado que se reporta una falla
    Cuando se registra
    Entonces el sistema incluye:
      | Campo                     |
      | Fecha/hora               |
      | Área afectada            |
      | Descripción de la falla  |
      | Prioridad (crítica/alta/media/baja) |
      | Personal responsable     |
      | Acción tomada            |
      | Estado (pendiente/en proceso/resuelta) |

  # ─────────────────────────────────────────────────────────────
  # 5. REPORTES ADMINISTRATIVOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Dashboard administrativo
    Dado que el director consulta dashboard
    Cuando se genera
    Entonces incluye:
      | Métrica                    | Valor |
      | Pacientes hospitalizados  | 12    |
      | Consultas del día         | 45    |
      | Cirugías programadas      | 3     |
      | Camas ocupadas            | 8/15  |
      | Personal en turno         | 12    |
      | Ingresos del mes          | $285,000 |
      | Egresos del mes           | $282,500 |
      | Inventario bajo           | 2 items |
      | Mantenimientos pendientes | 3     |
