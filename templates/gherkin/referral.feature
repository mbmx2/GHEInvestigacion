# language: es
Característica: Referencia y Contrarreferencia
  Como médico
  Quiero gestionar referencias a especialistas y hospitales
  Para garantizar continuidad de la atención del paciente

  Contexto:
    Dado que el sistema está funcionando
    Y que el usuario tiene rol de médico

  Escenario: Generación de referencia médica
    Dado que el paciente requiere atención especializada
    Cuando el médico genera nota de referencia
    Entonces el sistema genera documento con:
      | Sección                   |
      | Datos del paciente        |
      | Resumen clínico           |
      | Motivo de referencia      |
      | Signos vitales actuales   |
      | Diagnóstico (CIE-10)      |
      | Tratamiento realizado     |
      | Estudios solicitados      |
      | Urgencia de la referencia |
      | Médico que refiere        |
      | Cédula profesional        |
    Y el sistema registra:
      | Campo                     | Valor              |
      | Institución de destino    | Hospital Regional  |
      | Especialidad              | Cardiología        |
      | Médico receptor           | Dr. Especialista   |
      | Tipo de referencia        | Urgente            |
      | Fecha de referencia       | Automática         |

  Escenario: Referencia urgente por infarto
    Dado que el paciente presenta IAM sin elevación del ST
    Cuando se decide referencia urgente
    Entonces el sistema genera referencia de emergencia:
      | Campo                     | Valor              |
      | Urgencia                  | MÁXIMA             |
      | Tiempo de traslado estimado| 45 minutos         |
      | Estudios incluidos        | ECG, Troponina, BHC |
      | Tratamiento pre-hospitalario| Ácido acetilsalicílico, Nitroglicerina |
      | Disponibilidad de equipo  | Ambulancia básica  |
    Y el sistema notifica al hospital receptor
    Y el sistema genera copia digital de referencia
    Y el sistema registra hora de salida del paciente

  Escenario: Contrarreferencia recibida
    Dado que el paciente regresa con contrarreferencia
    Cuando el médico recibe la contrarreferencia
    Entonces el sistema importa datos:
      | Sección                   |
      | Resumen de hospitalización|
      | Procedimientos realizados |
      | Diagnóstico definitivo    |
      | Tratamiento indicado      |
      | Medicamentos de alta      |
      | Próximos pasos            |
      | Seguimiento requerido     |
    Y el sistema vincula contrarreferencia al expediente
    Y el sistema genera plan de seguimiento local

  Escenario: Referencia a laboratorio externo
    Dado que se requiere estudio especializado no disponible
    Cuando el médico genera orden
    Entonces el sistema registra:
      | Campo                     | Valor              |
      | Estudio solicitado        | RMN de cerebro     |
      | Laboratorio/imagen externo| Centro de Diagnóstico |
      | Indicación clínica        | Sospecha de esclerosis múltiple |
      | Urgencia                  | Programada         |
    Y el sistema genera orden impresa
    Y el sistema agenda resultados

  Escenario: Seguimiento de referencia pendiente
    Dado que hay referencias pendientes de respuesta
    Cuando el médico consulta estatus
    Entonces el sistema muestra:
      | Paciente     | Referencia a       | Especialidad | Fecha ref | Estado    |
      | Juan López   | Hospital Regional  | Cardiología  | 01/10     | Pendiente |
      | Ana García   | Centro Diagnóstico | Neurología   | 15/09     | Resultado |
      | Rosa Martínez| Hospital General   | Ginecología  | 01/09     | Contrarreferencia |
    Y el sistema puede filtrar por: estado, especialidad, fecha
    Y el sistema genera alerta si referencia tiene >30 días sin respuesta

  Escenario: Referencia interconsultada
    Dado que se solicita interconsulta dentro del mismo centro
    Cuando el médico genera interconsulta
    Entonces el sistema registra:
      | Campo                     | Valor              |
      | Especialidad consultada   | Nutrición          |
      | Motivo                    | Evaluación nutricional prequirúrgica |
      | Urgencia                  | Programada         |
    Y la interconsulta aparece en bandeja del especialista
    Y el sistema registra respuesta del especialista
    Y la respuesta se vincula al expediente

  Escenario: Notificación de referencia aceptada
    Dado que el hospital receptor acepta la referencia
    Cuando se recibe notificación
    Entonces el sistema registra:
      | Campo                     | Valor              |
      | Estado                    | Aceptada           |
      | Fecha de admisión         | 02/10/2024         |
      | Servicio                  | Unidad de Terapia Intensiva |
      | Cama asignada             | UTI-05             |
      | Médico receptor           | Dr. López García   |
    Y el sistema actualiza estado de referencia
    Y el sistema notifica al médico que refirió

  Escenario: Historial de referencias
    Dado que el paciente tiene múltiples referencias
    Cuando se consulta historial
    Entonces el sistema muestra:
      | Fecha        | Referencia a          | Especialidad | Motivo              | Estado |
      | 01/06/2024   | Hospital Regional    | Cardiología  | Dolor torácico      | Completada |
      | 15/03/2024   | Centro Diagnóstico   | Laboratorio  | Biometría completa  | Completada |
      | 01/01/2024   | Hospital General     | Cirugía      | Vesícula            | Pendiente |
    Y el sistema muestra resumen de cada referencia
    Y el sistema permite exportar historial completo
