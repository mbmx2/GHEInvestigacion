# language: es
Característica: Gestión de Laboratorio Clínico
  Como director de laboratorio
  Quiero gestionar el flujo completo de laboratorio
  Para garantizar resultados precisos y oportunos

  Contexto:
    Dado que el sistema está activo
    Y que el usuario tiene rol de laboratorio

  Escenario: Solicitud de estudios
    Dado que médico solicita BHC + Química + Orina
    Cuando sistema genera orden
    Entonces orden incluye:
      | Campo                     |
      | Paciente + CURP           |
      | Médico solicitante        |
      | Estudios + prioridad      |
      | Diagnóstico asociado      |
    Y genera código de muestra + etiqueta con código de barras

  Escenario: Recepción de muestra
    Dado que paciente llega a tomar muestra
    Cuando lab recibe muestra
    Entonces verifica:
      | Verificación              | Estado |
      | Identidad del paciente   | ✅      |
      | Ayuno (si aplica)        | ✅      |
      | Etiquetado correcto      | ✅      |
      | Calidad de muestra       | ✅      |

  Escenario: Biometría hemática
    Dado que se procesa BHC
    Cuando se ingresa al analizador
    Entonces resultados:
      | Parámetro     | Resultado | Referencia     |
      | Leucocitos    | 12,500    | 4,000-11,000   |
      | Hemoglobina   | 10.2      | 12-16          |
      | Plaquetas     | 180,000   | 150,000-400,000|
    Y evalúa: Leucocitosis → infección, Anemia → investigar causa

  Escenario: Valor crítico
    Dado que plaquetas = 25,000/µL
    Entonces sistema genera ALERTA CRÍTICA:
      | Acción                          |
      | Notificar médico INMEDIATAMENTE|
      | Confirmar con nueva muestra   |
      | Documentar notificación     |

  Escenario: Urocultivo positivo
    Dado que cultivo crece con >100,000 UFC/mL de E. coli
    Cuando se interpreta antibiograma
    Entonces:
      | Antibiótico               | Sensibilidad |
      | Amoxicilina/Clavulanico   | Sensible     |
      | Ciprofloxacino            | Sensible     |
      | Ampicilina                | Resistente   |
    Y sugiere: "Tratamiento con Amoxicilina/Clavulanico"

  Escenario: Control de calidad
    Dado que se ejecuta control de calidad diario
    Cuando personal registra resultados
    Entonces:
      | Control                | Valor  | Media | Estado |
      | Hb bajo                | 8.0    | 8.2   | Dentro |
      | Hb alto                 | 16.0   | 15.8  | Dentro |
    Y verifica Westgard rules: ✅ Cumplidas, sin out of control

  Escenario: Trazabilidad de muestra
    Dado que se sigue recorrido de muestra
    Cuando se consulta trazabilidad
    Entonces muestra timeline:
      | Hito                     | Hora  | Personal     |
      | Solicitud                | 08:00 | Dr. Pérez    |
      | Muestra tomada           | 08:15 | QFB López    |
      | Procesamiento            | 08:45 | Analizador   |
      | Resultado disponible     | 09:15 | Automático   |
      | Liberación                | 09:30 | QFB Jefe     |
    Y calcula tiempo total: 1h 35min
