# language: es
# PMBOK KA-06: Project Resource Management
@status:proposed
# @requirement:PRACTICE-GHE-001
@type:acceptance
@domain:general
# ÁREA DE CONOCIMIENTO: Gestión de Recursos del Proyecto
Característica: Gestión de Recursos (PMBOK KA-06)
  Como director del proyecto GHE
  Quiero gestionar recursos humanos y materiales
  Para tener el equipo adecuado en el momento correcto

  # ─────────────────────────────────────────────────────────────
  # 1. PLANIFICACIÓN DE RECURSOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Definición de roles del proyecto
    Dado que se definen roles necesarios
    Cuando se estructura el equipo
    Entonces se documentan:
      | Rol                         | Responsabilidad     | Dedicación |
      | Director de proyecto        | Gestión integral    | 100%       |
      | Arquitecto de software      | Diseño arquitectura | 100%       |
      | Desarrollador Senior (Clojure)| Implementación    | 100%       |
      | Desarrollador Frontend      | UI/UX               | 100%       |
      | QA Engineer                 | Testing y calidad   | 50%        |
      | Consultor clínico           | Validación médica   | 25%        |
      | DevOps                      | Infraestructura     | 25%        |
    Y cada rol tiene perfil de competencias

  Escenario: Matriz de asignación de recursos (RACI)
    Dado que se crea matriz RACI
    Cuando se asignan responsabilidades
    Entonces se muestra:
      | Actividad                  | Director | Arquitecto | Desarrollador | QA |
      | Definir requisitos         | A        | R          | C             | I  |
      | Diseñar arquitectura       | I        | A          | R             | C  |
      | Implementar código         | I        | C          | A             | I  |
      | Escribir tests             | I        | C          | R             | A  |
      | Revisar código             | I        | R          | C             | A  |
      | Desplegar                  | A        | C          | R             | C  |
      | Documentar                 | I        | R          | R             | C  |
    Y cada letra se define:
      | Letra | Significado        |
      | R     | Responsible (ejecuta) |
      | A     | Accountable (aprueba) |
      | C     | Consulted (consulta) |
      | I     | Informed (informado) |

  # ─────────────────────────────────────────────────────────────
  # 2. ADQUISICIÓN Y DESARROLLO DEL EQUIPO
  # ─────────────────────────────────────────────────────────────

  Escenario: Identificación de brechas de competencias
    Dado que se evalúan competencias del equipo
    Cuando se identifican brechas
    Entonces se documentan:
      | Competencia                | Nivel actual | Nivel requerido | Brecha |
      | Clojure                    | Senior       | Senior          | Ninguna|
      | Arquitectura hexagonal     | Experto      | Experto         | Ninguna|
      | IEC 62304                  | Básico       | Intermedio      | Media  |
      | HL7 FHIR                   | Ninguno      | Básico          | Alta   |
      | Gestión de calidad médica  | Ninguno      | Básico          | Alta   |
    Y se planifica capacitación:
      | Brecha                     | Acción              | Duración |
      | IEC 62304                  | Curso online        | 20 horas |
      | HL7 FHIR                   | Autoestudia + práctica | 40 horas |
      | Calidad médica             | Consultor externo   | 16 horas |

  # ─────────────────────────────────────────────────────────────
  # 3. GESTIÓN DEL EQUIPO
  # ─────────────────────────────────────────────────────────────

  Escenario: Seguimiento de desempeño del equipo
    Dado que se evalúa desempeño del equipo
    Cuando se realiza evaluación trimestral
    Entonces se mide:
      | Miembro                    | Velocity | Calidad | Colaboración | Nota |
      | Dev Senior (Clojure)       | Alta     | Alta    | Excelente    | 9/10 |
      | Dev Frontend               | Media    | Alta    | Buena        | 7/10 |
      | QA Engineer                | Alta     | Alta    | Excelente    | 9/10 |
    Y se identifican áreas de mejora
    Y se planifican acciones de desarrollo
  