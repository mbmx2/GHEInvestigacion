# language: es
# ISO 13485 - Sistema de Gestión de Calidad para Dispositivos Médicos
Característica: ISO 13485 - Gestión de Calidad (GHE)
  Como responsable de calidad del proyecto GHE
  Quiero implementar ISO 13485 para software médico
  Para alcanzar certificación como dispositivo médico

  # ─────────────────────────────────────────────────────────────
  # 1. CONTEXTO ORGANIZACIONAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Definición del contexto
    Dado que se define contexto bajo ISO 13485
    Cuando se documenta
    Entonces:
      | Elemento                    | GHE                   |
      | Organización               | Maternidad de Altotonga|
      | Producto                   | Software médico (EHR) |
      | Alcance                    | Expediente, farmacia, triaje, recetas |
      | Partes interesadas         | Médicos, pacientes, COFEPRIS, DGIS |
      | Procesos interactuantes    | Desarrollo, soporte, actualizaciones |

  # ─────────────────────────────────────────────────────────────
  # 2. GESTIÓN DE LA CALIDAD
  # ─────────────────────────────────────────────────────────────

  Escenario: Política de calidad
    Dado que se define política de calidad
    Cuando se documenta
    Entonces incluye:
      | Elemento                    |
      | Compromiso con la calidad   |
      | Satisfacción del paciente   |
      | Cumplimiento normativo      |
      | Mejora continua             |
      | Seguridad del paciente      |

  Escenario: Objetivos de calidad
    Dado que se definen objetivos medibles
    Cuando se establecen
    Entonces:
      | Objetivo                    | Métrica             | Meta      |
      | Seguridad del paciente      | Incidentes          | 0/año    |
      | Cumplimiento normativo      | Auditorías          | 100%     |
      | Satisfacción del usuario    | Encuesta            | >85%     |
      | Calidad del código          | Cobertura tests     | >90%     |
      | Disponibilidad del sistema  | Uptime              | >99.9%   |

  # ─────────────────────────────────────────────────────────────
  # 3. GESTIÓN DE RIESGOS (referencia a ISO 14971)
  # ─────────────────────────────────────────────────────────────

  Escenario: Proceso de gestión de riesgos
    Dado que se implementa gestión de riesgos
    Cuando se ejecuta ciclo
    Entonces:
      | Paso                       |
      | 1. Identificación de peligros |
      | 2. Estimación de riesgos   |
      | 3. Evaluación de riesgos   |
      | 4. Control de riesgos      |
      | 5. Revisión de riesgos     |
    Y el proceso se repite para cada cambio significativo

  # ─────────────────────────────────────────────────────────────
  # 4. REQUISITOS DEL PRODUCTO
  # ─────────────────────────────────────────────────────────────

  Escenario: Requisitos regulatorios
    Dado que se identifican requisitos regulatorios
    Cuando se documentan
    Entonces:
      | Requisito                   | Fuente              |
      | NOM-004-SSA3-2012          | Expediente clínico  |
      | NOM-024-SSA3-2012          | Sistemas de información |
      | IEC 62304                   | Lifecycle software  |
      | ISO 14971                   | Gestión de riesgos  |
      | LFPDPPP                     | Protección datos    |

  # ─────────────────────────────────────────────────────────────
  # 5. DISEÑO Y DESARROLLO
  # ─────────────────────────────────────────────────────────────

  Escenario: Proceso de diseño y desarrollo
    Dado que se documenta proceso de diseño
    Cuando se implementa
    Entonces:
      | Fase                       | Salida              |
      | Planificación              | Design Plan         |
      | Entradas de diseño         | Requisitos          |
      | Salidas de diseño          | Arquitectura, specs |
      | Revisión de diseño         | Review records      |
      | Verificación               | Test results        |
      | Validación                 | Clinical validation |
      | Control de cambios         | Change records      |

  # ─────────────────────────────────────────────────────────────
  # 6. CONTROL DEL PROCESO PRODUCTIVO
  # ─────────────────────────────────────────────────────────────

  Escenario: Control de producción
    Dado que se controla el proceso de "producción" (desarrollo)
    Cuando se ejecuta
    Entonces:
      | Actividad                  | Control             |
      | Desarrollo de código       | Code review + TDD   |
      | Testing                    | Plan de testing     |
      | Release                    | Release checklist   |
      | Despliegue                 | Deployment procedure|
      | Soporte                    | Support procedure   |

  # ─────────────────────────────────────────────────────────────
  # 7. ADQUISICIONES Y PROVEEDORES
  # ─────────────────────────────────────────────────────────────

  Escenario: Gestión de proveedores
    Dado que se gestionan proveedores (librerías, herramientas)
    Cuando se evalúa
    Entonces:
      | Criterio                   | Evaluación          |
      | Calidad del código         | Análisis estático   |
      | Mantenimiento              | Frecuencia de updates|
      | Licencia                   | Compatible          |
      | Seguridad                  | Sin CVEs            |

  # ─────────────────────────────────────────────────────────────
  # 8. IDENTIFICACIÓN Y TRAZABILIDAD
  # ─────────────────────────────────────────────────────────────

  Escenario: Trazabilidad completa
    Dado que se implementa trazabilidad
    Cuando se verifica
    Entonces:
      | Cadena                     | Implementación      |
      | Requisito → Diseño         | Spec → Design doc   |
      | Diseño → Código            | Design → Source     |
      | Código → Test              | Code → Test file    |
      | Test → Resultado           | Test → Test result  |
      | Resultado → Release        | Result → Version    |

  # ─────────────────────────────────────────────────────────────
  # 9. CONTROL DE DOCUMENTOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Gestión de documentos
    Dado que se gestionan documentos del sistema de calidad
    Cuando se verifica
    Entonces:
      | Criterio                   | Estado    |
      | Revisión y aprobación      | ✅         |
      | Control de versiones       | ✅ (Git)   |
      | Distribución controlada    | ✅         |
      | Retención documentada      | ✅         |
      | Eliminación controlada     | ✅         |

  # ─────────────────────────────────────────────────────────────
  # 10. AUDITORÍA INTERNA
  # ─────────────────────────────────────────────────────────────

  Escenario: Programa de auditoría interna
    Dado que se planifica auditoría interna
    Cuando se ejecuta
    Entonces:
      | Frecuencia                 | Alcance             |
      | Trimestral                 | Proceso de desarrollo |
      | Semestral                  | Seguridad            |
      | Anual                      | Sistema completo     |
    Y cada auditoría genera hallazgos y acciones correctivas

  # ─────────────────────────────────────────────────────────────
  # 11. NO CONFORMIDAD Y ACCIONES CORRECTIVAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Manejo de no conformidades
    Dado que se detecta no conformidad
    Cuando se procesa
    Entonces:
      | Paso                       |
      | 1. Identificar no conformidad |
      | 2. Acción inmediata (corrección) |
      | 3. Investigación de causa raíz |
      | 4. Acción correctiva      |
      | 5. Verificar eficacia     |
      | 6. Actualizar documentos  |
