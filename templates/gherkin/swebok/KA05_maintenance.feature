# language: es
# SWEBOK KA-05: Software Maintenance
# ÁREA DE CONOCIMIENTO: Mantenimiento de Software
Característica: Mantenimiento de Software (SWEBOK KA-05)
  Como responsable de mantenimiento del proyecto GHE
  Quiero mantener el software de forma estructurada
  Para garantizar continuidad operativa y corrección de defectos

  # ─────────────────────────────────────────────────────────────
  # 1. TIPOS DE MANTENIMIENTO
  # ─────────────────────────────────────────────────────────────

  Escenario: Mantenimiento correctivo
    Dado que se reporta un defecto en producción
    Cuando se recibe el reporte
    Entonces se sigue proceso:
      | Paso                       | Detalle             |
      | 1. Registro del defecto    | ID, severidad, pasos|
      | 2. Reproducción           | Confirmar en entorno dev |
      | 3. Diagnóstico            | Identificar causa raíz |
      | 4. Corrección             | Fix con test que falle |
      | 5. Verificación           | Todos los tests pasan |
      | 6. Code review            | Otro desarrollador revisa |
      | 7. Despliegue             | A producción con rollback plan |
    Y se documenta en changelog

  Escenario: Mantenimiento adaptativo
    Dado que cambia la normativa (NOM-004 actualizada)
    Cuando se detecta el cambio
    Entonces se sigue proceso:
      | Paso                       | Detalle             |
      | 1. Análisis del cambio    | Qué requisitos cambian |
      | 2. Impacto                | Qué módulos se afectan |
      | 3. Plan de adaptación     | Tareas y estimación  |
      | 4. Implementación         | Código + tests       |
      | 5. Validación normativa   | Verificar cumplimiento |
      | 6. Documentación          | Actualizar SRS       |

  Escenario: Mantenimiento perfectivo
    Dado que se identifica oportunidad de mejora
    Cuando se aprueba la mejora
    Entonces se sigue proceso:
      | Paso                       | Detalle             |
      | 1. Propuesta              | Descripción + beneficio |
      | 2. Evaluación             | Costo-beneficio      |
      | 3. Diseño                 | Especificación       |
      | 4. Implementación         | Código + tests       |
      | 5. Revisión               | Code review          |
      | 6. Despliegue             | Release notes        |

  Escenario: Mantenimiento preventivo
    Dado que se detecta deuda técnica
    Cuando se planifica reducción
    Entonces se registra:
      | Deuda técnica              | Impacto | Esfuerzo | Prioridad |
      | Tests sin cobertura        | Alto    | Medio    | Alta      |
      | Código duplicado           | Medio   | Bajo     | Media     |
      | Dependencias desactualizadas| Alto   | Bajo     | Alta      |
      | Documentación incompleta   | Medio   | Medio    | Media     |

  # ─────────────────────────────────────────────────────────────
  # 2. PROCESO DE MANTENIMIENTO
  # ─────────────────────────────────────────────────────────────

  Escenario: Gestión de solicitudes de cambio
    Dado que se recibe solicitud de cambio
    Cuando se evalúa
    Entonces se clasifica:
      | Clasificación              | Acción              |
      | S1 - Crítico               | Fix inmediato       |
      | S2 - Alto                  | Próximo sprint      |
      | S3 - Medio                 | Backlog priorizado  |
      | S4 - Bajo                  | Siguiente release   |
    Y se registra en sistema de tracking

  Escenario: Control de versiones en mantenimiento
    Dado que se mantiene múltiples versiones
    Cuando se trabaja en fix
    Entonces se sigue flujo:
      | Paso                       |
      | Crear branch desde main    |
      | Fix + test que reproduzca  |
      | Code review                |
      | Merge a develop            |
      | Merge a main (si es urgente)|
      | Tag de versión             |
      | Push a remote              |

  # ─────────────────────────────────────────────────────────────
  # 3. MÉTRICAS DE MANTENIMIENTO
  # ─────────────────────────────────────────────────────────────

  Escenario: Seguimiento de métricas de mantenimiento
    Dado que se miden métricas de mantenimiento
    Cuando se genera reporte
    Entonces se incluyen:
      | Métrica                    | Objetivo            |
      | Tiempo medio de reparación (MTTR) | <4 horas     |
      | Tiempo medio entre fallos (MTBF) | >30 días      |
      | Tasa de defectos por release| <5%                |
      | Cambios rechazados          | <10%               |
      | Tiempo de revisión de código| <1 día             |
    