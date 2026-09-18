# language: es
Característica: Atención Neurológica
  Como neurólogo
  Quiero diagnosticar y tratar enfermedades neurológicas
  Para mejorar la función neurológica y calidad de vida

  Contexto:
    Dado que el sistema está funcionando
    Y que el usuario tiene rol de médico

  Escenario: Evaluación de cefalea crónica
    Dado que el paciente acude por cefalea recurrente
    Cuando el médico evalúa
    Entonces el sistema registra:
      | Característica             | Detalle            |
      | Tipo de cefalea            | Pulsátil           |
      | Localización               | Hemicraneal izquierdo |
      | Frecuencia                 | 15 días/mes        |
      | Duración                   | 4-72 horas         |
      | Intensidad                 | 7/10               |
      | Síntomas asociados        | Náuseas, fotofobia |
      | Aura                       | Sí (escotoma centelleante) |
      | Factor desencadenante      | Estrés, regla     |
    Y el sistema diagnostica: "Migraña con aura (G43.1)"
    Y el sistema evalúa_handle de cefalea
    Y el sistema sugiere prophylaxis:
      | Medicamento               | Dosis              |
      | Propranolol               | 40mg cada 12h      |
      | Amitriptilina             | 25mg nocte         |
    Y el sistema genera diario de cefalea para el paciente

  Escenario: Escala de Glasgow
    Dado que el paciente llega con trauma craneoencefálico
    Cuando el médico evalúa Glasgow
    Entonces el sistema registra:
      | Componente                | Puntuación         |
      | Apertura ocular           | 4 (espontánea)     |
      | Respuesta verbal          | 5 (orientado)      |
      | Respuesta motora          | 6 (obedece órdenes)|
      | **Glasgow Total**         | **15**             |
    Y el sistema muestra evolución:
      | Hora     | Ocular | Verbal | Motor | Total |
      | 14:00    | 4      | 5      | 6     | 15    |
      | 14:30    | 3      | 4      | 6     | 13    |
      | 15:00    | 2      | 3      | 5     | 10    |
    Y el sistema alerta: "Deterioro neurológico - Glasgow en descenso"
    Y el sistema sugiere: "TAC craneal urgente"

  Escenario: Evaluación de crisis epiléptica
    Dado que el paciente acude después de una crisis
    Cuando el médico evalúa
    Entonces el sistema registra:
      | Característica             | Detalle            |
      | Tipo de crisis             | Tónico-clónica generalizada |
      | Duración                   | 3 minutos          |
      | Focalización inicial       | No                 |
      | Pérdida de esfínteres      | Sí                 |
      | Postcrisis                 | Confusión 30 min   |
      | Fiebre previa              | No                 |
      | Trauma previo              | No                 |
      | Medicamentos              | No toma            |
    Y el sistema solicita:
      | Estudio                   |
      | TAC craneal sin contraste |
      | EEG                        |
      | Electrolitos séricos       |
      | Glucosa capilar            |
    Y el sistema sugiere: "Iniciar tratamiento antiepiléptico"

  Escenario: Registro de escala de Rankin modificada
    Dado que el paciente tiene ictus hace 3 meses
    Cuando el médico evalúa discapacidad
    Entonces el sistema registra:
      | Escala                     | Puntuación         |
      | Rankin modificada          | 3 (Discapacidad moderada) |
      | NIHSS                      | 8                  |
      | Barthel                    | 60/100             |
    Y el sistema muestra evolución:
      | Fecha        | Rankin | NIHSS | Barthel  |
      | Agosto 2024  | 5      | 15    | 20/100   |
      | Septiembre   | 4      | 12    | 40/100   |
      | Octubre      | 3      | 8     | 60/100   |
    Y el sistema evalúa progreso: "Mejoría significativa"
    Y el sistema sugiere: "Continuar rehabilitación"

  Escenario: Evaluación de mareo y vértigo
    Dado que el paciente acude por mareo
    Cuando el médico evalúa
    Entonces el sistema registra:
      | Característica             | Detalle            |
      | Tipo de mareo              | Vértigo rotatorio   |
      | Inicio                     | Súbito              |
      | Duración                   | Horas               |
      | Desencadenante             | Cambio de posición  |
      | Nistagmo                   | Horizontal, direction-fixed |
      | Prueba de Dix-Hallpike      | Positiva derecha    |
      | Hipoacusia                 | No                  |
      | Acúfeno                    | No                  |
    Y el sistema diagnostica: "Vértigo posicional paroxístico benigno (H81.1)"
    Y el sistema sugiere: "Maniobra de Epley"

  Escenario: Prueba de marcha y coordinación
    Dado que el paciente acude por inestabilidad
    Cuando el médico realiza pruebas neurológicas
    Entonces el sistema registra:
      | Prueba                      | Resultado          |
      | Marcha                     | Atáxica, amplia     |
      | Prueba de Romberg          | Positiva           |
      | Dedo-nariz                 | Dismetría derecha   |
      | Talón-rodilla              | Dismetría bilateral |
      | Reflejos rotulianos        | Abolidos bilateral |
      | Babinski                   | Negativo bilateral |
      | Koernig                    | Negativo bilateral |
    Y el sistema sugiere: "TAC o RMN de fosa posterior"

  Escenario: Tratamiento de Parkinson
    Dado que el paciente tiene enfermedad de Parkinson diagnosticada
    Cuando acude a control neurológico
    Entonces el sistema registra:
      | Parámetro                  | Valor              |
      | UPDRS Parte III            | 32/108             |
      | Marcha                     | Lento, pasos cortos|
      | Temblor                    | Distal derecho, en reposo |
      | Rigidez                    | Rígida bilateral   |
      | Bradicinesia               | Moderada           |
      | Disfagia                   | Leve               |
      | Fluctuaciones motoras      | Presentes          |
    Y el sistema muestra esquema de tratamiento:
      | Medicamento                | Dosis actual       |
      | Levodopa/Carbidopa         | 250/25 mg cada 8h  |
      | Pramipexol                 | 0.5 mg cada 8h     |
      | Entacapone                 | 200 mg cada 8h     |
    Y el sistema evalúa complicaciones motoras:
      | Complicación               |
      | Disquinesias pico dosis    |
      | Fluctuaciones wearing-off   |
      | Fenómeno de congelamiento  |

  Escenario: Detección de ictus agudo
    Dado que el paciente llega con déficit neurológico súbito
    Cuando el médico evalúa
    Entonces el sistema registra:
      | Síntoma                    | Detalle            |
      | Inicio                     | Súbito, hace 2 horas |
      | Hemiplejía derecha         | Completa           |
      | Afasia                     | Global             |
      | Desviación de mirada       | A la izquierda     |
      | NIHSS                      | 18                 |
    Y el sistema clasifica como "Ictus agudo - Posible ACV isquémico"
    Y el sistema genera alarma: "CÓDIGO ICTUS - ACTIVAR PROTOCOLO"
    Y el sistema solicita urgente:
      | Estudio                   | Tiempo             |
      | TAC craneal sin contraste | <25 minutos        |
      | Glucosa capilar           | Inmediata          |
      | BHC + plaquetas           | Inmediata          |
      | Coagulación               | Inmediata          |
    Y el sistema evalúa ventana terapéutica:
      | Criterio                  | Valor              |
      | Hora de inicio            | Hace 2 horas       |
      | Ventana trombólisis       | <4.5 horas (Sí)    |
      | Ventana trombectomía      | <24 horas (Sí)     |
    Y el sistema sugiere: "Considerar trombólisis IV"
