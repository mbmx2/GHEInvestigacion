# language: es
# @id GHE-ASVS-V14-001
# @type compliance
# @domain security
# @layer infrastructure
# @risk s1
# @owner security-lead
# @status proposed
# @requirement ASVS-V14
# @risk-control CTRL-ASVS-V14
# @regulation NOM-024
@domain:security @type:compliance @risk:s1 @status:proposed
Característica: V14 - Resiliencia
  Como responsable de seguridad del proyecto GHE
  Quiero que el sistema sea resiliente ante fallos
  Para que la atención médica nunca se detenga

  Regla: V14.1 - Disponibilidad

    Escenario: Sistema disponible sin internet
      Dado que no hay conexión
      Cuando se usa el sistema
      Entonces 100% de funcionalidades disponibles
      Y tiempos de respuesta <500ms

    Escenario: Sistema disponible con internet
      Dado que hay conexión
      Cuando se usa el sistema
      Entonces 100% de funcionalidades disponibles
      Y sincronización activa

  Regla: V14.2 - Degradação controlada

    Escenario: Degradación ante sobrecarga
      Dado que el sistema recibe carga excesiva
      Cuando se evalúa comportamiento
      Entonces:
        | Nivel de carga | Comportamiento |
        | Normal (100%) | Funciona al 100% |
        | Alto (200%) | Respuestas lentas pero funciona |
        | Crítico (500%) | Rechaza peticiones new, mantiene activas |
      Y no pierde datos

  Regla: V14.3 - Backup y restauración

    Escenario: Backup automático
      Dado que se ejecuta backup
      Cuando se verifica
      Entonces:
        | Verificación              | Estado |
        | Frecuencia diaria         | ✅      |
        | Cifrado AES-256          | ✅      |
        | Offsite                   | ✅      |
        | Prueba de restauración    | ✅      |

    Escenario: Restauración exitosa
      Dado que se necesita restaurar
      Cuando se ejecuta restauración
      Entonces:
        | Verificación              | Estado |
        | Datos restaurados         | ✅      |
        | Integridad verificada     | ✅      |
        | Tiempo <10 minutos        | ✅      |

  Regla: V14.4 - Idempotencia

    Escenario: Reintento idempotente
      Dado que una operación falla y se reintenta
      Cuando se reenvía
      Entonces no se crea duplicado
      Y se mantiene consistencia

  Regla: V14.5 - Monitoreo

    Escenario: Health checks
      Dado que se verifica salud del sistema
      Cuando se ejecuta health check
      Entonces responde con:
        | Campo                      | Estado |
        | Base de datos              | Conectada |
        | Disco                      | <80% usado |
        | Memoria                    | <85% usada |
        | Uptime                     | Registrado |
      Y responde en <1 segundo

    Escenario: Alertas automáticas
      Dado que se detecta anomalía
      Cuando se evalúa
      Entonces:
        | Condición                  | Alerta |
        | Error rate >1%            | 🔴 Alta |
        | Tiempo respuesta >500ms   | 🟠 Media |
        | Sync queue >100           | 🟡 Baja  |
        | Backup fallido            | 🔴 Alta |
        | Disco >80%                | 🟠 Media |
