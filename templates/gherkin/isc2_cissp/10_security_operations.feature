# language: es
# @id GHE-CISSP-010
# @type business-rule
# @domain security
# @layer operations
# @risk s1
# @owner security-operations
# @status proposed
# @requirement REQ-CISSP-010
# @risk-control CTRL-CISSP-010
# @regulation CISSP-D7 ISC2
@domain:isc2_cissp @type:business-rule @risk:s1 @status:proposed
Característica: CISSP Dominio 7 — Operaciones de Seguridad
  Como director de operaciones de seguridad
  Quiero operaciones de seguridad conforme CISSP Domain 7
  Para que la seguridad sea operada, monitoreada y mantenida efectivamente

  Regla: Monitoreo de seguridad es continuo

    Escenario: SIEM opera 24/7
      Dado que sistema SIEM monitorea eventos
      Cuando se detecta evento de seguridad
      Entonces se verifica:
        | Tipo de evento               | Acción          |
        | Alerta baja                  | Log y monitoreo |
        | Alerta media                 | Investigación   |
        | Alerta alta                  | Respuesta inmediata|
        | Alerta crítica               | Escalamiento    |

    Escenario: Correlación de eventos
      Dado que SIEM correlaciona eventos
      Cuando detecta patrón sospechoso
      Entonces se verifica:
        | Patrón                       | Acción          |
        | Múltiples fallos de login    | Bloqueo cuenta  |
        | Acceso masivo a datos        | Contención      |
        | Cambio no autorizado         | Rollback        |
        | Exfiltración sospechosa      | Aislamiento     |

  Regla: Gestión de parches se ejecuta

    Escenario: Parches de seguridad
      Dado que se identifican parches de seguridad
      Cuando se evalúa
      Entonces se verifica:
        | Elemento                    |
        | Priorización por severidad  |
        | Prueba en staging           |
        | Aprobación de cambio        |
        | Implementación en ventana   |
        | Verificación post-parche    |
        | Rollback planificado        |

  Regla: Gestión de configuración se mantiene

    Escenario: Hardening de sistemas
      Dado que se implementa hardening
      Cuando se configura
      Entonces se verifica:
        | Elemento                    |
        | Benchmarks CIS aplicados    |
        | Servicios innecesarios off  |
        | Puertos cerrados            |
        | Logging habilitado          |
        | Cuentas por defecto removidas|

  Regla: Respuesta a incidentes se ejecuta

    Escenario: Proceso de respuesta
      Dado que se detecta incidente de seguridad
      Cuando se activa respuesta
      Entonces se sigue proceso:
        | Fase       | Acciones                          |
        | Preparación| Equipo y herramientas listas      |
        | Detección  | Identificar y clasificar          |
        | Contención | Limitar alcance                   |
        | Erradicación| Eliminar amenaza                 |
        | Recuperación| Restaurar servicio               |
        | Lecciones  | Documentar y mejorar              |

  Regla: Forense digital se preserva

    Escenario: Cadena de custodia
      Dado que se realiza análisis forense
      Cuando se recopila evidencia
      Entonces se verifica:
        | Elemento                    |
        | Imagen bit-a-bit            |
        | Hash de integridad          |
        | Cadena de custodia          |
        | Herramientas forenses       |
        | Documentación completa      |
