# language: es
Característica: Atención Ginecológica
  Como ginecólogo
  Quiero atender la salud de la mujer de forma integral
  Para prevenir, diagnosticar y tratar patologías ginecológicas

  Contexto:
    Dado que el sistema está funcionando
    Y que el usuario tiene rol de médico

  Escenario: Consulta ginecológica de rutina
    Dado que la paciente acude a revisión ginecológica anual
    Cuando el médico realiza evaluación
    Entonces el sistema registra:
      | Datos                      | Valor              |
      | Fecha de última regla      | 01/09/2024         |
      | Frecuencia de ciclos       | Regulares 28 días  |
      | Gestas                     | 2                  |
      | Partos                     | 2                  |
      | Cesáreas                  | 0                  |
      | Abortos                    | 0                  |
      | Menarquia                  | 12 años            |
      | Método anticonceptivo      | DI                 |
      | Tabaco                     | No                 |
      | Sexualidad activa          | Sí                 |
    Y el sistema solicita estudios:
      | Estudio                   | Periodicidad        |
      | Papanicolaou              | Anual               |
      | Colposcopía               | Si PAP anormal      |
      | Ecografía transvaginal     | Anual               |
      | Mamografía                | Cada 2 años (40+)   |

  Escenario: Resultado de Papanicolaou anormal
    Dado que la paciente tiene PAP con resultado ASC-US
    Cuando el médico revisa resultado
    Entonces el sistema muestra:
      | Resultado                  | Interpretación      |
      | ASC-US                     | Células atípicas de significado indeterminado |
      | HPV                        | Solicitud pendiente |
      | Colposcopía                | Pendiente           |
    Y el sistema genera plan:
      | Acción                    | Tiempo              |
      | Prueba de HPV             | Inmediata           |
      | Si HPV+ → Colposcopía     | 2 semanas           |
      | Si HPV- → Repetir PAP     | 12 meses            |
    Y el sistema agenda seguimiento

  Escenario: Manejo de miomas uterinos
    Dado que la paciente tiene miomas uterinos
    Cuando el médico realiza ecografía
    Entonces el sistema registra:
      | Característica             | Detalle            |
      | Número de miomas           | 3                  |
      | Tamaño mayor               | 5 cm               |
      | Localización               | Intramural, subseroso |
      | Endometrio                 | Normal             |
      | Espesor endometrial        | 8 mm               |
    Y el sistema clasifica según FIGO:
      | Mioma | Tipo FIGO | Tamaño | Localización   |
      | 1     | 3         | 5 cm   | Intramural     |
      | 2     | 4         | 2 cm   | Subseroso      |
      | 3     | 3         | 1.5 cm | Intramural     |
    Y el sistema evalúa:
      | Síntoma                   | Presente |
      | Menorragia                | Sí       |
      | Dolor pélvico             | Leve     |
      | Anemia                    | No       |
      | Infertilidad              | No       |
    Y el sistema sugiere tratamiento según síntomas

  Escenario: Manejo de endometriosis
    Dado que la paciente tiene endometriosis diagnosticada
    Cuando acude a control
    Entonces el sistema registra:
      | Parámetro                  | Valor              |
      | Escala de dolor (EVA)      | 7/10               |
      | Dolor durante coito        | Sí, intenso        |
      | Dolor menstrual            | Severo, incapacitante |
      | Dolor pélvico crónico      | Sí                 |
      | Infertilidad               | Sí (12 meses)      |
    Y el sistema muestra clasificación:
      | Estadio ASRM               | III (Moderado-severo) |
      | Localización               | Ovario bilateral, fondo de saco de Douglas |
    Y el sistema sugiere tratamiento:
      | Opción                     | Indicación         |
      | ACO combinados             | Primera línea      |
      | Progestágenos              | Segunda línea      |
      | Cirugía laparoscópica      | Si falla medical    |
      | Fertilización in vitro     | Si infertilidad     |

  Escenario: Atención de aborto espontáneo
    Dado que la paciente acude con sangrado en primer trimestre
    Cuando el médico evalúa
    Entonces el sistema registra:
      | Datos                      | Valor              |
      | Edad gestacional           | 8 semanas          |
      | Sangrado                   | Abundante          |
      | Dolor                      | Cólico intenso     |
      | Ecografía                  | Saco gestacional vacío |
      | FCF fetal                  | Ausente            |
    Y el sistema diagnostica: "Aborto incompleto (O02.1)"
    Y el sistema evalúa opciones:
      | Opción                     | Pros/Contras       |
      | Expectante                 | Esperar expulsión  |
      | Medical                    | Misoprostol        |
      | Quirúrgico                 | Limpieza endouterina |
    Y el sistema registra decisión de la paciente
    Y el sistema genera plan de seguimiento:
      | Acción                    | Tiempo              |
      | Control post-aborto       | 2 semanas          |
      | PAP si pendiente          | 6 semanas          |
      | Grupo sanguíneo y RH      | Inmediato          |
      | Rh negativo → Anti-D      | Inmediato          |

  Escenario: Educación en salud sexual y reproductiva
    Dado que la paciente solicita información sobre métodos anticonceptivos
    Cuando el médico realiza consejería
    Entonces el sistema muestra opciones:
      | Método                     | Eficacia | Tipo        |
      | DI de cobre                | 99%      | Irreversible|
      | DI hormonal                | 99%      | Irreversible|
      | Implante subdérmico        | 99%      | Irreversible|
      | Inyectable trimestral      | 94%      | Reversible  |
      | Pastilla anticonceptiva    | 91%      | Reversible  |
      | Condón masculino           | 82%      | Barrera     |
      | Condón femenino            | 79%      | Barrera     |
    Y el sistema registra elección de la paciente
    Y el sistema genera orden del método elegido
    Y el sistema agenda seguimiento según método

  Escenario: Detección de cáncer cervicouterino
    Dado que la paciente tiene diagnóstico de cáncer cervicouterino
    Cuando el médico completa estadificación
    Entonces el sistema registra:
      | Parámetro                  | Resultado          |
      | Estadio FIGO               | IB1                |
      | Tamaño tumoral             | 2 cm               |
      | Infiltración               | Cervical           |
      | Ganglios                   | Negativos          |
      | Metástasis                 | Ausentes           |
    Y el sistema sugiere tratamiento según estadio:
      | Estadio | Tratamiento                          |
      | IB1     | Conización + linfadenectomía o       |
      |         | Histerectomía radical                |
    Y el sistema genera referencia a ginecología oncológica
    Y el sistema programa seguimiento post-tratamiento
