# language: es
Característica: Atención Cardiológica
  Como cardiólogo
  Quiero diagnosticar y tratar enfermedades cardiovasculares
  Para reducir morbilidad y mortalidad cardiovascular

  Contexto:
    Dado que el sistema está funcionando
    Y que el usuario tiene rol de médico

  Escenario: Evaluación de dolor torácico
    Dado que el paciente acude con dolor torácico
    Cuando el médico realiza evaluación cardíaca
    Entonces el sistema registra:
      | Característica             | Detalle            |
      | Tipo de dolor              | Opresivo           |
      | Localización               | Retroesternal      |
      | Irradiación                | Brazo izquierdo    |
      | Duración                   | 30 minutos         |
      | Factores agravantes        | Esfuerzo           |
      | Factores atenuantes        | Reposo, nitroglicerina |
      | Síntomas asociados         | Diaforesis, náuseas|
    Y el sistema solicita:
      | Estudio                   | Prioridad          |
      | ECG de 12 derivaciones    | Inmediata          |
      | Troponina                 | Urgente            |
      | BHC                       | Urgente            |
      | Química sanguínea         | Urgente            |
      | Radiografía de tórax      | Urgente            |
    Y el sistema evalúa score de riesgo:
      | Score                     | Valor              |
      | HEART Score               | 7 (Alto riesgo)    |
    Y el sistema sugiere: "Hospitalización para observación"

  Escenario: Registro de electrocardiograma
    Dado que se realizó ECG al paciente
    Cuando el médico interpreta el ECG
    Entonces el sistema registra:
      | Parámetro                 | Resultado          |
      | Ritmo                     | Sinusal            |
      | Frecuencia                | 95 lpm             |
      | Eje                       | Normal             |
      | Intervalo PR              | 180 ms             |
      | Intervalo QRS             | 100 ms             |
      | Intervalo QTc             | 440 ms             |
      | Ondas ST                  | Elevación V1-V4    |
      | Ondas T                   | Invertidas V1-V4   |
      | Interpretación            | IAM anteroseptal agudo |
    Y el sistema clasifica como "IAM con elevación del ST"
    Y el sistema genera alarma: "Activar protocolo de infarto"

  Escenario: Ecocardiograma
    Dado que se solicitó ecocardiograma
    Cuando el cardiólogo realiza el estudio
    Entonces el sistema registra:
      | Parámetro                 | Valor              |
      | FEVI                      | 35%                |
      | VTD                       | 180 mL             |
      | VTS                       | 117 mL             |
      | FRacción de acortamiento  | 18%                |
      | Válvulas                  | Insuficiencia mitral moderada |
      | Pericardio                | Sin derrame         |
      | Motilidad segmentaria     | Hipocinesia anterior |
    Y el sistema clasifica como "Disfunción sistólica severa"
    Y el sistema sugiere: "ICFE - Iniciar tratamiento guiado por evidencia"

  Escenario: Manejo de insuficiencia cardíaca
    Dado que el paciente tiene ICFE con FEVI 35%
    Cuando el médico actualiza tratamiento
    Entonces el sistema muestra guía de tratamiento:
      | Fármaco                   | Dosis actual | Meta       |
      | Enalapril                 | 5mg cada 12h | 20mg cada 12h |
      | Carvedilol                | 3.125mg cada 12h | 25mg cada 12h |
      | Espironolactona           | 25mg diario  | 50mg diario |
      | Furosemida                | 40mg diario  | Ajustar según peso |
    Y el sistema registra titulación:
      | Fecha        | Enalapril | Carvedilol | Espironolactona |
      | 01/01/2024   | 5mg       | 3.125mg    | 25mg            |
      | 01/02/2024   | 10mg      | 6.25mg     | 25mg            |
      | 01/03/2024   | 10mg      | 12.5mg     | 50mg            |
    Y el sistema evalúa seguimiento:
      | Parámetro                 | Objetivo           |
      | Peso                      | Estable ±1 kg      |
      | PA                        | >90/60             |
      | Potasio                   | 3.5-5.0            |
      | Creatinina                | Estable            |

  Escenario: Monitorización ambulatoria de presión arterial (MAPA)
    Dado que se solicitó MAPA de 24 horas
    Cuando se realiza el estudio
    Entonces el sistema registra promedios:
      | Período                    | PA sistólica | PA diastólica |
      | Diurno (6-22h)            | 145          | 92            |
      | Nocturno (22-6h)          | 130          | 80            |
      | 24 horas                  | 140          | 88            |
    Y el sistema evalúa:
      | Criterio                  | Resultado         |
      | Descenso nocturno         | Dipper (10-20%)   |
      | Carga de presión          | Elevada           |
      | Variabilidad              | Normal            |
    Y el sistema clasifica como "Hipertensión mantecida"
    Y el sistema sugiere: "Ajustar tratamiento antihipertensivo"

  Escenario: Holter de 24 horas
    Dado que se solicitó Holter de 24 horas
    Cuando se realiza el estudio
    Entonces el sistema registra:
      | Parámetro                 | Resultado          |
      | FC media                  | 78 lpm             |
      | FC mínima                 | 52 lpm (nocturna)  |
      | FC máxima                 | 145 lpm            |
      | Arritmias                 | Extrasístoles ventriculares (150/24h) |
      | Bloqueos                  | Ninguno            |
      | Isquemia                  | No documentada     |
      | Ritmo predominante        | Sinusal            |
    Y el sistema clasifica arritmias como "Frecuentes, no complejas"
    Y el sistema sugiere: "Control periódico, sin tratamiento antiarrítmico"

  Escenario: Prueba de esfuerzo
    Dado que se solicitó prueba de esfuerzo
    Cuando se realiza el estudio
    Entonces el sistema registra:
      | Parámetro                 | Resultado          |
      | Protocolo                 | Bruce Modificado   |
      | Tiempo total              | 8 minutos          |
      | METS alcanzados           | 10                 |
      | FC máxima                 | 165 lpm            |
      | PA máxima                 | 180/90             |
      | Angina                    | No                 |
      | Depresión del ST          | 2mm en V4-V6       |
      | Arritmias                 | Extrasístoles ventriculares |
      | Capacidad funcional       | Moderada           |
    Y el sistema clasifica como "Prueba positiva para isquemia"
    Y el sistema sugiere: "Angiografía coronaria"

  Escenario: Seguimiento post-infarto
    Dado que el paciente fue hospitalizado por IAM
    Cuando egresa del hospital
    Entonces el sistema genera plan de egreso:
      | Componente                |
      | Diagnóstico de egreso     |
      | Procedimientos realizados |
      | Medicamentos de alta      |
      | Educación al paciente     |
      | Criterios de alarma       |
      | Citas de seguimiento      |
    Y el sistema programa seguimiento:
      | Cita                      | Tiempo             |
      | Control cardiológico      | 1 semana           |
      | Ecocardiograma de control | 1 mes              |
      | Reevaluación              | 3 meses            |
      | Prueba de esfuerzo        | 3 meses            |
    Y el sistema genera ordenes de rehabilitación cardíaca
