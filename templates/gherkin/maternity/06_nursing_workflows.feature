# language: es
# Enfermería Obstétrica - Workflows Específicos
@status:proposed
@type:acceptance
@domain:maternity
Característica: Enfermería en Maternidad (GHE)
  Como enfermera de la maternidad
  Quiero workflows específicos para mi rol
  Para documentar y ejecutar protocolos de enfermería correctamente

  # ─────────────────────────────────────────────────────────────
  # 1. TRIAJE OBSTÉTRICO (5 NIVELES)
  # ─────────────────────────────────────────────────────────────

  Escenario: Clasificación de triaje - Nivel 1 (Reanimación)
    Dado que la paciente llega inconsciente con sangrado activo
    Cuando la enfermera evalúa
    Entonces clasifica como:
      | Nivel | Color | Tiempo de atención |
      | 1 | 🔴 Rojo | Inmediato |
    Y activa:
      | Acción                      |
      | Llamada de emergencia       |
      | Vía aérea permeable         |
      | Acceso venoso x2            |
      | Tipaje y sangre             |
      | Monitoreo continuo          |

  Escenario: Clasificación de triaje - Nivel 2 (Emergencia)
    Dado que la paciente llega con PA >160/110 + cefalea severa
    Cuando la enfermera evalúa
    Entonces clasifica como:
      | Nivel | Color | Tiempo de atención |
      | 2 | 🟠 Naranja | <10 minutos |
    Y registra signos vitales inmediatamente

  Escenario: Clasificación de triaje - Nivel 3 (Urgencia)
    Dado que la paciente llega con dolor abdominal moderado
    Cuando la enfermera evalúa
    Entonces clasifica como:
      | Nivel | Color | Tiempo de atención |
      | 3 | 🟡 Amarillo | <30 minutos |

  Escenario: Clasificación de triaje - Nivel 4 (Menos urgente)
    Dado que la paciente llega a control prenatal de rutina
    Cuando la enfermera evalúa
    Entonces clasifica como:
      | Nivel | Color | Tiempo de atención |
      | 4 | 🟢 Verde | <60 minutos |

  Escenario: Clasificación de triaje - Nivel 5 (No urgente)
    Dado que la paciente llega con duda sobre medicamento
    Cuando la enfermera evalúa
    Entonces clasifica como:
      | Nivel | Color | Tiempo de atención |
      | 5 | 🔵 Azul | <120 minutos |

  # ─────────────────────────────────────────────────────────────
  # 2. REGISTRO DE SIGNOS VITALES POR TURNO
  # ─────────────────────────────────────────────────────────────

  Escenario: Registro de signos vitales en turno de mañana
    Dado que la enfermera inicia turno de mañana
    Cuando revisa pacientes internadas
    Entonces registra para cada paciente:
      | Parámetro                  | Frecuencia |
      | Presión arterial           | Cada 4h    |
      | Frecuencia cardíaca        | Cada 4h    |
      | Temperatura                | Cada 4h    |
      | Saturación de oxígeno      | Cada 4h    |
      | Peso                       | Diario     |
      | Frecuencia cardíaca fetal  | Cada 4h    |
      | Ingesta de líquidos        | Diario     |
      | Eliminaciones              | Diario     |

  # ─────────────────────────────────────────────────────────────
  # 3. ADMINISTRACIÓN DE MEDICAMENTOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Administración de sulfato de magnesio
    Dado que se administra sulfato de magnesio
    Cuando la enfermera prepara
    Entonces verifica:
      | Verificación               | Estado    |
      | Dosis correcta            | ✅         |
      | Vía de administración     | ✅ (IV)   |
      | Velocidad de infusión     | ✅         |
      | Reflejos rotulianos       | ✅ (>2/4) |
      | Respiración               | ✅ (>12rpm)|
      | Catéter vesical           | ✅ (orina >30ml/h) |
      | Antídoto disponible       | ✅ (gluconato calcio) |

  # ─────────────────────────────────────────────────────────────
  # 4. HANDOFF DE TURNO
  # ─────────────────────────────────────────────────────────────

  Escenario: Handoff estructurado (SBAR)
    Dado que la enfermera entrega turno
    Cuando usa formato SBAR
    Entonces documenta:
      | Sección                   | Contenido          |
      | S - Situation            | Estado actual de cada paciente |
      | B - Background           | Diagnóstico, tratamiento |
      | A - Assessment           | Evaluación, tendencias |
      | R - Recommendation       | Acciones pendientes, alertas |

  # ─────────────────────────────────────────────────────────────
  # 5. CONTROL DE MATERIAL ESTÉRIL
  # ─────────────────────────────────────────────────────────────

  Escenario: Verificación de material estéril
    Dado que se prepara material para procedimiento
    Cuando la enfermera verifica
    Entonces检查:
      | Verificación               | Estado    |
      | Paquete estéril sellado   | ✅         |
      | Fecha de esterilización   | ✅ vigente |
      | Indicador químico         | ✅ (cambio de color) |
      | Contenido completo        | ✅         |
  