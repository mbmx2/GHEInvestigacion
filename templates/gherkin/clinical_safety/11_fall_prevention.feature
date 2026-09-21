# language: es
# @id GHE-SAFETY-FP-001
# @type safety
# @domain clinical_safety
# @layer clinical
# @risk s2
# @owner nurse-director
# @status proposed
# @requirement REQ-SAFETY-FP
# @risk-control CTRL-SAFETY-FP
# @regulation NOM-004
@domain:clinical_safety @type:safety @risk:s2 @status:proposed
Característica: Prevención de Caídas
  Como responsable de enfermería del hospital
  Quiero evaluar y prevenir caídas de pacientes hospitalizados
  Para reducir lesiones y estancias prolongadas

  Regla: Todo paciente se evalúa por riesgo de caídas

    Escenario: Evaluación al ingreso
      Dado que paciente es hospitalizado
      Cuando se evalúa riesgo de caídas
      Entonces se usa escala:
        | Factor                      | Puntos |
        | Edad >65                   | 1      |
        | Historial de caídas       | 2      |
        | Mareo / inestabilidad     | 2      |
        | Medicamentos sedantes     | 2      |
        | Visión reducida           | 1      |
        | Debilidad muscular         | 1      |
        | Urgencia para orinar      | 1      |
      Y si total ≥3 → medidas preventivas

  Regla: Medidas preventivas se implementan

    Escenario: Medidas activadas
      Dado que paciente tiene riesgo ≥3
      Cuando se activan medidas
      Entonces:
        | Medida                      |
        | Bandera amarilla en cama   |
        | Llamador accesible        |
        | Zapatos antideslizantes   |
        | Barandales de cama        |
        | Iluminación adecuada      |
        | Objetos personales accesibles |
        | Educación al paciente     |

  Regla: Caída se registra y se investiga

    Escenario: Caída registrada
      Dado que paciente sufre una caída
      Cuando se registra
      Entonces incluye:
        | Campo                      |
        | Hora de la caída          |
        | Tipo de caída             |
        | Lesiones resultantes      |
        | Circunstancias           |
        | Medicamentos que tomaba   |
        | Acción tomada            |

    Escenario: Investigación post-caída
      Dado que ocurre una caída
      Cuando se investiga
      Entonces se evalúa:
        | Causa                      |
        | ¿Era prevenible?          |
        | ¿Las medidas estaban activas? |
        | ¿Qué se puede mejorar?   |

  # @invariante INV-FP-001: Todo paciente con riesgo ≥3 tiene medidas activas
  Regla: Riesgo alto implica medidas

    Escenario: Riesgo sin medidas
      Dado que paciente tiene riesgo ≥3
      Cuando NO se activan medidas
      Entonces se genera alerta de calidad
      Y se activan medidas inmediatamente
