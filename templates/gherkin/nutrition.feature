# language: es
Característica: Atención Nutricional
  Como nutriólogo
  Quiero evaluar y tratar problemas nutricionales
  Para mejorar estado nutricional y prevenir enfermedades

  Contexto:
    Dado que el sistema está activo
    Y que el usuario tiene rol de nutriólogo

  Escenario: Evaluación inicial
    Dado que paciente acude a consulta nutricional
    Cuando nutriólogo evalúa peso 95kg, talla 1.70m, circunferencia 102cm
    Entonces el sistema calcula:
      | Cálculo                | Resultado      |
      | IMC                    | 32.9 (Obesidad I) |
      | Riesgo CV               | Alto           |

  Escenario: Encuesta alimentaria
    Dado que nutriólogo realiza encuesta
    Cuando registra hábitos
    Entonces evalúa:
      | Ingesta calórica        | 3,200 kcal (excesiva) |
      | Distribución             | 60% CHO, 25% Líp, 15% Prot |
      | Sodio                    | Excesivo            |
      | Fibra                    | Insuficiente        |

  Escenario: Plan nutricional
    Dado que se completó evaluación
    Cuando nutriólogo genera plan
    Entonces genera:
      | Comida                   | Contenido           |
      | Desayuno                 | Avena, fruta, huevo |
      | Comida                   | Proteína, verdura, arroz integral |
      | Cena                     | Proteína, ensalada  |
    Y calcula: 2,200 kcal/día (déficit 1,000 kcal)

  Escenario: Seguimiento paciente diabético
    Dado que paciente diabético acude a seguimiento
    Cuando nutriólogo evalúa
    Entonces compara:
      | Parámetro         | Actual | Anterior | Estado     |
      | Peso              | 93 kg  | 95 kg    | Mejorando  |
      | HbA1c             | 8.0%   | 9.2%     | Mejorando  |
      | Adherencia        | 70%    | N/A      | Moderada   |
    Y ajusta plan: reducir CHO simples, aumentar fibra, educación

  Escenario: Paciente oncológico
    Dado que paciente oncológico requiere evaluación
    Cuando nutriólogo evalúa
    Entonces clasifica:
      | Clasificación          | Detalle              |
      | GLIM                   | Desnutrición moderada|
      | PG-SGA                 | 15 (Intervención urgente) |
    Y genera plan: dieta hiperproteica + suplementos + control semanal

  Escenario: Nutrición en embarazo
    Dado que paciente embarazada de 20 semanas acude
    Cuando nutriólogo evalúa ganancia de peso (7kg)
    Entonces evalúa: ganancia normal para semana 20
    Y recomienda: ácido fólico 400µg, hierro 30mg, calcio 1000mg

  Escenario: Trastorno alimentario
    Dado que paciente presenta pérdida 15kg en 6 meses + atracones + purgas
    Cuando nutriólogo evalúa
    Entonces clasifica: "Sospecha de trastorno alimentario"
    Y genera alerta: "Requiere atención multidisciplinaria"
    Y sugiere: referencia psiquiatría + psicología + labs

  Escenario: Dieta para ERC
    Dado que paciente tiene ERC
    Cuando nutriólogo genera guía
    Entonces muestra restricciones:
      | Nutriente    | Restricción    |
      | Sodio       | <2,000 mg/día  |
      | Potasio     | <2,000 mg/día  |
      | Fósforo     | <800 mg/día    |
      | Proteínas   | 0.6-0.8 g/kg  |
    Y genera lista de alimentos permitidos y menú semanal
