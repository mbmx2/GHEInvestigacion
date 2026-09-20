# language: es
Característica: Postoperatorio y Complicaciones
@status:proposed
@type:acceptance
@domain:surgery
  Como cirujano del hospital
  Quiero documentar postoperatorio y detectar complicaciones
  Para asegurar recuperación segura del paciente

  Contexto:
    Dado que el sistema está activo
    Y que el paciente tuvo cirugía

  Escenario: Nota postoperatoria
    Dado que cirujano escribe nota postoperatoria
    Cuando se registra
    Entonces incluye:
      | Sección                   |
      | Diagnóstico postoperatorio|
      | Procedimiento y hallazgos |
      | Estado actual             |
      | Tratamiento y plan cuidados|
      | Criterios de alta         |
    Y genera ordenes:
      | Orden                     |
      | Medicamentos              |
      | Dietas y movilización     |
      | Curaciones y monitoreo    |

  Escenario: Infección de sitio quirúrgico
    Dado que paciente acude 7 días post-op con signos de infección
    Cuando médico evalúa
    Entonces registra: eritema, calor, dolor, secreción purulenta
    Y clasifica: "ISQ"
    Y genera cultivo + tratamiento antibiótico + notifica epidemiología
