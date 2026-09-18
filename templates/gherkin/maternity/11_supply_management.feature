# language: es
# Gestión de Suministros Obstétricos
Característica: Gestión de Stock (GHE Maternidad)
  Como administrador de la maternidad
  Quiero gestión automática de inventario de suministros obstétricos
  Para nunca quedarse sin medicamentos o equipo crítico

  # ─────────────────────────────────────────────────────────────
  # 1. INVENTARIO DE MEDICAMENTOS OBSTÉTRICOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Inventario crítico de emergencias
    Dado que se verifica inventario de emergencias
    Cuando se revisa
    Entonces debe haber:
      | Medicamento                | Stock mínimo | Stock actual |
      | Sulfato de magnesio        | 50 ampollas   | ✅           |
      | Oxitocina                  | 30 ampollas   | ✅           |
      | Labetalol IV              | 20 ampollas   | ✅           |
      | Nifedipino                 | 50 cápsulas   | ✅           |
      | Misoprostol                | 20 tabletas   | ✅           |
      | Tranexámico                | 10 ampollas   | ✅           |
      | Gluconato de calcio        | 10 ampollas   | ✅           |

  Escenario: Alerta de stock bajo
    Dado que el stock de sulfato de magnesio baja de 20
    Cuando se detecta
    Entonces el sistema alerta:
      | Alerta                      |
      | ⚠️ STOCK BAJO: Sulfato de magnesio |
      | Stock actual: 18 ampollas  |
      | Stock mínimo: 50 ampollas  |
      | Acción: Solicitar reposición urgente |

  # ─────────────────────────────────────────────────────────────
  # 2. GESTIÓN DE CADUCIDADES
  # ─────────────────────────────────────────────────────────────

  Escenario: Alerta de caducidad próxima
    Dado que un medicamento caduca en 30 días
    Cuando se verifica inventario
    Entonces el sistema alerta:
      | Alerta                      |
      | ⚠️ CADUCIDAD PRÓXIMA: Oxitocina |
      | Lote: LOT-2024-001 |
      | Caduca: 15/11/2024 |
      | Stock: 15 ampollas |
      | Acción: Usar primero (FIFO) |

  # ─────────────────────────────────────────────────────────────
  # 3. GESTIÓN DE EQUIPO
  # ─────────────────────────────────────────────────────────────

  Escenario: Inventario de equipo obstétrico
    Dado que se verifica equipo
    Cuando se revisa
    Entonces debe haber:
      | Equipo                      | Estado    |
      | Monitor fetal              | ✅ Funcional |
      | Oxígeno (cilindro)         | ✅ Lleno    |
      | Bomba de infusión          | ✅ Funcional |
      | Equipo de reanimación neonatal | ✅ Completo |
      | Mesas de parto             | ✅ Funcional |
      | Instrumental estéril       | ✅ Estéril  |

  # ─────────────────────────────────────────────────────────────
  # 4. PUNTO DE REORDEN AUTOMÁTICO
  # ─────────────────────────────────────────────────────────────

  Escenario: Cálculo de reorder point
    Dado que se calcula punto de reorden
    Cuando se evalúa consumo promedio
    Entonces:
      | Medicamento | Consumo/mes | Stock actual | Reorder point | Estado |
      | Sulfato Mg  | 30 amp      | 45           | 20            | OK     |
      | Oxitocina   | 20 amp      | 25           | 15            | OK     |
      | Hierro      | 100 cajas   | 15           | 30            | ⚠️ Bajo|

  # ─────────────────────────────────────────────────────────────
  # 5. OXÍGENO MEDICINAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Control de oxígeno medicinal
    Dado que se monitorea nivel de oxígeno
    Cuando se verifica
    Entonces:
      | Parámetro | Objetivo | Estado |
      | Nivel de cilindro | >20% | ✅ |
      | Cilindro de respaldo | Disponible | ✅ |
      | Flujo de oxígeno | Funcional | ✅ |
      | Alarma de bajo nivel | Habilitada | ✅ |
