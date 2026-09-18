# language: es
Característica: Medicina Interna y Enfermedades Crónicas
  Como internista
  Quiero gestionar enfermedades crónicas de forma integral
  Para mejorar la calidad de vida y prevenir complicaciones

  Contexto:
    Dado que el sistema está funcionando
    Y que el usuario tiene rol de médico

  Escenario: Diagnóstico de diabetes tipo 2
    Dado que el paciente acude con sospecha de diabetes
    Cuando el médico revisa estudios:
      | Estudio                   | Resultado  | Referencia   |
      | Glucosa en ayunas         | 180 mg/dL  | <100 mg/dL   |
      | HbA1c                     | 9.2%       | <5.7%        |
      | Perfil lipídico           | (valores)  | (rangos)     |
      | Creatinina                | 0.9 mg/dL  | 0.6-1.2      |
      | Microalbuminuria          | Positiva   | Negativa     |
    Entonces el sistema diagnostica: "Diabetes Mellitus tipo 2 (E11.9)"
    Y el sistema clasifica complicaciones:
      | Complicación              | Estado     |
      | Retinopatía               | Pendiente  |
      | Neuropatía                | Pendiente  |
      | Nefropatía                | Sospecha   |
      | Cardiovascular            | Pendiente  |
    Y el sistema genera plan de tratamiento:
      | Componente                |
      | Metformina 850mg cada 12h |
      | Dieta para diabéticos     |
      | Ejercicio 150 min/semana  |
      | Autocontrol de glucosa    |
      | Educación en diabetes     |

  Escenario: Seguimiento de diabetes - Control trimestral
    Dado que el paciente tiene diabetes diagnosticada
    Cuando acude a control trimestral
    Entonces el sistema muestra:
      | Parámetro                 | Actual | Anterior | Tendencia |
      | HbA1c                     | 8.5%   | 9.2%     | Mejorando |
      | Glucosa en ayunas         | 150    | 180      | Mejorando |
      | Peso                      | 85 kg  | 87 kg    | Mejorando |
      | PA                        | 130/80 | 135/85   | Estable   |
    Y el sistema evalúa meta terapéutica:
      | Parámetro                 | Meta       | Estado   |
      | HbA1c                     | <7%        | No alcanzada |
      | Glucosa en ayunas         | 80-130     | No alcanzada |
      | PA                        | <130/80    | Límite   |
      | LDL                       | <100       | Pendiente|
    Y el sistema sugiere ajuste de tratamiento
    Y el sistema agenda próximo control: 3 meses

  Escenario: Hipertensión arterial - Manejo
    Dado que el paciente tiene hipertensión diagnosticada
    Cuando acude a control
    Entonces el sistema muestra historial de PA:
      | Fecha        | PA       | Medicamento          |
      | 01/01/2024   | 150/95   | Losartán 50mg       |
      | 01/04/2024   | 140/90   | Losartán 50mg       |
      | 01/07/2024   | 135/85   | Losartán 50mg + Amlodipino 5mg |
      | 01/10/2024   | 128/82   | Losartán 50mg + Amlodipino 5mg |
    Y el sistema evalúa:
      | Parámetro                 | Estado              |
      | Control de PA             | Mejorando           |
      | Órganos diana             | Pendiente evaluación|
      | Adherencia medicamentosa  | 80%                 |
      | Efectos adversos          | Ninguno             |
    Y el sistema sugiere: "Solicitar ecocardiograma y creatinina"

  Escenario: Insuficiencia renal crónica - Estadificación
    Dado que el paciente tiene enfermedad renal crónica
    Cuando el médico revisa estudios
    Entonces el sistema calcula:
      | Parámetro                 | Valor     |
      | Tasa de filtrado glomerular| 35 mL/min |
      | Estadio ERC               | 3b        |
      | Albuminuria               | 300 mg/g  |
      | Clasificación             | G3bA3     |
    Y el sistema muestra plan de manejo según estadio:
      | Estadio | Acciones                             |
      | G3b     | Control PA, restrictión proteica     |
      |         | Suplemento de hierro, vitamina D     |
      |         | Referencia a nefrología              |
      |         | Vigilar potasio y fósforo            |
    Y el sistema agenda laboratorio en 3 meses

  Escenario: Control de asma
    Dado que el paciente tiene asma diagnosticada
    Cuando acude a control respiratorio
    Entonces el sistema registra:
      | Parámetro                 | Valor              |
      | Espirometría pre-broncodilatador | FEV1 65%  |
      | Espirometría post-broncodilatador | FEV1 82% |
      | Reversibilidad            | 17% (Positiva)     |
      | Frecuencia de crisis      | 2/mes              |
      | Uso de rescue inhaler     | 3 veces/semana     |
      | Actividad física limitada | Sí                 |
    Y el sistema clasifica control como "NO CONTROLADO"
    Y el sistema sugiere escalada de tratamiento:
      | Paso actual               | Paso sugerido       |
      | ICS bajo dosis            | ICS + LABA          |
    Y el sistema genera plan de acción escrito

  Escenario: Educación en enfermedad crónica
    Dado que el paciente tiene diabetes y no controla glucosa
    Cuando el médico evalúa conocimientos
    Entonces el sistema registra:
      | Tema                       | Conocimiento       |
      | Autocontrol de glucosa     | No sabe hacer      |
      | Inyección de insulina      | Nunca practicó     |
      | Hipoglucemia               | No reconoce síntomas|
      | Alimentación               | Incorrecta         |
    Y el sistema genera plan de educación:
      | Tema                       | Sesión #           |
      | Autocontrol de glucosa     | 1                  |
      | Manejo de hipoglucemia     | 2                  |
      | Técnica de inyección       | 3                  |
      | Alimentación saludable     | 4                  |
    Y el sistema agenda 4 sesiones de educación

  Escenario: Detección de complicación aguda - Cetoacidosis
    Dado que el paciente tiene diabetes tipo 1
    Cuando acude con síntomas de cetoacidosis
    Entonces el sistema registra:
      | Síntoma                    | Detalle            |
      | Poliuria                   | Sí                 |
      | Polidipsia                 | Sí                 |
      | Náuseas/vómitos            | Sí                 |
      | Dolor abdominal            | Sí                 |
      | Aliento a frutas           | Sí                 |
      | Respiración de Kussmaul    | Sí                 |
    Y el sistema solicita urgente:
      | Estudio                   |
      | Glucosa capilar           |
      | Gasometría arterial       |
      | Cetonas séricas           |
      | Electrolitos              |
      | BHC                       |
    Y el sistema clasifica como "Emergencia diabética"
    Y el sistema genera plan de manejo:
      | Acción                    |
      | Insulina IV               |
      | Solución salina           |
      | Monitoreo horario         |
      | Unidad de cuidados intensivos|

  Escenario: Terapia de reemplazo renal
    Dado que el paciente está en diálisis
    Cuando acude a sesión de hemodiálisis
    Entonces el sistema registra:
      | Parámetro pre-diálisis     | Valor              |
      | Peso pre                   | 78 kg              |
      | PA pre                     | 150/90             |
      | FC                         | 80 lpm             |
      | Acceso vascular            | Fístula AV         |
      | Heparinización             | Estándar           |
    Y durante la sesión:
      | Parámetro                  | Valor              |
      | Tiempo de sesión           | 4 horas            |
      | Ultrafiltración            | 2.5 L              |
      | Flujo de sangre            | 300 mL/min         |
      | Complicaciones             | Ninguna            |
    Y post-diálisis:
      | Parámetro                  | Valor              |
      | Peso post                  | 75.5 kg            |
      | PA post                    | 130/80             |
      | Estado general             | Estable            |
    Y el sistema agenda próxima sesión: 3 días
