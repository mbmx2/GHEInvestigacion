# language: es
# @id GHE-RESIL-003
# @type business-rule
# @domain resilience
# @layer architecture
# @risk s2
# @owner software-architect
# @status proposed
# @requirement REQ-RESIL-003
# @risk-control CTRL-RESIL-003
# @regulation NOM-024
@domain:resilience @type:business-rule @risk:s2 @status:proposed
Característica: Circuit Breaker y Patrones de Resiliencia
  Como arquitecto de software
  Quiero patrones de circuit breaker y bulkhead
  Para que fallos en un componente no colapsen todo el sistema

  Regla: Circuit breaker para servicios externos

    Escenario: Servicio externo falla
      Dado que servicio de laboratorio externo falla 5 veces consecutivas
      Cuando circuit breaker abre
      Entonces el sistema:
        | Acción                          |
        | Rechaza requests nuevos         |
        | Retorna respuesta de fallback   |
        | Registra métrica de fallo       |
        | Notifica al equipo de operaciones|

    Escenario: Circuit breaker se recupera
      Dado que circuit breaker está abierto
      Cuando pasan 30 segundos (half-open)
      Entonces permite 1 request de prueba
      Y si es exitoso cierra el circuit breaker
      Y restaura tráfico normal

    Escenario: Circuit breaker con timeout
      Dado que servicio externo tarda >10 segundos
      Cuando circuit breaker detecta timeout
      Entonces abre circuit breaker
      Y retorna fallback con datos stale

  Regla: Bulkhead aísla componentes

    Escenario: Fallo en módulo de reportes
      Dado que módulo de reportes falla
      Cuando se ejecuta bulkhead
      Entonces:
        | Componente          | Estado        |
        | Expediente clínico  | Operativo     |
        | Farmacia            | Operativo     |
        | Triaje              | Operativo     |
        | Reportes            | Degradado     |

  Regla: Retry con backoff exponencial

    Escenario: Reintentos configurados
      Dado que request falla por timeout
      Cuando se reintenta
      Entonces usa backoff exponencial:
        | Intento | Espera  |
        | 1       | 1s      |
        | 2       | 2s      |
        | 3       | 4s      |
        | 4       | 8s      |
        | 5       | Falla   |

  Regla: Degradación graceful

    Escenario: Modo degradado activado
      Dado que sistema detecta alta carga
      Cuando activa modo degradado
      Entonces:
        | Función             | Estado          |
        | Consulta expediente | Completa        |
        | Nuevos registros    | Limitados       |
        | Reportes            | Diferidos       |
        | Imágenes            | Cola de espera  |
        | Sync offline        | Continúa        |

  Regla: Health checks automáticos

    Escenario: Health check falla
      Dado que health check no responde en 5 segundos
      Cuando se detecta
      Entonces se reinicia componente automáticamente
      Y se registra evento de reinicio
      Y se notifica si ocurre 3+ veces en 1 hora

    Escenario: Health check con dependencias
      Dado que health check verifica dependencias
      Cuando se ejecuta
      Entonces verifica:
        | Dependencia         | Timeout  |
        | SQLite              | 1s       |
        | Cola de sync        | 2s       |
        | API externa         | 5s       |
        | Almacenamiento      | 3s       |
