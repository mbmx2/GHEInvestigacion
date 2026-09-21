# language: es
# @id GHE-NIST-53-AU-001
# @type compliance
# @domain security
# @layer infrastructure
# @risk s1
# @owner security-lead
# @status proposed
# @requirement NIST-53-AU
# @risk-control CTRL-NIST-53-AU
# @regulation NOM-024
@domain:security @type:compliance @risk:s1 @status:proposed
Característica: NIST 800-53 - Auditoría y Responsabilidad (AU)
  Como responsable de seguridad del hospital
  Quiero auditoría completa según NIST 800-53
  Para que cada acción sea rastreable y auditable

  Regla: AU-2: Eventos de auditoría definidos

    Escenario: Eventos auditados
      Dado que se definen eventos de auditoría
      Cuando se verifica
      Entonces se registra:
        | Evento                      |
        | Login/logout              |
        | Acceso a datos de pacientes|
        | Crear/modificar/eliminar  |
        | Cambio de permisos        |
        | Intento de acceso denegado |
        | Generación de reportes    |

  Regla: AU-3: Contenido de registros de auditoría

    Escenario: Registro completo
      Dado que se registra evento
      Cuando se verifica contenido
      Entonces incluye: timestamp, user ID, acción, entidad, resultado, IP

  Regla: AU-4: Protección de registros

    Escenario: Registros protegidos
      Dado que se almacenan logs
      Cuando se verifica
      Entonces: append-only, hash SHA-256, permisos restrictivos

  Regla: AU-5: Retención de registros

    Escenario: Retención documentada
      Dado que se define retención
      Cuando se verifica
      Entonces: audit log 10 años, system log 1 año

  Regla: AU-6: Revisión de registros

    Escenario: Revisión periódica
      Dado que se revisan logs
      Cuando se audita
      Entonces se verifica: integridad, completitud, consistencia
