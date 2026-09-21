# language: es
# @id GHE-SAFETY-PU-001
# @type safety
# @domain clinical_safety
# @layer clinical
# @risk s2
# @owner nurse-director
# @status proposed
# @requirement REQ-SAFETY-PU
# @risk-control CTRL-SAFETY-PU
# @regulation NOM-004
@domain:clinical_safety @type:safety @risk:s2 @status:proposed
Característica: Prevención de Úlceras por Presión
  Como responsable de enfermería del hospital
  Quiero evaluar y prevenir úlceras por presión
  Para que ningún paciente hospitalizado desarrolle úlceras prevenibles

  Regla: Todo paciente con estancia >48h se evalúa

    Escenario: Evaluación de riesgo
      Dado que paciente lleva >48h hospitalizado
      Cuando se evalúa riesgo de úlcera
      Entonces se usa escala de Braden:
        | Factor                      | Puntuación |
        | Percepción sensorial      | 1-4        |
        | Actividad                 | 1-4        |
        | Capacidad de movilidad    | 1-4        |
        | Nutrición                 | 1-4        |
        | Exposición a humedad      | 1-4        |
        | Fricción y deslizamiento  | 1-3        |

  Regla: Medidas preventivas se implementan

    Escenario: Medidas activadas
      Dado que paciente tiene Braden ≤12
      Cuando se activan medidas
      Entonces:
        | Medida                      |
        | Cambio de posición cada 2h |
        | Colchón antiescaras      |
        | Nutrición adecuada       |
        | Hidratación              |
        | Protección de prominencias óseas |
        | Educación al cuidador    |

  Regla: Se vigila integridad de piel

    Escenario: Inspección de piel
      Dado que se inspecciona piel
      Cuando se evalúa
      Entonces se registra para cada prominencia ósea:
        | Prominencia               | Estado |
        | Sacro                     | Evaluar |
        | Talones                  | Evaluar |
        | Codos                    | Evaluar |
        | Tobillos                 | Evaluar |
        | Omóplatos                | Evaluar |

  Regla: La úlcera que se detecta se registra y trata

    Escenario: Úlcera detectada
      Dado que se detecta úlcera por presión
      Cuando se registra
      Entonces incluye:
        | Campo                      |
        | Localización              |
        | Estadio (1-4)             |
        | Tamaño                    |
        | Profundidad               |
        | Tipo de tejido            |
        | Plan de tratamiento       |
        | Foto (si aplica)          |
