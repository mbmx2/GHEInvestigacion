# language: es
# @id GHE-GIAC-037
# @type business-rule
# @domain security
# @layer social-engineering
# @risk s1
# @owner pentester
# @status proposed
# @requirement REQ-GIAC-037
# @risk-control CTRL-GIAC-037
# @regulation GIAC-GPEN-SE SANS
@domain:sans_giac @type:business-rule @risk:s1 @status:proposed
Característica: GIAC GPEN — Ingeniería Social y Phishing
  Como pentester certificado GPEN
  Quiero pruebas de ingeniería social conforme GPEN
  Para que la resistencia del personal del hospital se evalúe

  Regla: Campañas de phishing se ejecutan

    Escenario: Simulacro de phishing
      Dado que se planifica campaña de phishing
      Cuando se ejecuta
      Entonces se verifica:
        | Elemento                    |
        | Aprobación de dirección     |
        | Alcance definido            |
        | Templates realistas         |
        | Métricas capturadas         |
        | Capacitación post-campaña   |

    Escenario: Phishing spear
      Dado que se ejecuta phishing dirigido
      Cuando se personaliza
      Entonces se verifica:
        | Elemento                    |
        | Investigación del objetivo  |
        | Contenido personalizado     |
        | Dominio similar (typosquat) |
        | Timing apropiado            |
        | Evidencia documentada       |

  Regla: Pruebas de ingeniería social

    Escenario: Vishing (phishing por teléfono)
      Dado que se ejecuta prueba de vishing
      Cuando se realiza llamada
      Entonces se verifica:
        | Elemento                    |
        | Pretext creíble             |
        | Información solicitada      |
        | Respuesta del empleado      |
        | Escalación si aplica        |
        | Documentación completa      |

    Escenario: Physical social engineering
      Dado que se prueba acceso físico
      Cuando se ejecuta prueba
      Entonces se verifica:
        | Elemento                    |
        | Tailgating                 |
        | Pretext para acceso         |
        | Respuesta del personal      |
        | Controles físicos          |
        | Mejoras identificadas       |

  Regla: Resultados se documentan

    Escenario: Reporte de ingeniería social
      Dado que campaña está completa
      Cuando se genera reporte
      Entonces incluye:
        | Sección                    |
        | Tasa de éxito del ataque   |
        | Empleados más vulnerables  |
        | Departamentos afectados    |
        | Lecciones aprendidas       |
        | Plan de capacitación       |
