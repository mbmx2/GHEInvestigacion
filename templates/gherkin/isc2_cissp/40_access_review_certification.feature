# language: es
# @id GHE-CISSP-040
# @type business-rule
# @domain security
# @layer access-review
# @risk s1
# @owner compliance-officer
# @status proposed
# @requirement REQ-CISSP-040
# @risk-control CTRL-CISSP-040
# @regulation CISSP-D5 ISC2 NOM-024
@domain:isc2_cissp @type:business-rule @risk:s1 @status:proposed
Característica: CISSP — Revisión Periódica de Accesos y Certificaciones
  Como oficial de cumplimiento
  Quiero revisiones periódicas de accesos conforme CISSP
  Para que los accesos se revisen y certifiquen regularmente

  Regla: Revisión de accesos es periódica

    Escenario: Revisión trimestral de accesos
      Dado que es momento de revisión trimestral
      Cuando se revisan accesos
      Entonces se verifica:
        | Elemento                    |
        | Todos los accesos revisados |
        | Accesos obsoletos removidos |
        | Permisos excesivos corregidos|
        | Certificación del propietario|
        | Registro de la revisión     |

    Escenario: Revisión por evento
      Dado que ocurre evento que afecta accesos
      Cuando se evalúa
      Entonces se verifica:
        | Evento                      | Acción                   |
        | Cambio de rol               | Revisar permisos         |
        | Baja de empleado            | Revocar acceso           |
        | Incidente de seguridad      | Revisar accesos afectados|
        | Fusión/adquisición          | Revisar accesos heredados|

  Regla: Certificación de accesos se documenta

    Escenario: Proceso de certificación
      Dado que propietario certifica accesos
      Cuando se ejecuta
      Entonces se verifica:
        | Elemento                    |
        | Lista de accesos revisados  |
        | Acciones tomadas            |
        | Excepciones justificadas    |
        | Firma del propietario       |
        | Fecha de certificación      |

  Regla: Accesos fantasma se eliminan

    Escenario: Detección de accesos obsoletos
      Dado que se detectan accesos sin uso
      Cuando se evalúan
      Entonces se verifica:
        | Elemento                    |
        | Último uso verificado       |
        | Propietario notificado      |
        | Plazo para justificar       |
        | Desactivación si no se justifica|
        | Registro de eliminación     |

  Regla: Segregation of duties se verifica

    Escenario: Verificación de segregación
      Dado que se verifica segregación de funciones
      Cuando se audita
      Entonces se verifica:
        | Elemento                    |
        | Conflictos de interés       |
        | Combinaciones prohibidas    |
        | Acciones correctivas        |
        | Documentación               |

  Regla: Métricas de revisión se miden

    Escenario: Dashboard de revisiones
      Dado que se miden métricas de revisión
      Cuando se consulta
      Entonces se verifica:
        | Métrica                     | Meta          |
        | Revisiones completadas      | 100%          |
        | Accesos removidos           | Registrados   |
        | Tiempo de cierre            | <30 días      |
        | Certificaciones pendientes  | 0             |
