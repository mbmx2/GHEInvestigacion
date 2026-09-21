# language: es
# @id GHE-SAFETY-SE-001
# @type safety
# @domain clinical_safety
# @layer clinical
# @risk s0
# @owner medical-director
# @status proposed
# @requirement REQ-SAFETY-SE
# @risk-control CTRL-SAFETY-SE
# @regulation NOM-004
@domain:clinical_safety @type:safety @risk:s0 @status:proposed
Característica: Eventos Centinela y Análisis de Causa Raíz
  Como responsable de seguridad del paciente
  Quiero que todo evento adverso sea investigado y sus causas eliminadas
  Para que no se repita nunca

  Regla: Todo evento centinela se investiga

    Escenario: Evento centinela detectado
      Dado que ocurre un evento que causó muerte o daño grave
      Cuando se detecta
      Entonces se activa investigación inmediata
      Y se preserva evidencia
      Y se notifica a dirección

    Escenario: Evento centinela clasificado
      Dado que se clasifica un evento
      Cuando se evalúa
      Entonces:
        | Tipo                       | Ejemplo |
        | Muerte no esperada       | Paciente muere por complicación prevenible |
        | Daño grave no esperado   | Lesión por error médico |
        | Pérdida fetal            | Muerte fetal >20 semanas |
        | Cirugía en sitio equivocado | Never event |
        | Medicamento equivocado   | Never event |

  Regla: El análisis de causa raíz es formal

    Escenario: RCA ejecutado
      Dado que se inicia RCA
      Cuando se ejecuta
      Entonces se usa:
        | Herramienta               |
        | 5 Whys                    |
        | Diagrama de Ishikawa     |
        | Árbol de fallas           |
    Y se identifican:
      | Elemento                    |
      | Causa raíz                 |
      | Causas contribuyentes      |
      | Controles que fallaron     |
      | Oportunidades de mejora    |

    Escenario: Acciones correctivas
      Dado que se completa RCA
      Cuando se definen acciones
      Entonces:
        | Campo                      |
        | Acción correctiva         |
        | Responsable               |
        | Fecha de implementación   |
        | Criterio de verificación  |
        | Fecha de verificación     |

  Regla: Los eventos se comparten (sin culpa)

    Escenario: Cultura de justicia
      Dado que ocurre un error
      Cuando se reporta
      Entonces:
        | Principio                  |
        | Error humano → mejora del sistema |
        | Error por conocimiento → capacitación |
        | Error por riesgo → disciplina |
        | Conducta atrevida → disciplina |
        | Nunca culpa individual sin investigación |
