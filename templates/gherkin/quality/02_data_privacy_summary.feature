# language: es
Característica: Privacidad de Datos (Resumen Ejecutivo)
  Como oficial de protección de datos del hospital
  Quiero verificar cumplimiento de privacidad
  Para proteger datos de pacientes y cumplir LFPDPPP

  Contexto:
    Dado que el sistema está activo
    Y que el usuario tiene rol de protección de datos

  Escenario: Clasificación de datos
    Dado que se clasifican datos
    Cuando se evalúa
    Entonces:
      | Dato                       | Clasificación |
      | CURP, nombre              | Sensible      |
      | Diagnósticos, tratamientos| Crítico       |
      | Signos vitales            | Sensible      |

  Escenario: Derechos ARCO
    Dado que paciente solicita acceso/corrección/eliminación
    Cuando se procesa
    Entonces el sistema cumple:
      | Derecho                    | Implementación |
      | Acceso                    | Reporte completo |
      | Rectificación             | Modificación    |
      | Cancelación               | Soft delete     |
      | Oposición                  | Restricción     |

  Escenario: Consentimiento informado
    Dado que se procesan datos sensibles
    Cuando se solicita consentimiento
    Entonces:
      | Criterio                   | Estado |
      | Consentimiento explícito   | ✅      |
      | Propósito específico       | ✅      |
      | Derecho de oposición       | ✅      |
