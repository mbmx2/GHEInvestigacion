# language: es
# @id GHE-ISACA-CISM-006
# @type business-rule
# @domain security
# @layer program
# @risk s1
# @owner security-director
# @status proposed
# @requirement REQ-CISM-006
# @risk-control CTRL-CISM-006
# @regulation CISM ISACA
@domain:isaca @type:business-rule @risk:s1 @status:proposed
Característica: CISM — Desarrollo del Programa de Seguridad
  Como director de seguridad
  Quiero desarrollar programa de seguridad conforme CISM
  Para que la seguridad sea un programa estructurado, no reactiva

  Regla: Programa de seguridad se planifica

    Escenario: Definición del programa
      Dado que se inicia programa de seguridad
      Cuando se planifica
      Entonces se define:
        | Componente                  |
        | Visión y objetivos          |
        | Alcance del programa        |
        | Recursos necesarios         |
        | Cronograma de implementación|
        | Métricas de éxito           |
        | Aprobación de dirección    |

    Escenario: Roadmap de seguridad
      Dado que se crea roadmap de seguridad
      Cuando se define calendario
      Entonces se establece:
        | Fase      | Actividades clave              |
        | Inmediato | Políticas, control de acceso   |
        | Corto plazo| Monitoreo, respuesta incidentes|
        | Mediano plazo| Auditoría, capacitación     |
        | Largo plazo| Madurez, certificación        |

  Regla: Controles de seguridad se seleccionan

    Escenario: Framework de controles
      Dado que se seleccionan controles de seguridad
      Cuando se evalúa opciones
      Entonces se consideran:
        | Framework                   | Aplicabilidad   |
        | ISO 27001                   | Alto            |
        | NIST CSF                    | Alto            |
        | CIS Controls                | Medio           |
        | OWASP                       | Para aplicaciones|
        | COBIT AED11                 | Gobernanza      |

    Escenario: Controles para hospital offline-first
      Dado que hospital opera offline-first
      Cuando se seleccionan controles
      Entonces se priorizan:
        | Control                     | Justificación            |
        | Cifrado en reposo           | Datos sin protección de red|
        | Control de acceso local     | Sin autenticación central |
        | Respaldo offline            | Sin backup en la nube     |
        | Monitoreo de integridad     | Sin SIEM centralizado    |

  Regla: Presupuesto de seguridad se justifica

    Escenario: Inversión en seguridad
      Dado que se planifica presupuesto de seguridad
      Cuando se justifica inversión
      Entonces se demuestra:
        | Elemento                    |
        | Costo de no implementar     |
        | ROI de seguridad            |
        | Comparación con industria   |
        | Requisitos normativos       |
        | Costo de incidentes previos |

  Regla: Programa se revisa periódicamente

    Escenario: Revisión semestral del programa
      Dado que programa está en ejecución
      Cuando se realiza revisión semestral
      Entonces se evalúa:
        | Elemento                    |
        | Progreso contra roadmap     |
        | Efectividad de controles    |
        | Cambios en amenazas         |
        | Presupuesto ejecutado       |
        | Satisfacción de stakeholders|
        | Recomendaciones de ajuste   |
