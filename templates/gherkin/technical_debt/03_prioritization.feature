# language: es
# Deuda Técnica - Priorización
@status:proposed
# @evidence:code
@type:acceptance
@domain:general
# PRIORIZACIÓN: Decidir qué deuda reducir primero
Característica: Priorización de Deuda Técnica (GHE)
  Como tech lead del proyecto GHE
  Quiero priorizar deuda técnica de forma objetiva
  Para reducir primero la que tiene mayor impacto

  # ─────────────────────────────────────────────────────────────
  # 1. MATRIZ DE PRIORIZACIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Matriz de priorización de deuda
    Dado que se prioriza deuda técnica
    Cuando se evalúa cada item
    Entonces se usa matriz:
      | Impacto \ Esfuerzo         | Bajo esfuerzo | Alto esfuerzo |
      | Alto impacto               | **HACER AHORA** | PLANIFICAR  |
      | Bajo impacto               | HACER CUANDO HAYA TIEMPO | NO HACER |

  Escenario: Ejemplos de priorización
    Dado que se evalúan items de deuda
    Cuando se clasifican
    Entonces:
      | Item de deuda               | Impacto | Esfuerzo | Prioridad |
      | Agregar tests a módulo farmacia | Alto | Bajo      | **AHORA** |
      | Agregar audit log a domain  | Alto    | Bajo      | **AHORA** |
      | Refactorizar PatientService | Alto    | Alto      | PLANIFICAR|
      | Renombrar variables         | Bajo    | Bajo      | CUANDO    |
      | Migrar de SQLite a Postgres | Bajo    | Alto      | NO HACER  |

  # ─────────────────────────────────────────────────────────────
  # 2. Criterios de Impacto
  # ─────────────────────────────────────────────────────────────

  Escenario: Evaluar impacto en seguridad
    Dado que se evalúa impacto en seguridad
    Cuando se clasifica
    Entonces:
      | Deuda                       | Impacto seguridad   |
      | Sin cifrado de datos        | Crítico             |
      | Sin RBAC                    | Crítico             |
      | Sin audit log               | Alto                |
      | Sin backup                  | Alto                |

  Escenario: Evaluar impacto en calidad clínica
    Dado que se evalúa impacto en calidad clínica
    Cuando se clasifica
    Entonces:
      | Deuda                       | Impacto clínico     |
      | Sin validación de dosis     | Crítico             |
      | Sin alerta de alergias      | Crítico             |
      | Sin recordatorios prenatal  | Alto                |
      | Sin exportación de expediente| Medio              |

  Escenario: Evaluar impacto en mantenibilidad
    Dado que se evalúa impacto en mantenibilidad
    Cuando se clasifica
    Entonces:
      | Deuda                       | Impacto mantenimiento|
      | Funciones >100 líneas      | Alto                |
      | Duplicación >10%           | Alto                |
      | Sin tests en módulo         | Alto                |
      | Cobertura <70%             | Medio               |
      | Nombres inconsistentes      | Bajo                |

  # ─────────────────────────────────────────────────────────────
  # 3. PRIORIZACIÓN POR SPRINT
  # ─────────────────────────────────────────────────────────────

  Escenario: Asignar deuda en sprint planning
    Dado que se planifica sprint
    Cuando se selecciona deuda técnica
    Entonces:
      | Regla                       |
      | 20% del sprint para deuda técnica |
      | Priorizar deuda crítica primero |
      | Combinar con features nuevas |
      | No más de 2 items de deuda por sprint |

  Escenario: Deuda "quick wins"
    Dado que se identifican quick wins
    Cuando se ejecutan
    Entonces:
      | Quick Win                   | Esfuerzo | Impacto |
      | Agregar docstrings          | 1 hora   | Medio   |
      | Corregir nombres            | 2 horas  | Bajo    |
      | Agregar tests unitarios     | 4 horas  | Alto    |
      | Eliminar código muerto      | 2 horas  | Medio   |

  # ─────────────────────────────────────────────────────────────
  # 4. DEUDA TÉCNICA EN GHE
  # ─────────────────────────────────────────────────────────────

  Escenario: Backlog actual de deuda técnica en GHE
    Dado que se revisa backlog de deuda
    Cuando se evalúa
    Entonces:
      | Item                        | Severidad | Prioridad |
      | Sin certificación NOM-024   | Alta      | Alta      |
      | UI tests incompletos        | Media     | Media     |
      | Funciones >50 líneas (3)    | Media     | Media     |
      | Documentación API incompleta| Baja      | Baja      |
      | Dependencias por actualizar (2) | Media | Media     |
  