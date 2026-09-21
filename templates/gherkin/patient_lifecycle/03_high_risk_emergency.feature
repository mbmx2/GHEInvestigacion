# language: es
# @id GHE-PATIENT-LIFECYCLE-HIGH-001
# @type clinical
# @domain patient
# @layer domain
# @risk s1
# @owner medical-director
# @status proposed
# @requirement REQ-PATIENT-HIGH-RISK
# @risk-control CTRL-PATIENT-HIGH-RISK
# @regulation NOM-004
@domain:patient @type:clinical @risk:s1 @status:proposed
Característica: Paciente de Alto Riesgo y Emergencia
  Como médico del hospital
  Quiero protocolos específicos para pacientes de alto riesgo y emergencias
  Para que se priorice la atención y se documente completamente

  Regla: Paciente de alto riesgo tiene prioridad

    Escenario: Clasificación de riesgo
      Dado que paciente es clasificado como alto riesgo
      Cuando se evalúa
      Entonces:
        | Factor                      | Riesgo |
        | Edad <15 o >35 años      | Alto   |
        | Enfermedad crónica        | Alto   |
        | Antecedente de preeclampsia | Alto  |
        | Múltiples gestas          | Alto   |
        | Diabetes                  | Alto   |

  Regla: Emergencias se atienden según protocolo

    Escenario: Protocolo de emergencia activado
      Dado que paciente llega con emergencia
      Cuando se clasifica
      Entonces:
        | Nivel | Color  | Tiempo respuesta |
        | 1     | Rojo   | Inmediato        |
        | 2     | Naranja| 10 min           |
        | 3     | Amarillo| 30 min          |

  Regla: Documentación de emergencia completa

    Escenario: Documentación post-emergencia
      Dado que se atiende emergencia
      Cuando se documenta
      Entonces incluye:
        | Campo                      |
        | Hora de llegada           |
        | Tiempo de respuesta       |
        | Evaluación inicial        |
        | Tratamiento realizado     |
        | Outcome                   |
        | Tiempo total              |
