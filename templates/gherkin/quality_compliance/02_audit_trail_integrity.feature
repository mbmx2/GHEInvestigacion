# language: es
# @id GHE-QUALITY-002
# @type business-rule
# @domain quality
# @layer security
# @risk s1
# @owner quality-director
# @status proposed
# @requirement REQ-QUALITY-002
# @risk-control CTRL-QUALITY-002
# @regulation NOM-024 LFPDPPP
@domain:quality @type:business-rule @risk:s1 @status:proposed
Característica: Trazabilidad e Integridad de Auditoría
  Como oficial de seguridad de la información
  Quiero trazabilidad completa de acciones en el sistema
  Para detectar accesos no autorizados y preservar evidencia legal

  Regla: Toda acción se registra en audit log

    Escenario: Registro de acceso a expediente
      Dado que usuario accede a expediente clínico
      Cuando se realiza la consulta
      Entonces se registra:
        | Campo          | Valor                |
        | Timestamp      | ISO-8601 con TZ      |
        | Usuario        | ID y rol             |
        | Acción         | lectura/escritura    |
        | Recurso        | ID del expediente    |
        | IP/dispositivo | Origen de conexión   |
        | Resultado      | éxito/fallo          |

    Escenario: Registro de modificación de receta
      Dado que médico modifica prescripción
      Cuando se guarda el cambio
      Entonces audit trail registra:
        | Campo              | Valor                    |
        | Campo original     | Valor anterior           |
        | Campo modificado   | Valor nuevo              |
        | Timestamp          | ISO-8601                 |
        | Justificación      | Obligatoria para médicos |

  Regla: Audit trail es inmutable

    Escenario: Intento de modificar audit trail
      Dado que se intenta modificar registro de auditoría
      Cuando se evalúa la acción
      Entonces el sistema rechaza la operación
      Y genera alerta de integridad
      # @invariante INV-QUALITY-AUDIT-001

    Escenario: Verificación de integridad periódica
      Dado que se ejecuta verificación de integridad
      Cuando se comparan hashes
      Entonces se verifica que ningún registro fue alterado
      Y se genera reporte de integridad

  Regla: Retención de logs según normativa

    Escenario: Retención mínima de 5 años
      Dado que se configura política de retención
      Cuando se define período de retención
      Entonces es mínimo 5 años para logs de acceso
      Y mínimo 15 años para registros clínicos
      # @evidence EVID-QUALITY-AUDIT-001

    Escenario: Alerta de purga inminente
      Dado que logs están próximos a purgarse
      Cuando faltan 30 días para expiración
      Entonces sistema genera alerta al administrador
      Y sugiere backup o extensión de retención

  Regla: Búsqueda de auditoría es eficiente

    Escenario: Búsqueda por rango de fechas
      Dado que auditor solicita logs de un período
      Cuando ejecuta búsqueda
      Entonces resultados se muestran en <5 segundos
      Y pueden filtrarse por usuario, acción, recurso

    Escenario: Alerta por actividad sospechosa
      Dado que usuario falla autenticación 5 veces consecutivas
      Cuando se detecta patrón
      Entonces sistema bloquea cuenta temporalmente
      Y genera alerta de seguridad
      # @invariante INV-QUALITY-AUDIT-002
