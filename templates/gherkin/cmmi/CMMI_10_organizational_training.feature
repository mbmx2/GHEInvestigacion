# language: es
# @id GHE-CMMI-OT-001
# @type compliance
# @domain process
# @layer governance
# @risk s2
# @owner hr-lead
# @status proposed
# @requirement CMMI-OT
# @risk-control CTRL-CMMI-OT
# @regulation N/A
@domain:process @type:compliance @risk:s2 @status:proposed
Característica: CMMI - Capacitación Organizacional (OT)
  Como responsable de recursos humanos del proyecto GHE
  Quiero que el personal esté capacitado en los procesos del proyecto
  Para que cada miembro tenga las habilidades necesarias

  Regla: Se identifican necesidades de capacitación

    Escenario: Evaluación de necesidades
      Dado que se evalúa equipo
      Cuando se identifican brechas
      Entonces se documentan:
        | Competencia                | Nivel actual | Nivel requerido |
        | Clojure                    | Variable    | Intermedio      |
        | Arquitectura hexagonal     | Variable    | Intermedio      |
        | TDD                        | Variable    | Intermedio      |
        | OWASP                      | Variable    | Básico          |
        | IEC 62304                  | Ninguno     | Básico          |
      # @evidence EVID-CMMI-OT-001

  Regla: Se planifica capacitación

    Escenario: Programa de capacitación
      Dado que se tienen necesidades identificadas
      Cuando se planifica
      Entonces incluye:
        | Elemento                    |
        | Tema de capacitación       |
        | Objetivo de aprendizaje    |
        | Método (curso, práctica, mentoring) |
        | Duración                  |
        | Evaluación               |
      # @evidence EVID-CMMI-OT-002

  Regla: Se verifica efectividad de capacitación

    Escenario: Evaluación post-capacitación
      Dado que se completa capacitación
      Cuando se evalúa
      Entonces se verifica:
        | Verificación              |
        | Evaluación aprobada      |
        | Mejora en desempeño      |
        | Aplicación en el trabajo |
      # @evidence EVID-CMMI-OT-003
