# language: es
# CAP Theorem - Tolerancia a Particiones
@status:proposed
# @evidence:code
@type:acceptance
@domain:general
# PARTITION TOLERANCE: El sistema funciona cuando hay separación de red
Característica: Tolerancia a Particiones (CAP Theorem - GHE)
  Como arquitecto del proyecto GHE
  Quiero que el sistema tolere particiones de red
  Para que funcione cuando la conectividad falla

  # ─────────────────────────────────────────────────────────────
  # 1. PARTICIONES EN GHE
  # ─────────────────────────────────────────────────────────────

  Escenario: Tipos de particiones que enfrenta GHE
    Dado que se identifican particiones posibles
    Cuando se evalúa
    Entonces:
      | Partición                   | Frecuencia  | Impacto |
      | Sin internet (offline total)| Diaria      | Ninguno |
      | Conectividad intermitente   | Constante   | Bajo    |
      | Latencia alta (>5s)         | Frecuente   | Bajo    |
      | Pérdida de paquetes         | Frecuente   | Bajo    |
      | DNS failure                 | Rara        | Medio   |
      | Cloud no disponible         | Muy rara    | Medio   |

  Escenario: GHE es CP (Consistency + Partition Tolerance)
    Dado que GHE elige CP en el triángulo CAP
    Cuando hay partición
    Entonces:
      | Decisión                    | Implementación       |
      | Consistencia > Disponibilidad en sync | Última escritura |
      | Disponibilidad local siempre | SQLite funcional    |
      | Sync se reanuda después    | Outbox pattern       |
      | Conflictos se resuelven    | Automáticamente      |

  # ─────────────────────────────────────────────────────────────
  # 2. DISEÑO PARA PARTICIONES
  # ─────────────────────────────────────────────────────────────

  Escenario: Arquitectura tolerante a particiones
    Dado que se diseña para tolerar particiones
    Cuando se verifica
    Entonces:
      | Componente                  | Tolerancia            |
      | SQLite local               | Sin partición posible |
      | UI (ClojureScript)         | Funciona 100% offline|
      | Domain logic               | Sin dependencia de red|
      | Sync engine                | Maneja particiones    |
      | Connectivity detector      | Detecta particiones   |

  Escenario: Outbox pattern para particiones
    Dado que se usa outbox pattern
    Cuando hay partición
    Entonces:
      | Paso                       |
      | 1. Operación se guarda localmente |
      | 2. Se registra en outbox    |
      | 3. UI muestra confirmación  |
      | 4. Cuando cesa partición, sync ejecuta |
      | 5. Datos se transmiten al cloud |

  # ─────────────────────────────────────────────────────────────
  # 3. RESOLUCIÓN DE CONFLICTOS POST-PARTICIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Resolución automática post-partición
    Dado que hubo partición y ambos lados modificaron datos
    Cuando se restaura conexión
    Entonces:
      | Estrategia                 | Implementación       |
      | Last-write-wins            | Por defecto          |
      | Merge automático           | Campos diferentes    |
      | Manual                     | Datos críticos       |
      | Log de conflictos          | Auditoría            |

  Escenario: Verificación post-partición
    Dado que se completa resolución de conflictos
    Cuando se verifica
    Entonces:
      | Verificación               | Estado    |
      | Todos los datos presentes  | ✅         |
      | Sin duplicados             | ✅         |
      | Hash de integridad OK      | ✅         |
      | Timestamps consistentes    | ✅         |
      | Número de conflictos registrado | ✅    |

  # ─────────────────────────────────────────────────────────────
  # 4. PARTITION TOLERANCE EN EMERGENCIAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Emergencia durante partición
    Dado que hay emergencia obstétrica Y partición de red
    Cuando el médico necesita acceder al sistema
    Entonces:
      | Verificación               | Estado    |
      | Sistema 100% funcional    | ✅         |
      | Búsqueda de paciente       | ✅ (<500ms)|
      | Registro de signos vitales | ✅ (<200ms)|
      | Prescripción               | ✅ (<300ms)|
      | Referencia generable       | ✅         |
      | Vademécum local disponible | ✅         |
      | Sin pérdida de datos       | ✅         |

  Escenario: Múltiples usuarios durante partición
    Dado que múltiples usuarios operan durante partición
    Cuando se verifican datos
    Entonces:
      | Verificación               | Estado    |
      | Cada usuario tiene vista consistente local | ✅ |
      | No hay bloqueos entre usuarios | ✅ (WAL) |
      | Datos se preservan         | ✅         |
      | Sync posterior unifica todo | ✅         |

  # ─────────────────────────────────────────────────────────────
  # 5. MÉTRICAS DE TOLERANCIA A PARTICIONES
  # ─────────────────────────────────────────────────────────────

  Escenario: Medición de tolerancia a particiones
    Dado que se mide tolerancia a particiones
    Cuando se evalúa
    Entonces:
      | Métrica                    | Objetivo     |
      | Operaciones durante partición | 100%       |
      | Pérdida de datos durante partición | 0%    |
      | Tiempo de recuperación post-partición | <5 min |
      | Conflictos post-partición  | <5%          |
      | Conflictos resueltos automáticamente | >95% |
  