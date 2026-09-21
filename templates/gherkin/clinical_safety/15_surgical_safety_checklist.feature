# language: es
# @id GHE-SAFETY-SSC-001
# @type safety
# @domain clinical_safety
# @layer clinical
# @risk s0
# @owner surgical-director
# @status proposed
# @requirement REQ-SAFETY-SSC
# @risk-control CTRL-SAFETY-SSC
# @regulation NOM-004
@domain:clinical_safety @type:safety @risk:s0 @status:proposed
Característica: Checklist Quirúrgico de Seguridad (OMS)
  Como cirujano del hospital
  Quiero que todo procedimiento quirúrgico siga el checklist de la OMS
  Para prevenir errores que causan muerte

  Regla: El checklist OMS se ejecuta en 3 momentos

    Escenario: Sign-in antes de inducción
      Dado que paciente está en quirófano
      Cuando se ejecuta sign-in
      Entonces se verifica:
        | Verificación              |
        | Identidad del paciente    |
        | Sitio quirúrgico          |
        | Procedimiento planeado    |
        | Consentimiento            |
        | Alergias                  |
        | Profilaxis antibiótica    |

    Escenario: Time-out antes de incisión
      Dado que se va a realizar incisión
      Cuando se ejecuta time-out
      Entonces se verifica:
        | Verificación              |
        | Todos del equipo confirman |
        | Profilaxis administrada   |
        | Instrumental verificado   |
        | Plan de emergencia        |

    Escenario: Sign-out antes de salida
    Dado que se va a salir de quirófano
    Cuando se ejecuta sign-out
    Entonces se verifica:
      | Verificación              |
      | Conteo de instrumental    |
      | Conteo de gasas           |
      | Drenajes                  |
      | Muestras enviadas         |
      | Nombre del cirujano       |

  Regla: El checklist es obligatorio

    Escenario: Cirugía sin checklist
      Dado que se detecta cirugía sin checklist
      Cuando se audita
      Entonces se registra como evento centinela

  # @invariante INV-SSC-001: No se realiza incisión sin time-out
  Regla: Time-out antes de incisión

    Escenario: Incisión sin time-out
      Dado que se va a realizar incisión sin time-out
      Cuando se detecta
      Entonces se detiene el procedimiento
      Y se ejecuta time-out antes de continuar
