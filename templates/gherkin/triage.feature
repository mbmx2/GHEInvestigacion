# language: es
Característica: Triaje Obstétrico
  Como personal de enfermería
  Quiero clasificar el riesgo de cada paciente obstétrica
  Para priorizar la atención según la gravedad

  Contexto:
    Dado que el sistema está funcionando
    Y que el usuario tiene rol de enfermería

  Escenario: Triaje de paciente de bajo riesgo
    Dado que la paciente "Ana López" acude a control prenatal
    Cuando el personal de enfermería registra:
      | Campo                    | Valor         |
      | Presión arterial         | 115/72        |
      | Frecuencia cardíaca      | 78 lpm        |
      | Temperatura              | 36.5°C        |
      | Peso                     | 68 kg         |
      | Edema                    | Ninguno       |
      | Proteinuria              | Negativa      |
      | Frecuencia cardíaca fetal| 140 lpm       |
      | Altura uterina           | 24 cm         |
    Entonces el sistema clasifica riesgo como "BAJO"
    Y el sistema asigna color VERDE
    Y el sistema estima tiempo de espera: 30 minutos
    Y el sistema muestra "Puede esperar turno normal"

  Escenario: Triaje de paciente de riesgo medio
    Dado que la paciente "Carmen Ruiz" acude con 28 semanas
    Cuando el personal registra:
      | Campo                    | Valor         |
      | Presión arterial         | 130/85        |
      | Edema                    | Leve          |
      | Proteinuria              | +             |
      | Frecuencia cardíaca fetal| 155 lpm       |
    Entonces el sistema clasifica riesgo como "MEDIO"
    Y el sistema asigna color AMARILLO
    Y el sistema estima tiempo de espera: 15 minutos
    Y el sistema sugiere "Evaluar con prioridad"

  Escenario: Triaje de paciente de alto riesgo
    Dado que la paciente "Rosa Martínez" acude con 34 semanas
    Cuando el personal registra:
      | Campo                    | Valor         |
      | Presión arterial         | 142/92        |
      | Edema                    | Moderado      |
      | Proteinuria              | ++            |
      | Dolor abdominal          | Sí            |
    Entonces el sistema clasifica riesgo como "ALTO"
    Y el sistema asigna color NARANJA
    Y el sistema genera alerta inmediata al médico
    Y el sistema estima tiempo de espera: 5 minutos
    Y el sistema muestra "ATENCIÓN URGENTE"

  Escenario: Triaje de emergencia obstétrica
    Dado que la paciente "Laura Díaz" acude con sangrado activo
    Cuando el personal registra:
      | Campo                    | Valor         |
      | Sangrado genital         | Activo        |
      | Presión arterial         | 90/60         |
      | Frecuencia cardíaca      | 110 lpm       |
      |Estado general            | Comprometido  |
    Entonces el sistema clasifica riesgo como "CRÍTICO"
    Y el sistema asigna color ROJO
    Y el sistema genera ALARMA MÁXIMA
    Y el sistema notifica a TODO el personal disponible
    Y el sistema muestra "EMERGENCIA - ATENCIÓN INMEDIATA"
    Y el sistema inicia protocolo de emergencia

  Escenario: Cambio de clasificación durante espera
    Dado que la paciente fue clasificada como "MEDIO"
    Y que la paciente está en sala de espera
    Cuando el personal registra nuevos signos vitales:
      | Campo                    | Valor         |
      | Presión arterial         | 148/95        |
      | Dolor                    | Intenso       |
    Entonces el sistema actualiza clasificación a "ALTO"
    Y el sistema genera alerta de cambio de estado
    Y el sistema mueve a la paciente a prioridad urgente

  Escenario: Registro completo de signos vitales
    Dado que la paciente acude a consulta
    Cuando el personal registra signos vitales completos:
      | Campo                      | Valor   |
      | Presión arterial sistólica  | 120     |
      | Presión arterial diastólica | 75      |
      | Frecuencia cardíaca         | 76 lpm  |
      | Temperatura                 | 36.4°C  |
      | Saturación de oxígeno       | 98%     |
      | Frecuencia respiratoria     | 16 rpm  |
      | Peso                        | 72 kg   |
      | Talla                       | 1.65 m  |
      | IMC calculado               | 26.4    |
      | Altura uterina              | 30 cm   |
      | Frecuencia cardíaca fetal   | 138 lpm |
      | Presentación                | Cefálica|
      | Edema                       | Ninguno |
      | Proteinuria                 | Negativa|
    Entonces el sistema calcula automáticamente:
      | Cálculo               | Resultado     |
      | IMC                   | 26.4          |
      | Clasificación IMC     | Sobrepeso     |
      | Edad gestacional      | 30 semanas    |
      | Riesgo según protocolo| Bajo          |
    Y el sistema guarda registro completo con timestamp

  Escenario: Historial de triajes
    Dado que la paciente tiene 6 controles previos
    Cuando el personal abre el expediente
    Entonces el sistema muestra gráfica de:
      | Parámetro              | Período        |
      | Presión arterial       | Todo el embarazo|
      | Peso                   | Todo el embarazo|
      | Altura uterina         | Todo el embarazo|
      | Frecuencia cardíaca fetal | Todo el embarazo|
    Y el sistema muestra tendencias y variaciones
    Y el sistema resalta valores fuera de rango
