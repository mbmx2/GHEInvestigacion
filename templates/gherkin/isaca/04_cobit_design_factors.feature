# language: es
# @id GHE-ISACA-COBIT-004
# @type business-rule
# @domain governance
# @layer design
# @risk s2
# @owner governance-director
# @status proposed
# @requirement REQ-COBIT-004
# @risk-control CTRL-COBIT-004
# @regulation COBIT-2019
@domain:isaca @type:business-rule @risk:s2 @status:proposed
Característica: COBIT 2019 — Factores de Diseño y Personalización
  Como arquitecto de gobernanza
  Quiero personalizar COBIT 2019 según factores de diseño del hospital
  Para que el marco de gobernanza se ajuste al contexto y necesidades reales

  Regla: Factores de diseño se evalúan

    Escenario: Identificación de factores de diseño
      Dado que hospital implementa COBIT 2019
      Cuando se evalúan factores de diseño
      Entonces se consideran:
        | Factor de diseño              | Evaluación del hospital       |
        | Estrategia empresarial        | Salud materno-infantil        |
        | Objetivos de TI              | Offline-first, certificable   |
        | Riesgos empresariales        | Pérdida de datos, ransomware  |
        | Requisitos de cumplimiento   | NOM-004, NOM-024, IEC 62304   |
        | Amenazas actuales            | Sector salud, infraestructura rural|
        | Infraestructura de TI        | SQLite, Clojure, arquitectura hexagonal|
        | Estrategia de adquisición    | Desarrollo propio, open source|
        | Tamaño de la organización    | Hospital materno rural        |
        | Localización geográfica      | Sierra de Veracruz, 2G/EDGE   |

    Escenario: Priorización de procesos COBIT
      Dado que factores de diseño están evaluados
      Cuando se priorizan procesos
      Entonces se clasifican:
        | Prioridad | Procesos clave                |
        | Crítico   | GOV05, GOV08, AED11, AED23   |
        | Alto      | GOV01, AED01, AED10, AED15   |
        | Medio     | GOV03, AED05, AED13, AED20   |
        | Bajo      | GOV07, AED17, AED18          |

  Regla: Tamaño de empresa afecta implementación

    Escenario: Implementación para hospital pequeño
      Dado que hospital es organización pequeña
      Cuando se personaliza COBIT
      Entonces se aplican:
        | Adaptación                    |
        | Roles combinados permitidos   |
        | Procesos simplificados        |
        | Documentación proporcional    |
        | Herramientas de bajo costo    |
        | Frecuencia de evaluación reducida|

  Regla: Objetivos de gobierno se mapean

    Escenario: Mapeo de objetivos a procesos
      Dado que se mapean objetivos de gobierno
      Cuando se define alcance
      Entonces se establece:
        | Objetivo de gobierno          | Procesos COBIT asociados       |
        | Satisfacer stakeholders      | GOV01, GOV02, GOV11           |
        | Entregar valor               | AED01, AED04, AED06           |
        | Optimizar riesgo             | GOV08, AED11                  |
        | Optimizar recursos           | AED05, AED06, AED07           |
        | Medir desempeño              | GOV09, GOV10                  |

  Regla: Plan de implementación se crea

    Escenario: Roadmap de gobernanza
      Dado que se crea plan de implementación
      Cuando se define cronograma
      Entonces se establece:
        | Fase      | Duración  | Entregable                   |
        | Piloto    | 3 meses   | Procesos críticos            |
        | Expansión | 6 meses   | Procesos alto y medio        |
        | Madurez   | 12 meses  | Todos los procesos           |
        | Optimización| Continuo | Mejora continua              |
