# language: es
# Lavandería Hospitalaria
Característica: Gestión de Lavandería (GHE Hospital)
  Como jefe de lavandería del hospital
  Quiero workflows para lavandería hospitalaria
  Para garantizar ropa limpia y desinfectada

  # ─────────────────────────────────────────────────────────────
  # 1. RECEPCIÓN DE ROPA SUCIA
  # ─────────────────────────────────────────────────────────────

  Escenario: Recepción y clasificación
    Dado que se recibe ropa sucia de unidades
    Cuando se clasifica
    Entonces:
      | Tipo                      | Contenedor | Lavado |
      | Ropa de pacientes        | Sábanas    | 70°C + desinfectante |
      | Ropa quirúrgica           | Verde      | 70°C + desinfectante |
      | Uniformes de personal     | Azul        | 60°C + detergente  |
      | Toallas                   | Blanco     | 70°C + desinfectante |
      | Ropa contaminada (sangre)| Rojo       | 70°C + desinfectante especial |

  # ─────────────────────────────────────────────────────────────
  # 2. PROCESO DE LAVADO
  # ─────────────────────────────────────────────────────────────

  Escenario: Proceso de lavado desinfectante
    Dado que se ejecuta lavado
    Cuando se verifica proceso
    Entonces:
      | Paso                       | Verificación |
      | Clasificación previa      | ✅ |
      | Carga correcta (no sobrecarga) | ✅ |
      | Detergente correcto       | ✅ |
      | Temperatura de lavado     | ✅ (>70°C para desinfección) |
      | Tiempo de lavado          | ✅ (>10 min a >70°C) |
      | Enjuague                  | ✅ |
      | Secado                    | ✅ |
      | Pliegue/empaque           | ✅ |

  # ─────────────────────────────────────────────────────────────
  # 3. ALMACENAMIENTO
  # ─────────────────────────────────────────────────────────────

  Escenario: Almacenamiento de ropa limpia
    Dado que se almacena ropa limpia
    Cuando se verifica
    Entonces:
      | Criterio                   |
      | Área limpia, cerrada      |
      | Temperatura controlada    |
      | Sin polvo                 |
      | Etiquetada por tipo       |
      | Organizada por unidad     |
      | Stock mínimo definido     |

  # ─────────────────────────────────────────────────────────────
  # 4. CONTROL DE INVENTARIO
  # ─────────────────────────────────────────────────────────────

  Escenario: Inventario de ropa hospitalaria
    Dado que se gestiona inventario
    Cuando se evalúa
    Entonces:
      | Tipo                      | Stock mínimo por cama |
      | Sábanas                  | 3 juegos            |
      | Sabanitas                | 5 unidades          |
      | Toallas                  | 3 unidades          |
      | Batas de pacientes       | 3 unidades          |
      | Uniformes personal       | 2 por empleado      |

  # ─────────────────────────────────────────────────────────────
  # 5. CONTROL DE CALIDAD
  # ─────────────────────────────────────────────────────────────

  Escenario: Verificación de calidad
    Dado que se verifica calidad de lavado
    Cuando se evalúa
    Entonces:
      | Criterio                   | Estado |
      | Ropa sin manchas          | ✅ |
      | Ropa sin olores           | ✅ |
      | Ropa sin daños            | ✅ |
      | Ropa desinfectada         | ✅ (test strips) |
      | Ropa seca completamente   | ✅ |
