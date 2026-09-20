# language: es
# Offline-First - Connectivity Detection
@status:proposed
@type:acceptance
@domain:general
# DETECCIÓN DE CONECTIVIDAD: Saber cuándo hay internet
Característica: Detección de Conectividad (Offline-First - GHE)
  Como desarrollador del proyecto GHE
  Quiero detectar la disponibilidad de conexión a internet
  Para sincronizar solo cuando sea posible

  # ─────────────────────────────────────────────────────────────
  # 1. DETECCIÓN DE RED
  # ─────────────────────────────────────────────────────────────

  Escenario: Detección de estado de red
    Dado que se monitorea conectividad
    Cuando se verifica estado
    Entonces el sistema detecta:
      | Estado                     | Acción                |
      | Online (WiFi/Ethernet)     | Sync inmediata        |
      | Online (2G/EDGE)           | Sync diferida (datos limitados) |
      | Offline                    | Cola local, sync cuando haya |
      | Conectividad intermitente  | Sync por lotes pequeños |

  Escenario: Estrategia de sondeo (heartbeat)
    Dado que se usa heartbeat para verificar conectividad
    Cuando se ejecuta
    Entonces:
      | Configuración              | Valor                |
      | Frecuencia de sondeo       | 30 segundos          |
      | Endpoint de sondeo         | /health              |
      | Timeout del sondeo         | 5 segundos           |
      | Umbral de caída            | 3 fallos consecutivos|
      | Umbral de recuperación     | 1 éxito              |

  # ─────────────────────────────────────────────────────────────
  # 2. ADAPTACIÓN POR TIPO DE RED
  # ─────────────────────────────────────────────────────────────

  Escenario: Adaptación a red lenta (2G/EDGE)
    Dado que se detecta red lenta
    Cuando se sincroniza
    Entonces:
      | Estrategia                 | Implementación       |
      | Priorizar datos críticos   | Emergencias primero  |
      | Comprimir datos            | gzip                 |
      | Enviar en lotes pequeños   | 10 ops por lote      |
      | Timeout extendido          | 60 segundos          |
      | Reintentos con backoff     | Más conservador      |

  Escenario: Adaptación a red rápida
    Dado que se detecta red rápida
    Cuando se sincroniza
    Entonces:
      | Estrategia                 | Implementación       |
      | Enviar todos los cambios   | Sin limitación       |
      | Batch grande               | 50 ops por lote      |
      | Compresión opcional        | Si datos > 1MB       |
      | Timeout normal             | 30 segundos          |

  # ─────────────────────────────────────────────────────────────
  # 3. MODO OFFLINE
  # ─────────────────────────────────────────────────────────────

  Escenario: Indicador de estado en UI
    Dado que se muestra estado de conexión al usuario
    Cuando se verifica UI
    Entonces:
      | Estado                     | Indicador visual     |
      | Online                     | 🟢 Conectado         |
      | Offline                    | 🔴 Sin conexión      |
      | Sync en progreso           | 🟡 Sincronizando...  |
      | Sync fallida               | ⚠️ Sync pendiente    |

  Escenario: Comportamiento en modo offline
    Dado que el usuario está en modo offline
    Cuando realiza operación
    Entonces:
      | Acción                     |
      | Operación se guarda localmente |
      | Se muestra "Guardado localmente" |
      | Se agrega a cola de sync   |
      | Cuando haya internet, sync automática |

  # ─────────────────────────────────────────────────────────────
  # 4. RESUMEN DE CONECTIVIDAD
  # ─────────────────────────────────────────────────────────────

  Escenario: Resumen diario de conectividad
    Dado que se genera resumen diario
    Cuando se consulta
    Entonces incluye:
      | Métrica                    |
      | Horas online               |
      | Horas offline              |
      | Operaciones sync exitosas  |
      | Operaciones sync fallidas  |
      | Tamaño total sync          |
      | Velocidad promedio de sync |
  