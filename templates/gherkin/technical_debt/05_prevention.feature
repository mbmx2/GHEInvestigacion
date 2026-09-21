# language: es
# Deuda Técnica - Prevención
@status:proposed
# @evidence:code
@type:acceptance
@domain:general
# PREVENCIÓN: Evitar que se acumule más deuda técnica
Característica: Prevención de Deuda Técnica (GHE)
  Como equipo del proyecto GHE
  Quiero prevenir la acumulación de deuda técnica
  Para mantener calidad constante

  # ─────────────────────────────────────────────────────────────
  # 1. PRÁCTICAS DE PREVENCIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Prácticas de prevención
    Dado que se aplican prácticas de prevención
    Cuando se desarrolla
    Entonces:
      | Práctica                   | Implementación       |
      | TDD                        | Tests primero, código después |
      | Code review                | 1+ aprobación antes de merge |
      | Definition of Done         | Checklist antes de marcar "listo" |
      | Pair programming           | Para features complejas |
      | Continuous refactoring     | Boy Scout Rule       |
      | Technical debt budget      | 20% del sprint       |

  Escenario: Definition of Done (DoD)
    Dado que se define DoD
    Cuando se completa feature
    Entonces se verifica:
      | Item                       | Estado    |
      | Código escrito con TDD     | ✅         |
      | Tests pasan (100%)         | ✅         |
      | Cobertura >=85%            | ✅         |
      | Code review aprobado       | ✅         |
      | Documentación actualizada | ✅         |
      | Sin code smells críticos  | ✅         |
      | Sin dependencias obsoletas| ✅         |
      | Specs definidos            | ✅         |
      | Changelog actualizado      | ✅         |

  Escenario: Technical debt budget
    Dado que se asigna presupuesto de deuda
    Cuando se planifica sprint
    Entonces:
      | Regla                       |
      | 20% del sprint para reducir deuda |
      | No agregar features nuevas si deuda >30% |
      | Deuda crítica se trata inmediatamente |
      | Deuda acumulada >100 horas requiere sprint dedicado |

  # ─────────────────────────────────────────────────────────────
  # 2. HERRAMIENTAS DE PREVENCIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Linting automático
    Dado que se ejecuta linting en cada commit
    Cuando se detecta problema
    Entonces:
      | Problema detectado          | Acción automática    |
      | Code smell crítico         | Bloquea merge        |
      | Complejidad >10            | Warning              |
      | Función >50 líneas         | Warning              |
      | Variable sin usar          | Error                |

  Escenario: Análisis estático continuo
    Dado que se ejecuta análisis estático
    Cuando se ejecuta en CI/CD
    Entonces:
      | Herramienta                | Qué verifica         |
      | clj-kondo                  | Code smells          |
      | cloverage                  | Cobertura            |
      | lein ancient               | Dependencias         |
      | SonarQube                  | Deuda técnica global |

  # ─────────────────────────────────────────────────────────────
  # 3. CULTURA DE CALIDAD
  # ─────────────────────────────────────────────────────────────

  Escenario: Cultura de calidad
    Dado que se promueve cultura de calidad
    Cuando se trabaja
    Entonces:
      | Acción                      |
      | No aceptar código sin tests |
      | No aceptar código sin review |
      | No aceptar deuda sin justificación |
      | Celebrar reducción de deuda |
      | Documentar decisiones técnicas |

  Escenario: Retrospectiva de calidad
    Dado que se realiza retrospectiva de calidad
    Cuando se evalúa
    Entonces se discuten:
      | Pregunta                   |
      | ¿Creamos deuda nueva este sprint? |
      | ¿Reducimos deuda este sprint? |
      | ¿Qué causó la deuda nueva? |
      | ¿Cómo prevenimos más deuda? |
      | ¿Qué herramientas necesitamos? |
  