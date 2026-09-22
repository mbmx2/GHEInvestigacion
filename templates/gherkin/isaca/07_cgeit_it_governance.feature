# language: es
# @id GHE-ISACA-CGEIT-001
# @type business-rule
# @domain governance
# @layer governance
# @risk s2
# @owner governance-director
# @status proposed
# @requirement REQ-CGEIT-001
# @risk-control CTRL-CGEIT-001
# @regulation CGEIT ISACA
@domain:isaca @type:business-rule @risk:s2 @status:proposed
Característica: CGEIT — Gobernanza de TI Empresarial
  Como director de TI
  Quiero gobernanza de TI conforme CGEIT/ISACA
  Para que la inversión en TI genere valor medible para el hospital

  Regla: Marco de gobernanza se establece

    Escenario: Estructura de gobernanza de TI
      Dado que se establece gobierno de TI
      Cuando se define estructura
      Entonces se incluyen:
        | Componente                  |
        | Comité de gobernanza de TI  |
        | Roles y responsabilidades   |
        | Procesos de decisión        |
        | Mecanismos de comunicación  |
        | Herramientas de monitoreo   |

    Escenario: Politica de TI se define
      Dado que se crea política de TI del hospital
      Cuando se aprueba
      Entonces cubre:
        | Política                    |
        | Uso aceptable de tecnología|
        | Seguridad de la información|
        | Gestión de cambios          |
        | Adquisición de tecnología   |
        | Privacidad de datos         |
        | Retención de información    |

  Regla: Inversión en TI se gestiona como portafolio

    Escenario: Evaluación de proyectos TI
      Dado que se evalúa proyecto de TI
      Cuando se presenta para aprobación
      Entonces se evalúa:
        | Criterio                    |
        | Alineación con estrategia   |
        | Retorno de inversión        |
        | Riesgo asociado             |
        | Recursos necesarios         |
        | Impacto en calidad de atención|
        | Cumplimiento normativo      |

    Escenario: Priorización de portafolio
      Dado que hay múltiples proyectos TI propuestos
      Cuando se priorizan
      Entonces se usa criterio compuesto:
        | Factor           | Peso   |
        | Valor clínico    | 40%    |
        | Riesgo           | 25%    |
        | Costo            | 20%    |
        | Cumplimiento     | 15%    |

  Regla: Beneficios se realization y miden

    Escenario: Tracking de beneficios
      Dado que proyecto TI fue aprobado
      Cuando se implementa
      Entonces se definen:
        | Elemento                    |
        | Beneficios esperados        |
        | Métricas de realización     |
        | Fecha objetivo de realiza   |
        | Responsable de beneficio    |
        | Revisión post-implementación|

    Escenario: Realización de beneficios
      Dado que proyecto está en producción
      Cuando se mide realization
      Entonces se compara:
        | Métrica                     | Esperado vs Real |
        | Reducción de tiempo de espera| 30% vs medido   |
        | Mejora en satisfacción      | 15% vs medido    |
        | Reducción de errores        | 20% vs medido    |
        | Ahorro de costos            | $X vs medido     |

  Regla: Recursos de TI se optimizan

    Escenario: Gestión de talento TI
      Dado que se gestiona equipo de TI
      Cuando se planifica
      Entonces se verifica:
        | Elemento                    |
        | Competencias requeridas     |
        | Plan de capacitación        |
        | Evaluación de desempeño     |
        | Retención de talento        |
        | Sucesión en roles clave     |

    Escenario: Infraestructura TI se optimiza
      Dado que se revisa infraestructura
      Cuando se evalúa eficiencia
      Entonces se verifica:
        | Métrica                     | Meta    |
        | Uso de servidores           | >60%    |
        | Costo por usuario           | <umbral |
        | Disponibilidad              | >99.5%  |
        | Capacidad futura            | >2 años |

  Regla: Desempeño de TI se mide continuamente

    Escenario: Balanced scorecard de TI
      Dado que se consulta scorecard
      Entonces muestra:
        | Perspectiva                 | KPI              |
        | Financiera                  | ROI, costo/transacción |
        | Clientes                    | Satisfacción, NPS |
        | Procesos                    | Eficiencia, calidad |
        | Aprendizaje                 | Capacitación, innovación |
