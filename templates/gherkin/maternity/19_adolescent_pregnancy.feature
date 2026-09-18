# language: es
# Embarazo Adolescente
Característica: Embarazo en Adolescentes (GHE Maternidad)
  Como médico de la maternidad
  Quiero workflows específicos para embarazo adolescente
  Para atender las necesidades especiales de esta población vulnerable

  # ─────────────────────────────────────────────────────────────
  # 1. IDENTIFICACIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Detección de embarazo adolescente
    Dado que una paciente <20 años acude a consulta
    Cuando se identifica embarazo
    Entonces el sistema clasifica:
      | Edad     | Clasificación        | Riesgo |
      | <15 años | Embarazo en niña     | Muy alto |
      | 15-17 años | Embarazo adolescente temprano | Alto |
      | 18-19 años | Embarazo adolescente tardío | Medio |

  # ─────────────────────────────────────────────────────────────
  # 2. EVALUACIÓN ESPECÍFICA
  # ─────────────────────────────────────────────────────────────

  Escenario: Evaluación integral de adolescente embarazada
    Dado que se evalúa adolescente embarazada
    Cuando se realiza evaluación
    Entonces el sistema incluye áreas adicionales:
      | Área                        |
      | Estado emocional y psicológico |
      | Situación familiar           |
      | Apoyo social                 |
      | Nivel educativo              |
      | Violencia doméstica (screening) |
      | Autonomía reproductiva       |
      | Plan de vida postparto       |

  Escenario: Screening de violencia
    Dado que se evalúa adolescente embarazada
    Cuando se aplica screening de violencia
    Entonces el sistema verifica:
      | Pregunta                    | Respuesta esperada |
      | "Alguien en casa la golpea?" | No               |
      | "Se siente segura en su hogar?" | Sí             |
      | "Alguien la obligó a tener relaciones?" | No  |
    Y si respuesta negativa → escalar inmediatamente

  # ─────────────────────────────────────────────────────────────
  # 3. RIESGOS ESPECÍFICOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Riesgos del embarazo adolescente
    Dado que se evalúa riesgo en adolescente
    Cuando se verifica
    Entonces el sistema identifica:
      | Riesgo                      | frecuencia        |
      | Preeclampsia                | 2-3x más frecuente |
      | Parto prematuro             | 2x más frecuente |
      | Bajo peso al nacer          | 2x más frecuente |
      | Anemia                      | 3x más frecuente |
      | Depresión posparto          | 2x más frecuente |
      | Abandono escolar            | 60%               |
      | Pobreza                     | 80%               |

  # ─────────────────────────────────────────────────────────────
  # 4. APOYO PSICOSOCIAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Intervención psicosocial
    Dado que se identifican factores de riesgo psicosocial
    Cuando se evalúa
    Entonces el sistema sugiere:
      | Intervención                |
      | Referencia a trabajo social |
      | Grupo de apoyo entre pares |
      | Educación continua (continuar estudios) |
      | Planificación familiar posparto |
      | Asesoría sobre derechos reproductivos |
      | Conexión con servicios de apoyo |

  # ─────────────────────────────────────────────────────────────
  # 5. EDUCACIÓN SEXUAL Y REPRODUCTIVA
  # ─────────────────────────────────────────────────────────────

  Escenario: Educación postparto en adolescente
    Dado que la adolescente tuvo su bebé
    Cuando se asesora postparto
    Entonces el sistema incluye:
      | Tema                       |
      | Anticoncepción efectiva    |
      | Lactancia materna          |
      | Retorno a la escuela       |
      | Salud sexual               |
      | Prevención de nuevo embarazo no deseado |
      | Derechos reproductivos     |
