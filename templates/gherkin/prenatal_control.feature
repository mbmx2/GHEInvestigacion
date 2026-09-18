# language: es
Característica: Control Prenatal
  Como médico de la maternidad
  Quiero dar seguimiento a mujeres embarazadas
  Para detectar complicaciones a tiempo y reducir mortalidad materna

  Contexto:
    Dado que el sistema está funcionando
    Y que el usuario tiene rol de médico
    Y que existe la paciente "María García" con embarazo activo

  Escenario: Primer control prenatal
    Dado que la paciente "María García" acude por primera vez en embarazo
    Cuando el médico registra los datos iniciales:
      | Campo                    | Valor         |
      | Fecha última regla       | 01/06/2024    |
      | Edad gestacional         | 8 semanas     |
      | Frecuencia cardíaca fetal| N/A           |
      | Presión arterial         | 110/70        |
      | Peso                     | 65 kg         |
      | Talla                    | 1.62 m        |
      | Edema                    | Ninguno       |
      | Proteinuria              | Negativa      |
      | Factor Rh                | Positivo      |
    Entonces el sistema calcula fecha probable de parto: 08/03/2025
    Y el sistema clasifica riesgo como "Bajo"
    Y el sistema agenda próximo control en 4 semanas
    Y el sistema genera lista de estudios solicitados

  Escenario: Control prenatal de seguimiento
    Dado que la paciente tiene 4 controles previos registrados
    Cuando el médico abre el expediente para el control 5
    Entonces el sistema muestra:
      | Información              | Fuente                    |
      | Historial de signos vitales | Controles anteriores   |
      | Curva de peso            | Gráfica automática        |
      | Evolución de PA          | Gráfica automática        |
      | Altura uterina esperada  | Tabla de crecimiento      |
      | Próximo estudio pendiente| Plan terapéutico anterior  |
    Y el sistema sugiere estudios según edad gestacional

  Escenario: Detección de preeclampsia
    Dado que la paciente tiene 32 semanas de gestación
    Cuando el médico registra:
      | Campo                    | Valor         |
      | Presión arterial         | 145/95        |
      | Proteinuria              | ++            |
      | Edema                    | Moderado      |
    Entonces el sistema genera ALERTA de preeclampsia
    Y el sistema sugiere:
      | Acción                   | Prioridad     |
      | Solicitar uricemia       | Urgente       |
      | Solicitar biometría hemática | Urgente    |
      | Considerar referencia    | Alta          |
    Y el sistema registra la alerta en el expediente
    Y el sistema muestra la alerta en rojo en la UI

  Escenario: Detección de anemia
    Dado que la paciente tiene resultado de hemoglobina
    Cuando el valor de hemoglobina es 9.5 g/dL
    Entonces el sistema clasifica como "Anemia leve"
    Y el sistema sugiere suplementación de hierro
    Y el sistema agenda复查 de hemoglobina en 4 semanas

  Escenario: Registro de control prenatal rápido
    Dado que la paciente acude a control rutinario
    Cuando el médico realiza evaluación rápida:
      | Campo                    | Valor         |
      | Presión arterial         | 120/75        |
      | Peso                     | 70 kg         |
      | Altura uterina           | 28 cm         |
      | Frecuencia cardíaca fetal| 145 lpm       |
      | Edema                    | Leve          |
      | Proteinuria              | Negativa      |
    Entonces el sistema registra el control en menos de 2 minutos
    Y el sistema actualiza la edad gestacional
    Y el sistema agenda próximo control

  Escenario: Detección de crecimiento intrauterino restringido
    Dado que la paciente tiene 36 semanas de gestación
    Cuando la altura uterina registrada es 26 cm (esperada: 34-36 cm)
    Entonces el sistema alerta sobre posible CIUR
    Y el sistema sugiere ultrasonido obstétrico
    Y el sistema clasifica riesgo como "Alto"

  Escenario: Generación de resumen para referencia
    Dado que la paciente requiere referencia a hospital
    Cuando el médico genera nota de referencia
    Entonces el sistema exporta:
      | Sección                   | Contenido                     |
      | Resumen clínico          | Texto estructurado            |
      | Signos vitales históricos| Tabla + gráfica               |
      | Diagnósticos             | CIE-10                        |
      | Tratamientos previos     | Lista cronológica             |
      | Estudios                 | PDFs adjuntos                 |
      | Motivo de referencia     | Texto libre                   |
    Y el sistema genera PDF profesional con membrete
    Y el sistema registra la referencia en el expediente
