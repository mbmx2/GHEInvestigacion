# language: es
Característica: Medicina Interna y Enfermedades Crónicas
  Como internista
  Quiero gestionar enfermedades crónicas
  Para mejorar calidad de vida y prevenir complicaciones

  Contexto:
    Dado que el sistema está activo
    Y que el usuario tiene rol de médico

  Escenario: Diagnóstico de diabetes tipo 2
    Dado que paciente acude con sospecha de diabetes
    Cuando médico revisa estudios
      | Estudio           | Resultado | Referencia |
      | Glucosa ayunas    | 180 mg/dL | <100       |
      | HbA1c             | 9.2%      | <5.7%      |
      | Microalbuminuria   | Positiva  | Negativa   |
    Entonces diagnostica: "DM tipo 2 (E11.9)"
    Y clasifica complicaciones: retinopatía pendiente, nefropatía sospecha
    Y genera plan: metformina 850mg c/12h + dieta + ejercicio 150min/sem

  Escenario: Control trimestral de diabetes
    Dado que paciente tiene diabetes diagnosticada
    Cuando acude a control trimestral
    Entonces compara:
      | Parámetro  | Actual | Anterior | Tendencia |
      | HbA1c     | 8.5%   | 9.2%     | Mejorando |
      | Glucosa   | 150    | 180      | Mejorando |
      | PA        | 130/80 | 135/85   | Estable   |
    Y evalúa metas: HbA1c <7% (no alcanzada), PA <130/80 (límite)
    Y agenda próximo control: 3 meses

  Escenario: Hipertensión arterial
    Dado que paciente tiene HTA diagnosticada
    Cuando acude a control
    Entonces muestra historial de PA con tendencia mejorante
    Y sugiere: "Solicitar ecocardiograma y creatinina"

  Escenario: Insuficiencia renal crónica
    Dado que paciente tiene ERC
    Cuando médico revisa estudios
    Entonces calcula TFG 35 mL/min → Estadio 3b, clasificación G3bA3
    Y plan: control PA, restricción proteica, referencia nefrología

  Escenario: Asma no controlada
    Dado que paciente tiene asma
    Cuando acude a control respiratorio
    Entonces registra FEV1 65% → 82% post-broncodilatador (reversibilidad 17%)
    Y clasifica: "NO CONTROLADO" → escalar a ICS + LABA

  Escenario: Educación en enfermedad crónica
    Dado que paciente con diabetes no controla glucosa
    Cuando médico evalúa conocimientos
    Entonces genera plan de educación en 4 sesiones:
      | Tema                       | Sesión |
      | Autocontrol glucosa       | 1      |
      | Manejo hipoglucemia       | 2      |
      | Técnica inyección         | 3      |
      | Alimentación saludable    | 4      |

  Escenario: Cetoacidosis diabética
    Dado que paciente DM1 acude con poliuria, náuseas, aliento a frutas
    Cuando se evalúa
    Entonces solicita urgente: glucosa, gasometría, cetonas, electrolitos
    Y clasifica: "Emergencia diabética" → insulina IV + solución salina + UCI

  Escenario: Sesión de hemodiálisis
    Dado que paciente está en diálisis
    Cuando acude a sesión
    Entonces registra pre-diálisis: peso 78kg, PA 150/90, FC 80
    Y durante sesión: 4 horas, ultrafiltración 2.5L, flujo 300mL/min
    Y post-diálisis: peso 75.5kg, PA 130/80, estado estable
    Y agenda próxima sesión: 3 días
