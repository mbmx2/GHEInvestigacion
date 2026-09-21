# language: es
# @id GHE-SAFETY-RRT-001
# @type safety
# @domain clinical_safety
# @layer clinical
# @risk s1
# @owner medical-director
# @status proposed
# @requirement REQ-SAFETY-RRT
# @risk-control CTRL-SAFETY-RRT
# @regulation NOM-004
@domain:clinical_safety @type:safety @risk:s1 @status:proposed
Característica: Equipo de Respuesta Rápida (RRT)
  Como responsable de emergencias del hospital
  Quiero un equipo de respuesta rápida activable
  Para intervenir antes de que un deterioro se convierta en paro

  Regla: Todo deterioro activa el RRT

    Escenario: Criterios de activación
      Dado que se detecta deterioro
      Cuando se evalúa
      Entonces se activa RRT si:
        | Criterio                   |
        | PA <90 o >200             |
        | FC <50 o >130            |
        | FR >30 o <8              |
        | SpO2 <90%                |
        | Glasgow <12              |
        | Fiebre >40°C             |
        | Convulsiones             |
        | Dolor torácico           |
        | Sangrado activo          |

  Regla: El RRT responde en <5 minutos

    Escenario: Respuesta rápida
      Dado que se activa RRT
      Cuando se evalúa tiempo
      Entonces respuesta en <5 minutos

  Regla: El RRT documenta su intervención

    Escenario: Documentación de RRT
      Dado que RRT interviene
      Cuando se documenta
      Entonces incluye:
        | Campo                      |
        | Hora de activación        |
        | Hora de llegada           |
        | Evaluación inicial        |
        | Intervenciones realizadas |
        | Resultado                 |
        | Destino del paciente      |
