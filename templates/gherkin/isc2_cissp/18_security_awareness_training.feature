# language: es
# @id GHE-CISSP-018
# @type business-rule
# @domain security
# @layer security-training
# @risk s2
# @owner training-coordinator
# @status proposed
# @requirement REQ-CISSP-018
# @risk-control CTRL-CISSP-018
# @regulation CISSP-D1 ISC2
@domain:isc2_cissp @type:business-rule @risk:s2 @status:proposed
Característica: CISSP — Capacitación y Concienciación en Seguridad
  Como coordinador de capacitación
  Quiero programa de concienciación conforme CISSP
  Para que todo el personal del hospital sea la primera línea de defensa

  Regla: Capacitación es obligatoria

    Escenario: Capacitación inicial
      Dado que nuevo empleado ingresa
      Cuando se incorpora
      Entonces recibe:
        | Tema                     | Duración  |
        | Política de seguridad    | 1 hora    |
        | Uso aceptable            | 30 min    |
        | Protección de datos      | 1 hora    |
        | Phishing y social eng.   | 30 min    |
        | Incidentes               | 30 min    |
        | Firma de acknowledge     | Incluido  |

    Escenario: Capacitación anual
      Dado que es renovación anual
      Cuando se ejecuta
      Entonces se verifica:
        | Elemento                    |
        | 100% de personal capacitado |
        | Contenido actualizado       |
        | Evaluación de conocimiento  |
        | Certificación de asistencia |
        | Métricas de efectividad     |

  Regla: Concienciación es continua

    Escenario: Campañas de concienciación
      Dado que se ejecutan campañas
      Cuando se planifican
      Entonces se incluyen:
        | Campaña                    | Frecuencia  |
        | Phishing simulado          | Mensual     |
        | Tips de seguridad          | Semanal     |
        | Newsletter de seguridad    | Mensual     |
        | Gamificación de seguridad  | Trimestral  |
        | Simulacros de incidentes   | Trimestral  |

    Escenario: Simulacro de phishing
      Dado que se ejecuta simulacro de phishing
      Cuando se evalúa
      Entonces se mide:
        | Métrica                     | Meta          |
        | Tasa de apertura            | <20%          |
        | Tasa de clics               | <10%          |
        | Tasa de reporte             | >30%          |
        | Mejora mensual              | Tendencia ↓   |

  Regla: Roles especializados se capacitan

    Escenario: Capacitación para desarrolladores
      Dado que equipo de TI desarrolla software
      Cuando se capacita
      Entonces recibe:
        | Tema                     | Frecuencia  |
        | Secure coding            | Trimestral  |
        | OWASP Top 10             | Semestral   |
        | Threat modeling          | Anual       |
        | Code review seguro       | Trimestral  |

  Regla: Efectividad se mide

    Escenario: Métricas de capacitación
      Dado que se mide efectividad
      Cuando se evalúa
      Entonces se verifica:
        | Métrica                     | Meta          |
        | Asistencia completa         | 100%          |
        | Evaluación aprobatoria      | >90%          |
        | Incidentes post-capacitación| ↓             |
        | Reportes de phishing        | ↑             |
