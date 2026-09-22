# language: es
# @id GHE-IR-003
# @type business-rule
# @domain incident-response
# @layer postmortem
# @risk s2
# @owner security-lead
# @status proposed
# @requirement REQ-IR-003
# @risk-control CTRL-IR-003
# @regulation NOM-024
@domain:incident_response @type:business-rule @risk:s2 @status:proposed
Característica: Playbooks de Post-Mortem y Lecciones Aprendidas
  Como líder de respuesta a incidentes
  Quiero playbooks de post-mortem estandarizados
  Para que cada incidente genere mejoras accionables

  Regla: Post-mortem es obligatorio para incidentes críticos

    Escenario: Activación de post-mortem
      Dado que incidente crítico fue resuelto
      Cuando se activa proceso post-mortem
      Entonces se convoca reunión dentro de 48 horas
      Y asisten: responsible, responders, affected parties
      # @invariante INV-IR-POSTMORTEM-001

    Escenario: Timeline del incidente
      Dado que post-mortem está activo
      Cuando se reconstruye timeline
      Entonces se documenta:
        | Momento         | Evento                    |
        | Detección       | Cómo se detectó           |
        | Escalación      | Cuándo y a quién          |
        | Contención      | Acciones inmediatas       |
        | Erradicación    | Cómo se eliminó la causa  |
        | Recuperación    | Cómo se restauró servicio |
        | Lecciones       | Qué mejorar               |

  Regla: Playbooks cubren escenarios comunes

    Escenario: Playbook — Fallo de base de datos
      Dado que falla SQLite (corrupción, lock)
      Cuando se ejecuta playbook
      Entonces se sigue:
        | Paso | Acción                              |
        | 1    | Diagnosticar tipo de fallo           |
        | 2    | Intentar checkpoint/recovery         |
        | 3    | Si falla, restaurar desde backup     |
        | 4    | Verificar integridad post-restauración|
        | 5    | Notificar a usuarios afectados       |
        | 6    | Documentar en post-mortem            |

    Escenario: Playbook — Fallo de autenticación masivo
      Dado que múltiples usuarios no pueden autenticarse
      Cuando se ejecuta playbook
      Entonces se sigue:
        | Paso | Acción                              |
        | 1    | Verificar servicio de auth           |
        | 2    | Revisar logs de autenticación        |
        | 3    | Verificar integridad de tokens        |
        | 4    | Si ataque, rotar claves              |
        | 5    | Si fallo técnico, reiniciar servicio |
        | 6    | Comunicar a usuarios                 |

    Escenario: Playbook — Pérdida de conectividad
      Dado que hospital pierde conectividad completa
      Cuando se ejecuta playbook
      Entonces se sigue:
        | Paso | Acción                              |
        | 1    | Verificar modo offline activo        |
        | 2    | Confirmar que datos locales son válidos|
        | 3    | Activar protocolo de cola de sync     |
        | 4    | Notificar a usuarios del modo offline|
        | 5    | Monitorear恢复 de conectividad        |
        | 6    | Sincronizar al reconectar             |

  Regla: Lecciones se documentan y accionan

    Escenario: Generación de plan de acción
      Dado que post-mortem identifica mejoras
      Cuando se genera plan de acción
      Entonces cada mejora tiene:
        | Campo           |
        | Descripción     |
        | Responsable     |
        | Fecha límite    |
        | Prioridad       |
        | Métrica de éxito|

    Escenario: Seguimiento de mejoras
      Dado que plan de acción está registrado
      Cuando pasa 30 días
      Entonces se verifica progreso de cada mejora
      Y se actualiza estado
      Y se escala si no avanza
