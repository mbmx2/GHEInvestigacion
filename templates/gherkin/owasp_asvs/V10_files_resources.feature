# language: es
# @id GHE-ASVS-V10-001
# @type compliance
# @domain security
# @layer infrastructure
# @risk s2
# @owner security-lead
# @status proposed
# @requirement ASVS-V10
# @risk-control CTRL-ASVS-V10
# @regulation NOM-024
@domain:security @type:compliance @risk:s2 @status:proposed
Característica: V10 - Archivos y Recursos
  Como responsable de seguridad del proyecto GHE
  Quiero que los archivos y recursos estén protegidos
  Para que no se acceda, modifique o elimine información no autorizada

  Regla: V10.1 - Acceso a archivos

    Escenario: Permisos restrictivos de archivos
      Dado que se configuran permisos de archivos
      Cuando se verifica
      Entonces:
        | Archivo                     | Permisos |
        | Base de datos              | 600 (solo owner) |
        | Backups                    | 600 (solo owner) |
        | Logs                       | 644 (lectura para todos) |
        | Configuración             | 600 (solo owner) |

  Regla: V10.2 - Prevención de path traversal

    Escenario: Protección contra path traversal
      Dado que se procesa ruta de archivo
      Cuando se valida
      Entonces se rechaza si contiene:
        | Patrón malicioso           |
        | ../                       |
        | ..\\                       |
        | Rutas absolutas           |
        | Caracteres especiales     |

  Regla: V10.3 - Upload de archivos (si aplica)

    Escenario: Upload seguro
      Dado que se permite upload de archivos
      Cuando se procesa
      Entonces:
        | Verificación              |
        | Tipo MIME permitido (whitelist) |
        | Tamaño máximo verificado  |
        | Archivo renombrado        |
        | Almacenado fuera de web root |
        | Escaneado contra malware  |
