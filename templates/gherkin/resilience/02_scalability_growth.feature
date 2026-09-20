# language: es
# @id GHE-RES-SCALE-001
# @type resilience
# @domain architecture
# @layer infrastructure
# @risk s2
# @owner dev-lead
# @status proposed
@domain:architecture @type:resilience @risk:s2 @status:proposed
Característica: Escalabilidad y Crecimiento de Datos
  Como arquitecto del proyecto GHE
  Quiero que el sistema escale correctamente
  Para manejar crecimiento de pacientes y consultas

  Contexto:
    Dado que el hospital atiende pacientes crecientes

  Escenario Outline: Rendimiento según volumen
    Dado que hay <volumen> pacientes registrados
    Cuando se ejecuta búsqueda
    Entonces tiempo respuesta < <objetivo>

    Ejemplos:
      | volumen   | objetivo |
      | 1,000     | 100ms    |
      | 10,000    | 300ms    |
      | 50,000    | 500ms    |
      | 100,000   | 1,000ms  |

  Escenario Outline: Crecimiento de BD según actividad
    Dado que se procesan <operaciones>/mes
    Entonces tamaño BD estimado = "<tamaño>"

    Ejemplos:
      | operaciones | tamaño    |
      | 1,000       | 50MB      |
      | 10,000      | 200MB     |
      | 50,000      | 800MB     |
      | 100,000     | 1.5GB     |

  Escenario: Límites del sistema
    Dado que se evalúan límites
    Cuando se verifica
    Entonces:
      | Límite                     | Valor    |
      | Tamaño máximo BD           | 2GB      |
      | Usuarios concurrentes      | 50       |
      | Operaciones por segundo    | 100      |
      | Tamaño máximo de sync batch| 50 ops   |
      | Retención de datos         | 5 años   |

  Escenario: VACUUM y mantenimiento de BD
    Dado que BD supera 1GB
    Cuando se ejecuta VACUUM
    Entonces:
      | Paso                       |
      | Crear backup antes        |
      | Ejecutar VACUUM           |
      | Verificar integridad      |
      | Archivar registros >3 años|
