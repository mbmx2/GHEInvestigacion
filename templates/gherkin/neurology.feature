# language: es
Característica: Atención Neurológica
@status:proposed
@type:acceptance
@domain:neurology
  Como neurólogo
  Quiero diagnosticar y tratar enfermedades neurológicas
  Para mejorar calidad de vida

  Contexto:
    Dado que el sistema está activo
    Y que el usuario tiene rol de médico

  Escenario: Cefalea crónica (migraña)
    Dado que paciente acude por cefalea recurrente pulsátil hemicraneal
    Cuando médico evalúa
    Entonces registra:
      | Característica          | Detalle              |
      | Frecuencia              | 15 días/mes          |
      | Duración                | 4-72 horas           |
      | Intensidad              | 7/10                 |
      | Síntomas asociados      | Náuseas, fotofobia   |
      | Aura                    | Sí (escotoma)        |
    Y diagnostica: "Migraña con aura (G43.1)"
    Y sugiere prophylaxis: propranolol 40mg c/12h o amitriptilina 25mg nocte

  Escenario: Escala de Glasgow
    Dado que paciente llega con trauma craneoencefálico
    Cuando médico evalúa Glasgow
    Entonces registra:
      | Componente            | Puntuación    |
      | Apertura ocular       | 4 (espontánea)|
      | Respuesta verbal      | 5 (orientado) |
      | Respuesta motora      | 6 (obedece)   |
    Y registra evolución temporal:
      | Hora  | Ocular | Verbal | Motor | Total |
      | 14:00 | 4      | 5      | 6     | 15    |
      | 14:30 | 3      | 4      | 6     | 13    |
      | 15:00 | 2      | 3      | 5     | 10    |
    Y alerta: "Deterioro → TAC craneal urgente"

  Escenario: Crisis epiléptica
    Dado que paciente acude post-crisis tónico-clónica de 3 min
    Cuando médico evalúa
    Entonces registra:
      | Característica          | Detalle              |
      | Tipo                    | Tónico-clónica generalizada |
      | Duración                 | 3 minutos           |
      | Postcrisis              | Confusión 30 min    |
      | Sin fiebre ni trauma     | Sí                  |
    Y solicita: TAC craneal, EEG, electrolitos, glucosa
    Y sugiere: "Iniciar antiepiléptico"

  Escenario: Escala de Rankin (ictus)
    Dado que paciente tiene ictus hace 3 meses
    Cuando médico evalúa discapacidad
    Entonces registra evolución:
      | Fecha      | Rankin | NIHSS | Barthel |
      | Agosto     | 5      | 15    | 20/100  |
      | Septiembre| 4      | 12    | 40/100  |
      | Octubre   | 3      | 8     | 60/100  |
    Y evalúa: "Mejoría significativa → continuar rehabilitación"

  Escenario: Vértigo posicional
    Dado que paciente acude por vértigo rotatorio súbito al cambiar posición
    Cuando médico evalúa con prueba de Dix-Hallpike positiva derecha
    Entonces diagnostica: "VPPB (H81.1)"
    Y sugiere: "Maniobra de Epley"

  Escenario: Pruebas neurológicas de coordinación
    Dado que paciente acude por inestabilidad
    Cuando médico realiza pruebas
    Entonces registra:
      | Prueba               | Resultado            |
      | Marcha                | Atáxica, amplia      |
      | Romberg               | Positiva             |
      | Dedo-nariz             | Dismetría derecha    |
      | Reflejos rotulianos    | Abolidos bilateral  |
    Y sugiere: "TAC o RMN fosa posterior"

  Escenario: Parkinson
    Dado que paciente tiene Parkinson diagnosticado
    Cuando acude a control
    Entonces registra:
      | Parámetro             | Valor               |
      | UPDRS III             | 32/108              |
      | Marcha                | Lenta, pasos cortos |
      | Temblor               | Distal derecho reposo |
      | Bradicinesia          | Moderada            |
    Y muestra tratamiento: levodopa/carbidopa 250/25 c/8h + pramipexol 0.5 c/8h
    Y evalúa complicaciones: disquinesias, wearing-off, congelamiento

  Escenario: Ictus agudo
    Dado que paciente llega con déficit neurológico súbito hace 2h
    Cuando médico evalúa (NIHSS 18, hemiplejía derecha, afasia global)
    Entonces el sistema genera:
      | Acción                          |
      | CÓDIGO ICTUS - ACTIVAR PROTOCOLO |
      | Solicitar: TAC craneal <25min, glucosa, BHC, coagulación |
      | Evaluar ventana trombólisis: <4.5h (SÍ) |
      | Sugerir: trombólisis IV    |
  