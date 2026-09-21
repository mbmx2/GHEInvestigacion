# language: es
# SWEBOK KA-11: Software Engineering Professional Practice
@status:proposed
# @requirement:PRACTICE-GHE-001
@type:acceptance
@domain:general
# ÁREA DE CONOCIMIENTO: Práctica Profesional de Ingeniería de Software
Característica: Práctica Profesional (SWEBOK KA-11)
  Como profesional de ingeniería de software
  Quiero seguir prácticas éticas y profesionales
  Para mantener integridad y responsabilidad social

  # ─────────────────────────────────────────────────────────────
  # 1. ÉTICA PROFESIONAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Código de ética del proyecto GHE
    Dado que se define código de ética para el proyecto
    Cuando se documenta
    Entonces se establecen principios:
      | Principio                   | Aplicación en GHE    |
      | Interés público primero    | La seguridad del paciente es prioridad |
      | Evitar daño                | Nunca comprometer seguridad clínica |
      | Honestidad                 | Documentar limitaciones del sistema |
      | Competencia                | Solo implementar lo que se domina |
      | Confidencialidad           | Proteger datos de pacientes |
      | Colaboración               | Trabajar con equipo clínico |
    Y todo el equipo conoce y acepta estos principios

  Escenario: Responsabilidad ante fallos
    Dado que el sistema tiene un fallo que afecta atención
    Cuando se detecta el fallo
    Entonces se sigue protocolo:
      | Paso                       |
      | 1. Notificar inmediatamente a administración |
      | 2. Activar protocolo de respaldo (papel) |
      | 3. Diagnosticar causa raíz |
      | 4. Implementar corrección urgente |
      | 5. Documentar lecciones aprendidas |
      | 6. Revisar procesos para prevenir recurrencia |

  # ─────────────────────────────────────────────────────────────
  # 2. COMUNICACIÓN EFECTIVA
  # ─────────────────────────────────────────────────────────────

  Escenario: Comunicación con stakeholders clínicos
    Dado que se necesita comunicar estado del proyecto
    Cuando se prepara reporte
    Entonces se adapta al audiencia:
      | Audiencia                  | Formato              |
      | Médicos                    | Demo funcional + beneficios clínicos |
      | Administración             | Dashboard + métricas de negocio |
      | Equipo técnico             | Sprint review + technical debt |
      | Reguladores                | Documento de cumplimiento normativo |
    Y se usa lenguaje apropiado para cada audiencia

  Escenario: Documentación de decisiones
    Dado que se toma una decisión técnica
    Cuando se documenta
    Entonces se registra:
      | Campo                     |
      | Contexto                  |
      | Alternativas evaluadas    |
      | Decisión tomada           |
      | Justificación             |
      | Consecuencias esperadas   |
      | Fecha                     |
      | Responsable               |

  # ─────────────────────────────────────────────────────────────
  # 3. TRABAJO EN EQUIPO
  # ─────────────────────────────────────────────────────────────

  Escenario: Colaboración interdisciplinaria
    Dado que el proyecto requiere trabajo con profesionales de salud
    Cuando se establece colaboración
    Entonces se definen:
      | Rol clínico               | Participación en proyecto |
      | Médico consultor          | Validación de workflows   |
      | Enfermera                 | Pruebas de usabilidad     |
      | Farmacéutico              | Validación de inventario  |
      | Administrador             | Definición de requisitos  |
    Y hay reuniones regulares de alineación
  