# language: es
# @id GHE-SAFETY-VSM-001
# @type safety
# @domain clinical_safety
# @layer clinical
# @risk s1
# @owner nurse-director
# @status proposed
# @requirement REQ-SAFETY-VSM
# @risk-control CTRL-SAFETY-VSM
# @regulation NOM-004
@domain:clinical_safety @type:safety @risk:s1 @status:proposed
Característica: Protocolo de Monitoreo de Signos Vitales
  Como enfermera del hospital
  Quiero un protocolo estandarizado de monitoreo
  Para que cada paciente tenga signos vitales registrados según su condición

  Regla: La frecuencia de monitoreo depende de la condición

    Escenario: Frecuencia por categoría
      Dado que se clasifica paciente
      Cuando se establece monitoreo
      Entonces:
        | Categoría                  | Frecuencia |
        | Crítico (UCI)             | Continua   |
        | Grave                     | Cada 1h    |
        | Moderado                  | Cada 4h    |
        | Estable                   | Cada 8h    |
        | Pre-alta                  | Cada 12h   |

  Regla: Los signos vitales se registran completamente

    Escenario: Registro completo
      Dado que se registran signos vitales
      Cuando se verifica
      Entonces incluye:
        | Campo                      |
        | Presión arterial          |
        | Frecuencia cardíaca       |
        | Temperatura               |
        | Saturación de oxígeno     |
        | Frecuencia respiratoria   |
        | Peso                      |
        | Nivel de conciencia       |

  Regla: Los valores fuera de rango generan alerta

    Escenario: Alerta de valor crítico
      Dado que se registra valor fuera de rango
      Cuando se detecta
      Entonces:
        | Valor                     | Acción |
        | PA >160/110              | Alerta médica inmediata |
        | FC >130 o <50            | Alerta médica inmediata |
        | SpO2 <90%                | Alerta médica inmediata |
        | Temperatura >40°C        | Alerta médica inmediata |
        | Glasgow <12              | Alerta médica inmediata |

  Regla: Los registros son inmutables

    Escenario: Registro inmutable
      Dado que se registran signos vitales
      Cuando se intenta modificar
      Entonces se crea registro nuevo (no se modifica el anterior)
      Y se conserva el historial completo
