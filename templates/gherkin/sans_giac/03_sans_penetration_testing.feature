# language: es
# @id GHE-SANS-003
# @type business-rule
# @domain security
# @layer pentest
# @risk s1
# @owner pentest-lead
# @status proposed
# @requirement REQ-SANS-003
# @risk-control CTRL-SANS-003
# @regulation SANS-PENTEST PTES
@domain:sans_giac @type:business-rule @risk:s1 @status:proposed
Característica: SANS — Metodología de Prueba de Penetración
  Como líder de pentesting
  Quiero metodología SANS de pentesting
  Para que las pruebas de penetración sean consistentes y comprehensivas

  Regla: Preparación y alcance

    Escenario: Definición de alcance
      Dado que se planifica pentest
      Cuando se define alcance
      Entonces se verifica:
        | Elemento                    |
        | Sistemas en alcance         |
        | Sistemas fuera de alcance   |
        | Técnicas permitidas         |
        | Horario de prueba           |
        | Contacto de emergencia      |
        | Aprobación legal            |

    Escenario: Recopilación de información
      Dado que se inicia reconocimiento
      Cuando se recopila información
      Entonces se verifica:
        | Elemento                    |
        | DNS y subdominios           |
        | rangos de IP                |
        | Tecnologías identificadas   |
        | Empleados expuestos         |
        | Información pública (OSINT) |

  Regla: Análisis de vulnerabilidades

    Escenario: Escaneo de vulnerabilidades
      Dado que se ejecuta escaneo
      Cuando se identifican vulnerabilidades
      Entonces se verifica:
        | Elemento                    |
        | Cobertura completa          |
        | Falsos positivos minimizados|
        | Severidad asignada          |
        | Explotabilidad evaluada     |
        | Impacto determinado         |

  Regla: Explotación se ejecuta controladamente

    Escenario: Explotación de vulnerabilidades
      Dado que vulnerabilidades están identificadas
      Cuando se explotan
      Entonces se verifica:
        | Elemento                    |
        | Aprobación explícita        |
        | Técnicas seguras            |
        | Evidencia documentada       |
        | Sin impacto en producción   |
        | Plan de reversión listo     |

  Regla: Post-explotación y报告

    Escenario: Análisis post-explotación
      Dado que explotación está completa
      Cuando se analiza post-explotación
      Entonces se verifica:
        | Elemento                    |
        | Datos accedidos documentados|
        | Alcance completo determinado|
        | Privilegios escalados       |
        | Persistencia verificada     |
        | Impacto real evaluado       |

    Escenario: Informe de pentest
      Dado que pentest está completo
      Cuando se genera informe
      Entonces incluye:
        | Sección                    |
        | Resumen ejecutivo          |
        | Metodología usada          |
        | Vulnerabilidades halladas  |
        | Evidencia de explotación   |
        | Recomendaciones priorizadas|
        | Plan de remediación        |
