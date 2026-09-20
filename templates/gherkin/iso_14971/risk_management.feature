# language: es
# ISO 14971 - Gestión de Riesgos para Dispositivos Médicos
@status:proposed
@type:acceptance
@domain:general
Característica: ISO 14971 - Gestión de Riesgos (GHE)
  Como responsable de riesgos del proyecto GHE
  Quiero implementar ISO 14971 para software médico
  Para identificar, evaluar y controlar riesgos que afecten seguridad del paciente

  # ─────────────────────────────────────────────────────────────
  # 1. ANÁLISIS DE PELIGROS
  # ─────────────────────────────────────────────────────────────

  Escenario: Identificación de peligros
    Dado que se identifican peligros del sistema
    Cuando se evalúa cada componente
    Entonces:
      | Peligro                     | Componente          |
      | Pérdida de expediente       | SQLite + sync       |
      | Prescripción errónea        | Receta electrónica  |
      | Alerta CDS no generada      | Motor CDS           |
      | Cálculo erróneo             | Calculadoras        |
      | Acceso no autorizado        | Autenticación       |

  # ─────────────────────────────────────────────────────────────
  # 2. ESTIMACIÓN DEL RIESGO
  # ─────────────────────────────────────────────────────────────

  Escenario: Matriz de severidad × probabilidad
    Dado que se evalúa riesgo
    Cuando se usa matriz
    Entonces:
      | Severidad × Probabilidad   | Nivel de riesgo     |
      | 5×5, 5×4, 4×5             | Inaceptable         |
      | 3×5, 5×3, 4×4             | Alto                |
      | 2×4, 3×3, 4×2             | Medio               |
      | 1×3, 2×2, 3×1             | Bajo                |
      | 1×1, 1×2, 2×1             | Aceptable           |

  # ─────────────────────────────────────────────────────────────
  # 3. CONTROL DE RIESGOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Estrategias de control
    Dado que se implementan controles de riesgo
    Cuando se evalúa eficacia
    Entonces:
      | Estrategia                  | Ejemplo en GHE      |
      | Eliminar el peligro        | No implementar funcionalidad riesgosa |
      | Reducir probabilidad       | Tests automatizados |
      | Reducir severidad          | Alertas de seguridad|
      | Alertar al usuario         | Toast de advertencia|
      | Control administrativo     | Capacitación        |

  # ─────────────────────────────────────────────────────────────
  # 4. REVISIÓN RESIDUAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Evaluación de riesgo residual
    Dado que se aplican controles
    Cuando se evalúa riesgo residual
    Entonces:
      | Criterio                   | Estado    |
      | Riesgo residual aceptable  | ✅         |
      | Nuevos peligros no introducidos | ✅     |
      | Beneficio supera riesgo    | ✅         |

  # ─────────────────────────────────────────────────────────────
  # 5. MONITOREO POST-PRODUCCIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Vigilancia post-venta
    Dado que el sistema está en producción
    Cuando se monitorea
    Entonces:
      | Actividad                  | Frecuencia          |
      | Revisión de incidentes     | Continua            |
      | Análisis de causas raíz    | Por incidente       |
      | Actualización de riesgos   | Trimestral          |
      | Revisión de eficacia de controles | Semestral  |
