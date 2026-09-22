# language: es
# @id GHE-GIAC-032
# @type business-rule
# @domain security
# @layer incident-recovery
# @risk s1
# @owner ir-manager
# @status proposed
# @requirement REQ-GIAC-032
# @risk-control CTRL-GIAC-032
# @regulation GIAC-GCIH-ADV SANS
@domain:sans_giac @type:business-rule @risk:s1 @status:proposed
Característica: GIAC GCIH — Recuperación y Comunicación Post-Incidente
  Como gerente de respuesta a incidentes
  Quiero recuperación avanzada conforme GCIH
  Para que la recuperación post-incidente sea completa y efectiva

  Regla: Recuperación se planifica

    Escenario: Plan de recuperación post-incidente
      Dado que incidente está contenido
      Cuando se planifica recuperación
      Entonces se verifica:
        | Elemento                    |
        | Sistemas a recuperar        |
        | Orden de recuperación       |
        | Verificación de integridad  |
        | Pruebas post-recuperación   |
        | Monitoreo reforzado         |

  Regla: Comunicación post-incidente

    Escenario: Notificación a stakeholders
      Dado que incidente requiere comunicación
      Cuando se notifica
      Entonces se verifica:
        | Audiencia                   | Formato                  |
        | Dirección                   | Resumen ejecutivo        |
        | Legal                       | Detalle técnico          |
        | Pacientes (si aplica)       | Notificación clara       |
        | Autoridades (si aplica)     | Reporte formal           |
        | Medios (si aplica)          | Comunicado de prensa     |

  Regla: Lecciones aprendidas se implementan

    Escenario: Post-mortem ejecutivo
      Dado que post-mortem está completo
      Cuando se implementan mejoras
      Entonces se verifica:
        | Elemento                    |
        | Acciones correctivas asignadas|
        | Fecha de cierre             |
        | Responsable identificado    |
        | Verificación de efectividad |
        | Actualización de playbooks  |
