# language: es
Característica: Atención de Urgencias
  Como médico de urgencias
  Quiero atender pacientes de forma rápida y organizada
  Para estabilizar emergencias y salvar vidas

  Contexto:
    Dado que el sistema está funcionando
    Y que el usuario tiene rol de médico de urgencias

  Escenario: Triaje de urgencias - Nivel 1 (Resucitación)
    Dado que el paciente llega al área de urgencias
    Cuando el personal registra signos vitales:
      | Campo                    | Valor           |
      | Nivel de conciencia      | Glasgow 6       |
      | Presión arterial         | 70/40           |
      | Frecuencia cardíaca      | 140 lpm         |
      | Saturación de oxígeno    | 82%             |
      | Temperatura              | 36.0°C          |
      | Respiración              | 8 rpm           |
    Entonces el sistema clasifica como "NIVEL 1 - RESUCITACIÓN"
    Y el sistema asigna color ROJO
    Y el sistema genera ALARMA MÁXIMA
    Y el sistema notifica a TODO el equipo de urgencias
    Y el sistema muestra "ATENCIÓN INMEDIATA - SIN ESPERA"

  Escenario: Triaje de urgencias - Nivel 2 (Emergencia)
    Dado que el paciente llega con dolor torácico intenso
    Cuando el personal registra:
      | Campo                    | Valor           |
      | Dolor torácico           | Sí, intenso     |
      | Presión arterial         | 160/100         |
      | Frecuencia cardíaca      | 110 lpm         |
      | Saturación de oxígeno    | 91%             |
      | Sudoración               | Profusa         |
    Entonces el sistema clasifica como "NIVEL 2 - EMERGENCIA"
    Y el sistema asigna color NARANJA
    Y el sistema alerta al cardiólogo de guardia
    Y el sistema estima tiempo de atención: 10 minutos

  Escenario: Triaje de urgencias - Nivel 3 (Urgencia)
    Dado que el paciente llega con fiebre alta y cefalea
    Cuando el personal registra:
      | Campo                    | Valor           |
      | Temperatura              | 39.5°C          |
      | Cefalea                  | Intensa         |
      | Rigidez de nuca          | Positiva        |
      | Presión arterial         | 130/80          |
      | Frecuencia cardíaca      | 95 lpm          |
    Entonces el sistema clasifica como "NIVEL 3 - URGENTE"
    Y el sistema asigna color AMARILLO
    Y el sistema sugiere: "Considerar punción lumbar"
    Y el sistema estima tiempo de atención: 30 minutos

  Escenario: Triaje de urgencias - Nivel 4 (Menos urgente)
    Dado que el paciente llega con traumatismo de muñeca
    Cuando el personal registra:
      | Campo                    | Valor           |
      | Dolor                    | Moderado        |
      | Deformidad               | Sí              |
      | Movilidad                | Limitada        |
      | Presión arterial         | 120/75          |
      | Frecuencia cardíaca      | 78 lpm          |
      | Saturación de oxígeno    | 98%             |
    Entonces el sistema clasifica como "NIVEL 4 - MENOS URGENTE"
    Y el sistema asigna color VERDE CLARO
    Y el sistema estima tiempo de atención: 60 minutos

  Escenario: Triaje de urgencias - Nivel 5 (No urgente)
    Dado que el paciente llega con resfriado común
    Cuando el personal registra:
      | Campo                    | Valor           |
      | Síntomas                 | Congestión, estornudos |
      | Fiebre                   | 37.2°C          |
      | Presión arterial         | 118/72          |
      | Frecuencia cardíaca      | 72 lpm          |
      | Saturación de oxígeno    | 99%             |
    Entonces el sistema clasifica como "NIVEL 5 - NO URGENTE"
    Y el sistema asigna color AZUL
    Y el sistema sugiere: "Canalizar a consulta externa"
    Y el sistema estima tiempo de atención: 120 minutos

  Escenario: Atención de politraumatismo
    Dado que el paciente llega en politraumatismo por accidente vial
    Cuando el médico realiza evaluación primaria (ATLS):
      | Vía aérea                | Permeable       |
      | Respiración              | 24 rpm, bilateral |
      | Circulación              | PA 90/60, FC 120 |
      | Discapacidad             | Glasgow 14      |
      | Exposición               | Múltiples lesiones |
    Y realiza evaluación secundaria:
      | Hallazgo                 | Detalle         |
      | Tórax                    | Tórax inestable |
      | Abdomen                  | Dolor difuso    |
      | Pelvis                    | Estable         |
      | Extremidades             | Fx abierta fémur|
    Entonces el sistema genera HOJA DE TRAUMA
    Y el sistema registra tiempos:
      | Momento                  | Timestamp       |
      | Llegada                  | Automático      |
      | Evaluación primaria      | Automático      |
      | Evaluación secundaria    | Automático      |
      | Decisiones               | Automático      |
    Y el sistema sugiere estudios urgentes:
      | Estudio                  | Prioridad       |
      | Radiografía tórax        | Inmediata       |
      | Radiografía pelvis       | Inmediata       |
      | TAC craneal              | Urgente         |
      | Ecografía FAST           | Urgente         |

  Escenario: Paro cardiorrespiratorio
    Dado que el paciente presenta PCR
    Cuando se inicia RCP
    Entonces el sistema registra:
      | Hito                     | Hora            |
      | Detección del paro       | Automática      |
      | Inicio RCP               | Automática      |
      | Desfibrilación           | (si aplica)     |
      | Administración adrenalina| (si aplica)     |
      | Retorno de circulación espontánea | (si aplica) |
    Y el sistema muestra cronómetro de RCP
    Y el sistema registra cada compresión y ventilación
    Y el sistema genera reporte post-RCP

  Escenario: Intoxicación aguda
    Dado que el paciente llega por intoxicación
    Cuando el médico registra:
      | Sustancia                 | Paracetamol     |
      | Cantidad ingerida        | 20 tabletas     |
      | Hora de ingesta          | Hace 2 horas    |
      | Peso del paciente        | 70 kg           |
    Entonces el sistema calcula dosis ingerida: 10,000mg
    Y el sistema cruza con nomograma de hepatotoxicidad
    Y el sistema sugiere: "NAC según protocolo"
    Y el sistema genera orden de laboratorio:
      | Estudio                  | Urgencia        |
      | Paracetam sérico         | Inmediata       |
      | Biometría hemática       | Urgente         |
      | Pruebas de función hepática | Urgente     |

  Escenario: Registro de egreso de urgencias
    Dado que el paciente fue atendido y estabilizado
    Cuando el médico genera nota de egreso
    Entonces el sistema genera documento con:
      | Sección                   |
      | Motivo de consulta        |
      | Exploración física         |
      | Diagnóstico               |
      | Tratamiento realizado     |
      | Indicaciones de egreso    |
      | Criterio de interconsulta |
      | Seguimiento               |
    Y el sistema registra destino del paciente:
      | Destino                   |
      | Domicilio con indicaciones|
      | Hospitalización           |
      | Observación               |
      | Referencia a otro centro  |
    Y el sistema genera receta de egreso
    Y el sistema agenda seguimiento si aplica

  Escenario: Historial de visitas a urgencias
    Dado que el paciente tiene visitas previas a urgencias
    Cuando el médico abre el expediente
    Entonces el sistema muestra:
      | Columna                   |
      | Fecha de visita           |
      | Motivo                    |
      | Diagnóstico               |
      | Tratamiento               |
      | Destino                   |
    Y el sistema muestra frecuencia de visitas
    Y el sistema alerta si hay patrón de visitas frecuentes
