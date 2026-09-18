# language: es
Característica: Gestión de Laboratorio Clínico
  Como director de laboratorio
  Quiero gestionar el flujo completo de laboratorio
  Para garantizar resultados precisos y oportunos

  Contexto:
    Dado que el sistema está funcionando
    Y que el usuario tiene rol de laboratorio

  Escenario: Solicitud de estudios de laboratorio
    Dado que el médico solicita estudios de laboratorio
    Cuando el sistema genera la orden
    Entonces la orden incluye:
      | Campo                     | Valor              |
      | Paciente                  | María García López |
      | CURP                      | GALM850315MVZRRL04 |
      | Médico solicitante        | Dr. Juan Pérez     |
      | Estudios solicitados      | BHC, Química sanguínea, Orina completa |
      | Prioridad                 | Rutina             |
      | Fecha de solicitud        | Automática         |
      | Diagnóstico asociado      | E11.9 (Diabetes)   |
    Y el sistema genera código de muestra
    Y el sistema imprime etiqueta con código de barras
    Y la orden aparece en cola de laboratorio

  Escenario: Recepción de muestra
    Dado que el paciente llega a tomar muestra
    Cuando el personal de laboratorio recibe la muestra
    Entonces el sistema registra:
      | Campo                     | Valor              |
      | Código de muestra         | LAB-2024-00001     |
      | Tipo de muestra           | Sangre venosa      |
      | Volumen                   | 5 mL               |
      | Calidad de muestra        | Aceptable          |
      | Hora de toma              | Automática         |
      | Personal que tomó         | QFB Ana López      |
    Y el sistema verifica:
      | Verificación              | Estado             |
      | Identidad del paciente    | Verificada         |
      | Ayuno (si aplica)         | Verificado         |
      | Etiquetado correcto       | Verificado         |
      | Condición de la muestra   | Aceptable          |

  Escenario: Procesamiento de biometría hemática
    Dado que la muestra está en procesamiento
    Cuando se ingresa al analizador
    Entonces el sistema registra resultados:
      | Parámetro                 | Resultado | Unidad   | Referencia  |
      | Leucocitos                | 12,500    | /µL      | 4,000-11,000|
      | Neutrófilos               | 78%       | %        | 40-70%      |
      | Linfocitos                | 15%       | %        | 20-40%      |
      | Hemoglobina               | 10.2      | g/dL     | 12-16       |
      | Hematocrito               | 31%       | %        | 36-46%      |
      | Plaquetas                 | 180,000   | /µL      | 150,000-400,000|
      | VCM                       | 80        | fL       | 80-100      |
      | VCH                       | 27        | pg       | 27-33       |
    Y el sistema evalúa:
      | Hallazgo                  | Interpretación     |
      | Leucocitosis             | Infección probable |
      | Neutrofilia              | Infección bacteriana|
      | Anemia leve              | Investigar causa   |

  Escenario: Resultado con valor crítico
    Dado que se detecta un valor crítico en resultados
    Cuando el sistema evalúa resultados
    Entonces el sistema genera ALERTA:
      | Tipo de alerta            | Detalle            |
      | Valor crítico             | Plaquetas: 25,000  |
      | Parámetro                 | Plaquetas          |
      | Valor                     | 25,000 /µL         |
      | Rango normal              | 150,000-400,000    |
      | Severidad                 | CRÍTICO            |
    Y el sistema requiere:
      | Acción                    |
      | Notificar al médico solicitante INMEDIATAMENTE |
      | Confirmar resultado con nueva muestra          |
      | Documentar notificación                        |
    Y el sistema registra:
      | Campo                     |
      | Hora de detección         |
      | Hora de notificación      |
      | Médico notificado         |
      | Confirmación              |

  Escenario: Reporte microbiológico
    Dado que se cultiva una muestra
    Cuando el cultivo crece
    Entonces el sistema registra:
      | Campo                     | Valor              |
      | Tipo de cultivo           | Urocultivo         |
      | Organismo aislado         | E. coli            |
      | Carga bacteriana          | >100,000 UFC/mL    |
      | Antibiograma              | (ver tabla)        |
    Y el sistema muestra antibiograma:
      | Antibiótico               | Sensibilidad       |
      | Ampicilina                | Resistente         |
      | Amoxicilina/Clavulanico   | Sensible           |
      | Ciprofloxacino            | Sensible           |
      | Trimetoprim/Sulfametoxazol| Resistente         |
      | Nitrofurantoina           | Sensible           |
      | Ceftriaxona               | Sensible           |
    Y el sistema sugiere: "Tratamiento con Amoxicilina/Clavulanico"

  Escenario: Control de calidad interno
    Dado que se ejecuta control de calidad diario
    Cuando el personal registra resultados del control
    Entonces el sistema registra:
      | Control                   | Valor  | Media  | DS permitido | Estado |
      | Control bajo - Hemoglobina| 8.0    | 8.2    | 0.3          | Dentro |
      | Control alto - Hemoglobina| 16.0   | 15.8   | 0.4          | Dentro |
      | Control bajo - Plaquetas  | 95,000 | 98,000 | 8,000        | Dentro |
      | Control alto - Plaquetas  | 350,000| 345,000| 20,000       | Dentro |
    Y el sistema genera gráfica de Levey-Jennings
    Y el sistema evalúa:
      | Criterio                  | Estado             |
      | Westgard rules            | Cumplidas          |
      | Out of control            | No                 |
      | tendencia                  | No detectada       |

  Escenario: Estadísticas de laboratorio
    Dado que el director solicita reporte mensual
    Cuando el sistema genera estadísticas
    Entonces el reporte incluye:
      | Métrica                   | Valor              |
      | Total de muestras procesadas | 1,250           |
      | Tiempo promedio de resultado| 4 horas           |
      | Muestras rechazadas        | 15 (1.2%)         |
      | Valores críticos reportados | 8                 |
      | Controles fuera de rango   | 2                 |
      | Estudios más solicitados    | BHC, Química, Orina|
    Y el sistema puede exportar a PDF o Excel

  Escenario: Trazabilidad de muestra
    Dado que se sigue el recorrido de una muestra
    Cuando se consulta trazabilidad
    Entonces el sistema muestra:
      | Hito                     | Hora    | Personal        |
      | Solicitud generada       | 08:00   | Dr. Pérez       |
      | Muestra tomada           | 08:15   | QFB López       |
      | Recepción en laboratorio | 08:30   | QFB Martínez    |
      | Procesamiento            | 08:45   | Analizador      |
      | Resultado disponible     | 09:15   | Automático      |
      | Revisión y liberación    | 09:30   | QFB Jefe        |
      | Notificación al médico  | 09:35   | Sistema         |
    Y el sistema calcula tiempo total: 1 hora 35 minutos
