# language: es
# @id GHE-GIAC-013
# @type business-rule
# @domain security
# @layer leadership
# @risk s2
# @owner security-manager
# @status proposed
# @requirement REQ-GIAC-013
# @risk-control CTRL-GIAC-013
# @regulation GIAC-GSLC SANS
@domain:sans_giac @type:business-rule @risk:s2 @status:proposed
Característica: GIAC GSLC — Liderazgo de Seguridad
  Como gerente de seguridad certificado GSLC
  Quiero marco GSLC de liderazgo de seguridad
  Para que la seguridad se gestione con liderazgo efectivo

  Regla: Estrategia de seguridad se define

    Escenario: Alineación con negocio
      Dado que se define estrategia de seguridad
      Cuando se alinea con objetivos del hospital
      Entonces se verifica:
        | Elemento                    |
        | Objetivos de seguridad      |
        | Alineación con estrategia   |
        | Métricas de negocio         |
        | Inversión en seguridad      |
        | Roadmap de madurez          |

  Regla: Programa de seguridad se gestiona

    Escenario: Gestión del programa
      Dado que programa de seguridad está activo
      Cuando se gestiona
      Entonces se verifica:
        | Elemento                    |
        | Presupuesto aprobado        |
        | Recursos asignados          |
        | Progreso medido             |
        | Riesgos gestionados         |
        | Stakeholders informados     |

  Regla: Comunicación de seguridad

    Escenario: Reporte a dirección
      Dado que dirección necesita visibilidad
      Cuando se reporta
      Entonces se incluye:
        | Sección                    |
        | Estado del programa        |
        | Métricas clave             |
        | Riesgos principales        |
        | Inversión vs resultados    |
        | Recomendaciones estratégicas|

  Regla: Cultura de seguridad se construye

    Escenario: Programa de concienciación
      Dado que se construye cultura de seguridad
      Cuando se ejecuta programa
      Entonces se verifica:
        | Elemento                    |
        | Capacitación continua      |
        | Reconocimiento de comportamientos|
        | Liderazgo por ejemplo      |
        | Comunicación efectiva      |
        | Mejora continua            |
