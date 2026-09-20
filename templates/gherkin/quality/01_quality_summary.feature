# language: es
Característica: Calidad - ISO 13485 (Resumen Ejecutivo)
@status:proposed
@type:acceptance
@domain:general
  Como director de calidad del hospital
  Quiero verificar que el software cumple ISO 13485
  Para certificar como dispositivo médico

  Contexto:
    Dado que el sistema está activo
    Y que el usuario tiene rol de calidad

  Escenario: Resumen de cumplimiento
    Dado que se evalúa ISO 13485
    Cuando se verifica
    Entonces:
      | Capítulo                   | Estado |
      | Contexto organizacional   | ✅      |
      | Gestión de la calidad     | ✅      |
      | Responsabilidad dirección | ✅      |
      | Gestión de recursos       | ✅      |
      | Realización del producto  | ✅      |
      | Medición, análisis mejora | ✅      |

  Escenario: Documentación requerida
    Dado que se prepara documentación
    Cuando se verifica
    Entonces incluye:
      | Documento                   |
      | Manual de calidad         |
      | Procedimientos operativos |
      | Registros de calidad      |
      | Análisis de riesgos       |
      | Plan de mantenimiento     |
