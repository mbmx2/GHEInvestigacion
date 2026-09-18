# language: es
Característica: Atención Psiquiátrica
  Como psiquiatra
  Quiero evaluar y tratar trastornos mentales
  Para mejorar la salud mental y calidad de vida del paciente

  Contexto:
    Dado que el sistema está funcionando
    Y que el usuario tiene rol de médico

  Escenario: Evaluación psiquiátrica inicial
    Dado que el paciente acude por primera vez a consulta psiquiátrica
    Cuando el psiquiatra realiza evaluación
    Entonces el sistema registra:
      | Sección                   |
      | Motivo de consulta        |
      | Historia de la enfermedad actual |
      | Antecedentes personales patológicos |
      | Antecedentes familiares psiquiátricos |
      | Historia social           |
      | Historia farmacológica    |
      | Antecedentes de agresividad/ideación suicida |
      | Evaluación del estado mental |
      | Exploración psicopatológica |
      | Juicio clínico            |
      | Plan de tratamiento       |

  Escenario: Escalas de evaluación - PHQ-9 (Depresión)
    Dado que el paciente presenta síntomas depresivos
    Cuando el psiquiatra aplica PHQ-9
    Entonces el sistema registra respuestas:
      | Pregunta                                         | Puntuación |
      | 1. Poco interés o placer en las cosas            | 2          |
      | 2. Sentirse deprimido, triste o sin esperanza    | 2          |
      | 3. Dificultad para dormir o dormir demasiado     | 1          |
      | 4. Sentirse cansado o con poca energía           | 2          |
      | 5. Poco apetito o comer en exceso                | 1          |
      | 6. Sentirse mal consigo mismo                    | 2          |
      | 7. Dificultad para concentrarse                  | 1          |
      | 8. Moverse o hablar lentamente                   | 0          |
      | 9. Pensar en hacerse daño                        | 1          |
      | **TOTAL**                                        | **12**     |
    Y el sistema clasifica como "Depresión moderada"
    Y el sistema evalúa riesgo suicida:
      | Factor                      | Presente |
      | Ideación suicida            | Pasiva   |
      | Plan definido               | No       |
      | Acceso a medios             | No       |
      | Intentos previos            | No       |
    Y el sistema sugiere tratamiento:
      | Opción                     |
      | ISRS (Sertralina 50mg)     |
      | Psicoterapia cognitivo-conductual |
      | Seguimiento semanal        |

  Escenario: Escalas de evaluación - GAD-7 (Ansiedad)
    Dado que el paciente presenta síntomas de ansiedad
    Cuando el psiquiatra aplica GAD-7
    Entonces el sistema registra:
      | Pregunta                                         | Puntuación |
      | 1. Sentirse nervioso, ansioso o al límite        | 2          |
      | 2. No poder dejar de preocuparse                 | 2          |
      | 3. Preocuparse demasiado por diversas cosas      | 1          |
      | 4. Dificultad para relajarse                     | 2          |
      | 5. Estar tan inquieto que es difícil permanecer quieto | 1    |
      | 6. Irritarse o molestar fácilmente               | 1          |
      | 7. Sentir miedo como si pudiera pasar algo terrible | 0        |
      | **TOTAL**                                        | **9**      |
    Y el sistema clasifica como "Ansiedad moderada"
    Y el sistema sugiere tratamiento:
      | Opción                     |
      | ISRS o ISRN                |
      | Terapia cognitivo-conductual |
      | Técnicas de relajación     |

  Escenario: Evaluación de riesgo suicida
    Dado que el paciente presenta ideación suicida
    Cuando el psiquiatra evalúa riesgo
    Entonces el sistema registra:
      | Factor                      | Evaluación        |
      | Ideación suicida            | Activa, con plan   |
      | Plan específico             | Ingesta de medicamentos |
      | Acceso a medios             | Sí (medicamentos en casa) |
      | Intentos previos            | 1 hace 2 años      |
      | Factores protectores        | Hijos menores      |
      | Red de apoyo                | Familiar           |
      | Enfermedad mental comórbida | Depresión mayor    |
    Y el sistema clasifica como "ALTO RIESGO SUICIDA"
    Y el sistema genera ALERTA MÁXIMA
    Y el sistema requiere:
      | Acción                    |
      | Internación involuntaria  |
      | Retiro de medios letales  |
      | Notificar a familia       |
      | Plan de seguridad         |
    Y el sistema registra decisión clínica documentada

  Escenario: Prescripción de psicofármacos
    Dado que el psiquiatra indica medicamento
    Cuando genera prescripción
    Entonces el sistema verifica:
      | Verificación               | Estado             |
      | Interacciones medicamentosas| Verificadas        |
      | Dosis según peso/edad      | Correcta           |
      | Efectos adversos informados| Sí                 |
      | Consentimiento informado   | Firmado            |
      | Control de sustancias      | Verificado         |
    Y el sistema muestra información al paciente:
      | Información                 |
      | Cómo tomar el medicamento  |
      | Efectos adversos posibles  |
      | Qué hacer si olvida una dosis |
      | No suspender abruptamente  |
      | Citas de seguimiento       |

  Escenario: Monitoreo de litio
    Dado que el paciente toma litio para trastorno bipolar
    Cuando acude a control
    Entonces el sistema registra:
      | Parámetro                  | Valor              |
      | Nivel de litio             | 0.8 mEq/L         |
      | Rango terapéutico          | 0.6-1.2 mEq/L     |
      | Creatinina                 | 0.9 mg/dL          |
      | TSH                        | 2.5 mIU/mL         |
      | Tego renal                 | Normal             |
      | Sed                        | Leve               |
      | Temblor                    | Fino               |
      | Poliuria                   | No                 |
      | Polidipsia                 | No                 |
    Y el sistema evalúa:
      | Criterio                   | Estado             |
      | Nivel en rango             | Sí                 |
      | Función renal              | Normal             |
      | Función tiroidea           | Normal             |
      | Toxicidad                   | No                 |
    Y el sistema agenda próximo nivel: 3 meses

  Escenario: Evaluación de deterioro cognitivo
    Dado que la familia reporta olvidos en el paciente
    Cuando el psiquiatra evalúa
    Entonces el sistema aplica escalas:
      | Escala                     | Puntuación         |
      | MMSE                       | 22/30              |
      | MoCA                       | 19/30              |
      | Pfeiffer                   | 4 errores          |
    Y el sistema evalúa dominios cognitivos:
      | Dominio                    | Resultado          |
      | Orientación                | Déficit temporal y espacial |
      | Memoria                    | Déficit de evocación |
      | Atención                   | Conservada          |
      | Lenguaje                   | Anomia leve         |
      | Habilidades visuoespaciales| Déficit leve        |
      | Funciones ejecutivas       | Déficit moderado    |
    Y el sistema sugiere:
      | Acción                    |
      | TAC craneal               |
      | Perfil tiroideo           |
      | Vitamina B12              |
      | Evaluación neuropsicológica|
    Y el sistema clasifica como "Deterioro cognitivo leve - Dominio múltiple"

  Escenario: Terapia electroconvulsiva (TEC)
    Dado que el paciente es candidato a TEC
    Cuando se programa la sesión
    Entonces el sistema registra:
      | Parámetro                  | Valor              |
      | Indicación                 | Depresión resistente |
      | Número de sesiones planificadas | 12            |
      | Sesión actual              | 1                  |
      | Parámetros                 |                    |
      | Tipo                       | Bifrontal          |
      | Corriente                  | Déficit            |
      | Frecuencia                 | 120 Hz             |
      | Duración del pulso         | 1.5 ms             |
      | Tiempo de convulsión       | 35 segundos        |
      | Complicaciones             | Ninguna            |
    Y el sistema genera reporte de TEC
    Y el sistema agenda próxima sesión: 48 horas

  Escenario: Urgencia psiquiátrica
    Dado que el paciente llega con crisis de agitación psicomotora
    Cuando el equipo evalúa
    Entonces el sistema registra:
      | Parámetro                  | Valor              |
      | Comportamiento             | Agresivo, grita     |
      | Coherencia                 | Disminuida          |
      | Riesgo hacia sí mismo     | No evaluable        |
      | Riesgo hacia otros         | Sí                 |
      | Sustancias                 | No conocidas        |
    Y el sistema genera protocolo de contención:
      | Medida                    | Estado              |
      | Contención verbal         | Iniciada            |
      | Contención mecánica       | Si falla verbal     |
      | Medicación de rescate     | Haloperidol 5mg IM  |
      | Monitorización            | Continua            |
    Y el sistema registra cada intervención con timestamps
