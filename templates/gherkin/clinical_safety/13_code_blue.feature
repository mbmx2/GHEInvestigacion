# language: es
# @id GHE-SAFETY-CB-001
# @type safety
# @domain clinical_safety
# @layer clinical
# @risk s0
# @owner medical-director
# @status proposed
# @requirement REQ-SAFETY-CB
# @risk-control CTRL-SAFETY-CB
# @regulation NOM-004
@domain:clinical_safety @type:safety @risk:s0 @status:proposed
Característica: Protocolo de Código Azul (Paro Cardíaco)
  Como responsable de emergencias del hospital
  Quiero protocolo de paro cardíaco ejecutable
  Para que se inicie RCP inmediata ante cualquier paro

  Regla: Todo personal reconoce el paro

    Escenario: Detección de paro
      Dado que personal detecta paciente inconsciente
      Cuando se evalúa
      Entonces:
        | Verificación              |
        | Sin respuesta a estímulo  |
        | Sin respiración normal    |
        | Sin pulso palpable        |
    Y se activa código azul

  Regla: RCP se inicia en 1 minuto

    Escenario: RCP inmediata
      Dado que se activa código azul
      Cuando se inicia RCP
      Entonces:
        | Paso | Acción |
        | 1    | Compresiones torácicas (100-120/min) |
        | 2    | Ventilación (30:2) |
        | 3    | Desfibrilación si VF/pVT |
        | 4    | Adrenalina 1mg IV cada 3-5 min |
        | 5    | Reevaluación cada 2 min |

  Regla: Se registra todo

    Escenario: Documentación de código azul
      Dado que se ejecuta código azul
      Cuando se documenta
      Entonces incluye:
        | Campo                      |
        | Hora de inicio del paro   |
        | Hora de inicio de RCP     |
        | Causa probable            |
        | Intervenciones realizadas |
        | Hora de desfibrilación    |
        | Resultado (RCE o no)      |
        | Hora de fin               |

  Regla: Factores reversibles se buscan

    Escenario: Búsqueda de H's y T's
      Dado que hay paro cardíaco
      Cuando se investiga causa
      Entonces se buscan:
        | H's                        | T's          |
        | Hipovolemia               | Taponamiento |
        | Hipoxia                   | TEP          |
        | H+ (acidosis)            | Tórax abierto |
        | Hipokalemia              | Tóxinas       |
        | Hipotermia               |               |
