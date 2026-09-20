# language: es
# PMBOK KA-08: Project Risk Management
@status:proposed
@type:acceptance
@domain:general
# ÁREA DE CONOCIMIENTO: Gestión de Riesgos del Proyecto
Característica: Gestión de Riesgos (PMBOK KA-08)
  Como director del proyecto GHE
  Quiero identificar y gestionar riesgos proactivamente
  Para minimizar impactos negativos en el proyecto

  # ─────────────────────────────────────────────────────────────
  # 1. IDENTIFICACIÓN DE RIESGOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Identificación de riesgos del proyecto
    Dado que se realiza sesión de identificación de riesgos
    Cuando se listan riesgos
    Entonces se documentan:
      | ID    | Riesgo                              | Tipo     |
      | R-001 | Pérdida de developer clave          | Recurso  |
      | R-002 | Cambio de normativa durante desarrollo | Alcance |
      | R-003 | Conectividad insuficiente en maternidad | Técnico |
      | R-004 | Rechazo del equipo médico al sistema | Stakeholder |
      | R-005 | Sobrecosto por cambios de alcance   | Costo    |
      | R-006 | Vulnerabilidad de seguridad         | Técnico  |
      | R-007 | Fallo en certificación NOM-024      | Calidad  |
      | R-008 | Dependencia de tecnología obsoleta  | Técnico  |

  # ─────────────────────────────────────────────────────────────
  # 2. ANÁLISIS DE RIESGOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Análisis cualitativo de riesgos
    Dado que se analizan riesgos cualitativamente
    Cuando se evalúa probabilidad e impacto
    Entonces se genera matriz:
      | ID    | Probabilidad | Impacto | Nivel    | Prioridad |
      | R-001 | Baja         | Alto    | Medio    | 3         |
      | R-002 | Media        | Alto    | Alto     | 1         |
      | R-003 | Alta         | Alto    | Crítico  | 0         |
      | R-004 | Media        | Medio   | Medio    | 4         |
      | R-005 | Media        | Medio   | Medio    | 5         |
      | R-006 | Baja         | Crítico | Alto     | 2         |
      | R-007 | Baja         | Alto    | Medio    | 6         |
      | R-008 | Baja         | Bajo    | Bajo     | 8         |

  Escenario: Análisis cuantitativo de riesgos
    Dado que se analizan riesgos críticos cuantitativamente
    Cuando se evalúa impacto económico
    Entonces se muestra:
      | ID    | Impacto económico | PERT    | EMV      |
      | R-003 | $50,000-$200,000 | $100,000| $80,000  |
      | R-002 | $20,000-$80,000  | $40,000 | $20,000  |
      | R-006 | $100,000-$500,000| $250,000| $25,000  |
    Y se calcula EMV (Expected Monetary Value) total

  # ─────────────────────────────────────────────────────────────
  # 3. RESPUESTA A RIESGOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Plan de respuesta a riesgos críticos
    Dado que se definen respuestas para riesgos críticos
    Cuando se documenta plan
    Entonces se establece:
      | ID    | Estrategia       | Respuesta específica     | Contingencia |
      | R-003 | Mitigar          | Offline-first + hotspot  | App simplificada |
      | R-002 | Mitigar          | Monitoreo regulatorio    | Flexibilidad diseño |
      | R-006 | Mitigar          | OWASP + pentesting       | Response plan |
      | R-001 | Transferir       | Documentación completa   | Contratar externo |
      | R-004 | Mitigar          | Involucrar desde inicio  | Capacitación |
    Y cada respuesta tiene responsable y fecha

  Escenario: Registro de riesgos materializados
    Dado que un riesgo se materializa
    Cuando se detecta
    Entonces se registra:
      | Campo                     |
      | ID del riesgo             |
      | Fecha de materialización  |
      | Impacto real              |
      | Respuesta ejecutada       |
      | Costo de la respuesta     |
      | Lecciones aprendidas      |
    Y se actualiza register de riesgos

  # ─────────────────────────────────────────────────────────────
  # 4. MONITOREO DE RIESGOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Revisión periódica de riesgos
    Dado que se realiza revisión mensual de riesgos
    Cuando se evalúa register
    Entonces se verifica:
      | Riesgo                    | Estado actual       | Acción requerida |
      | R-001 (Pérdida dev)      | Activo, mitigado    | Mantener docs    |
      | R-003 (Conectividad)     | Activo, monitoreando| Test mensual     |
      | R-006 (Seguridad)        | Activo, en proceso  | Pentesting pendiente |
    Y se identifican nuevos riesgos
    