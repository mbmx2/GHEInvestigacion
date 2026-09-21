# language: es
# @id GHE-SAMM-OPS-001
# @type compliance
# @domain security
# @layer operations
# @risk s1
# @owner ops-lead
# @status proposed
# @requirement SAMM-OPERATIONS
# @risk-control CTRL-SAMM-OPS
# @regulation NOM-024
@domain:security @type:compliance @risk:s1 @status:proposed
Característica: SAMM Operations - Penetration Testing, Environment y Configuration
  Como responsable de operaciones del hospital
  Quiero que las operaciones de seguridad sean continuas
  Para detectar y responder a amenazas en tiempo real

  # ─────────────────────────────────────────────────────────────
  # PRÁCTICA 1: Penetration Testing
  # ─────────────────────────────────────────────────────────────

  Regla: Se ejecutan pruebas de penetración periódicas

    Escenario: Pentest semestral
      Dado que se ejecuta pentest
      Cuando se completa
      Entonces se verifica:
        | Verificación              | Frecuencia |
        | Pruebas automatizadas    | Mensual    |
        | Pruebas manuales         | Semestral  |
        | Reporte de hallazgos     | Semestral  |
        | Remediación de findings  | Según severidad |
      # @evidence EVID-SAMM-OPS-001

    Escenario: Clasificación de hallazgos
      Dado que se reciben hallazgos de pentest
      Cuando se clasifican
      Entonces:
        | Severidad                  | Plazo de remediación |
        | Crítica                    | 24 horas             |
        | Alta                       | 7 días               |
        | Media                      | 30 días              |
        | Baja                       | Siguiente release   |

  # ─────────────────────────────────────────────────────────────
  # PRÁCTICA 2: Software Environment
  # ─────────────────────────────────────────────────────────────

  Regla: El entorno de producción es seguro

    Escenario: Hardening de producción
      Dado que se configura entorno de producción
      Cuando se verifica
      Entonces:
        | Verificación              | Estado |
        | SO actualizado            | ✅      |
        | Servicios innecesarios off| ✅      |
        | Firewall configurado      | ✅      |
        | Monitoreo activo          | ✅      |
        | Backup automático         | ✅      |
      # @evidence EVID-SAMM-OPS-002

    Escenario: Segregación de entornos
      Dado que se separan entornos
      Cuando se verifica
      Entonces:
        | Entorno                    | Acceso |
        | Producción                | Solo producción |
        | Staging                   | Solo dev/qa |
        | Desarrollo                | Solo dev |
      Y no hay acceso cruzado

  # ─────────────────────────────────────────────────────────────
  # PRÁCTICA 3: Configuration Management y Vulnerability Mgmt
  # ─────────────────────────────────────────────────────────────

  Regla: La configuración se gestiona como código

    Escenario: Configuración versionada
      Dado que se modifica configuración
      Cuando se aplica
      Entonces:
        | Verificación              | Estado |
        | Versionado en Git         | ✅      |
        | Code review               | ✅      |
        | Testing de configuración  | ✅      |
        | Rollback posible          | ✅      |

  Regla: Vulnerabilidades se gestionan activamente

    Escenario: Gestión de vulnerabilidades
      Dado que se detecta vulnerabilidad
      Cuando se gestiona
      Entonces:
        | Severidad                  | Tiempo máximo |
        | Crítica                    | 24 horas     |
        | Alta                       | 7 días       |
        | Media                      | 30 días      |
        | Baja                       | Siguiente release |

    Escenario: Registro de vulnerabilidades
      Dado que se gestiona vulnerabilidad
      Cuando se registra
      Entonces incluye:
        | Campo                      |
        | CVE ID (si aplica)        |
        | Componente afectado       |
        | Severidad                 |
        | Fecha de detección        |
        | Fecha de remediación      |
        | Estado                    |

  Regla: Monitoreo continuo de seguridad

    Escenario: Alertas automáticas de seguridad
      Dado que se monitorea seguridad
      Cuando se detecta anomalía
      Entonces:
        | Condición                  | Acción |
        | Login fallido >5 veces    | Alerta |
        | Acceso fuera de horario   | Alerta |
        | Vulnerabilidad nueva      | Alerta |
        | Cambio de configuración   | Alerta |

    Escenario: Dashboard de seguridad
      Dado que se consulta dashboard
      Cuando se genera
      Entonces incluye:
        | Métrica                    |
        | Vulnerabilidades abiertas |
        | Pentest pendientes       |
        | Incidencias activas       |
        | Estado de auditoría       |
        | Último review de código   |
