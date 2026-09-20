# language: es
# Governance del Ciclo de Vida de Features
Característica: Gestión del Ciclo de Vida de Features (GHE)
  Como tech lead del proyecto GHE
  Quiero gestionar el ciclo de vida de cada feature
  Para que no haya features obsoletos, duplicados ni sin owner

  # ─────────────────────────────────────────────────────────────
  # 1. CREACIÓN DE FEATURE
  # ─────────────────────────────────────────────────────────────

  Escenario: Crear nuevo feature
    Dado que se necesita un nuevo workflow
    Cuando se crea feature
    Entonces debe incluir:
      | Campo                     |
      | ID estable (GHE-DOM-SUB-XXX) |
      | Tags (@domain, @layer, @type, @risk, @owner, @status) |
      | Característica descriptiva|
      | Contexto compartido       |
      | Escenarios con Given/When/Then |

  # ─────────────────────────────────────────────────────────────
  # 2. REVISIÓN PERIÓDICA
  # ─────────────────────────────────────────────────────────────

  Escenario: Revisión trimestral de features
    Dado que es fin de trimestre
    Cuando se revisa cada feature
    Entonces se verifica:
      | Criterio                   | Acción |
      | Feature sigue siendo relevante | Marcar @status:obsolete si no |
      | Owner sigue asignado       | Reasignar si abandonado |
      | Última revisión >6 meses   | Revisar contenido |
      | Tags actualizados          | Actualizar |

  # ─────────────────────────────────────────────────────────────
  # 3. DEPRECIACIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Depreciar feature obsoleto
    Dado que un feature ya no aplica
    Cuando se deprecia
    Entonces:
      | Paso                       |
      | Marcar @status:obsolete    |
      | Agregar nota de deprecación|
      | Mover a directorio deprecated/ |
      | Mantener por 6 meses       |
      | Eliminar después           |

  # ─────────────────────────────────────────────────────────────
  # 4. DUPLICACIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Detección de duplicados
    Dado que se revisan features
    Cuando se detecta contenido similar
    Entonces:
      | Acción                    |
      | Identificar features duplicados |
      | Evaluar cuál es mejor     |
      | Fusionar o eliminar uno   |
      | Actualizar referencias    |
