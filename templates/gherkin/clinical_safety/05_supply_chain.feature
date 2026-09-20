# language: es
# Supply Chain y Gestión de Inventario
@status:proposed
@type:acceptance
@domain:clinical_safety
Característica: Cadena de Suministros (GHE Maternidad)
  Como administrador de la maternidad
  Quiero gestión integral de inventario y suministros
  Para nunca quedarse sin lo necesario para salvar vidas

  # ─────────────────────────────────────────────────────────────
  # 1. GESTIÓN DE MEDICAMENTOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Inventario de emergencias
    Dado que se verifica inventario de emergencias
    Cuando se revisa
    Entonces debe haber:
      | Medicamento                | Stock mínimo | Categoría |
      | Sulfato de magnesio        | 50 ampollas   | Emergencia|
      | Oxitocina                  | 30 ampollas   | Emergencia|
      | Labetalol IV              | 20 ampollas   | Emergencia|
      | Nifedipino                 | 50 cápsulas   | Emergencia|
      | Misoprostol                | 20 tabletas   | Emergencia|
      | Tranexámico                | 10 ampollas   | Emergencia|
      | Gluconato de calcio        | 10 ampollas   | Emergencia|
      | Epinefrina                 | 10 ampollas   | Emergencia|

  Escenario: Medicamentos de uso diario
    Dado que se verifica stock de uso diario
    Cuando se evalúa
    Entonces:
      | Medicamento                | Stock mínimo |
      | Paracetamol               | 100 cajas    |
      | Amoxicilina               | 50 cajas     |
      | Ácido fólico              | 200 cajas    |
      | Hierro                    | 150 cajas    |
      | Omeprazol                 | 50 cajas     |

  # ─────────────────────────────────────────────────────────────
  # 2. CADENA DE FRÍO (VACUNAS)
  # ─────────────────────────────────────────────────────────────

  Escenario: Monitoreo de cadena de frío
    Dado que se almacenan vacunas
    Cuando se monitorea temperatura
    Entonces:
      | Parámetro                  | Objetivo |
      | Temperatura refrigerador   | 2-8°C    |
      | Temperatura congelador     | -25 a -10°C |
      | Registro de temperatura    | Cada 8 horas |
      | Alarma por desviación     | ±2°C      |
    Y si temperatura fuera de rango:
      | Acción                      |
      | Notificar inmediatamente   |
      | Cuarentena de vacunas      |
      | Evaluar uso o descarte     |
      | Registrar incidente       |

  # ─────────────────────────────────────────────────────────────
  # 3. GESTIÓN DE CADUCIDADES
  # ─────────────────────────────────────────────────────────────

  Escenario: Monitoreo de caducidades
    Dado que se gestiona inventario
    Cuando se verifica caducidades
    Entonces:
      | Acción                      | Tiempo antes |
      | Usar primero (FIFO)        | Siempre      |
      | Alerta amarilla            | 60 días      |
      | Alerta naranja             | 30 días      |
      | Bloqueo de dispensación    | Caducado     |

  Escenario: Reporte de caducidades
    Dado que se genera reporte mensual
    Cuando se revisa
    Entonces incluye:
      | Medicamento | Stock | Caduca | Días restantes | Acción |
      | Oxitocina   | 15    | 01/12  | 42             | Usar primero |
      | Amoxicilina | 10    | 15/11  | 27             | Usar primero |
      | Paracetamol | 20    | 01/03  | 164            | OK         |

  # ─────────────────────────────────────────────────────────────
  # 4. KIT DE EMERGENCIA
  # ─────────────────────────────────────────────────────────────

  Escenario: Verificación de kit de emergencia
    Dado que se verifica kit de emergencia
    Cuando se revisa
    Entonces debe contener:
      | Equipo/Medicamento         | Verificar |
      | oxígeno (cilindro lleno)   | ✅         |
      | Equipo de intubación       | ✅         |
      | Ambú (bag-valve-mask)      | ✅         |
      | Sulfato de magnesio        | ✅         |
      | Oxitocina                  | ✅         |
      | Acceso venoso              | ✅         |
      | Equipo de reanimación neonatal | ✅     |
      | Desfibrilador             | ✅         |

  # ─────────────────────────────────────────────────────────────
  # 5. GESTIÓN DE OXÍGENO
  # ─────────────────────────────────────────────────────────────

  Escenario: Control de oxígeno medicinal
    Dado que se monitorea oxígeno
    Cuando se verifica
    Entonces:
      | Parámetro                  | Objetivo |
      | Nivel de cilindro principal| >20%     |
      | Cilindro de respaldo       | Lleno    |
      | Alarma de bajo nivel       | Habilitada |
      | Flujo de oxígeno           | Funcional |
      | Oxímetro funcional         | Sí        |

  # ─────────────────────────────────────────────────────────────
  # 6. PUNTO DE REORDEN
  # ─────────────────────────────────────────────────────────────

  Escenario: Cálculo de reorder point
    Dado que se calcula punto de reorden
    Cuando se evalúa consumo
    Entonces:
      | Medicamento | Consumo/mes | Stock actual | Reorder | Estado |
      | Sulfato Mg  | 30 amp      | 45           | 20      | OK     |
      | Oxitocina   | 20 amp      | 25           | 15      | OK     |
      | Hierro      | 100 cajas   | 15           | 30      | ⚠️ Bajo|
      | Paracetamol | 80 cajas    | 100          | 20      | OK     |

  Escenario: Alerta de stock crítico
    Dado que el stock baja del reorder point
    Cuando se detecta
    Entonces el sistema alerta:
      | Alerta                      |
      | "STOCK BAJO: [medicamento]" |
      | Stock actual: [cantidad]   |
      | Stock mínimo: [cantidad]   |
      | Acción: Solicitar reposición urgente |
