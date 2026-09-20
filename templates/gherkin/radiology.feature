# language: es
Característica: Gestión de Imagenología
@status:proposed
@type:acceptance
@domain:imaging
  Como radiólogo
  Quiero gestionar estudios de imagen de forma eficiente
  Para diagnosticar con precisión y rapidez

  Contexto:
    Dado que el sistema está funcionando
    Y que el usuario tiene rol de imagenología

  Escenario: Solicitud de estudio de imagen
    Dado que el médico solicita un estudio de imagen
    Cuando el sistema genera la orden
    Entonces la orden incluye:
      | Campo                     | Valor              |
      | Paciente                  | María García López |
      | Estudio solicitado        | Radiografía de tórax PA |
      | Indicación clínica        | Dolor torácico, fiebre |
      | Urgencia                  | Urgente            |
      | Médico solicitante        | Dr. Juan Pérez     |
      | Diagnóstico presuntivo    | Neumonía           |
    Y el sistema genera código de estudio
    Y el sistema agenda al paciente
    Y el estudio aparece en cola de estudio

  Escenario: Registro de estudio de radiografía
    Dado que el paciente acude a radiografía
    Cuando el técnico realiza el estudio
    Entonces el sistema registra:
      | Campo                     | Valor              |
      | Tipo de estudio           | Radiografía PA     |
      | Región                    | Tórax              |
      | Proyección                | PA                 |
      | Parámetros técnicos       | 75 kVp, 3 mAs      |
      | Distancia foco-película   | 180 cm             |
      | Protección gonadal        | Sí                 |
      | Imagen adquirida          | Sí                 |
      | Calidad de imagen         | Adecuada           |

  Escenario: Interpretación de radiografía
    Dado que se realizó radiografía de tórax
    Cuando el radiólogo interpreta
    Entonces el sistema registra hallazgos:
      | Hallazgo                  | Detalle            |
      | Campos pulmonares         | Infiltrado basal derecho |
      | Silueta cardíaca          | Normal             |
      | Mediastino                | Normal             |
      | Diafragmas                | Normal             |
      | Costillas                 | Sin lesiones       |
      | Pleura                    | Sin derrame        |
    Y el sistema genera impresión:
      | Impresión                  |
      | Infiltrado pulmonar basal derecho compatible con neumonía |
    Y el sistema asignascore de certeza:
      | Nivel de certeza           |
      | Alto (>90%)               |

  Escenario: Ecografía obstétrica
    Dado que se solicita ecografía obstétrica
    Cuando el médico realiza el estudio
    Entonces el sistema registra:
      | Parámetro                 | Resultado          |
      | Edad gestacional por ecografía | 24 semanas    |
      | Biometría fetal           |                    |
      | DBP                       | 60 mm (50° percentil) |
      | AC                        | 200 mm (50° percentil) |
      | LF                        | 45 mm (50° percentil) |
      | Peso fetal estimado       | 650 g              |
      | Líquido amniótico         |                    |
      | ISLA                      | 12 cm (normal)     |
      | Placenta                  |                    |
      | Localización              | Anterior           |
      | Grado                     | II                 |
      | Sitio                     | Fondo              |
      | Presentación fetal        | Cefálica           |
      | Frecuencia cardíaca fetal | 145 lpm            |
      | Movimientos fetales       | Presentes          |
      | Sexenaje                  | Femenino          |
    Y el sistema evalúa:
      | Criterio                  | Resultado          |
      | Crecimiento               | Adecuado           |
      | Líquido amniótico         | Normal             |
      | Placenta                  | Normal             |
      | Anomalías estructurales   | No observadas      |

  Escenario: Tomografía computarizada
    Dado que se solicita TAC de abdomen
    Cuando se realiza el estudio
    Entonces el sistema registra:
      | Campo                     | Valor              |
      | Tipo de estudio           | TAC abdomen con contraste |
      | Contraste                 | Iohexol 350 mL IV  |
      | Protocolo                 | Fase venosa        |
      | Cortes                    | Axial, 5 mm        |
      | Reconstrucciones          | Coronal, sagital   |
    Y el sistema registra hallazgos:
      | Estructura                | Hallazgo           |
      | Hígado                    | Sin lesiones       |
      | Vesícula                  | Coledocolitiasis   |
      | Páncreas                  | Normal             |
      | Riñones                   | Sin litiasis       |
      | Aorta                     | Normal             |
      | Peritoneo                 | Sin ascitis        |
    Y el sistema genera impresión: "Coledocolitiasis. Se sugiere colangiopancreatografía."

  Escenario: Alerta de hallazgo incidental
    Dado que se realizó TAC por otra indicación
    Cuando el radiólogo detecta hallazgo incidental
    Entonces el sistema registra:
      | Hallazgo incidental        | Detalle            |
      | Hallazgo                   | Masa renal izquierda 3 cm |
      | Características            | Sólida, Enhancement  |
      | Localización               | Riñón izquierdo, polo superior |
      | Urgencia                   | Requiere seguimiento |
    Y el sistema genera alerta:
      | Tipo                       |
      | Hallazgo incidental - Requiere correlación clínica |
    Y el sistema sugiere:
      | Acción                    |
      | Correlación con clínica   |
      | Considerar biopsia        |
      | Referencia a urología     |

  Escenario: Control de dosis de radiación
    Dado que el paciente recibe estudios con radiación
    Cuando se consulta historial de dosis
    Entonces el sistema muestra:
      | Fecha        | Estudio              | Dosis (mSv) | Acumulado |
      | 01/01/2024   | Radiografía tórax    | 0.1         | 0.1       |
      | 15/03/2024   | TAC abdomen          | 10.0        | 10.1      |
      | 01/09/2024   | Radiografía abdomen  | 0.7         | 10.8      |
    Y el sistema evalúa:
      | Límite                     | Valor              | Estado   |
      | Dosis anual ocupacional    | 20 mSv             | Dentro   |
      | Dosis fetal (si embarazada)| <1 mSv             | Verificar|
    Y el sistema sugiere: "Considerar estudios sin radiación si es posible"

  Escenario: Lista de espera de estudios
    Dado que hay estudios pendientes
    Cuando el administrador genera reporte
    Entonces el sistema muestra:
      | Estudio               | Paciente     | Prioridad | Fecha solicitud | Espera |
      | TAC craneal           | Juan López   | Urgente   | Hoy             | 0 días |
      | RMN rodilla           | Ana García   | Media     | Hace 3 días     | 3 días |
      | Mamografía            | Rosa Martínez| Rutina    | Hace 1 semana   | 7 días |
    Y el sistema puede ordenar por: prioridad, fecha, tipo de estudio
    Y el sistema muestra tiempo promedio de espera por tipo de estudio
