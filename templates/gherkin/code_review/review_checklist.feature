# language: es
# Code Review
Característica: Revisión de Código (GHE)
  Como tech lead del proyecto GHE
  Quiero revisar código antes de merge
  Para mantener calidad y consistencia

  # ─────────────────────────────────────────────────────────────
  # 1. CHECKLIST DE CODE REVIEW
  # ─────────────────────────────────────────────────────────────

  Escenario: Checklist de revisión
    Dado que se revisa un PR
    Cuando se evalúa
    Entonces se verifica:
      | Categoría                  | Criterio            |
      | **Funcionalidad**          | |
      | | Cumple requisitos        | Sí                  |
      | | Maneja edge cases        | Sí                  |
      | | Errores manejados        | Sí                  |
      | **Calidad**                | |
      | | Código claro y legible   | Sí                  |
      | | Sin code smells          | Sí                  |
      | | Funciones <50 líneas     | Sí                  |
      | | Nombres descriptivos     | Sí                  |
      | **Seguridad**              | |
      | | Sin vulnerabilidades     | Sí                  |
      | | Input validado           | Sí                  |
      | | Sin secrets hardcodeados | Sí                  |
      | **Tests**                  | |
      | | Tests unitarios          | Sí                  |
      | | Tests de integración     | Sí (si aplica)      |
      | | Cobertura >=85%          | Sí                  |
      | **Documentación**          | |
      | | Docstrings actualizados  | Sí                  |
      | | Changelog actualizado    | Sí                  |
      | | README actualizado       | Sí (si aplica)      |

  # ─────────────────────────────────────────────────────────────
  # 2. ERRORES COMUNES A BUSCAR
  # ─────────────────────────────────────────────────────────────

  Escenario: Errores críticos a detectar
    Dado que se revisa código
    Cuando se buscan errores críticos
    Entonces:
      | Error                       | Acción              |
      | SQL injection               | Rechazar PR         |
      | XSS                         | Rechazar PR         |
      | Hardcoded secrets           | Rechazar PR         |
      | Sin validación de input     | Rechazar PR         |
      | Sin manejo de errores       | Solicitar corrección|
      | Código sin tests            | Solicitar tests     |

  Escenario: Code smells a detectar
    Dado que se buscan code smells
    Cuando se revisa
    Entonces:
      | Code smell                  | Acción              |
      | Función >50 líneas         | Solicitar refactor  |
      | Duplicación >5%            | Solicitar extracción|
      | Complejidad >10            | Solicitar simplificación|
      | Variable sin usar          | Solicitar eliminación|
      | Magic numbers              | Solicitar constantes|

  # ─────────────────────────────────────────────────────────────
  # 3. PROCESO DE REVIEW
  # ─────────────────────────────────────────────────────────────

  Escenario: Flujo de code review
    Dado que se solicita code review
    Cuando se ejecuta
    Entonces:
      | Paso                       |
      | 1. Autor crea PR con descripción |
      | 2. Asignar reviewer        |
      | 3. Reviewer revisa (max 1 día) |
      | 4. Feedback: approve / request changes |
      | 5. Si changes → autor corrige |
      | 6. Re-review si es necesario |
      | 7. Merge cuando approve    |

  Escenario: Comentarios en review
    Dado que se hacen comentarios
    Cuando se escriben
    Entonces:
      | Tipo                       | Formato             |
      | Bloqueante (debe corregirse)| "BLOCK: [problema]" |
      | Sugerencia (opcional)      | "NIT: [mejora]"     |
      | Pregunta                   | "QUESTION: [duda]"  |
      | Elogio                     | "GOOD: [buen código]"|

  # ─────────────────────────────────────────────────────────────
  # 4. MÉTRICAS DE REVIEW
  # ─────────────────────────────────────────────────────────────

  Escenario: Métricas de code review
    Dado que se miden métricas
    Cuando se genera reporte
    Entonces:
      | Métrica                    | Objetivo     |
      | Tiempo promedio de review  | <1 día       |
      | Tasa de aprobación primera vez | >80%    |
      | Comments por PR            | 3-5 promedio |
      | Reviewers por PR           | 1-2          |
  