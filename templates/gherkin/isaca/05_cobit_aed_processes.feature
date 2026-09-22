# language: es
# @id GHE-ISACA-COBIT-005
# @type business-rule
# @domain governance
# @layer operations
# @risk s1
# @owner governance-director
# @status proposed
# @requirement REQ-COBIT-005
# @risk-control CTRL-COBIT-005
# @regulation COBIT-2019
@domain:isaca @type:business-rule @risk:s1 @status:proposed
Característica: COBIT 2019 — Procesos AED Críticos para Salud
  Como gestor de operaciones de TI
  Quiero implementar procesos AED críticos del sector salud
  Para que la operación de TI soporte seguridad y continuidad clínica

  Regla: AED11 — Gestión de la Seguridad

    Escenario: Seguridad de la información operativa
      Dado que se gestiona seguridad conforme AED11
      Cuando se revisan actividades
      Entonces se verifica:
        | Actividad                    | Frecuencia  |
        | Evaluación de amenazas       | Mensual     |
        | Prueba de controles          | Trimestral  |
        | Revisión de políticas        | Semestral   |
        | Auditoría de seguridad       | Anual       |
        | Capacitación de seguridad    | Trimestral  |

  Regla: AED15 — Gestión de Operaciones

    Escenario: Operaciones de TI diarias
      Dado que se gestiona operación conforme AED15
      Cuando se ejecutan actividades
      Entonces se verifica:
        | Actividad                    | Frecuencia  |
        | Monitoreo de sistemas        | Continuo    |
        | Gestión de problemas         | Diaria      |
        | Gestión de capacidades       | Semanal     |
        | Optimización de rendimiento  | Mensual     |
        | Gestión de cambios           | Según evento|

  Regla: AED23 — Gestión de la Continuidad

    Escenario: Continuidad del negocio
      Dado que se gestiona continuidad conforme AED23
      Cuando se planifican actividades
      Entonces se verifica:
        | Actividad                    | Frecuencia  |
        | Análisis de impacto (BIA)    | Anual       |
        | Plan de continuidad          | Anual       |
        | Prueba de backup             | Semanal     |
        | Prueba de recuperación       | Trimestral  |
        | Simulacro de desastre        | Semestral   |

    Escenario: Plan de continuidad hospitalario
      Dado que hospital define plan de continuidad
      Cuando se documenta
      Entonces incluye:
        | Elemento                    |
        | Procesos críticos identificados|
        | Recovery Time Objective     |
        | Recovery Point Objective    |
        | Recursos necesarios         |
        | Roles y responsabilidades   |
        | Comunicación de crisis      |

  Regla: AED10 — Gestión del Cambio

    Escenario: Control de cambios en sistema médico
      Dado que se solicita cambio en sistema GHE
      Cuando se evalúa cambio
      Entonces se verifica:
        | Elemento                    |
        | Justificación del cambio    |
        | Análisis de impacto         |
        | Aprobación del cambio       |
        | Plan de pruebas             |
        | Plan de rollback            |
        | Comunicación a usuarios     |

  Regla: AED13 — Gestión de Configuración

    Escenario: Gestión de configuración
      Dado que se gestiona configuración de TI
      Cuando se documenta
      Entonces se verifica:
        | Elemento                    |
        | Inventario de configuración |
        | Baseline de configuración   |
        | Control de versiones        |
        | Auditoría de configuración  |
        | Gestión de parches          |
