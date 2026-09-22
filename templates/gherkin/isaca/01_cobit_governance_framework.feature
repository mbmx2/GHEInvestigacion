# language: es
# @id GHE-ISACA-COBIT-001
# @type business-rule
# @domain governance
# @layer governance
# @risk s1
# @owner governance-director
# @status proposed
# @requirement REQ-COBIT-001
# @risk-control CTRL-COBIT-001
# @regulation COBIT-2019
@domain:isaca @type:business-rule @risk:s1 @status:proposed
Característica: COBIT 2019 — Marco de Gobernanza y Gestión de TI
  Como director de gobernanza
  Quiero implementar COBIT 2019 para gobernar TI del hospital
  Para asegurar que la tecnología apoya los objetivos clínicos y administrativos

  Regla: Gobernanza de TI se evalúa continuamente

    Escenario: Evaluación de madurez COBIT
      Dado que se realiza evaluación de gobernanza de TI
      Cuando se mide madurez contra COBIT 2019
      Entonces se evalúan los 5 objetivos:
        | Objetivo                        | Dominio       |
        | Satisfacer necesidades stakeholders| Gobernanza  |
        | Entregar valor                  | Gobernanza    |
        | Optimizar riesgo                | Gobernanza    |
        | Optimizar recursos              | Gestión       |
        | Medir desempeño                 | Gestión       |
      Y se genera roadmap de mejora

    Escenario: Procesos GOV evaluados
      Dado que se evalúa dominio GOV (Gobernanza)
      Cuando se revisan procesos GOV
      Entonces se verifica cobertura de:
        | Proceso                         | Descripción   |
        | GOV01 | Framework de gobierno   |
        | GOV02 | Estrategia de TI        |
        | GOV03 | Arquitectura empresarial|
        | GOV04 | Innovación de TI        |
        | GOV05 | Política de TI          |
        | GOV06 | Gestión de inversiones  |
        | GOV07 | Gestión de recursos humanos TI |
        | GOV08 | Gestión de riesgos      |
        | GOV09 | Medición                |
        | GOV10 | Monitoreo y evaluación  |
        | GOV11 | Aseguramiento de servicios|

  Regla: Procesos AED (Alcanzar, Entregar, Devolver) se gestionan

    Escenario: Procesos AED evaluados
      Dado que se evalúa dominio AED
      Cuando se revisan procesos AED
      Entonces se verifica:
        | Proceso                         | Descripción   |
        | AED01 | Gestión de la estrategia |
        | AED02 | Gestión de la definición de arquitectura |
        | AED03 | Innovación                |
        | AED04 | Gestión de portafolio     |
        | AED05 | Gestión de presupuesto y costos |
        | AED06 | Gestión de recursos humanos |
        | AED07 | Gestión de relaciones     |
        | AED08 | Gestión de acuerdos de servicio |
        | AED09 | Gestión de proveedores    |
        | AED10 | Gestión del cambio        |
        | AED11 | Gestión de la seguridad   |
        | AED12 | Gestión de datos          |
        | AED13 | Gestión de configuración  |
        | AED14 | Gestión de problemas      |
        | AED15 | Gestión de operaciones    |
        | AED16 | Gestión de interfaces del negocio |
        | AED17 | Gestión del capital humano |
        | AED18 | Gestión del conocimiento  |
        | AED19 | Gestión de la calidad     |
        | AED20 | Gestión del ciclo de vida |
        | AED21 | Gestión de la infraestructura |
        | AED22 | Gestión de servicios      |
        | AED23 | Gestión de la continuidad |
        | AED24 | Gestión de la seguridad   |

  Regla: Objetivos de gobierno se alinean con metas clínicas

    Escenario: Alineación TI-estrategia hospitalaria
      Dado que hospital define objetivos estratégicos
      Cuando se alinean con objetivos de TI
      Entonces se verifica:
        | Objetivo hospitalario       | Soporte TI                      |
        | Reducir mortalidad materna  | Sistema de alerta temprana      |
        | Cumplir NOM-007             | Control prenatal automatizado   |
        | Optimizar farmacia          | Sistema de dispensación         |
        | Reducir errores médicos     | CDSS y clinical decision support|

  Regla: Roles de gobernanza se definen

    Escenario: Estructura de gobierno
      Dado que se implementa gobernanza COBIT
      Cuando se definen roles
      Entonces se establecen:
        | Rol                   | Responsabilidad         |
        | Comité de gobierno    | Estrategia y dirección  |
        | Dueño del proceso     | Ejecución y resultados  |
        | Equipo de TI          | Implementación operativa|
        | Auditor interno       | Verificación independiente|
        | Stakeholders clínicos | Necesidades y validación|

  Regla: Medición continua de desempeño

    Escenario: KPIs de gobernanza
      Dado que se monitorean KPIs de gobernanza
      Cuando se consulta dashboard
      Entonces muestra:
        | KPI                           | Meta          |
        | Alineación TI-negocio        | >90%          |
        | Cumplimiento de SLAs          | >95%          |
        | Incidentes de seguridad      | <5/mes        |
        | Disponibilidad de sistemas   | >99.5%        |
        | Satisfacción de usuarios     | >85%          |
        | Retorno de inversión TI      | >15%          |
