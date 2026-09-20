# language: es
# Almacén General del Hospital
@status:proposed
@type:acceptance
@domain:hospital
Característica: Gestión de Almacén (GHE Hospital)
  Como jefe de almacén del hospital
  Quiero workflows para gestión de almacén general
  Para mantener inventario adecuado de todos los insumos

  # ─────────────────────────────────────────────────────────────
  # 1. RECEPCIÓN DE MERCANCÍA
  # ─────────────────────────────────────────────────────────────

  Escenario: Proceso de recepción
    Dado que llega mercancía al almacén
    Cuando se recibe
    Entonces:
      | Paso                       |
      | Verificar contra orden de compra |
      | Inspeccionar calidad      |
      | Verificar cantidades      |
      | Verificar caducidades     |
      | Registrar en inventario   |
      | Almacenar según categoría |

  # ─────────────────────────────────────────────────────────────
  # 2. CLASIFICACIÓN DE ALMACÉN
  # ─────────────────────────────────────────────────────────────

  Escenario: Organización de almacén
    Dado que se organiza almacén
    Cuando se clasifica
    Entonces:
      | Zona                      | Contenido |
      | A - Medicamentos controlados | bajo llave |
      | B - Medicamentos generales | estantería |
      | C - Insumos médicos       | estantería |
      | D - Material de curación  | estantería |
      | E - Equipamiento menor    | estantería |
      | F - Equipamiento mayor    | área dedicada |
      | G - Productos de limpieza | área separada |
      | H - Papelería y oficina   | estantería |

  # ─────────────────────────────────────────────────────────────
  # 3. GESTIÓN DE INVENTARIO
  # ─────────────────────────────────────────────────────────────

  Escenario: Control ABC de inventario
    Dado que se clasifica inventario por valor
    Cuando se aplica análisis ABC
    Entonces:
      | Clase | Categoría | Items | Valor | Control |
      | A     | Alto      | 20%   | 80%   | Diario  |
      | B     | Medio     | 30%   | 15%   | Semanal |
      | C     | Bajo      | 50%   | 5%    | Mensual |

  Escenario: Punto de reorden
    Dado que se calcula reorder point
    Cuando se evalúa
    Entonces:
      | Fórmula                    |
      | Reorder Point = (Consumo diario × Tiempo de entrega) + Stock de seguridad |

  # ─────────────────────────────────────────────────────────────
  # 4. GESTIÓN DE CADUCIDADES
  # ─────────────────────────────────────────────────────────────

  Escenario: FIFO y caducidades
    Dado que se gestiona inventario con caducidad
    Cuando se verifica
    Entonces:
      | Regla                       |
      | Primero en entrar, primero en salir (FIFO) |
      | Alerta a 60 días de caducidad |
      | Bloqueo de dispensación si caducado |
      | Registro de merma por caducidad |

  # ─────────────────────────────────────────────────────────────
  # 5. CONTEO CÍCLICO
  # ─────────────────────────────────────────────────────────────

  Escenario: Programa de conteo cíclico
    Dado que se ejecuta conteo cíclico
    Cuando se planifica
    Entonces:
      | Clase ABC | Frecuencia |
      | A         | Semanal    |
      | B         | Mensual    |
      | C         | Trimestral |

  # ─────────────────────────────────────────────────────────────
  # 6. REPORTES
  # ─────────────────────────────────────────────────────────────

  Escenario: Reportes de inventario
    Dado que se generan reportes
    Cuando se solicitan
    Entonces:
      | Reporte                    | Frecuencia |
      | Stock actual              | Tiempo real |
      | Movimientos de almacén    | Diario      |
      | Valor de inventario       | Mensual     |
      | Items por caducar         | Semanal     |
      | Consumo por unidad        | Mensual     |
      | Mermas                    | Mensual     |
