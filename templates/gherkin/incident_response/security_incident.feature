# language: es
# Gestión de Incidentes de Seguridad
Característica: Incident Response (GHE)
  Como responsable de seguridad del proyecto GHE
  Quiero tener un plan de respuesta a incidentes
  Para manejar brechas de seguridad de forma efectiva

  # ─────────────────────────────────────────────────────────────
  # 1. CLASIFICACIÓN DE INCIDENTES
  # ─────────────────────────────────────────────────────────────

  Escenario: Clasificar severidad de incidente
    Dado que se detecta incidente de seguridad
    Cuando se clasifica
    Entonces:
      | Severidad                  | Criterio             |
      | S1 - Crítico              | Pérdida de datos, acceso masivo no autorizado |
      | S2 - Alto                 | Vulnerabilidad explotada, intento exitoso |
      | S3 - Medio                | Vulnerabilidad detectada, sin explotación |
      | S4 - Bajo                 | Configuración insegura, warning |

  # ─────────────────────────────────────────────────────────────
  # 2. RESPUESTA A INCIDENTES
  # ─────────────────────────────────────────────────────────────

  Escenario: Proceso de respuesta
    Dado que se activa respuesta a incidente
    Cuando se ejecuta proceso
    Entonces:
      | Paso                       | Tiempo máximo |
      | 1. Detección y reporte     | Inmediato     |
      | 2. Contención              | <15 minutos   |
      | 3. Erradicación            | <1 hora       |
      | 4. Recuperación            | <4 horas      |
      | 5. Lecciones aprendidas    | <1 semana     |

  Escenario: Contención de incidente
    Dado que se contiene un incidente
    Cuando se ejecuta
    Entonces:
      | Acción                      |
      | Aislar sistema afectado     |
      | Preservar evidencia         |
      | Notificar a equipo          |
      | Activar plan de respaldo    |

  # ─────────────────────────────────────────────────────────────
  # 3. NOTIFICACIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Notificación de breach de datos
    Dado que hay breach que involucra datos de pacientes
    Cuando se notifica
    Entonces:
      | Destinatario               | Plazo               |
      | Director de proyecto       | Inmediato           |
      | Director médico            | <1 hora             |
      | COFEPRIS                   | <72 horas (si aplica)|
      | Pacientes afectados        | <72 horas           |
      | Autoridades                | Según normativa     |

  # ─────────────────────────────────────────────────────────────
  # 4. POST-INCIDENTE
  # ─────────────────────────────────────────────────────────────

  Escenario: Análisis post-incidente
    Dado que se completa la respuesta
    Cuando se realiza post-mortem
    Entonces incluye:
      | Sección                     |
      | Timeline del incidente     |
      | Causa raíz                 |
      | Acciones tomadas           |
      | Eficacia de respuesta      |
      | Lecciones aprendidas       |
      | Acciones correctivas       |
      | Mejoras preventivas        |
  