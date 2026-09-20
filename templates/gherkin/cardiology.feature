# language: es
Característica: Atención Cardiológica
  Como cardiólogo
  Quiero diagnosticar y tratar enfermedades cardiovasculares
  Para reducir morbilidad y mortalidad

  Contexto:
    Dado que el sistema está activo
    Y que el usuario tiene rol de médico

  Escenario: Evaluación de dolor torácico
    Dado que paciente acude con dolor torácico opresivo retroesternal
    Cuando médico realiza evaluación
    Entonces el sistema:
      | Acción                          |
      | Registrar características del dolor |
      | Solicitar: ECG 12 derivaciones, troponina, BHC, Rx tórax |
      | Evaluar HEART Score: 7 (Alto riesgo) |
      | Sugerir: Hospitalización para observación |

  Escenario: Registro de ECG
    Dado que se realizó ECG al paciente
    Cuando médico interpreta
    Entonces el sistema registra:
      | Parámetro                 | Resultado          |
      | Ritmo                     | Sinusal            |
      | FC                        | 95 lpm             |
      | PR/QRS/QTc               | 180/100/440 ms     |
      | Ondas ST                  | Elevación V1-V4    |
      | Interpretación            | IAM anteroseptal   |
    Y genera alarma: "Activar protocolo infarto"

  Escenario: Ecocardiograma
    Dado que se realizó ecocardiograma
    Cuando cardiólogo interpreta
    Entonces registra:
      | Parámetro                 | Resultado          |
      | FEVI                      | 35%                |
      | Válvulas                  | Insuf. mitral mod. |
      | Motilidad                 | Hipocinesia anterior |
    Y clasifica: "Disfunción sistólica severa"

  Escenario: Manejo de IC
    Dado que paciente tiene ICFE con FEVI 35%
    Cuando médico actualiza tratamiento
    Entonces muestra guía:
      | Fármaco     | Actual       | Meta            |
      | Enalapril   | 5mg c/12h    | 20mg c/12h      |
      | Carvedilol  | 3.125mg c/12h| 25mg c/12h      |
      | Espironolactona| 25mg/día  | 50mg/día        |
    Y evalúa seguimiento:
      | Parámetro  | Objetivo         |
      | Peso       | Estable ±1 kg    |
      | PA         | >90/60           |
      | Potasio    | 3.5-5.0          |

  Escenario: MAPA de 24 horas
    Dado que se realizó MAPA
    Cuando se interpreta
    Entonces registra promedios:
      | Período    | Sistólica | Diastólica |
      | Diurno     | 145       | 92         |
      | Nocturno   | 130       | 80         |
      | 24h        | 140       | 88         |
    Y clasifica: "Hipertensión mantecida"

  Escenario: Holter de 24 horas
    Dado que se realizó Holter
    Cuando se interpreta
    Entonces registra:
      | Parámetro   | Resultado                          |
      | FC media    | 78 lpm                             |
      | FC mín/máx  | 52-145 lpm                         |
      | Arritmias   | Extrasístoles ventriculares 150/24h |
    Y clasifica: "Frecuentes, no complejas"

  Escenario: Prueba de esfuerzo
    Dado que se realizó prueba de esfuerzo (Bruce Modificado)
    Cuando se interpreta
    Entonces registra:
      | Parámetro   | Resultado          |
      | Tiempo      | 8 min, 10 METS     |
      | FC/PA máx   | 165 lpm, 180/90    |
      | ST          | Depresión 2mm V4-V6 |
    Y clasifica: "Positiva para isquemia" → angiografía

  Escenario: Seguimiento post-infarto
    Dado que paciente egresa post-IAM
    Cuando se genera plan de egreso
    Entonces programa seguimiento:
      | Cita                | Tiempo   |
      | Control cardiológico| 1 semana |
      | Eco de control      | 1 mes    |
      | Reevaluación        | 3 meses  |
    Y genera ordenes de rehabilitación cardíaca
