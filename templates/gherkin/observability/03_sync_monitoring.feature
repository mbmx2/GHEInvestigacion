# language: es
# @id GHE-OBS-SYNC-001
# @type audit
# @domain operations
# @layer sync
# @risk s2
# @owner dev-lead
# @status proposed
@domain:operations @type:audit @risk:s2 @status:proposed
Característica: Observabilidad de Sincronización Offline
  Como administrador del hospital
  Quiero monitorear el estado de sincronización
  Para garantizar que no se pierdan datos

  Contexto:
    Dado que el sistema sincroniza datos entre local y cloud

  Escenario Outline: Estado de la cola de sync
    Dado que la cola de sync tiene <operaciones> operaciones pendientes
    Entonces estado = "<estado>" y acción = "<acción>"

    Ejemplos:
      | operaciones | estado   | acción                          |
      | 0           | ✅ OK    | Ninguna                         |
      | 10          | ✅ OK    | Monitorear                       |
      | 50          | ⚠️ Media | Verificar conectividad           |
      | 100         | 🔴 Alta  | Investigar causa + priorizar     |
      | 500         | 🔴 Crítica| Notificar admin + reducir carga  |

  Escenario Outline: Tiempo de sync según tipo de red
    Dado que hay <tipo_red> disponible
    Entonces tiempo_sync_estimado = "<tiempo>"

    Ejemplos:
      | tipo_red      | tiempo_sync_estimado    |
      | WiFi/Ethernet | <30 segundos           |
      | 4G            | <1 minuto              |
      | 3G            | <3 minutos             |
      | 2G/EDGE       | <10 minutos            |
      | Offline       | Sincronizar al恢复     |

  Escenario: Verificación de integridad post-sync
    Dado que se completa sincronización
    Cuando se verifica
    Entonces:
      | Verificación              | Estado  |
      | Hash local = hash cloud  | ✅       |
      | Sin duplicados            | ✅       |
      | Sin datos perdidos        | ✅       |
      | Conflictos resueltos      | ✅       |
