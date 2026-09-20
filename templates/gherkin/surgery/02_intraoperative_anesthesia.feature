# language: es
Característica: Intraoperatorio y Anestesia
  Como equipo quirúrgico
  Quiero registrar datos intraoperatorios y de anestesia
  Para documentar el procedimiento de forma completa

  Contexto:
    Dado que el sistema está activo
    Y que el paciente está en quirófano

  Escenario: Registro intraoperatorio
    Dado que se realiza cirugía
    Cuando equipo registra datos
    Entonces captura:
      | Campo                     |
      | Hora inicio/fin           |
      | Procedimiento realizado   |
      | Hallazgos y complicaciones|
      | Pérdida sanguínea         |
      | Fluidos y medicamentos    |
      | Cultivos tomados          |

  Escenario: Registro de anestesia
    Dado que anestesiólogo registra datos
    Cuando se completa anestesia
    Entonces captura:
      | Campo                     |
      | Tipo y vía de anestesia   |
      | Inducción y mantenimiento |
      | Monitorización            |
      | Fluidos y diuresis        |
      | Eventos adversos          |
    Y registra signos vitales cada 5 min
    Y genera reporte de anestesia

  Escenario: Recuperación postanestésica
    Dado que paciente llega a recuperación
    Cuando se evalúa
    Entonces registra:
      | Campo                     |
      | Glasgow, PA, FC, SpO2     |
      | Dolor (EVA), náuseas      |
    Y verifica checklist de egreso:
      | Item                      | Estado |
      | Estable hemodinámicamente | ✅      |
      | Dolor controlado          | ✅      |
      | Sin náuseas               | ✅      |
      | Herida estable            | ✅      |
    Y aprueba egreso a habitación
