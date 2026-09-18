# language: es
# Offline-First - Conflict Resolution
# RESOLUCIÓN DE CONFLICTOS: Manejar cuando los datos cambian en ambos lados
Característica: Resolución de Conflictos (Offline-First - GHE)
  Como desarrollador del proyecto GHE
  Quiero resolver conflictos de sincronización automáticamente
  Para mantener integridad de datos sin intervención manual

  # ─────────────────────────────────────────────────────────────
  # 1. TIPOS DE CONFLICTOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Tipos de conflictos posibles
    Dado que se identifican tipos de conflictos
    Cuando se sincroniza
    Entonces:
      | Tipo                       | Ejemplo              |
      | Update-Update              | Mismo paciente modificado en ambos lados |
      | Create-Create              | Mismo paciente creado en ambos lados |
      | Delete-Update              | Borrado local, modificado en cloud |
      | Delete-Delete              | Borrado en ambos lados |

  Escenario: Clasificación por criticidad
    Dado que se clasifican conflictos por criticidad
    Cuando se evalúa
    Entonces:
      | Entidad                    | Criticidad | Estrategia |
      | Patient (datos demográficos) | Media    | Merge automático |
      | Consultation (notas clínicas) | Alta    | Última escritura |
      | Prescription               | Crítica   | Nunca conflicto (1 médico) |
      | VitalSigns                 | Media     | Última escritura |
      | Pregnancy                  | Alta      | Merge + notificar |

  # ─────────────────────────────────────────────────────────────
  # 2. ESTRATEGIAS DE RESOLUCIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Last-write-wins (por defecto)
    Dado que se usa estrategia last-write-wins
    Cuando hay conflicto
    Entonces:
      | Lado                       | Gana?     |
      | Local (timestamp más reciente) | Sí (por defecto) |
      | Cloud (timestamp más reciente) | Sí (si es mayor) |
    Y se registra cuál lado ganó para auditoría

  Escenario: Merge automático por campos
    Dado que se usa merge automático
    Cuando los campos modificados son diferentes
    Entonces:
      | Campo local modificado     | Campo cloud modificado | Resultado |
      | Nombre (local: "María García") | Teléfono (cloud: "7841234") | Merge: ambos campos |
      | Nombre (local: "María")    | Nombre (cloud: "María García") | Conflict: last-write |

  Escenario: Resolución manual para datos críticos
    Dado que hay conflicto en datos críticos
    Cuando no se puede resolver automáticamente
    Entonces:
      | Paso                       |
      | 1. Registrar conflicto en conflict_log |
      | 2. Mantener ambas versiones |
      | 3. Notificar al administrador |
      | 4. Administrador resuelve   |
      | 5. Aplicar resolución       |
      | 6. Registrar en auditoría   |

  # ─────────────────────────────────────────────────────────────
  # 3. CONFLICT LOG
  # ─────────────────────────────────────────────────────────────

  Escenario: Registro de conflictos
    Dado que se registra cada conflicto
    Cuando ocurre
    Entonces el log incluye:
      | Campo                      |
      | Conflict ID                |
      | Entity type                |
      | Entity ID                  |
      | Local version              |
      | Cloud version              |
      | Local timestamp            |
      | Cloud timestamp            |
      | Resolution strategy used   |
      | Resolution result          |
      | Resolved by (auto/manual)  |
      | Resolved at                |

  Escenario: Auditoría de conflictos
    Dado que se auditan conflictos
    Cuando se genera reporte
    Entonces se muestra:
      | Métrica                    |
      | Total de conflictos (mes)  |
      | Resueltos automáticamente |
      | Requirieron intervención   |
      | Entidades más conflictivas |
      | Tiempo promedio de resolución |

  # ─────────────────────────────────────────────────────────────
  # 4. PREVENCIÓN DE CONFLICTOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Estrategias de prevención
    Dado que se previenen conflictos
    Cuando se diseñan flujos
    Entonces:
      | Estrategia                 | Implementación       |
      | Un solo editor por entidad | 1 médico edita a la vez |
      | Lock optimista             | Versión por timestamp |
      | Separación de edición      | Local edita lo suyo, cloud lo suyo |
      | Sincronización frecuente   | Cuando haya internet |
  