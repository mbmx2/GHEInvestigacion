# language: es
Característica: Gestión de Enfermedades Crónicas
@status:proposed
@type:acceptance
@domain:chronic
  Como médico de atención primaria
  Quiero gestionar enfermedades crónicas de forma integral
  Para prevenir complicaciones y mejorar calidad de vida

  Contexto:
    Dado que el sistema está funcionando
    Y que el usuario tiene rol de médico

  Escenario: Registro de enfermedad crónica
    Dado que se diagnostica diabetes tipo 2
    Cuando el médico registra diagnóstico crónico
    Entonces el sistema crea registro de enfermedad crónica:
      | Campo                     | Valor              |
      | Enfermedad                | Diabetes Mellitus Tipo 2 |
      | Código CIE-10             | E11.9              |
      | Fecha de diagnóstico      | 01/01/2024         |
      | Estadio                   | Inicial            |
      | Tratamiento actual        | Metformina 850mg   |
      | Meta terapéutica          | HbA1c <7%          |
      | Frecuencia de seguimiento | Cada 3 meses       |
    Y el sistema genera cronograma de seguimiento:
      | Fecha        | Actividad                |
      | 01/01/2024   | Diagnóstico + Plan       |
      | 01/04/2024   | Control + HbA1c          |
      | 01/07/2024   | Control + HbA1c          |
      | 01/10/2024   | Control + HbA1c + Microalbuminuria |
      | 01/01/2025   | Control integral anual   |

  Escenario: Dashboard de paciente crónico
    Dado que el paciente tiene múltiples enfermedades crónicas
    Cuando el médico abre el expediente
    Entonces el sistema muestra dashboard:
      | Enfermedad      | Estado actual        | Último control | Próximo control |
      | Diabetes T2     | HbA1c 8.5%           | 01/07/2024     | 01/10/2024     |
      | Hipertensión    | PA 135/85            | 01/07/2024     | 01/08/2024     |
      | Dislipidemia    | LDL 130 mg/dL        | 01/07/2024     | 01/01/2025     |
    Y el sistema resalta valores fuera de meta
    Y el sistema muestra tendencias

  Escenario: Alerta de seguimiento perdido
    Dado que el paciente crónico no asiste a control
    Cuando el sistema detecta inasistencia
    Entonces el sistema genera alerta:
      | Tipo                       |
      | Paciente con seguimiento perdido |
      | Enfermedad: Diabetes       |
      | Último control: hace 6 meses |
      | Meta: control cada 3 meses |
    Y el sistema sugiere:
      | Acción                    |
      | Llamada telefónica al paciente |
      | Envío de recordatorio por WhatsApp |
      | Evaluación de adherencia   |

  Escenario: Evaluación de adherencia terapéutica
    Dado que el paciente crónico acude a control
    Cuando el médico evalúa adherencia
    Entonces el sistema registra:
      | Pregunta                                          | Respuesta |
      | ¿Toma todos sus medicamentos?                     | No        |
      | ¿Ha olvidado alguna toma esta semana?              | Sí, 2 veces|
      | ¿Ha dejado de tomar algún medicamento?             | Sí, pastilla para la presión |
      | ¿Ha automedicado algún medicamento?                | No        |
      | ¿Tiene dificultad para pagar medicamentos?         | Sí        |
    Y el sistema calcula adherencia: 60%
    Y el sistema evalúa:
      | Factor                      | Identificado      |
      | Olvido                      | Sí                |
      | Efectos adversos            | No                |
      | Dificultad económica        | Sí                |
      | Falta de conocimiento       | Parcial           |
    Y el sistema sugiere intervenciones:
      | Intervención                |
      | Simplificar esquema         |
      | Educación reforzada         |
      | Referencia a asistencia social |

  Escenario: Control integrado de crónicos
    Dado que el paciente tiene diabetes, HTA y dislipidemia
    Cuando acude a control integral trimestral
    Entonces el sistema ejecuta checklist:
      | Actividad                   | Estado     |
      | Signos vitales             | Completado |
      | Peso y BMI                 | Completado |
      | Glucosa capilar            | Completado |
      | HbA1c (si aplica)          | Pendiente  |
      | Perfil lipídico (si aplica)| Pendiente  |
      | Creatinina (si aplica)     | Pendiente  |
      | Microalbuminuria (si aplica)| Pendiente |
      | Evaluar adherencia         | Completado |
      | Ajustar medicamentos       | Pendiente  |
      | Educación al paciente      | Completado |
      | Agendar próximo control    | Pendiente  |

  Escenario: Reporte epidemiológico de crónicos
    Dado que se genera reporte mensual de enfermedades crónicas
    Cuando el administrador solicita estadísticas
    Entonces el sistema muestra:
      | Enfermedad      | Pacientes activos | Controlados | No controlados |
      | Diabetes        | 120               | 72 (60%)    | 48 (40%)       |
      | Hipertensión    | 200               | 140 (70%)   | 60 (30%)       |
      | Dislipidemia    | 80                | 48 (60%)    | 32 (40%)       |
      | EPOC            | 30                | 18 (60%)    | 12 (40%)       |
    Y el sistema puede filtrar por: período, enfermedad, médico
    Y el sistema exporta a PDF o Excel

  Escenario: Detección de complicaciones tempranas
    Dado que el paciente tiene diabetes hace 5 años
    Cuando se realiza control anual integral
    Entonces el sistema verifica:
      | Complicación                | Estudio requerido     | Estado   |
      | Retinopatía diabética       | Fondo de ojo          | Pendiente|
      | Nefropatía diabética        | Microalbuminuria      | Pendiente|
      | Neuropatía periférica       | Monofilamento         | Pendiente|
      | Pie diabético               | Exploración de pies   | Pendiente|
      | Cardiovascular              | ECG + perfil lipídico | Pendiente|
    Y el sistema genera orden de estudios preventivos
    Y el sistema agenda evaluación por especialidad si aplica

  Escenario: Vacunación en crónicos
    Dado que el paciente tiene enfermedad crónica
    Cuando se revisa estado de vacunación
    Entonces el sistema muestra:
      | Vacuna                    | Recomendada | Estado    |
      | Influenza                 | Anual       | Pendiente |
      | Neumococo                 | Cada 5 años | Aplicada  |
      | Hepatitis B               | Completa    | Aplicada  |
      | COVID-19                  | Refuerzo    | Pendiente |
      | Herpes zóster             | Si >50 años | No aplica |
    Y el sistema genera orden de vacunación pendiente
    Y el sistema registra vacuna aplicada con lote y fecha
