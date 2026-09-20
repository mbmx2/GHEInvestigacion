# language: es
# Contabilidad y Finanzas
@status:proposed
@type:acceptance
@domain:hospital
Característica: Gestión Contable (GHE Hospital)
  Como contador del hospital
  Quiero workflows contables
  Para llevar las finanzas del hospital de forma transparente

  # ─────────────────────────────────────────────────────────────
  # 1. CONTABILIDAD DIARIA
  # ─────────────────────────────────────────────────────────────

  Escenario: Registro de operaciones diarias
    Dado que se registran operaciones del día
    Cuando se contabiliza
    Entonces:
      | Tipo de operación         | Cuenta |
      | Ingreso por consultas     | Ingresos |
      | Ingreso por farmacia      | Ingresos |
      | Pago de nómina            | Gastos |
      | Pago de proveedores       | Gastos |
      | Pago de servicios         | Gastos |

  # ─────────────────────────────────────────────────────────────
  # 2. CUENTAS POR COBRAR
  # ─────────────────────────────────────────────────────────────

  Escenario: Gestión de cuentas por cobrar
    Dado que se gestionan cuentas por cobrar
    Cuando se verifica
    Entonces:
      | Concepto                  | Monto    | Estado |
      | Pacientes directos        | $45,000  | Por cobrar |
      | Seguros                   | $120,000 | En trámite |
      | Convenios                | $35,000  | Pendiente |
      | **Total**                | **$200,000** | |

  # ─────────────────────────────────────────────────────────────
  # 3. CUENTAS POR PAGAR
  # ─────────────────────────────────────────────────────────────

  Escenario: Gestión de cuentas por pagar
    Dado que se gestionan cuentas por pagar
    Cuando se verifica
    Entonces:
      | Proveedor                 | Monto    | Vencimiento |
      | Laboratorio               | $15,000  | 30 días    |
      | Proveedor de insumos      | $25,000  | 45 días    |
      | Servicios públicos        | $12,000  | 30 días    |
      | Mantenimiento             | $8,000   | 15 días    |

  # ─────────────────────────────────────────────────────────────
  # 4. ESTADOS FINANCIEROS
  # ─────────────────────────────────────────────────────────────

  Escenario: Generación de estados financieros
    Dado que se generan estados financieros
    Cuando se elabora
    Entonces incluye:
      | Estado                     |
      | Balance general           |
      | Estado de resultados      |
      | Flujo de efectivo         |
      | Variaciones en patrimonio |

  # ─────────────────────────────────────────────────────────────
  # 5. FACTURACIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Proceso de facturación
    Dado que se factura servicio al paciente
    Cuando se genera factura
    Entonces el sistema incluye:
      | Concepto                  |
      | Consulta médica          |
      | Procedimiento            |
      | Medicamentos             |
      | Laboratorio              |
      | Hospitalización          |
      | Descuentos/seguro        |
      | Total a pagar            |

  # ─────────────────────────────────────────────────────────────
  # 6. IMPUESTOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Obligaciones fiscales
    Dado que se cumplen obligaciones fiscales
    Cuando se verifica
    Entonces:
      | Obligación                | Frecuencia |
      | Declaración de IVA       | Mensual    |
      | Declaración de ISR       | Mensual    |
      | Declaración anual        | Anual      |
      | DIOT                     | Mensual    |
      | Contabilidad electrónica | Mensual    |

  # ─────────────────────────────────────────────────────────────
  # 7. CONTROL PRESUPUESTAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Seguimiento presupuestal
    Dado que se monitorea presupuesto
    Cuando se evalúa
    Entonces:
      | Categoría                  | Presupuesto | Real    | % Ejecutado |
      | Nómina                    | $1,800,000  | $1,750,000 | 97%       |
      | Medicamentos             | $960,000    | $850,000  | 89%       |
      | Insumos                   | $360,000    | $340,000  | 94%       |
      | Servicios                | $300,000    | $280,000  | 93%       |
      | Mantenimiento            | $180,000    | $150,000  | 83%       |
      | Capital                  | $600,000    | $450,000  | 75%       |
      | **Total**                | **$4,200,000** | **$3,820,000** | **91%** |
