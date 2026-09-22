# language: es
# @id GHE-GIAC-040
# @type business-rule
# @domain security
# @layer healthcare-ir
# @risk s1
# @owner healthcare-ir-manager
# @status proposed
# @requirement REQ-GIAC-040
# @risk-control CTRL-GIAC-040
# @regulation GIAC-GCIH-HEALTH SANS
@domain:sans_giac @type:business-rule @risk:s1 @status:proposed
Característica: GIAC GCIH — Respuesta a Incidentes en Sector Salud
  Como gerente de IR del sector salud
  Quiero respuesta a incidentes específica para salud conforme GCIH
  Para que los incidentes en hospital se manejen con consideraciones clínicas

  Regla: Incidentes clínicos se priorizan

    Escenario: Clasificación de incidentes clínicos
      Dado que incidente afecta sistemas clínicos
      Cuando se clasifica
      Entonces se verifica:
        | Nivel | Criterio                          | Tiempo respuesta |
        | P1    | Sistema de prescripción caído     | <15 minutos      |
        | P2    | Expedientes inaccesibles          | <30 minutos      |
        | P3    | Sistema de laboratorio afectado   | <1 hora          |
        | P4    | Sistema administrativo afectado   | <4 horas         |

  Regla: Impacto en pacientes se evalúa

    Escenario: Evaluación de impacto clínico
      Dado que incidente afecta atención al paciente
      Cuando se evalúa impacto
      Entonces se verifica:
        | Elemento                    |
        | Pacientes afectados         |
        | Procedimientos retrasados   |
        | Medicamentos comprometidos  |
        | Riesgo de vida              |
        | Plan de mitigación clínica  |

  Regla: Procedimientos de respaldo se activan

    Escenario: Procedimientos manuales
      Dado que sistema clínico está caído
      Cuando se activa plan de contingencia
      Entonces se verifica:
        | Elemento                    |
        | Formularios en papel listos |
        | Personal capacitado         |
        | Procesos manuales documentados|
        | Transición planificada      |
        | Recuperación verificada     |

  Regla: Notificación regulatoria

    Escenario: Notificación a autoridades
      Dado que incidente requiere notificación
      Cuando se evalúa
      Entonces se verifica:
        | Elemento                    |
        | COFEPRIS (si aplica)        |
        | INAI (datos personales)     |
        | Autoridad local de salud    |
        | Plazo de notificación       |
        | Contenido de notificación   |

  Regla: Recuperación clínica priorizada

    Escenario: Restauración de sistemas críticos
      Dado que se restauran sistemas clínicos
      Cuando se prioriza recuperación
      Entonces se verifica:
        | Orden de recuperación       |
        | 1. Prescripción y farmacia  |
        | 2. Expedientes clínicos     |
        | 3. Laboratorio              |
        | 4. Imagenología             |
        | 5. Administrativo           |
