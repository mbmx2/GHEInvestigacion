# language: es
# @id GHE-CISSP-030
# @type business-rule
# @domain security
# @layer policy
# @risk s1
# @owner ciso
# @status proposed
# @requirement REQ-CISSP-030
# @risk-control CTRL-CISSP-030
# @regulation CISSP-D1 ISC2
@domain:isc2_cissp @type:business-rule @risk:s1 @status:proposed
Característica: CISSP — Ciclo de Vida de Políticas de Seguridad
  Como CISO
  Quiero gestión del ciclo de vida de políticas conforme CISSP
  Para que las políticas de seguridad sean vigentes, efectivas y aceptadas

  Regla: Política se crea formalmente

    Escenario: Desarrollo de nueva política
      Dado que se requiere nueva política de seguridad
      Cuando se desarrolla
      Entonces se sigue proceso:
        | Fase       | Acciones                          |
        | Identificación| Necesidad documentada          |
        | Redacción  | Borrador con alcance y objetivos |
        | Revisión   | Stakeholders revisan y comentan  |
        | Aprobación | Dirección aprueba formalmente   |
        | Publicación| Disponible para todo el personal |
        | Capacitación| Personal capacitado            |

  Regla: Política se comunica

    Escenario: Distribución de política
      Dado que política está aprobada
      Cuando se distribuye
      Entonces se verifica:
        | Elemento                    |
        | Acceso universal            |
        | Formato consistente         |
        | Versión controlada          |
        | Acknowledge requerido       |
        | Disponibilidad continua     |

  Regla: Política se revisa periódicamente

    Escenario: Revisión anual de políticas
      Dado que es momento de revisión anual
      Cuando se revisan políticas
      Entonces se verifica:
        | Elemento                    |
        | Relevancia actual           |
        | Cambios regulatorios        |
        | Nuevas amenazas             |
        | Feedback de usuarios        |
        | Efectividad medida          |

    Escenario: Actualización de política
      Dado que política requiere cambios
      Cuando se actualiza
      Entonces se verifica:
        | Elemento                    |
        | Justificación del cambio   |
        | Aprobación actualizada      |
        | Comunicación de cambios     |
        | Capacitación si aplica      |
        | Fecha de efectividad        |

  Regla: Excepciones se gestionan

    Escenario: Solicitud de excepción
      Dado que usuario necesita excepción a política
      Cuando solicita
      Entonces se verifica:
        | Elemento                    |
        | Justificación documentada   |
        | Evaluación de riesgo        |
        | Aprobación del propietario  |
        | Duración limitada           |
        | Controles compensatorios    |
        | Revisión periódica          |

  Regla: Cumplimiento se mide

    Escenario: Auditoría de cumplimiento de políticas
      Dado que se mide cumplimiento de políticas
      Cuando se evalúa
      Entonces se verifica:
        | Métrica                     | Meta          |
        | Políticas aprobadas         | 100%          |
        | Personal capacitado         | 100%          |
        | Excepciones activas         | <5            |
        | Políticas desactualizadas   | 0             |
