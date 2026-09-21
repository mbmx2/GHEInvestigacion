# language: es
# @id GHE-DISASTER-RECOVERY-BACKUP-001
# @type safety
# @domain operations
# @layer infrastructure
# @risk s1
# @owner ops-lead
# @status proposed
# @requirement REQ-DISASTER-BACKUP
# @risk-control CTRL-DISASTER-BACKUP
# @regulation NOM-024
@domain:operations @type:safety @risk:s1 @status:proposed
Característica: Backup y Restauración
  Como responsable de operaciones del hospital
  Quiero backup automático y proceso de restauración
  Para que nunca se pierdan datos de pacientes

  Regla: Backup se ejecuta automáticamente

    Escenario: Backup diario
      Dado que son las 2:00 AM
      Cuando se ejecuta backup
      Entonces: backup completo, cifrado, verificación de integridad

  Regla: Backup se verifica

    Escenario: Verificación de backup
      Dado que se completa backup
      Cuando se verifica
      Entonces: hash coincide, tamaño esperado, restauración probada

  Regla: Restauración funciona

    Escenario: Restauración exitosa
      Dado que se necesita restaurar
      Cuando se ejecuta restauración
      Entonces: datos restaurados, integridad verificada, <10 minutos

  Regla: Backup se conserva según política

    Escenario: Retención de backups
      Dado que se gestiona retención
      Cuando se verifica
      Entonces: backup diario 30 días, semanal 3 meses, mensual 1 año
