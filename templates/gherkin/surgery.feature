# language: es
Característica: Atención Quirúrgica
  Como equipo quirúrgico
  Quiero gestionar el proceso quirúrgico completo
  Para garantizar seguridad del paciente antes, durante y después de la cirugía

  Contexto:
    Dado que el sistema está funcionando
    Y que el usuario tiene rol de médico quirúrgico

  Escenario: Evaluación preoperatoria
    Dado que el paciente será intervenido quirúrgicamente
    Cuando el cirujano realiza evaluación preoperatoria
    Entonces el sistema registra:
      | Campo                     | Valor              |
      | Diagnóstico preoperatorio | Colecistitis crónica|
      | Procedimiento planeado    | Colectomía laparoscópica|
      | Tipo de anestesia         | General            |
      | ASA                       | II                 |
      | Riesgo quirúrgico         | Moderado           |
      | Consentimiento informado  | Firmado            |
    Y el sistema verifica checklist preoperatoria:
      | Item                      | Estado             |
      | Identificación correcta   | Verificado         |
      | Sitio quirúrgico marcado  | Verificado         |
      | Consentimiento            | Verificado         |
      | Ayuno                    | Verificado         |
      | Alergias                  | Verificadas        |
      | Profilaxis antibiótica    | Administrada       |
      | Vía aérea                 | Evaluada           |
    Y el sistema genera orden de hospitalización

  Escenario: Registro intraoperatorio
    Dado que el paciente está en quirófano
    Cuando el equipo quirúrgico registra datos intraoperatorios
    Entonces el sistema captura:
      | Campo                     | Valor              |
      | Hora inicio               | 08:30              |
      | Hora fin                  | 10:45              |
      | Procedimiento realizado   | Colectomía laparoscópica|
      | Hallazgos                 | Vesícula inflamada |
      | Complicaciones            | Ninguna            |
      | Pérdida sanguínea         | 150 mL             |
      | Fluidos administrados     | 2000 mL RL         |
      | Medicamentos intraop      | (lista)            |
      | Implantados               | Ninguno            |
      | Cultivos tomados          | Sí                 |
    Y el sistema registra datos de anestesia:
      | Campo                     | Valor              |
      | Tipo de anestesia         | General            |
      | Intubación                |_orotraqueal        |
      | Tiempo de anestesia       | 135 minutos        |
      | Medicamentos anestésicos  | (lista)            |
      | Eventos adversos          | Ninguno            |
    Y el sistema genera reporte quirúrgico

  Escenario: Hoja de quirófano
    Dado que se programó cirugía para el día
    Cuando el administrador genera hoja de quirófano
    Entonces el sistema muestra:
      | Quirófano | Hora  | Paciente        | Procedimiento              | Cirujano       | Anestesiólogo |
      | Q1        | 08:00 | María García    | Colectomía laparoscópica   | Dr. Pérez      | Dr. López     |
      | Q1        | 11:00 | Ana López       | Apendicectomía             | Dr. Ruiz       | Dr. García    |
      | Q2        | 09:00 | Carmen Ruiz     | Hernia inguinal            | Dr. Martínez   | Dr. Sánchez   |
    Y el sistema muestra estado de cada quirófano:
      | Estado                      |
      | Programado                  |
      | En preparación              |
      | En cirugía                  |
      | Limpieza                    |
      | Disponible                  |

  Escenario: Registro de anestesia
    Dado que el paciente está en quirófano
    Cuando el anestesiólogo registra datos de anestesia
    Entonces el sistema captura:
      | Campo                     | Valor              |
      | Evaluación preanestésica  | Completa           |
      | Tipo de anestesia         | General            |
      | Vía aérea                 | Orotraqueal 7.5    |
      | Inducción                 | Propofol + Rocuronio|
      | Mantenimiento             | Sevoflurano + Fentanilo|
      | Monitorización            | ECG, SpO2, EtCO2, TA|
      | Fluidos                   | 2500 mL RL         |
      | Diuresis                  | 400 mL             |
      | Complicaciones            | Ninguna            |
      | Extubación                 | Consciente          |
    Y el sistema registra signos vitales intraoperatorios cada 5 minutos
    Y el sistema genera reporte de anestesia

  Escenario: Recuperación postanestésica
    Dado que el paciente egresa de quirófano
    Cuando el paciente llega a recuperación
    Entonces el sistema registra:
      | Campo                     | Valor              |
      | Hora de llegada           | Automática         |
      | Glasgow                   | 15                 |
      | PA                        | 120/75             |
      | FC                        | 85 lpm             |
      | SpO2                      | 98%                |
      | Temperatura               | 36.2°C             |
      | Dolor (EVA)               | 4/10               |
      | Náuseas                   | No                 |
      | Líquidos                  | Continuar IV       |
    Y el sistema muestra checklist de egreso de recuperación:
      | Item                      | Estado             |
      | Estable hemodinámicamente | Sí                 |
      | Dolor controlado          | Sí                 |
      | Sin náuseas               | Sí                 |
      | Diuresis presente         | Sí                 |
      | Herida quirúrgica estable | Sí                 |
      | Sin sangrado activo       | Sí                 |
    Y el sistema aprueba egreso a habitación

  Escenario: Nota postoperatoria
    Dado que el paciente está en recuperación postoperatoria
    Cuando el cirujano escribe nota postoperatoria
    Entonces el sistema registra:
      | Sección                   |
      | Diagnóstico postoperatorio|
      | Procedimiento realizado   |
      | Hallazgos intraoperatorios|
      | Estado actual             |
      | Tratamiento postoperatorio|
      | Plan de cuidados          |
      | Criterios de alta         |
    Y el sistema genera ordenes postoperatorias:
      | Orden                     |
      | Medicamentos              |
      | Fluidos                   |
      | Dietas                    |
      | Movilización              |
      | Curaciones                |
      | Monitoreo                 |

  Escenario: Control de infección de sitio quirúrgico
    Dado que el paciente fue intervenido hace 7 días
    Cuando el paciente acude con signos de infección
    Entonces el sistema registra:
      | Hallazgo                  |
      | Eritema en herida         |
      | Calor local               |
      | Dolor                     |
      | Secreción purulenta       |
    Y el sistema clasifica como "ISQ - Infección de Sitio Quirúrgico"
    Y el sistema genera cultivo de herida
    Y el sistema inicia tratamiento antibiótico
    Y el sistema notifica a epidemiología

  Escenario: Lista de espera quirúrgica
    Dado que hay pacientes en lista de espera
    Cuando el administrador genera reporte de lista de espera
    Entonces el sistema muestra:
      | Paciente      | Procedimiento         | Cirujano    | Urgencia | Fecha programada |
      | Juan López    | Prótesis de rodilla   | Dr. Ruiz    | Alta      | 15/10/2024       |
      | Rosa Díaz     | Catarata              | Dr. Martínez| Media     | 20/10/2024       |
      | Carlos Sánchez| Hernia inguinal       | Dr. Pérez   | Baja      | 01/11/2024       |
    Y el sistema puede ordenar por: urgencia, fecha, cirujano
    Y el sistema muestra tiempo de espera promedio
