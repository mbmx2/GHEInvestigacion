# language: es
Característica: Atención Pediátrica
  Como pediatra
  Quiero dar seguimiento completo al crecimiento y desarrollo infantil
  Para prevenir enfermedades y detectar problemas a tiempo

  Contexto:
    Dado que el sistema está funcionando
    Y que el usuario tiene rol de médico
    Y que existe el paciente "Sofía Martínez" de 2 años

  Escenario: Consulta de niño sano - 1 mes
    Dado que el bebé acude a control a los 30 días
    Cuando el médico realiza evaluación:
      | Campo                     | Valor              |
      | Peso                      | 4.2 kg             |
      | Talla                     | 54 cm              |
      | Perímetro cefálico        | 37 cm              |
      | Fontanela                 | Blanda, normal     |
      | Reflejos primitivos       | Presentes          |
      | Alimentación              | Lactancia materna exclusiva |
      | Sueño                     | Normal             |
      | Eliminaciones             | Normales           |
    Y el sistema calcula percentiles:
      | Parámetro   | Percentil | Clasificación    |
      | Peso        | 50        | Normal           |
      | Talla       | 50        | Normal           |
      | PC          | 50        | Normal           |
    Y el sistema agenda próximo control: 2 meses
    Y el sistema registra vacunas pendientes

  Escenario: Esquema de vacunación
    Dado que el paciente tiene 6 meses
    Cuando el médico revisa esquema de vacunación
    Entonces el sistema muestra:
      | Vacuna                    | Dosis  | Fecha programada | Estado    |
      | Hexavalente (1ra dosis)   | 1ra    | 02/04/2024       | Aplicada  |
      | Hexavalente (2da dosis)   | 2da    | 02/06/2024       | Pendiente |
      | Rotavirus (1ra dosis)     | 1ra    | 02/04/2024       | Aplicada  |
      | Rotavirus (2da dosis)     | 2da    | 02/06/2024       | Pendiente |
      | Neumococo (1ra dosis)     | 1ra    | 02/04/2024       | Aplicada  |
    Y el sistema genera orden para vacunas pendientes
    Y el sistema registra vacuna aplicada con:
      | Campo                     |
      | Vacuna                    |
      | Dosis                     |
      | Lote                      |
      | Caducidad                 |
      | Vía de administración     |
      | Sitio de aplicación       |
      | Enfermera que aplicó      |
      | Reacciones adversas       |

  Escenario: Curva de crecimiento
    Dado que el paciente tiene múltiples controles registrados
    Cuando el médico abre el expediente
    Entonces el sistema muestra gráfica de:
      | Curva                     | Período            |
      | Peso vs. edad            | 0-2 años           |
      | Talla vs. edad           | 0-2 años           |
      | Perímetro cefálico vs. edad | 0-2 años        |
      | IMC vs. edad             | 0-2 años           |
    Y el sistema superpone curvas OMS (percentiles 3, 15, 50, 85, 97)
    Y el sistema resalta valores fuera de rango
    Y el sistema calcula velocidad de crecimiento

  Escenario: Detección de retraso del desarrollo
    Dado que el paciente tiene 18 meses
    Cuando el médico evalúa hitos del desarrollo
    Entonces el sistema muestra checklist:
      | Hito                       | Edad esperada | Presente |
      | Camina sin apoyo           | 12 meses      | Sí       |
      | Dice 3-5 palabras          | 15 meses      | No       |
      | Señala con dedo             | 12 meses      | Sí       |
      | Hace "adiós" con la mano   | 12 meses      | Sí       |
      | Sigue objetos con la vista | 3 meses       | Sí       |
    Y el sistema alerta: "Retraso en lenguaje expresivo"
    Y el sistema sugiere: "Referencia a estimulación del desarrollo"
    Y el sistema registra plan de seguimiento

  Escenario: Atención de infección respiratoria aguda
    Dado que el paciente de 3 años acude con IRA
    Cuando el médico evalúa:
      | Síntoma                    | Detalle           |
      | Fiebre                     | 38.5°C            |
      | Tos                        | Productiva        |
      | Rinorrea                   | Purulenta         |
      | Dificultad respiratoria    | Leve              |
      | Sibilancias                | Ausentes          |
      | Alimentación               | Disminuida        |
    Y registra signos vitales:
      | Campo                     | Valor              |
      | FC                        | 120 lpm            |
      | FR                        | 28 rpm             |
      | SpO2                      | 95%                |
      | Temperatura               | 38.5°C             |
    Entonces el sistema clasifica como "IRA sin neumonía"
    Y el sistema sugiere manejo sintomático
    Y el sistema genera receta:
      | Medicamento               | Dosis              |
      | Paracetamol               | 15 mg/kg cada 6h   |
      | Ambroxol                  | 7.5 mg cada 12h    |
    Y el sistema agenda seguimiento en 48-72 horas

  Escenario: Control nutricional infantil
    Dado que el paciente de 8 meses acude a control
    Cuando el médico evalúa nutrición
    Entonces el sistema muestra:
      | Parámetro                 | Valor              |
      | Peso                      | 8.2 kg             |
      | Talla                     | 70 cm              |
      | IMC                       | 16.7               |
      | Percentil peso            | 50                 |
      | Percentil talla           | 50                 |
      | Tipo de alimentación      | Complementaria     |
      | Alimentos introducidos    | Cereales, frutas   |
    Y el sistema evalúa estado nutricional:
      | Estado                    | Clasificación      |
      | Peso/edad                 | Normal             |
      | Talla/edad                | Normal             |
      | Peso/talla                | Normal             |
    Y el sistema sugiere plan de alimentación según edad

  Escenario: Detección de maltrato infantil
    Dado que el paciente acude con lesiones sospechosas
    Cuando el médico realiza exploración física
    Entonces el sistema registra:
      | Hallazgo                  | Detalle            |
      | Hematomas en diferentes etapas de cicatrización | Múltiples |
      | Lesiones incompatibles con la historia clínica | Sí |
      | Miedo a los padres        | Observado          |
    Y el sistema genera ALERTA de sospecha de maltrato
    Y el sistema requiere documentación detallada
    Y el sistema notifica a servicio social
    Y el sistema registra obligación de reporte a autoridades

  Escenario: Consulta de emergencia pediátrica - Dificultad respiratoria
    Dado que el bebé de 4 meses llega con dificultad respiratoria
    Cuando el médico evalúa:
      | Señal                     | Detalle            |
      | Aleteo nasal              | Presente           |
      | Tiraje subcostal          | Marcado            |
      | Quejido espiratorio       | Presente           |
      | SpO2                      | 88%                |
      | FC                        | 180 lpm            |
      | FR                        | 60 rpm             |
      | Temperatura               | 38.2°C             |
    Entonces el sistema clasifica como "Emergencia respiratoria"
    Y el sistema genera orden inmediata:
      | Acción                    |
      | Oxígeno suplementario     |
      | Nebulización con salbutamol|
      | Monitoreo continuo        |
      | Laboratorios urgentes     |
    Y el sistema alerta al pediatra de guardia
    Y el sistema inicia cronómetro de atención
