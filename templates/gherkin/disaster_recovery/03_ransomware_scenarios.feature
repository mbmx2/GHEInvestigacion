# language: es
# @id GHE-DR-003
# @type business-rule
# @domain disaster-recovery
# @layer security
# @risk s1
# @owner ops-director
# @status proposed
# @requirement REQ-DR-003
# @risk-control CTRL-DR-003
# @regulation NOM-024
@domain:disaster_recovery @type:business-rule @risk:s1 @status:proposed
Característica: Escenarios de Ransomware y Recuperación
  Como director de operaciones
  Quiero protocolos específicos ante ransomware
  Para recuperar datos y minimizar tiempo de inactividad

  Regla: Detección de ransomware

    Escenario: Patrón de cifrado detectado
      Dado que sistema monitorea patrones de acceso a archivos
      Cuando detecta cifrado masivo de archivos .db, .sqlite
      Entonces se activa alerta crítica
      Y se aísla instancia afectada de la red
      Y se notifica al equipo de seguridad

    Escenario: Intento de cifrado de backup
      Dado que atacante intenta cifrar copias de seguridad
      Cuando sistema detecta acceso no autorizado a backups
      Entonces backups se marcan como verificados
      Y se activa protocolo de recuperación desde sitio remoto

  Regla: Contención es inmediata

    Escenario: Aislamiento de red
      Dado que ransomware confirmado
      Cuando se ejecuta contención
      Entonces:
        | Acción                          |
        | Desconectar de red externa      |
        | Mantener red interna para análisis|
        | Preservar evidencia en memoria  |
        | Activar circuit breaker global  |
        | Notificar a autoridades         |

    Escenario: Preservación de evidencia
      Dado que se contiene ransomware
      Cuando se preserva evidencia
      Entonces se captura:
        | Elemento                        |
        | Logs de sistema                 |
        | Volcado de memoria              |
        | Imagen de disco forense         |
        | Configuración de red            |

  Regla: Recuperación desde backups

    Escenario: Restauración desde backup local
      Dado que backup local está intacto
      Cuando se inicia restauración
      Entonces se verifica integridad del backup
      Y se restaura a instancia limpia
      Y se valida que datos son consistentes

    Escenario: Restauración desde backup offsite
      Dado que backup local está comprometido
      Cuando se usa backup offsite
      Entonces se verifica RPO (Recovery Point Objective)
      Y se restaura con pérdida máxima de 4 horas
      Y se notifica pérdida de datos si aplica

  Regla: Tiempo de recuperación se mide

    Escenario: RTO calculado
      Dado que se evalúa tiempo de recuperación
      Cuando se mide RTO (Recovery Time Objective)
      Entonces:
        | Componente        | RTO máximo |
        | Expediente clínico | 2 horas    |
        | Farmacia           | 4 horas    |
        | Reportes           | 8 horas    |
        | Sistema completo   | 24 horas   |

  Regla: Post-incidente se documenta

    Escenario: Análisis post-ransomware
      Dado que incidente está resuelto
      Cuando se realiza análisis post-mortem
      Entonces se documenta:
        | Elemento                        |
        | Timeline del ataque             |
        | Vector de entrada               |
        | Datos afectados                 |
        | Acciones de contención          |
        | Tiempo de recuperación          |
        | Mejoras preventivas             |
