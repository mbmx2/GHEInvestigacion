# language: es
# Propuesta 8: Certificación como Dispositivo Médico
@status:proposed
@type:acceptance
@domain:maternity
Característica: Certificación NOM-024/IEC 62304 (GHE Maternidad)
  Como director del proyecto GHE
  Quiero certificar GHE como dispositivo médico
  Para acceder a mercados institucionales e internacionales

  # ─────────────────────────────────────────────────────────────
  # 1. NOM-024
  # ─────────────────────────────────────────────────────────────

  Escenario: Preparación de expediente NOM-024
    Dado que se prepara solicitud de certificación
    Cuando se documenta
    Entonces incluye:
      | Documento                   |
      | Descripción del sistema     |
      | Análisis de riesgos         |
      | Plan de seguridad           |
      | Resultados de testing       |
      | Plan de mantenimiento       |

  Escenario: Evaluación NOM-024
    Dado que DGIS evalúa el sistema
    Cuando se verifica
    Entonces:
      | Criterio                   | Estado    |
      | SGSI implementado          | ✅         |
      | SIS-CEX (Consulta Externa) | ✅         |
      | Integridad de datos        | ✅         |
      | Confidencialidad           | ✅         |
      | Disponibilidad             | ✅         |
      | Trazabilidad               | ✅         |

  # ─────────────────────────────────────────────────────────────
  # 2. IEC 62304
  # ─────────────────────────────────────────────────────────────

  Escenario: Documentación IEC 62304
    Dado que se prepara documentación IEC 62304
    Cuando se revisa
    Entonces incluye:
      | Documento                   |
      | Software Development Plan  |
      | Software Requirements Spec |
      | Software Architecture Spec |
      | Software Verification Plan |
      | Risk Management File        |
      | Traceability Matrix        |

  Escenario: Clasificación de software
    Dado que se clasifica GHE bajo IEC 62304
    Cuando se evalúa
    Entonces:
      | Criterio                   | Resultado |
      | ¿Puede causar muerte?     | Sí (emergencias) |
      | ¿Puede causar lesión grave?| Sí (prescripciones) |
      | **Clasificación**         | **Clase C** |

  # ─────────────────────────────────────────────────────────────
  # 3. ISO 14971
  # ─────────────────────────────────────────────────────────────

  Escenario: Gestión de riesgos ISO 14971
    Dado que se documenta gestión de riesgos
    Cuando se evalúa
    Entonces:
      | Riesgo                     | Severidad | Probabilidad | Control |
      | Pérdida de expediente      | 5         | 2            | Backup + sync |
      | Prescripción errónea       | 5         | 1            | CDS + validación |
      | Alerta CDS no generada     | 4         | 2            | Monitoreo |
      | Fallo de disponibilidad    | 4         | 1            | Offline-first |

  # ─────────────────────────────────────────────────────────────
  # 4. CERTIFICACIONES
  # ─────────────────────────────────────────────────────────────

  Escenario: Roadmap de certificaciones
    Dado que se planifican certificaciones
    Cuando se establece cronograma
    Entonces:
      | Certificación | Plazo    | Costo estimado |
      | NOM-024       | 3 meses  | $50,000 MXN    |
      | IEC 62304     | 6 meses  | $80,000 MXN    |
      | ISO 13485     | 12 meses | $100,000 MXN   |
      | ISO 14971     | 6 meses  | Incluido en IEC |
