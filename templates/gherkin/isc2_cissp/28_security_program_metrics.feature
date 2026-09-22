# language: es
# @id GHE-CISSP-028
# @type business-rule
# @domain security
# @layer security-metrics
# @risk s2
# @owner security-program-manager
# @status proposed
# @requirement REQ-CISSP-028
# @risk-control CTRL-CISSP-028
# @regulation CISSP-D1 ISC2
@domain:isc2_cissp @type:business-rule @risk:s2 @status:proposed
Característica: CISSP — Métricas y Programa de Seguridad
  Como gerente del programa de seguridad
  Quiero métricas y programa de seguridad conforme CISSP
  Para que la seguridad sea medible y mejore continuamente

  Regla: Programa de seguridad se mide

    Escenario: Balanced Security Scorecard
      Dado que se mide programa de seguridad
      Cuando se consulta scorecard
      Entonces muestra:
        | Perspectiva                 | Métrica                  | Meta    |
        | Protección                  | Controles operativos     | >95%    |
        | Detección                   | MTTD                     | <30 min |
        | Respuesta                   | MTTR                     | <2 horas|
        | Recuperación                | RTO alcanzado            | 100%    |
        | Cumplimiento                | Auditorías aprobadas     | 100%    |
        | Concienciación              | Capacitación completada  | 100%    |

  Regla: Benchmarking se realiza

    Escenario: Comparación con industria
      Dado que se realiza benchmarking de seguridad
      Cuando se comparan métricas
      Entonces se usa:
        | Fuente                       |
        | Verizon DBIR                 |
        | Ponemon Institute            |
        | ISACA benchmarks            |
        | NIST Cybersecurity Framework |
        | CIS Controls metrics        |

  Regla: Madurez de seguridad se evalúa

    Escenario: Evaluación de madurez
      Dado que se evalúa madurez de seguridad
      Cuando se mide
      Entonces se usa escala:
        | Nivel | Descripción                        |
        | 1     | Inicial: reactivo, sin procesos    |
        | 2     | Repetible: procesos básicos        |
        | 3     | Definido: procesos documentados    |
        | 4     | Gestionado: medido y controlado    |
        | 5     | Optimizado: mejora continua        |

  Regla: Roadmap de madurez se crea

    Escenario: Plan de mejora de madurez
      Dado que madurez actual es Nivel 2
      Cuando se crea roadmap
      Entonces se establece:
        | Fase      | Objetivo                    | Duración |
        | Corto plazo| Nivel 3: procesos definidos | 6 meses  |
        | Mediano plazo| Nivel 4: gestionado      | 12 meses |
        | Largo plazo| Nivel 5: optimizado        | 24 meses |

  Regla: ROI de seguridad se demuestra

    Escenario: Valor de seguridad
      Dado que se demuestra ROI de seguridad
      Cuando se calcula
      Entonces se incluye:
        | Elemento                    |
        | Incidentes evitados         |
        | Ahorro por cumplimiento     |
        | Reducción de primas de seguro|
        | Valor de reputación         |
        | Continuidad del negocio     |
