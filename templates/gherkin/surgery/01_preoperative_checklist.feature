# language: es
Característica: Preoperatorio y Checklist Quirúrgico
  Como cirujano del hospital
  Quiero evaluar pacientes preoperatoriamente y seguir checklists
  Para prevenir errores antes de la cirugía

  Contexto:
    Dado que el sistema está activo
    Y que el usuario tiene rol de cirujano

  Escenario: Evaluación preoperatoria
    Dado que paciente será intervenido
    Cuando cirujano realiza evaluación
    Entonces registra:
      | Campo                     |
      | Diagnóstico preoperatorio |
      | Procedimiento planeado    |
      | ASA y riesgo quirúrgico   |
      | Consentimiento informado  |
    Y verifica checklist OMS:
      | Item                      | Estado |
      | Identificación correcta   | ✅      |
      | Sitio quirúrgico marcado  | ✅      |
      | Consentimiento            | ✅      |
      | Ayuno                    | ✅      |
      | Alergias                  | ✅      |
      | Profilaxis antibiótica    | ✅      |

  Escenario: Hoja de quirófano
    Dado que hay cirugías programadas
    Cuando se genera hoja de quirófano
    Entonces muestra:
      | Quirófano | Hora | Paciente | Procedimiento | Cirujano |
      | Q1        | 08:00| García   | Colectomía     | Dr. Pérez|
    Y estado de quirófano: programado/en preparación/en cirugía/limpieza/disponible

  Escenario: Lista de espera quirúrgica
    Dado que hay pacientes en lista de espera
    Cuando se genera reporte
    Entonces puede ordenar por: urgencia, fecha, cirujano
