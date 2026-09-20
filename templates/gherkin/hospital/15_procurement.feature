# language: es
# Compras y Contrataciones
@status:proposed
@type:acceptance
@domain:hospital
Característica: Gestión de Compras (GHE Hospital)
  Como jefe de compras del hospital
  Quiero workflows para compras y contrataciones
  Para adquirir bienes y servicios de forma eficiente y transparente

  # ─────────────────────────────────────────────────────────────
  # 1. PROCESO DE COMPRA
  # ─────────────────────────────────────────────────────────────

  Escenario: Proceso completo de compra
    Dado que se necesita adquirir un bien o servicio
    Cuando se inicia el proceso
    Entonces:
      | Paso                       | Responsable |
      | 1. Solicitud de compra    | Área solicitante |
      | 2. Validación de necesidad| Dirección |
      | 3. Cotización (mín 3 proveedores) | Compras |
      | 4. Evaluación y comparativa | Compras |
      | 5. Aprobación            | Dirección |
      | 6. Orden de compra       | Compras |
      | 7. Recepción y verificación | Área solicitante |
      | 8. Conformidad          | Almacén |
      | 9. Registro contable    | Contabilidad |

  Escenario: Tipos de adquisición
    Dado que se clasifican adquisiciones
    Cuando se evalúa
    Entonces:
      | Tipo                      | Monto aprox | Proceso |
      | Menor cuantía            | <$50,000 MXN  | 3 cotizaciones |
      | Cuantía media            | $50k-$500k    | Licitación simplificada |
      | Gran cuantía             | >$500k        | Licitación pública |

  # ─────────────────────────────────────────────────────────────
  # 2. PROVEEDORES
  # ─────────────────────────────────────────────────────────────

  Escenario: Registro de proveedor
    Dado que se registra nuevo proveedor
    Cuando se evalúa
    Entonces el sistema requiere:
      | Campo                     |
      | Razón social / nombre    |
      | RFC / identificación fiscal |
      | Dirección fiscal         |
      | Teléfono / email         |
      | Tipo de bienes/servicios |
      | Licencias sanitarias     |
      | Referencias comerciales  |

  Escenario: Evaluación de proveedor
    Dado que se evalúa desempeño de proveedor
    Cuando se califica
    Entonces:
      | Criterio                   | Peso |
      | Calidad del producto      | 30%  |
      | Tiempo de entrega         | 25%  |
      | Precio                    | 25%  |
      | Servicio post-venta       | 10%  |
      | Cumplimiento normativo    | 10%  |

  # ─────────────────────────────────────────────────────────────
  # 3. CONTRATACIÓN DE SERVICIOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Contratación de servicio médico
    Dado que se contrata servicio médico externo
    Cuando se evalúa
    Entonces el sistema registra:
      | Campo                     |
      | Tipo de servicio         |
      | Proveedor                |
      | Monto                    |
      | Duración                 |
      | Condiciones              |
      | SLA (acuerdo de nivel de servicio) |

  # ─────────────────────────────────────────────────────────────
  # 4. CONTROL DE GASTOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Seguimiento de presupuesto de compras
    Dado que se monitorea presupuesto de compras
    Cuando se evalúa
    Entonces:
      | Categoría                  | Presupuesto | Real    | Disponible |
      | Medicamentos             | $80,000     | $65,000 | $15,000   |
      | Insumos médicos          | $30,000     | $28,000 | $2,000    |
      | Equipamiento             | $50,000     | $45,000 | $5,000    |
      | Servicios externos       | $25,000     | $22,000 | $3,000    |
      | Mantenimiento            | $15,000     | $12,000 | $3,000    |

  # ─────────────────────────────────────────────────────────────
  # 5. DOCUMENTACIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Documentación de compra
    Dado que se documenta cada compra
    Cuando se archiva
    Entonces incluye:
      | Documento                   |
      | Solicitud de compra        |
      | Cotizaciones recibidas     |
      | Evaluación de proveedores  |
      | Aprobación                 |
      | Orden de compra            |
      | Nota de recepción         |
      | Factura                    |
      | Conformidad               |
