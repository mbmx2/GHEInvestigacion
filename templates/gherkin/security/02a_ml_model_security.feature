# language: es
Característica: Seguridad de Modelos de IA
  Como responsable de seguridad del proyecto GHE
  Quiero proteger modelos de predicción contra ataques adversariales
  Para que las predicciones clínicas sean confiables

  Contexto:
    Dado que el sistema usa modelos predictivos
    Y que el usuario tiene rol de seguridad

  Escenario: Ataque adversarial contra modelo
    Dado que se prueba ataque adversarial
    Cuando se evalúa resistencia
    Entonces:
      | Técnica                   | Defensa |
      | Adversarial examples      | Validación contra rango fisiológico |
      | Data poisoning            | Detección de datos anómalos |
      | Model evasion             | Verificación cruzada con reglas clínicas |
      | Model extraction          | Rate limiting en endpoints |

  Escenario: Protección de modelos
    Dado que se protegen modelos de predicción
    Cuando se evalúa
    Entonces:
      | Medida                     |
      | Modelos no expuestos a internet |
      | Validación de inputs antes del modelo |
      | Resultados vs. reglas clínicas |
      | Logs y auditoría          |

  Escenario: Detección de datos manipulados
    Dado que se verifica integridad de datos de entrenamiento
    Cuando se detecta anomalía
    Entonces:
      | Señal                      | Acción |
      | Valor fuera de rango fisiológico | Investigar |
      | Patrón inusual            | Investigar |
      | Hash no coincide          | Investigar |
