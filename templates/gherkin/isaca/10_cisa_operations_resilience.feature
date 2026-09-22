# language: es
# @id GHE-ISACA-CISA-010
# @type business-rule
# @domain audit
# @layer resilience
# @risk s1
# @owner audit-director
# @status proposed
# @requirement REQ-CISA-010
# @risk-control CTRL-CISA-010
# @regulation CISA ISACA
@domain:isaca @type:business-rule @risk:s1 @status:proposed
Característica: CISA — Operaciones de SI y Resiliencia del Negocio
  Como auditor de TI
  Quiero auditar operaciones y resiliencia conforme CISA
  Para que la operación de TI sea continua y resiliente ante fallos

  Regla: Operaciones de TI se monitorean

    Escenario: Monitoreo de operaciones
      Dado que se auditan operaciones de TI
      Cuando se evalúa monitoreo
      Entonces se verifica:
        | Área                        | Qué se audita          |
        | Disponibilidad              | Uptime de sistemas     |
        | Rendimiento                 | Tiempos de respuesta   |
        | Capacidad                   | Uso de recursos        |
        | Seguridad operativa         | Eventos de seguridad   |
        | Cambios                     | Cambios implementados  |
        | Incidentes                  | Registro y resolución  |

    Escenario: Gestión de problemas
      Dado que se audita gestión de problemas
      Cuando se evalúa
      Entonces se verifica:
        | Elemento                    |
        | Registro de problemas       |
        | Análisis de causa raíz      |
        | Soluciones documentadas     |
        | Base de conocimiento        |
        | Reducción de incidentes     |

  Regla: Resiliencia del negocio se prueba

    Escenario: Prueba de resiliencia
      Dado que se audita resiliencia
      Cuando se prueban planes
      Entonces se verifica:
        | Elemento                    |
        | Backup restaurado exitosamente|
        | Failover funciona           |
        | Personal conoce roles       |
        | Comunicación efectiva       |
        | Tiempo dentro de RTO        |

    Escenario: Escenario de fallo completo
      Dado que se simula fallo de sistema principal
      Cuando se activa contingencia
      Entonces se verifica:
        | Elemento                    |
        | Modo offline opera          |
        | Datos preservados           |
        | Servicio degradado pero disponible|
        | Recuperación exitosa        |

  Regla: Continuidad del negocio se documenta

    Escenario: BIA actualizado
      Dado que se audita Business Impact Analysis
      Cuando se revisa
      Entonces se verifica:
        | Elemento                    |
        | Procesos críticos identificados|
        | RTO y RPO definidos         |
        | Dependencias mapeadas       |
        | Recursos alternativos       |
        | Plan de comunicación        |

  Regla: Gestión de capacidad se evalúa

    Escenario: Capacidad de TI
      Dado que se audita gestión de capacidad
      Cuando se evalúa
      Entonces se verifica:
        | Elemento                    |
        | Demanda proyectada          |
        | Capacidad disponible        |
        | Plan de expansión           |
        | Puntos de estrangulamiento  |
        | Costo de capacidad          |
