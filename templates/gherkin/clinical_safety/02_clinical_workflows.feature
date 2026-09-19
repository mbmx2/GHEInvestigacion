# language: es
# Clinical Workflow Standardization
Característica: Estandarización de Flujos Clínicos (GHE)
  Como director médico de la maternidad
  Quiero workflows clínicos estandarizados
  Para que cada paciente reciba la misma calidad de atención

  # ─────────────────────────────────────────────────────────────
  # 1. TRIAJE DE ENFERMERÍA (5 NIVELES)
  # ─────────────────────────────────────────────────────────────

  Escenario: Clasificación de triaje - Nivel 1 (Reanimación)
    Dado que la paciente llega en estado crítico
    Cuando se clasifica
    Entonces:
      | Criterio                    | Nivel 1 |
      | Sin pulso / sin respiración| Reanimación inmediata |
      | Shock hipovolémico         | Inmediato |
      | Convulsiones activas       | Inmediato |
      | Coma                       | Inmediato |
    Y tiempo de atención: **INMEDIATO**

  Escenario: Clasificación de triaje - Nivel 2 (Emergencia)
    Dado que la paciente llega con signos vitales anormales
    Cuando se clasifica
    Entonces:
      | Criterio                    | Nivel 2 |
      | PA >160/110                 | Emergencia |
      | Fiebre >39°C + signos de sepsis | Emergencia |
      | Sangrado activo moderado   | Emergencia |
      | Dolor intenso + signos de irritación peritoneal | Emergencia |
    Y tiempo de atención: **<10 minutos**

  Escenario: Clasificación de triaje - Nivel 3 (Urgencia)
    Dado que la paciente llega con síntomas preocupantes
    Cuando se clasifica
    Entonces:
      | Criterio                    | Nivel 3 |
      | PA 140-159/90-109          | Urgencia |
      | Fiebre 38.5-39°C           | Urgencia |
      | Dolor moderado-intenso     | Urgencia |
      | Sangrado escaso            | Urgencia |
    Y tiempo de atención: **<30 minutos**

  Escenario: Clasificación de triaje - Nivel 4 (Menos urgente)
    Dado que la paciente llega a control de rutina con hallazgo
    Cuando se clasifica
    Entonces:
      | Criterio                    | Nivel 4 |
      | Control prenatal normal    | Rutina |
      | Dolor leve                 | Rutina |
      | Consulta por duda         | Rutina |
    Y tiempo de atención: **<60 minutos**

  Escenario: Clasificación de triaje - Nivel 5 (No urgente)
    Dado que la paciente llega con consulta administrativa
    Cuando se clasifica
    Entonces:
      | Criterio                    | Nivel 5 |
      | Solicitud de receta        | Administrativo |
      | Consulta de resultados    | Administrativo |
      | Duda general              | Administrativo |
    Y tiempo de atención: **<120 minutos**

  # ─────────────────────────────────────────────────────────────
  # 2. HANDOFF ESTRUCTURADO (SBAR)
  # ─────────────────────────────────────────────────────────────

  Escenario: Handoff de enfermería (SBAR)
    Dado que la enfermera entrega turno
    Cuando usa formato SBAR
    Entonces documenta:
      | Sección | Contenido |
      | **S** - Situation | "Paciente María García, 28 semanas, en control prenatal" |
      | **B** - Background | "Primigesta, HTA gestacional, toma Labetalol" |
      | **A** - Assessment | "PA 135/88, tolera alimentos, FCF 140" |
      | **R** - Recommendation | "Vigilar PA cada 4h, próximo lab en 48h" |

  Escenario: Handoff entre turnos de médico
    Dado que el médico entrega guardia
    Cuando se documenta handoff
    Entonces incluye:
      | Sección                   |
      | Pacientes activos (lista) |
      | Pacientes críticos (detalles) |
      | Pendientes por resolver |
      | Pendientes de laboratorio |
      | Referencias pendientes |
      | Alertas activas |

  # ─────────────────────────────────────────────────────────────
  # 3. ADMINISTRACIÓN DE MEDICAMENTOS (5 CORRECTOS)
  # ─────────────────────────────────────────────────────────────

  Escenario: Verificación de los 5 correctos
    Dado que se administra medicamento
    Cuando se verifica
    Entonces el sistema confirma:
      | Correcto                    | Verificación |
      | Paciente correcto          | Nombre + CURP |
      | Medicamento correcto       | Nombre genérico |
      | Dosis correcta             | Calculada por peso |
      | Vía correcta              | Oral/IV/IM/etc |
      | Hora correcta            | Según schedule |

  # ─────────────────────────────────────────────────────────────
  # 4. TOMA DE MUESTRAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Protocolo de toma de muestras
    Dado que se toma muestra de sangre
    Cuando se sigue protocolo
    Entonces:
      | Paso                       |
      | 1. Verificar identidad del paciente |
      | 2. Verificar ayuno (si aplica) |
      | 3. Seleccionar sitio de punción |
      | 4. Técnica aséptica |
      | 5. Rotular correctamente |
      | 6. Transportar en conditions adecuadas |
      | 7. Registrar en sistema |

  # ─────────────────────────────────────────────────────────────
  # 5. PREVENCIÓN DE CAÍDAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Evaluación de riesgo de caídas
    Dado que se evalúa riesgo de caídas
    Cuando se clasifica
    Entonces:
      | Factor                      | Puntos |
      | Edad >65 años              | 1      |
      | Historial de caídas       | 2      |
      | Mareo / inestabilidad     | 2      |
      | Medicamentos sedantes     | 2      |
      | Visión reducida           | 1      |
      | Debilidad muscular         | 1      |
      | Urgencia para orinar      | 1      |
    Y si total ≥3: implementar medidas preventivas
