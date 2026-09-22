# language: es
# @id GHE-GIAC-028
# @type business-rule
# @domain security
# @layer security-operations-center
# @risk s1
# @owner soc-manager
# @status proposed
# @requirement REQ-GIAC-028
# @risk-control CTRL-GIAC-028
# @regulation GIAC-GSOC SANS
@domain:sans_giac @type:business-rule @risk:s1 @status:proposed
Característica: GIAC GSOC — Operaciones de Centro de Seguridad
  Como gerente SOC certificado GSOC
  Quiero metodología GSOC de operaciones SOC
  Para que el SOC opere con excelencia y efectividad

  Regla: SOC se configura

    Escenario: Diseño de SOC
      Dado que se diseña SOC
      Cuando se implementa
      Entonces se verifica:
        | Elemento                    |
        | Tiered SOC structure        |
        | Roles y responsabilidades   |
        | Herramientas SIEM/SOAR      |
        | Procedimientos operativos   |
        | Métricas de desempeño       |

  Regla: Procesos SOC se ejecutan

    Escenario: Monitoreo 24/7
      Dado que SOC opera 24/7
      Cuando se ejecutan procesos
      Entonces se verifica:
        | Elemento                    |
        | Alertas triageadas          |
        | Incidentes escalados        |
        | Threat hunting              |
        | Vulnerability management    |
        | Compliance monitoring       |

  Regla: Métricas SOC se miden

    Escenario: Dashboard de SOC
      Dado que se miden métricas SOC
      Cuando se consulta dashboard
      Entonces se verifica:
        | Métrica                     | Meta          |
        | MTTD                        | <30 minutos   |
        | MTTR                        | <2 horas      |
        | Alertas procesadas          | 100%          |
        | Falsos positivos            | <5%           |
        | Cobertura de activos        | 100%          |

  Regla: Mejora continua del SOC

    Escenario: Optimización de SOC
      Dado que SOC está operando
      Cuando se optimiza
      Entonces se verifica:
        | Elemento                    |
        | Playbooks actualizados      |
        | Herramientas optimizadas    |
        | Capacitación continua       |
        | Procesos refinados          |
        | Innovación tecnológica      |
