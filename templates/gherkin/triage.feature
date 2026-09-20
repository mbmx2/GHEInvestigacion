# language: es
Característica: Triaje Obstétrico
  Como personal de enfermería
  Quiero clasificar el riesgo de cada paciente
  Para priorizar la atención según gravedad

  Contexto:
    Dado que el sistema está activo
    Y que el usuario tiene rol de enfermería

  Escenario: Triaje bajo riesgo
    Dado que "Ana López" acude a control prenatal
    Cuando registra signos vitales
      | Campo                    | Valor       |
      | Presión arterial         | 115/72      |
      | Frecuencia cardíaca      | 78 lpm      |
      | Temperatura              | 36.5°C      |
      | Edema                    | Ninguno     |
      | Proteinuria              | Negativa    |
    Entonces el sistema:
      | Acción                          | Resultado     |
      | Clasificar riesgo              | BAJO          |
      | Asignar color                 | VERDE         |
      | Estimar espera               | 30 min        |
      | Mensaje                       | Turno normal  |

  Escenario: Triaje riesgo medio
    Dado que "Carmen Ruiz" acude con 28 semanas
    Cuando registra PA 130/85, edema leve, proteinuria +
    Entonces el sistema:
      | Acción                          | Resultado     |
      | Clasificar riesgo              | MEDIO         |
      | Asignar color                 | AMARILLO      |
      | Estimar espera               | 15 min        |
      | Mensaje                       | Evaluar con prioridad |

  Escenario: Triaje alto riesgo
    Dado que "Rosa Martínez" acude con 34 semanas
    Cuando registra PA 142/92, edema moderado, proteinuria ++, dolor abdominal
    Entonces el sistema:
      | Acción                          | Resultado     |
      | Clasificar riesgo              | ALTO          |
      | Asignar color                 | NARANJA       |
      | Alerta inmediata al médico    | ✅            |
      | Estimar espera               | 5 min         |
      | Mensaje                       | ATENCIÓN URGENTE |

  Escenario: Triaje emergencia obstétrica
    Dado que "Laura Díaz" acude con sangrado activo
    Cuando registra PA 90/60, FC 110, estado comprometido
    Entonces el sistema:
      | Acción                          | Resultado         |
      | Clasificar riesgo              | CRÍTICO           |
      | Asignar color                 | ROJO              |
      | ALARMA MÁXIMA                 | ✅                |
      | Notificar a TODO el personal  | ✅                |
      | Iniciar protocolo emergencia  | ✅                |

  Escenario: Cambio de clasificación
    Dado que paciente fue clasificada "MEDIO" y espera
    Cuando registra PA 148/95 y dolor intenso
    Entonces el sistema:
      | Acción                          |
      | Actualizar clasificación a ALTO |
      | Generar alerta de cambio       |
      | Mover a prioridad urgente      |

  Escenario: Registro de signos vitales completos
    Dado que paciente acude a consulta
    Cuando registra signos vitales completos
      | Campo                      | Valor     |
      | PA sistólica/diastólica    | 120/75    |
      | FC                         | 76 lpm    |
      | Temperatura                | 36.4°C    |
      | SpO2                       | 98%       |
      | Peso                       | 72 kg     |
      | Talla                      | 1.65 m    |
      | Altura uterina             | 30 cm     |
      | FCF                        | 138 lpm   |
      | Presentación               | Cefálica  |
    Entonces el sistema calcula automáticamente:
      | Cálculo                    | Resultado |
      | IMC                        | 26.4      |
      | Clasificación IMC          | Sobrepeso |
      | Edad gestacional           | 30 semanas|
      | Riesgo                     | Bajo      |

  Escenario: Historial de triajes
    Dado que paciente tiene 6 controles previos
    Cuando se abre expediente
    Entonces el sistema muestra gráficas de:
      | Parámetro                  | Período           |
      | Presión arterial           | Todo el embarazo  |
      | Peso                       | Todo el embarazo  |
      | Altura uterina             | Todo el embarazo  |
      | FCF                        | Todo el embarazo  |
    Y resalta valores fuera de rango
