# language: es
# SWEBOK KA-10: Software Quality
# ÁREA DE CONOCIMIENTO: Calidad de Software
Característica: Calidad de Software (SWEBOK KA-10)
  Como responsable de calidad del proyecto GHE
  Quiero garantizar estándares de calidad de software médico
  Para cumplir IEC 62304 y proteger vidas

  # ─────────────────────────────────────────────────────────────
  # 1. CALIDAD DEL PRODUCTO
  # ─────────────────────────────────────────────────────────────

  Escenario: Modelo de calidad ISO 25010
    Dado que se evalúa calidad según ISO 25010
    Cuando se mide cada característica
    Entonces se verifica:
      | Característica             | Criterio GHE         | Estado |
      | Funcionalidad adecuación   | Cumple requisitos    | ✅     |
      | Fiabilidad                 | >99% uptime offline  | ✅     |
      | Usabilidad                 | Aprendizaje <2 horas | ✅     |
      | Eficiencia de desempeño    | <200ms respuesta     | ✅     |
      | Mantenibilidad             | Modular, testable    | ✅     |
      | Portabilidad               | Multi-SO             | ✅     |
      | Seguridad                  | Cifrado + RBAC       | ✅     |
      | Compatibilidad             | Browsers modernos    | ✅     |

  Escenario: Aseguramiento de calidad (SQA)
    Dado que se implementa SQA
    Cuando se ejecutan actividades
    Entonces se incluyen:
      | Actividad                  | Frecuencia          |
      | Revisiones de código       | Continua            |
      | Revisiones de diseño       | Por sprint          |
      | Auditorías de proceso      | Trimestral          |
      | Análisis estático          | En cada commit      |
      | Métricas de calidad        | Semanal             |
      | Evaluación de riesgos      | Por release         |

  # ─────────────────────────────────────────────────────────────
  # 2. MÉTRICAS DE CALIDAD
  # ─────────────────────────────────────────────────────────────

  Escenario: Métricas de código
    Dado que se miden métricas de código
    Cuando se ejecuta análisis
    Entonces se verifican:
      | Métrica                    | Objetivo            |
      | Complejidad ciclomatica   | <10 por función     |
      | Líneas de código por función | <50               |
      | Duplicación de código     | <3%                 |
      | Deuda técnica             | <5 días             |
      | Cobertura de código       | >85%                |
      | Code smells               | 0 críticos          |

  Escenario: Métricas de proceso de calidad
    Dado que se miden métricas de proceso
    Cuando se genera reporte
    Entonces se incluyen:
      | Métrica                    | Valor actual        |
      | Densidad de defectos       | <0.5/KLOC           |
      | Eficiencia de remediación| >90%                |
      | Cumplimiento de standards | >95%                |
      | Satisfacción del usuario  | >85%                |

  # ─────────────────────────────────────────────────────────────
  # 3. CALIDAD EN SOFTWARE MÉDICO
  # ─────────────────────────────────────────────────────────────

  Escenario: Cumplimiento IEC 62304 - Calidad
    Dado que se evalúa calidad según IEC 62304
    Cuando se verifican requisitos
    Entonces se confirma:
      | Requisito IEC 62304        | Estado |
      | Plan de desarrollo documentado | ✅  |
      | Análisis de riesgos       | ✅     |
      | Diseño de arquitectura    | ✅     |
      | Implementación con estándares | ✅  |
      | Verificación completa     | ✅     |
      | Validación clínica        | 🔄 Pendiente |
      | Trazabilidad completa     | 🔄 Parcial |
      | Documentación de mantenimiento | ✅ |

  Escenario: Control de calidad en entregas
    Dado que se prepara una entrega
    Cuando se ejecuta checklist de calidad
    Entonces se verifica:
      | Item                       | Estado    |
      | Todos los tests pasan     | ✅         |
      | Cobertura >= 85%          | ✅         |
      | Code review completado    | ✅         |
      | Documentación actualizada| ✅         |
      | Changelog escrito         | ✅         |
      | Sin bugs S1/S2 abiertos  | ✅         |
      | Security scan limpio      | ✅         |
      | Performance dentro de objetivos | ✅  |
    