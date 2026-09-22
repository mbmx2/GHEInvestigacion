# language: es
# @id GHE-CISSP-009
# @type business-rule
# @domain security
# @layer assessment
# @risk s1
# @owner security-analyst
# @status proposed
# @requirement REQ-CISSP-009
# @risk-control CTRL-CISSP-009
# @regulation CISSP-D6 ISC2
@domain:isc2_cissp @type:business-rule @risk:s1 @status:proposed
Característica: CISSP Dominio 6 — Evaluación y Pruebas de Seguridad
  Como analista de seguridad
  Quiero evaluación y pruebas de seguridad conforme CISSP Domain 6
  Para que la seguridad se mida, pruebe y mejore continuamente

  Regla: Evaluación de vulnerabilidades es periódica

    Escenario: Escaneo de vulnerabilidades
      Dado que se realiza escaneo de vulnerabilidades
      Cuando se ejecuta
      Entonces se verifica:
        | Elemento                    |
        | Cobertura de activos        |
        | Frecuencia: mensual         |
        | Herramienta calibrada       |
        | Resultados documentados     |
        | Remediación asignada        |

    Escenario: Clasificación de vulnerabilidades
      Dado que escaneo identifica vulnerabilidades
      Cuando se clasifican
      Entonces se usa CVSS:
        | Severidad | CVSS     | Acción de remediación |
        | Crítico   | 9.0-10.0 | Inmediato (<24h)     |
        | Alto      | 7.0-8.9  | <7 días              |
        | Medio     | 4.0-6.9  | <30 días             |
        | Bajo      | 0.1-3.9  | <90 días             |

  Regla: Pruebas de penetración se realizan

    Escenario: Pentest anual
      Dado que hospital requiere pentest
      Cuando se ejecuta
      Entonces se verifica:
        | Elemento                    |
        | Alcance definido            |
        | Metodología documentada     |
        | Probado en horario seguro   |
        | Hallazgos reportados        |
        | Remediación verificada      |

    Escenario: Prueba de concepto de ataque
      Dado que se prueba explotación de vulnerabilidad
      Cuando se ejecuta PoC
      Entonces se verifica:
        | Elemento                    |
        | Aprobación explícita        |
        | Sin impacto en producción   |
        | Evidencia documentada       |
        | Plan de reversión listo     |

  Regla: Auditorías de seguridad se ejecutan

    Escenario: Auditoría interna de seguridad
      Dado que se realiza auditoría interna
      Cuando se ejecuta
      Entonces se verifica:
        | Elemento                    |
        | Checklist de auditoría      |
        | Evidencia recopilada        |
        | Hallazgos clasificados      |
        | Recomendaciones accionables |
        | Seguimiento de cierre       |

  Regla: Revisiones de código se realizan

    Escenario: Revisión de seguridad de código
      Dado que se revisa código fuente
      Cuando se ejecuta SAST/DAST
      Entonces se verifica:
        | Elemento                    |
        | Cobertura de código         |
        | Vulnerabilidades OWASP Top 10|
        | Bugs de seguridad           |
        | Remediación antes de merge  |
        | Métricas de calidad         |
