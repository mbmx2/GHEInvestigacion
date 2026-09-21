# language: es
# @id GHE-SAFETY-HO-001
# @type safety
# @domain clinical_safety
# @layer clinical
# @risk s1
# @owner nurse-director
# @status proposed
# @requirement REQ-SAFETY-HO
# @risk-control CTRL-SAFETY-HO
# @regulation NOM-004
@domain:clinical_safety @type:safety @risk:s1 @status:proposed
Característica: Handoff Estructurado (SBAR)
  Como enfermera del hospital
  Quiero que toda transición de información sea estructurada y completa
  Para que no se pierda información crítica entre turnos

  Regla: Toda transición usa formato SBAR

    Escenario: Handoff de enfermería
      Dado que enfermera entrega turno
      Cuando usa SBAR
      Entonces documenta:
        | Sección                   | Contenido |
        | S - Situation             | Estado actual del paciente |
        | B - Background            | Diagnóstico, tratamiento |
        | A - Assessment            | Evaluación, tendencias |
        | R - Recommendation        | Acciones pendientes, alertas |

    Escenario: Handoff de médico
      Dado que médico entrega guardia
      Cuando usa SBAR
      Entonces documenta:
        | Sección                   | Contenido |
        | S - Situation             | Pacientes activos |
        | B - Background            | Historia relevante |
        | A - Assessment            | Estado actual      |
        | R - Recommendation        | Pendientes, alertas |

  Regla: El handoff se verifica

    Escenario: Verificación de handoff
      Dado que se realiza handoff
      Cuando se verifica
      Entonces receptor confirma:
        | Verificación              |
        | Entendió la información   |
        | No hay dudas pendientes   |
        | Tiene acceso a información |

  Regla: El handoff se documenta

    Escenario: Documentación de handoff
      Dado que se completa handoff
      Cuando se documenta
      Entonces incluye:
        | Campo                      |
        | Quién entrega             |
        | Quién recibe              |
        | Fecha/hora                |
        | Pacientes informados      |
        | Pendientes documentados   |

  # @invariante INV-HO-001: No hay transición de información sin SBAR
  Regla: Toda transición es SBAR

    Escenario: Transición sin SBAR
      Dado que se detecta transición sin formato SBAR
      Cuando se audita
      Entonces se genera alerta de calidad
