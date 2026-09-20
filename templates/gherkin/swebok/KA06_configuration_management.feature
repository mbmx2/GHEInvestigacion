# language: es
# SWEBOK KA-06: Software Configuration Management
@status:proposed
@type:acceptance
@domain:general
# ÁREA DE CONOCIMIENTO: Gestión de Configuración de Software
Característica: Gestión de Configuración (SWEBOK KA-06)
  Como responsable de CM del proyecto GHE
  Quiero gestionar configuración de forma estructurada
  Para garantizar trazabilidad y reproducibilidad

  # ─────────────────────────────────────────────────────────────
  # 1. IDENTIFICACIÓN DE CONFIGURACIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Identificación de elementos de configuración
    Dado que se identifican items de configuración (CI)
    Cuando se registra
    Entonces se documentan:
      | CI                          | Tipo         | Repositorio |
      | Código fuente               | Código       | Git         |
      | Documentación               | Documento    | Git         |
      | Scripts de despliegue       | Script       | Git         |
      | Configuración de base datos | Schema       | Git         |
      | Dependencias (project.clj)  | Configuración| Git         |
      | Tests automatizados         | Código       | Git         |
      | templates Gherkin           | Documento    | Git         |
    Y cada CI tiene identificador único

  Escenario: Versionado de código
    Dado que se usa control de versiones Git
    Cuando se commitea
    Entonces se sigue convención:
      | Acción                      | Convención           |
      | Commit message             | <type>(<scope>): <desc> |
      | Branch feature             | feature/TICKET-nombre |
      | Branch fix                 | fix/TICKET-nombre    |
      | Branch release             | release/X.Y.Z        |
      | Tag                        | vX.Y.Z               |
    Y no se commitea directamente a main

  # ─────────────────────────────────────────────────────────────
  # 2. CONTROL DE CAMBIOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Proceso de control de cambios
    Dado que se solicita cambio en código
    Cuando se implementa
    Entonces se sigue proceso:
      | Paso                       |
      | 1. Crear ticket con descripción |
      | 2. Crear branch desde develop  |
      | 3. Implementar cambio + test   |
      | 4. Push a origin               |
      | 5. Crear Pull Request          |
      | 6. Code review (1+ aprobación) |
      | 7. CI pasa (tests + lint)       |
      | 8. Merge a develop             |
    Y se documenta en changelog

  Escenario: Gestión de ramas
    Dado que se manejan múltiples ramas
    Cuando se consulta estado
    Entonces se muestra:
      | Rama                        | Propósito           | Estado  |
      | main                        | Producción          | Estable |
      | develop                     | Desarrollo          | Activo  |
      | feature/PATIENT-001         | Nuevo feature       | En progreso |
      | fix/PHARM-003               | Corrección          | Completado |
      | release/1.1.0               | Pre-release         | Pendiente  |
    Y no hay ramas huérfanas

  # ─────────────────────────────────────────────────────────────
  # 3. ESTADO Y REPORTES
  # ─────────────────────────────────────────────────────────────

  Escenario: Reporte de estado de configuración
    Dado que se genera reporte de estado
    Cuando se consulta
    Entonces se incluye:
      | Métrica                    | Valor              |
      | Commits esta semana       | 15                 |
      | Pull requests abiertos    | 3                  |
      | Pull requests mergeados   | 12                 |
      | Bugs abiertos             | 5                  |
      | Tests failing             | 0                  |
      | Cobertura de código       | 92%                |

  # ─────────────────────────────────────────────────────────────
  # 4. VERIFICACIÓN Y AUDITORÍA
  # ─────────────────────────────────────────────────────────────

  Escenario: Auditoría de configuración
    Dado que se realiza auditoría de CM
    Cuando se verifica
    Entonces se confirma:
      | Verificación               | Estado    |
      | Todos los CIs versionados | ✅         |
      | Commits siguen convención| ✅         |
      | No hay código sin test    | ✅         |
      | Dependencias actualizadas| ⚠️ Parcial |
      | Documentación sincronizada| ✅         |
    