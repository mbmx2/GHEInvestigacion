# language: es
# @id GHE-ISACA-CISA-003
# @type business-rule
# @domain audit
# @layer acquisition
# @risk s1
# @owner audit-director
# @status proposed
# @requirement REQ-CISA-003
# @risk-control CTRL-CISA-003
# @regulation CISA ISACA
@domain:isaca @type:business-rule @risk:s1 @status:proposed
Característica: CISA — Adquisición, Desarrollo e Implementación de SI
  Como auditor de TI
  Quiero auditar adquisición y desarrollo de sistemas conforme CISA
  Para que los proyectos de TI se ejecuten con controles adecuados

  Regla: Adquisición de software se evalúa

    Escenario: Evaluación de compra de software
      Dado que hospital evalúa adquisición de software
      Cuando se ejecuta proceso CISA
      Entonces se verifica:
        | Elemento                    |
        | Análisis de necesidades     |
        | Evaluación de mercado       |
        | Criterios de selección      |
        | Prueba de concepto          |
        | Evaluación de proveedor     |
        | Análisis costo-beneficio    |
        | Cumplimiento normativo      |

    Escenario: Evaluación de proveedor SaaS
      Dado que se evalúa proveedor SaaS
      Cuando se audita
      Entonces se verifica:
        | Elemento                    |
        | Certificaciones del proveedor|
        | SLA y disponibilidad        |
        | Seguridad de datos          |
        | Portabilidad de datos       |
        | Baja dependencia            |
        | Plan de salida              |

  Regla: Desarrollo de software tiene controles

    Escenario: Controles de desarrollo
      Dado que se desarrolla software médico
      Cuando se audita proceso de desarrollo
      Entonces se verifica:
        | Elemento                    |
        | Metodología documentada     |
        | Revisión de diseño          |
        | Control de versiones        |
        | Pruebas automatizadas       |
        | Gestión de defectos         |
        | Aprobación para producción  |

    Escenario: Pruebas en desarrollo
      Dado que se prueban componentes
      Cuando se ejecutan pruebas
      Entonces se verifica:
        | Tipo de prueba              | Cobertura    |
        | Unitaria                    | 100%         |
        | Integración                 | Críticos     |
        | Aceptación                  | Requisitos   |
        | Seguridad                   | OWASP Top 10 |
        | Regresión                   | Completa     |

  Regla: Implementación se planifica

    Escenario: Plan de implementación
      Dado que software está listo para implementar
      Cuando se crea plan
      Entonces incluye:
        | Elemento                    |
        | Cronograma detallado        |
        | Estrategia de despliegue    |
        | Plan de capacitación        |
        | Plan de rollback            |
        | Criterios de éxito          |
        | Responsabilidades           |

  Regla: Post-implementación se evalúa

    Escenario: Revisión post-implementación
      Dado que implementación está completa
      Cuando se realiza revisión
      Entonces se verifica:
        | Elemento                    |
        | Objetivos alcanzados        |
        | Beneficios realizados       |
        | Lecciones aprendidas        |
        | Estado de documentación     |
        | Satisfacción de usuarios    |
