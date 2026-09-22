# language: es
# @id GHE-PERF-003
# @type business-rule
# @domain performance
# @layer offline-sync
# @risk s2
# @owner performance-engineer
# @status proposed
# @requirement REQ-PERF-003
# @risk-control CTRL-PERF-003
# @regulation NOM-024
@domain:performance @type:business-rule @risk:s2 @status:proposed
Característica: Benchmarks de Sincronización Offline
  Como ingeniero de rendimiento
  Quiero benchmarks específicos para sincronización offline
  Para garantizar desempeño en conectividad 2G/EDGE

  Regla: Sincronización tiene SLA definidos

    Escenario: Sync de 100 registros en 2G
      Dado que hay 100 registros pendientes de sync
      Cuando se ejecuta sincronización en red 2G
      Entonces completa en <5 minutos
      Y no bloquea interfaz de usuario
      # @invariante INV-PERF-SYNC-001

    Escenario: Sync incremental eficiente
      Dado que solo hay 5 registros nuevos
      Cuando se ejecuta sync incremental
      Entonces completa en <30 segundos
      Y solo transfiere datos modificados

  Regla: Límites de cola se respetan

    Escenario: Cola excede capacidad máxima
      Dado que cola tiene 10,000 registros pendientes
      Cuando se evalúa capacidad
      Entonces sistema prioriza:
        | Prioridad | Tipo de registro       |
        | 1         | Emergencias            |
        | 2         | Signos vitales         |
        | 3         | Prescripciones         |
        | 4         | Notas clínicas         |
        | 5         | Reportes administrativos|

    Escenario: Compresión de cola
      Dado que cola tiene registros del mismo paciente
      Cuando se comprime
      Entonces se consolidan actualizaciones
      Y se mantiene último estado consistente

  Regla: Throughput se mide bajo diferentes condiciones

    Escenario: Throughput en WiFi
      Dado que dispositivo tiene WiFi
      Cuando se mide throughput de sync
      Entonces alcanza >1 MB/s
      Y latencia promedio <100ms

    Escenario: Throughput en 2G/EDGE
      Dado que dispositivo tiene solo 2G
      Cuando se mide throughput de sync
      Entonces alcanza >10 KB/s
      Y latencia promedio <2000ms
      Y sistema se adapta automáticamente al ancho de banda

    Escenario: Throughput con intermitencia
      Dado que conexión se corta cada 30 segundos
      Cuando se ejecuta sync
      Entonces sistema retoma donde quedó
      Y no reenvía registros ya confirmados

  Regla: Almacenamiento local es eficiente

    Escenario: Base de datos local optimizada
      Dado que base de datos local tiene 1 año de datos
      Cuando se consulta
      Entonces respuesta <200ms para consultas comunes
      Y tamaño de base <500MB

    Escenario: Limpieza automática de datos antiguos
      Dado que datos locales tienen >2 años
      Cuando se ejecuta limpieza
      Entonces se archivan datos antiguos
      Y se mantiene espacio disponible
      Y se preservan datos críticos (expedientes activos)

  Regla: Métricas de sync se monitorean

    Escenario: Dashboard de sincronización
      Dado que se consulta dashboard de sync
      Entonces muestra:
        | Métrica                     | Meta          |
        | Tasa de éxito de sync       | >99%          |
        | Tiempo promedio de sync     | <60s          |
        | Cola pendiente promedio     | <50 registros |
        | Conflictos de sync          | <1%           |
        | Datos perdidos              | 0             |
