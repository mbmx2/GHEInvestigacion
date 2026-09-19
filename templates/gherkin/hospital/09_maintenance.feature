# language: es
# Mantenimiento de Equipo e Infraestructura
Característica: Mantenimiento (GHE Hospital)
  Como jefe de mantenimiento del hospital
  Quiero workflows de mantenimiento
  Para que todo el equipo e infraestructura funcionen correctamente

  # ─────────────────────────────────────────────────────────────
  # 1. MANTENIMIENTO PREVENTIVO
  # ─────────────────────────────────────────────────────────────

  Escenario: Calendario de mantenimiento preventivo
    Dado que se programa mantenimiento
    Cuando se planifica
    Entonces:
      | Equipo/Infraestructura     | Frecuencia |
      | Equipos médicos           | Mensual    |
      | Equipo de quirófano       | Semanal    |
      | Monitores de signos vitales| Semanal   |
      | Bombas de infusión        | Mensual    |
      | Equipo de laboratorio     | Mensual    |
      | Sistemas eléctricos       | Mensual    |
      | Gas medicinal             | Mensual    |
      | Aire acondicionado       | Mensual    |
      | Extintores               | Semestral  |
      | Iluminación              | Trimestral  |

  # ─────────────────────────────────────────────────────────────
  # 2. MANTENIMIENTO CORRECTIVO
  # ─────────────────────────────────────────────────────────────

  Escenario: Registro de falla de equipo
    Dado que se reporta falla de equipo
    Cuando se registra
    Entonces el sistema incluye:
      | Campo                     |
      | Fecha/hora de la falla   |
      | Equipo afectado          |
      | Área                     |
      | Descripción de la falla  |
      | Prioridad (crítica/alta/media/baja) |
      | Personal asignado       |
      | Estado (pendiente/en proceso/resuelta) |
      | Tiempo de resolución     |

  Escenario: Priorización de mantenimiento
    Dado que se priorizan fallas
    Cuando se evalúa
    Entonces:
      | Prioridad                | Criterio | Tiempo respuesta |
      | Crítica                  | Equipo de vida | <1 hora |
      | Alta                     | Equipo quirúrgico | <4 horas |
      | Media                    | Equipo diagnóstico | <24 horas |
      | Baja                     | Equipamiento menor | <1 semana |

  # ─────────────────────────────────────────────────────────────
  # 3. GESTIÓN DE GAS MEDICINAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Control de oxígeno medicinal
    Dado que se gestiona oxígeno
    Cuando se monitorea
    Entonces:
      | Parámetro                  | Objetivo |
      | Nivel de tanque principal  | >20%     |
      | Cilindro de respaldo      | Lleno    |
      | Alarma de bajo nivel      | Habilitada |
      | Red de distribución       | Funcional |

  # ─────────────────────────────────────────────────────────────
  # 4. GESTIÓN ELÉCTRICA
  # ─────────────────────────────────────────────────────────────

  Escenario: Monitoreo eléctrico
    Dado que se monitorea sistema eléctrico
    Cuando se verifica
    Entonces:
      | Parámetro                  | Estado |
      | Generador de emergencia   | Funcional |
      | UPS                       | Cargado  |
      │ Tablero eléctrico         | Sin anomalías |
      │ Iluminación de emergencia | Funcional |

  Escenario: Protocolo de apagón
    Dado que se produce un apagón
    Cuando se activa protocolo
    Entonces:
      | Paso                       |
      | 1. Generador arranca automáticamente |
      | 2. Verificar pacientes críticos |
      | 3. Verificar equipos de vida |
      | 4. Notificar a dirección  |
      | 5. Monitorear hasta restablecimiento |

  # ─────────────────────────────────────────────────────────────
  # 5. GESTIÓN DE AGUA
  # ─────────────────────────────────────────────────────────────

  Escenario: Monitoreo de calidad de agua
    Dado que se verifica calidad de agua
    Cuando se evalúa
    Entonces:
      | Parámetro                  | Objetivo |
      | Potabilidad               | NOM-127   |
      | Cloración                 | 0.2-1.5 mg/L |
      | Temperatura agua caliente | >45°C      |
      | Tanques de almacenamiento | Limpios     |
