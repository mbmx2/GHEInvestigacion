# language: es
# @id GHE-ASVS-V8-001
# @type compliance
# @domain security
# @layer domain
# @risk s1
# @owner security-lead
# @status proposed
# @requirement ASVS-V8
# @risk-control CTRL-ASVS-V8
# @regulation LFPDPPP
@domain:security @type:compliance @risk:s1 @status:proposed
Característica: V8 - Protección de Datos
  Como responsable de seguridad del proyecto GHE
  Quiero que los datos sensibles estén protegidos según LFPDPPP
  Para que se respete la privacidad de los pacientes

  Regla: V8.1 - Identificación de datos sensibles

    Escenario: Clasificación de datos
      Dado que se clasifican datos del sistema
      Cuando se evalúa sensibilidad
      Entonces:
        | Dato                       | Clasificación |
        | CURP                       | Sensible      |
        | Nombre completo            | Sensible      |
        | Diagnósticos               | Crítico       |
        | Tratamientos               | Crítico       |
        | Alergias                   | Crítico       |
        | Signos vitales             | Sensible      |
        | Recetas médicas            | Crítico       |

  Regla: V8.2 - Minimización de datos

    Escenario: Solo datos necesarios
      Dado que se procesan datos
      Cuando se evalúa
      Entonces:
        | Medida                     |
        | Solo datos necesarios se recolectan |
        | Datos no necesarios se eliminan |
        | Datos anonimizados para reportes |

  Regla: V8.3 - Consentimiento

    Escenario: Consentimiento informado
      Dado que se procesan datos sensibles
      Cuando se solicita consentimiento
      Entonces:
        | Requisito                   | Estado |
        | Consentimiento explícito   | ✅      |
        | Propósito específico       | ✅      |
        | Derecho de oposición       | ✅      |
        | Derecho de acceso          | ✅      |
        | Derecho de rectificación   | ✅      |
        | Derecho de cancelación     | ✅      |

  Regla: V8.4 - Derechos ARCO

    Escenario: Derecho de acceso
      Dado que paciente solicita copia de sus datos
      Cuando se procesa
      Entonces se genera reporte completo y se entrega

    Escenario: Derecho de rectificación
      Dado que paciente solicita corregir datos
      Cuando se procesa
      Entonces se modifican datos y se registra cambio

    Escenario: Derecho de cancelación
      Dado que paciente solicita eliminación
      Cuando se procesa
      Entonces se ejecuta soft delete si no hay obligación legal

  Regla: V8.5 - Retención y eliminación

    Escenario: Retención según normativa
      Dado que se gestiona retención
      Cuando se evalúa
      Entonces:
        | Tipo de dato              | Retención |
        | Expediente clínico        | 5 años    |
        | Consentimientos           | 5 años    |
        | Audit log                 | 10 años   |

  Regla: V8.6 - Prevención de pérdida

    Escenario: Backup periódico
      Dado que se realizan backups
      Cuando se verifica
      Entonces:
        | Medida                     |
        | Backup diario automático  |
        | Backup cifrado AES-256    |
        | Backup offsite            |
        | Prueba de restauración    |
