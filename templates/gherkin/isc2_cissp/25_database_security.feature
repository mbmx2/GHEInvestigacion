# language: es
# @id GHE-CISSP-025
# @type business-rule
# @domain security
# @layer database-security
# @risk s1
# @owner dba-security
# @status proposed
# @requirement REQ-CISSP-025
# @risk-control CTRL-CISSP-025
# @regulation CISSP-D8 ISC2 NOM-004
@domain:isc2_cissp @type:business-rule @risk:s1 @status:proposed
Característica: CISSP — Seguridad de Bases de Datos
  Como DBA de seguridad
  Quiero seguridad de bases de datos conforme CISSP
  Para que la información clínica en BD esté protegida

  Regla: Acceso a BD se controla

    Escenario: Control de acceso a BD
      Dado que BD contiene datos clínicos
      Cuando se controla acceso
      Entonces se verifica:
        | Elemento                    |
        | Roles por función           |
        | Sin cuentas compartidas     |
        | Principio de mínimo privilegio|
        | Auditoría de accesos        |
        | Revisión trimestral         |

    Escenario: Permisos de BD por rol
      Dado que se asignan permisos de BD
      Cuando se configuran
      Entonces se verifica:
        | Rol                   | Permisos BD              |
        | App GHE               | SELECT/INSERT/UPDATE     |
        | Médico                | SELECT +有限 INSERT     |
        | DBA                   | Admin (con auditoría)    |
        | Auditor               | Solo SELECT              |
        | Backup                | Solo lectura             |

  Regla: Cifrado de BD se implementa

    Escenario: Cifrado de datos sensibles
      Dado que BD tiene datos sensibles
      Cuando se cifran
      Entonces se verifica:
        | Elemento                    |
        | Cifrado en reposo (TDE)     |
        | Cifrado de columnas sensibles|
        | Cifrado de backups          |
        | Gestión de claves separada  |
        | Rendimiento aceptable       |

  Regla: Integridad de BD se verifica

    Escenario: Verificación de integridad
      Dado que se verifica integridad de BD
      Cuando se ejecutan checks
      Entonces se verifica:
        | Elemento                    |
        | Checksums de tablas         |
        | Integridad referencial      |
        | Constraints validados       |
        | Sin registros huérfanos     |
        | Log de verificación         |

  Regla: Backup de BD se protege

    Escenario: Seguridad de backups
      Dado que se generan backups de BD
      Cuando se almacenan
      Entonces se verifica:
        | Elemento                    |
        | Backup cifrado              |
        | Almacenamiento seguro       |
        | Prueba de restauración      |
        | Retención documentada       |
        | Acceso restringido          |
