# language: es
Característica: Atención Nutricional
  Como nutriólogo
  Quiero evaluar y tratar problemas nutricionales
  Para mejorar el estado nutricional y prevenir enfermedades

  Contexto:
    Dado que el sistema está funcionando
    Y que el usuario tiene rol de nutriólogo

  Escenario: Evaluación nutricional inicial
    Dado que el paciente acude a consulta nutricional
    Cuando el nutriólogo realiza evaluación
    Entonces el sistema registra:
      | Parámetro                  | Valor              |
      | Peso actual                | 95 kg              |
      | Talla                      | 1.70 m             |
      | IMC                        | 32.9               |
      | Clasificación IMC          | Obesidad grado I   |
      | Circunferencia abdominal   | 102 cm             |
      | Porcentaje de grasa corporal| 35%               |
      | Masa muscular              | 40 kg              |
      | Tasa metabólica basal      | 1,850 kcal         |
    Y el sistema calcula:
      | Cálculo                    | Resultado          |
      | IMC                        | 32.9 (Obesidad I)  |
      | Riesgo cardiovascular      | Alto               |
      | Estado nutricional         | Sobrepeso/Obesidad |

  Escenario: Encuesta alimentaria
    Dado que el nutriólogo realiza encuesta alimentaria
    Cuando registra hábitos alimentarios
    Entonces el sistema muestra:
      | Comida                     | Contenido habitual |
      | Desayuno                   | Café con pan dulce |
      | Colación mañana            | Ninguna            |
      | Comida                     | Arroz, frijoles, tortillas, refresco |
      | Colación tarde             | Papas fritas       |
      | Cena                       | Tacos de guisado   |
      | Bebidas                    | Refrescos 2L/día   |
      | Actividad física           | Ninguna            |
      | Horas de sueño             | 5 horas            |
    Y el sistema evalúa:
      | Parámetro                  | Valor              |
      | Ingesta calórica estimada  | 3,200 kcal         |
      | Distribución de macronutrientes | 60% CHO, 25% Lípidos, 15% Proteínas |
      | Ingesta de sodio           | Excesiva           |
      | Ingesta de fibra           | Insuficiente       |
      | Hidratación                | Insuficiente       |

  Escenario: Plan nutricional personalizado
    Dado que se completó la evaluación nutricional
    Cuando el nutriólogo genera plan
    Entonces el sistema muestra:
      | Componente                 |
      | Diagnóstico nutricional    |
      | Meta calórica              |
      | Distribución de macronutrientes |
      | Plan de comidas            |
      | Recomendaciones de actividad física |
      | Suplementación             |
      | Seguimiento                |
    Y el sistema genera plan detallado:
      | Comida                     | Contenido plan      |
      | Desayuno                   | Avena, fruta, huevo |
      | Colación mañana            | Fruta, nueces       |
      | Comida                     | Proteína, verdura, arroz integral |
      | Colación tarde             | Yogurt, fruta       |
      | Cena                       | Proteína, ensalada  |
    Y el sistema calcula: 2,200 kcal/día (déficit 1,000 kcal)

  Escenario: Seguimiento de paciente diabético
    Dado que el paciente tiene diabetes y necesita educación nutricional
    Cuando acude a seguimiento
    Entonces el sistema registra:
      | Parámetro                  | Actual | Anterior |
      | Peso                       | 93 kg  | 95 kg    |
      | Glucosa en ayunas          | 140    | 180      |
      | HbA1c                      | 8.0%   | 9.2%     |
      | Adherencia al plan         | 70%    | N/A      |
    Y el sistema evalúa:
      | Criterio                   | Estado             |
      | Pérdida de peso            | 2 kg en 1 mes      |
      | Control glucémico          | Mejorando          |
      | Adherencia                 | Moderada           |
    Y el sistema ajusta plan:
      | Ajuste                     |
      | Reducir carbohidratos simples |
      | Aumentar fibra             |
      | Distribución de carbohidratos |
      | Educación en conteo de carbohidratos |

  Escenario: Evaluación de paciente oncológico
    Dado que el paciente oncológico requiere evaluación nutricional
    Cuando el nutriólogo evalúa
    Entonces el sistema registra:
      | Parámetro                  | Valor              |
      | Pérdida de peso involuntaria| 8 kg en 3 meses   |
      | % de pérdida de peso       | 12%                |
      | Ingesta calórica           | 800 kcal/día       |
      | Disfagia                   | Moderada           |
      | Xerostomía                 | Sí                 |
      | Náuseas                    | Frecuentes         |
    Y el sistema clasifica como:
      | Clasificación GLIM          | Desnutrición moderada |
      | Score PG-SGA               | 15 (Intervención urgente) |
    Y el sistema genera plan de soporte nutricional:
      | Acción                    |
      | Dieta hiperproteica e hipercalórica |
      | Suplementos nutricionales orales |
      | Evaluación para sonda nasogástrica |
      | Control semanal            |

  Escenario: Nutrición en embarazo
    Dado que la paciente embarazada requiere consejería nutricional
    Cuando el nutriólogo evalúa
    Entonces el sistema registra:
      | Parámetro                  | Valor              |
      | Edad gestacional           | 20 semanas         |
      | Peso preembarazo           | 55 kg              |
      | Peso actual                | 62 kg              |
      | Ganancia peso hasta ahora  | 7 kg               |
      | IMC preembarazo            | 21.1 (Normopeso)   |
    Y el sistema evalúa ganancia de peso:
      | Semana  | Ganancia esperada | Ganancia real | Estado |
      | 20      | 5.5-7.5 kg       | 7 kg          | Normal |
    Y el sistema genera recomendaciones:
      | Nutriente                  | Recomendación      |
      | Ácido fólico               | 400-800 µg/día     |
      | Hierro                     | 30 mg/día          |
      | Calcio                     | 1,000 mg/día       |
      | Proteínas                 | 71 g/día           |
      | Calorías extra            | 300 kcal/día (2do trimestre) |
    Y el sistema programa seguimiento mensual

  Escenario: Detección de trastorno alimentario
    Dado que el paciente acude con sospecha de trastorno alimentario
    Cuando el nutriólogo evalúa
    Entonces el sistema registra:
      | Señal de alarma             | Presente |
      | Pérdida de peso severa      | 15 kg en 6 meses |
      | IMC                         | 16.5 (Delgadez severa) |
      | Miedo a engordar            | Intenso |
      | Distorsión de imagen corporal | Sí     |
      | Atracones                   | Sí, 3/semana |
      | Purgas                      | Sí, autoinducidas |
    Y el sistema clasifica como "Sospecha de Trastorno Límite de la Conducta Alimentaria"
    Y el sistema genera alerta:
      | Tipo                       |
      | Trastorno alimentario - Requiere atención multidisciplinaria |
    Y el sistema sugiere:
      | Acción                    |
      | Referencia a psiquiatría  |
      | Referencia a psicología   |
      | Monitoreo de signos vitales |
      | Labs: electrolitos, función hepática |

  Escenario: Guía alimentaria por enfermedad
    Dado que el paciente tiene enfermedad renal crónica
    Cuando el nutriólogo genera guía
    Entonces el sistema muestra restricciones:
      | Nutriente                  | Restricción        |
      | Sodio                      | <2,000 mg/día      |
      | Potasio                    | <2,000 mg/día      |
      | Fósforo                    | <800 mg/día        |
      | Proteínas                 | 0.6-0.8 g/kg/día   |
      | Líquidos                   | <2 L/día           |
    Y el sistema genera lista de alimentos permitidos y restringidos
    Y el sistema muestra ejemplos de menú semanal
