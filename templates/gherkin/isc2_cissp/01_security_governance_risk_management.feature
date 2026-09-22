# language: es
# @id GHE-CISSP-001
# @type business-rule
# @domain security
# @layer governance
# @risk s1
# @owner ciso
# @status proposed
# @requirement REQ-CISSP-001
# @risk-control CTRL-CISSP-001
# @regulation CISSP-D1 ISC2
@domain:isc2_cissp @type:business-rule @risk:s1 @status:proposed
Característica: CISSP Dominio 1 — Gobernanza de Seguridad y Gestión de Riesgos
  Como CISO del hospital
  Quiero gobernanza de seguridad conforme CISSP Domain 1
  Para que la seguridad de la información esté integrada en la estrategia del hospital

  Regla: Política de seguridad se define y comunica

    Escenario: Desarrollo de política de seguridad
      Dado que hospital requiere política de seguridad
      Cuando se desarrolla
      Entonces se incluye:
        | Componente                  |
        | Propósito y alcance         |
        | Roles y responsabilidades   |
        | Estándares de seguridad     |
        | Procedimientos operativos   |
        | Directrices técnicas        |
        | Consecuencias de violación  |
        | Revisión y actualización    |

    Escenario: Comunicación de política
      Dado que política está aprobada
      Cuando se comunica
      Entonces se verifica:
        | Elemento                    |
        | Personal la recibe          |
        | Firma de acknowledge        |
        | Capacitación asociada       |
        | Disponibilidad continua     |
        | Revisión anual              |

  Regla: Gestión de riesgos es continua

    Escenario: Identificación de activos de información
      Dado que se identifican activos de información
      Cuando se catalogan
      Entonces se incluyen:
        | Tipo de activo             | Ejemplo                       |
        | Datos de pacientes         | Expedientes clínicos          |
        | Datos financieros          | Facturación, pagos            |
        | Propiedad intelectual      | Protocolos, investigaciones   |
        | Software                   | GHE, bases de datos           |
        | Hardware                   | Servidores, workstations      |
        | Personal                   | Equipo clínico y TI           |

    Escenario: Evaluación de amenazas y vulnerabilidades
      Dado que se evalúa amenaza contra un activo
      Cuando se analiza
      Entonces se documenta:
        | Elemento                    |
        | Amenaza identificada        |
        | Vulnerabilidad asociada     |
        | Controles existentes        |
        | Probabilidad de exploit     |
        | Impacto potencial           |
        | Riesgo inherente            |

  Regla: Controles de seguridad se seleccionan

    Escenario: Matriz de controles
      Dado que se seleccionan controles de seguridad
      Cuando se evalúa opciones
      Entonces se consideran:
        | Tipo de control | Ejemplo                       |
        | Preventivo      | Cifrado, MFA, firewalls       |
        | Detectivo       | IDS, SIEM, monitoreo de anomalías|
        | Correctivo      | Parches, backups, respuesta   |
        | Disuasorio      | Políticas, acuerdos, capacitación|
        | Compensatorio   | Controles alternativos        |

  Regla: Métricas de seguridad se miden

    Escenario: KPIs de seguridad
      Dado que se definen métricas de seguridad
      Cuando se monitorean
      Entonces se mide:
        | Métrica                     | Meta          |
        | Tiempo medio de detección   | <1 hora       |
        | Tiempo medio de respuesta   | <4 horas      |
        | Incidentes este trimestre   | <3            |
        | Vulnerabilidades críticas   | 0 abiertas    |
        | Cobertura de controles      | >95%          |
        | Capacitación completada     | 100%          |
