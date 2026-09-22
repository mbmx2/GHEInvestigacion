# language: es
# @id GHE-ISACA-CISA-002
# @type business-rule
# @domain audit
# @layer resilience
# @risk s1
# @owner audit-director
# @status proposed
# @requirement REQ-CISA-002
# @risk-control CTRL-CISA-002
# @regulation CISA ISACA
@domain:isaca @type:business-rule @risk:s1 @status:proposed
Característica: CISA — Protección de Activos de TI y Continuidad del Negocio
  Como auditor de TI
  Quiero evaluar protección de activos y continuidad conforme CISA
  Para que los activos de información del hospital estén protegidos y la operación sea continua

  Regla: Activos de información se clasifican

    Escenario: Inventario de activos de TI
      Dado que se realiza inventario de activos
      Cuando se catalogan activos
      Entonces se incluyen:
        | Tipo de activo             | Ejemplos                        |
        | Datos clínicos             | Expedientes, imágenes, resultados|
        | Software                   | GHE, bases de datos, OS         |
        | Hardware                   | Servidores, workstations, red   |
        | Personal                   | Equipo de TI y clínico          |
        | Documentación              | Políticas, procedimientos       |
        | Servicios                  | Internet, energía, telecom      |

    Escenario: Clasificación de activos
      Dado que activo está inventariado
      Cuando se clasifica
      Entonces se asigna:
        | Clasificación | Criterio                        |
        | Crítico       | Sin este activo, la vida está en riesgo |
        | Esencial      | Interrupción afecta calidad de atención |
        | Importante    | Interrupción afecta eficiencia  |
        | Soporte       | Interrupción causa inconveniencia|

  Regla: Controles de protección se implementan

    Escenario: Controles de protección de datos
      Dado que se protegen datos críticos
      Cuando se implementan controles
      Entonces se verifican:
        | Tipo de control | Implementación                  |
        | Acceso          | RBAC, autenticación multifactor |
        | Cifrado         | AES-256 en reposo, TLS en tránsito|
        | Respaldo        | Diario incremental, semanal completo|
        | Monitoreo       | SIEM, IDS, alertas automáticas  |
        | Físico          | Seguridad de data center        |

  Regla: Plan de continuidad del negocio se prueba

    Escenario: Prueba de continuidad
      Dado que plan de continuidad está documentado
      Cuando se realiza prueba
      Entonces se verifica:
        | Elemento                    | Resultado esperado|
        | Backup se restaura          | <4 horas          |
        | Sistema opera en degraded  | Funcional         |
        | Personal conoce roles      | Ejecutan correctamente|
        | Comunicación funciona      | Notificaciones salen|

    Escenario: Prueba de recuperación ante desastres
      Dado que se simula escenario de desastre
      Cuando se ejecuta DR
      Entonces se verifica:
        | Métrica                     | Meta              |
        | RTO (Recovery Time Objective)| <4 horas         |
        | RPO (Recovery Point Objective)| <4 horas         |
        | Datos perdidos              | 0                 |
        | Personal afectado           | Identificado      |

  Regla: Gestión de incidentes es estructurada

    Escenario: Respuesta a incidente de seguridad
      Dado que se detecta incidente de seguridad
      Cuando se activa respuesta
      Entonces se sigue proceso:
        | Fase       | Acciones                          |
        | Detección  | Identificar y clasificar          |
        | Contención | Limitar alcance                   |
        | Erradicación| Eliminar causa                   |
        | Recuperación| Restaurar servicio               |
        | Lecciones  | Documentar y mejorar              |

  Regla: Monitoreo de controles es continuo

    Escenario: Dashboard de controles
      Dado que se consulta estado de controles
      Entonces muestra:
        | Control                       | Estado      |
        | Respaldos ejecutados          | Último: fecha|
        | Pruebas de penetración       | Último: fecha|
        | Revisión de accesos          | Último: fecha|
        | Prueba de continuidad        | Último: fecha|
        | Auditoría interna            | Último: fecha|
        | Capacitación de seguridad    | Completado %  |
