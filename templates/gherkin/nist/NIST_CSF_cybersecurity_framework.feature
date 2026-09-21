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

  # IDENTIFY
  Regla: Identificar activos de información

    Escenario: Inventario de activos
      Dado que se identifican activos
      Cuando se documenta
      Entonces: cada activo tiene clasificación y responsable
      # @evidence EVID-NIST-CSF-001

  Regla: Evaluar riesgos

    Escenario: Evaluación de riesgos
      Dado que se evalúan riesgos
      Cuando se usa matriz
      Entonces: severidad × probabilidad = nivel de riesgo
      # @evidence EVID-NIST-CSF-002

  # PROTECT
  Regla: Gestionar acceso

    Escenario: RBAC implementado
      Dado que se verifica acceso
      Entonces: mínimo privilegio, denegación por defecto, auditoría
      # @evidence EVID-NIST-CSF-003

  Regla: Gestionar datos

    Escenario: Datos protegidos
      Dado que se procesan datos sensibles
      Cuando se verifica
      Entonces: cifrado en reposo, cifrado en tránsito, minimización
      # @evidence EVID-NIST-CSF-004

  # DETECT
  Regla: Detectar anomalías

    Escenario: Monitoreo activo
      Dado que se monitorea el sistema
      Cuando se detecta anomalía
      Entonces: alerta generada, clasificada, notificada
      # @evidence EVID-NIST-CSF-005

  Regla: Analizar eventos de seguridad

    Escenario: Análisis ejecutado
      Dado que se recibe alerta
      Cuando se analiza
      Entonces: se clasifica, prioriza, responde
      # @evidence EVID-NIST-CSF-006

  # RESPOND
  Regla: Responder a incidentes

    Escenario: Respuesta estructurada
      Dado que ocurre incidente
      Cuando se activa respuesta
      Entonces: contención, erradicación, recuperación, post-mortem
      # @evidence EVID-NIST-CSF-007

    Escenario: Incidente sin respuesta
      Dado que hay incidente sin respuesta
      Cuando se detecta
      Entonces: se escala inmediatamente
      # @evidence EVID-NIST-CSF-007-N

  # RECOVER
  Regla: Recuperar de incidentes

    Escenario: Recuperación ejecutada
      Dado que se completa erradicación
      Cuando se recupera
      Entonces: sistema restaurado, datos verificados, operación normal
      # @evidence EVID-NIST-CSF-008

  Regla: Lecciones aprendidas

    Escenario: Post-mortem documentado
      Dado que se completa incidente
      Cuando se documenta
      Entonces: lecciones, acciones correctivas, actualización de procesos
      # @evidence EVID-NIST-CSF-009

  # GOVERN
  Regla: Gobernanza de seguridad

    Escenario: Gobernanza documentada
      Dado que se gestiona seguridad
      Cuando se verifica
      Entonces: política, roles, métricas, revisiones, mejora continua
      # @evidence EVID-NIST-CSF-010

  # @invariante INV-CSF-001: Las 6 funciones del CSF están cubiertas
  Regla: Cobertura completa del CSF

    Escenario: Verificación de cobertura
      Dado que se verifica CSF
      Cuando se evalúa
      Entonces: Identify ✅, Protect ✅, Detect ✅, Respond ✅, Recover ✅, Govern ✅
      # @evidence EVID-NIST-CSF-011

  # @invariante INV-CSF-002: Todo incidente tiene post-mortem
  Regla: Post-mortem obligatorio

    Escenario: Incidente sin post-mortem
      Dado que hay incidente sin post-mortem
      Cuando se detecta
      Entonces: se programa post-mortem urgente
      # @evidence EVID-NIST-CSF-012
