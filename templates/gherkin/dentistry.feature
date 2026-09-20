# language: es
Característica: Atención Odontológica
@status:proposed
@type:acceptance
@domain:dentistry
  Como odontólogo
  Quiero diagnosticar y tratar patologías dentales
  Para mantener la salud bucal integral del paciente

  Contexto:
    Dado que el sistema está funcionando
    Y que el usuario tiene rol de odontólogo

  Escenario: Evaluación odontológica inicial
    Dado que el paciente acude a revisión dental
    Cuando el odontólogo realiza evaluación
    Entonces el sistema registra:
      | Índice                     | Valor              |
      | DMFT                       | 8                  |
      | Índice de placa            | 45%                |
      | Índice gingival            | 35%                |
      | Probing pockets            | (tabla por diente) |
      | Movilidad dental           | Grado I: 16        |
      | Radiografías               | Panorámica + periapical |
    Y el sistema genera mapa dental:
      | Diente | Estado           | Tratamiento necesario |
      | 16     | Caries           | Restauración          |
      | 24     | Ausente          | Prótesis              |
      | 36     | Endodoncia       | Corona                |
      | 46     | Caries profunda  | Endodoncia + Corona   |
      | General| Gingivitis       | Profilaxis + Educación|

  Escenario: Odontograma digital
    Dado que el odontólogo realiza odontograma
    Cuando registra hallazgos por diente
    Entonces el sistema muestra dientes con códigos de color:
      | Código | Significado          | Color   |
      | S      | Sano                | Verde   |
      | C      | Caries              | Rojo    |
      | O      | Obturado            | Azul    |
      | E      | Endodonciado        | Amarillo|
      | X      | Extracción indicada | Negro   |
      | P      | Prótesis            | Morado  |
      | F      | Fractura            | Naranja |
    Y el sistema permite registrar por superficie:
      | Superficie | Diente 16 |
      | Mesial     | C         |
      | Distal     | S         |
      | Oclusal    | C         |
      | Vestibular | S         |
      | Lingual    | S         |

  Escenario: Tratamiento de caries
    Dado que el paciente tiene caries en diente 46
    Cuando el odontólogo realiza tratamiento
    Entonces el sistema registra:
      | Campo                     | Valor              |
      | Diente                    | 46                 |
      | Diagnóstico               | Caries profunda    |
      | Tratamiento               | Endodoncia + Corona |
      | Número de sesiones        | 3                  |
      | Materiales utilizados     | (lista)            |
      | Anestesia                 | Lidocaína 2% con vasoconstrictor |
    Y el sistema genera plan de tratamiento:
      | Sesión | Procedimiento                |
      | 1      | Endodoncia + Obturación temporal |
      | 2      | Preparación para corona      |
      | 3      | Cementación de corona        |
    Y el sistema calcula costo estimado
    Y el sistema agenda siguientes sesiones

  Escenario: Profilaxis dental
    Dado que el paciente acude a profilaxis
    Cuando el odontólogo realiza limpieza
    Entonces el sistema registra:
      | Procedimiento              |
      | Detartraje supragingival   |
      | Detartraje subgingival     |
      | Pulido dentario            |
      | Aplicación de flúor        |
      | Irrigación                 |
    Y el sistema registra observaciones:
      | Hallazgo                   |
      | Cálculo severo inferior    |
      | Gingivitis generalizada    |
      | Sangrado al sondeo         |
      | Halitosis                  |
    Y el sistema genera recomendaciones:
      | Recomendación              |
      | Cepillado 3 veces al día   |
      | Hilo dental diario         |
      | Enjuague con clorhexidina  |
      | Control en 6 meses         |

  Escenario: Urgencia dental - Dolor agudo
    Dado que el paciente llega con dolor dental agudo
    Cuando el odontólogo evalúa
    Entonces el sistema registra:
      | Característica             | Detalle            |
      | Tipo de dolor              | Pulsátil, intenso  |
      | Localización               | Diente 46          |
      | Duración                   | 2 días             |
      | Desencadenante             | Calor, frío        |
      | Dolor nocturno             | Sí                 |
      | Inflamación                | Sí, facial         |
      | Fiebre                     | 38.2°C             |
    Y el sistema diagnostica: "Pulpitis irreversible con absceso periapical"
    Y el sistema genera plan de emergencia:
      | Acción                    |
      | Antibioticoterapia        |
      | Analgesia                 |
      | Drenaje si aplica         |
      | Endodoncia de urgencia    |

  Escenario: Extracción dental
    Dado que el paciente requiere extracción
    Cuando se realiza el procedimiento
    Entonces el sistema registra:
      | Campo                     | Valor              |
      | Diente                    | 48 (muelas del juicio) |
      | Tipo de extracción        | Simple             |
      | Anestesia                 | Inferior alveolar  |
      | Complicaciones            | Ninguna            |
      | Tiempo del procedimiento  | 20 minutos         |
      | Materiales                | Gasas, sutura      |
    Y el sistema genera instrucciones post-extracción:
      | Instrucción               |
      | Mantener gasa 30 minutos  |
      | No enjuagar bucal 24 horas|
      | Dieta blanda 48 horas     |
      | No fumar 72 horas         |
      | Analgésico según indicación|
      | Antibiótico según indicación|
      | Control en 7 días         |

  Escenario: Plan de tratamiento odontológico
    Dado que el odontólogo completa evaluación
    Cuando genera plan de tratamiento
    Entonces el sistema muestra:
      | Prioridad | Diente | Tratamiento              | Costo   | Sesiones |
      | 1         | 46     | Endodoncia + Corona      | $3,500  | 3        |
      | 1         | 16     | Restauración             | $800    | 1        |
      | 2         | 24     | Puente o implante        | $8,000  | 4        |
      | 3         | General| Profilaxis               | $500    | 1        |
    Y el sistema calcula costo total: $12,800
    Y el sistema puede generar cotización para paciente
    Y el sistema agenda primera sesión
