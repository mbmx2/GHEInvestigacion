# language: es
# @id GHE-NIST-CSF-001
# @type compliance
# @domain security
# @layer governance
# @risk s1
# @owner security-lead
# @status proposed
# @requirement NIST-CSF
# @risk-control CTRL-NIST-CSF
# @regulation NOM-024
@domain:security @type:compliance @risk:s1 @status:proposed
Característica: NIST Cybersecurity Framework (CSF)
  Como responsable de seguridad del hospital
  Quiero que la seguridad se gestione según NIST CSF
  Para tener un marco integral de ciberseguridad

  # ─────────────────────────────────────────────────────────────
  # FUNCIÓN 1: IDENTIFY
  # ─────────────────────────────────────────────────────────────

  Regla: Identificar activos de información

    Escenario: Inventario de activos
      Dado que se identifican activos
      Cuando se documenta
      Entonces:
        | Activo                     | Clasificación |
        | Base de datos de pacientes | Crítico        |
        | Expedientes clínicos      | Crítico        |
        | Recetas médicas           | Crítico        |
        | Sistema de laboratorio    | Alto           |
        | Sistema de farmacia       | Alto           |

  Regla: Evaluar riesgos

    Escenario: Evaluación de riesgos
      Dado que se evalúan riesgos
      Cuando se usa matriz
      Entonces: severidad × probabilidad = nivel de riesgo

  Regla: Gestionar riesgos

    Escenario: Tratamiento de riesgos
      Dado que se identifica riesgo
      Cuando se mitiga
      Entonces: control implementado, responsable, fecha verificación

  # ─────────────────────────────────────────────────────────────
  # FUNCIÓN 2: PROTECT
  # ─────────────────────────────────────────────────────────────

  Regla: Gestionar acceso

    Escenario: RBAC implementado
      Dado que se verifica acceso
      Entonces: mínimo privilegio, denegación por defecto, auditoría

  Regla: Gestionar datos

    Escario: Datos protegidos
      Dado que se procesan datos sensibles
      Cuando se verifica
      Entonces: cifrado en reposo, cifrado en tránsito, minimización

  Regla: Mantenimiento de seguridad

    Escenario: Parches aplicados
      Dado que se detecta vulnerabilidad
      Cuando se remedia
      Entonces: parche aplicado, tests pasan, documentado

  # ─────────────────────────────────────────────────────────────
  # FUNCIÓN 3: DETECT
  # ─────────────────────────────────────────────────────────────

  Regla: Detectar anomalías

    Escenario: Monitoreo activo
      Dado que se monitorea el sistema
      Cuando se detecta anomalía
      Entonces: alerta generada, clasificada, notificada

  Regla: Analizar eventos de seguridad

    Escenario: Análisis de eventos
      Dado que se recibe alerta de seguridad
      Cuando se analiza
      Entonces: se clasifica, se prioriza, se responde

  # ─────────────────────────────────────────────────────────────
  # FUNCIÓN 4: RESPOND
  # ─────────────────────────────────────────────────────────────

  Regla: Responder a incidentes

    Escenario: Respuesta estructurada
      Dado que ocurre incidente
      Cuando se activa respuesta
      Entonces: contención, erradicación, recuperación, post-mortem

  Regla: Comunicar incidentes

    Escenario: Notificación de incidentes
      Dado que se clasifica incidente
      Cuando se notifica
      Entonces: stakeholders internos y externos según severidad

  # ─────────────────────────────────────────────────────────────
  # FUNCIÓN 5: RECOVER
  # ─────────────────────────────────────────────────────────────

  Regla: Recuperar de incidentes

    Escenario: Recuperación ejecutada
      Dado que se completa erradicación
      Cuando se recupera
      Entonces: sistema restaurado, datos verificados, operación normal

  Regla: Mejorar después de incidentes

    Escenario: Lecciones aprendidas
      Dado que se completa post-mortem
      Cuando se documenta
      Entonces: lecciones, acciones correctivas, actualización de procesos

  # ─────────────────────────────────────────────────────────────
  # FUNCIÓN 6: GOVERN
  # ─────────────────────────────────────────────────────────────

  Regla: Gobernanza de seguridad

    Escenario: Gobernanza documentada
      Dado que se gestiona seguridad
      Cuando se verifica
      Entonces: política, roles, métricas, revisiones, mejora continua
