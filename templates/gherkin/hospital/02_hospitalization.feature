# language: es
# Hospitalización
@status:proposed
@type:acceptance
@domain:hospital
Característica: Gestión de Hospitalización (GHE Hospital)
  Como médico internista del hospital
  Quiero workflows de hospitalización
  Para gestionar pacientes internados de forma segura y eficiente

  # ─────────────────────────────────────────────────────────────
  # 1. ADMISIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Proceso de admisión hospitalaria
    Dado que se decide hospitalizar paciente
    Cuando se ejecuta admisión
    Entonces el sistema guía:
      | Paso                       |
      | 1. Verificar indicación médica |
      | 2. Registrar datos de admisión |
      | 3. Asignar cama           |
      | 4. Generar orden de hospitalización |
      | 5. Informar al paciente    |
      | 6. Registrar en sistema    |

  # ─────────────────────────────────────────────────────────────
  # 2. SIGNOS VITALES EN HOSPITALIZACIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Frecuencia de monitoreo
    Dado que el paciente está hospitalizado
    Cuando se establece frecuencia de monitoreo
    Entonces:
      | Categoría                  | Frecuencia |
      | Crítico (UCI)              | Continua   |
      | Grave                      | Cada 1h    |
      | Moderado                   | Cada 4h    |
      | Estable                    | Cada 8h    |
      | Pre-alta                   | Cada 12h   |

  # ─────────────────────────────────────────────────────────────
  # 3. ÓRDENES MÉDICAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Gestión de órdenes médicas
    Dado que el médico genera órdenes
    Cuando se registra
    Entonces el sistema incluye:
      | Tipo de orden              |
      | Medicamentos              |
      | Dietas                    |
      | Laboratorios              |
      | Imagenología              |
      | Consultas a especialistas |
      | Procedimientos            |
      | Movilización              |
      | alta                      |

  # ─────────────────────────────────────────────────────────────
  # 4. ALTA HOSPITALARIA
  # ─────────────────────────────────────────────────────────────

  Escenario: Plan de alta
    Dado que se decide dar de alta al paciente
    Cuando se prepara alta
    Entonces el sistema guía:
      | Sección                   |
      | Diagnóstico de alta       |
      | Procedimientos realizados |
      | Tratamiento de alta       |
      | Medicamentos de alta      |
      | Cuidados en domicilio     |
      | Criterios de alarma       |
      | Cita de seguimiento       |
      | Instrucciones al paciente |

  # ─────────────────────────────────────────────────────────────
  # 5. PREVENCIÓN DE INFECCIONES NOSOCOMIALES
  # ─────────────────────────────────────────────────────────────

  Escenario: Protocolo de prevención de infecciones
    Dado que se implementan medidas de prevención
    Cuando se verifica
    Entonces:
      | Medida                      | Implementada |
      | Higiene de manos           | ✅           |
      | Técnica aséptica          | ✅           |
      | Curación de heridas        | ✅           |
      | Cuidado de catéteres       | ✅           |
      | Vigilancia de infecciones  | ✅           |
      | Uso de guantes            | ✅           |

  Escenario: Vigilancia de infección de sitio quirúrgico
    Dado que se vigila ISQ
    Cuando se registra
    Entonces:
      | Dato                       |
      | Tipo de cirugía           |
      | Clasificación de herida   |
      | Profilaxis antibiótica    |
      | Tiempo quirúrgico         |
      | Infección post-op (Sí/No) |
      | Tipo de infección (si aplica) |

  # ─────────────────────────────────────────────────────────────
  # 6. MANEJO DEL DOLOR
  # ─────────────────────────────────────────────────────────────

  Escenario: Evaluación y manejo del dolor
    Dado que se evalúa dolor en paciente hospitalizado
    Cuando se registra
    Entonces el sistema guía:
      | Escala                     | Uso |
      | EVA (0-10)                | Adultos |
      | Wong-Baker (caras)        | Niños 3-7 años |
      | FLACC                     | Niños <3 años |
    Y plan de manejo según EVA:
      | EVA   | Manejo |
      | 1-3   | No farmacológico |
      | 4-6   | Paracetamol/ibuprofeno |
      | 7-10  | Opioides + no farmacológico |

  # ─────────────────────────────────────────────────────────────
  # 7. IDENTIFICACIÓN DE PACIENTE HOSPITALIZADO
  # ─────────────────────────────────────────────────────────────

  Escenario: Sistema de identificación
    Dado que el paciente está hospitalizado
    Cuando se verifica identidad
    Entonces el sistema usa:
      | Elemento                    |
      | Pulsera de identificación  |
      | Código de barras           |
      | Verificación al administrar medicamento |
      | Verificación al tomar muestra |
      | Verificación al trasladar  |
