# language: es
# PMBOK KA-10: Project Stakeholder Management
@status:proposed
@type:acceptance
@domain:general
# ÁREA DE CONOCIMIENTO: Gestión de Interesados del Proyecto
Característica: Gestión de Interesados (PMBOK KA-10)
  Como director del proyecto GHE
  Quiero gestionar stakeholders de forma efectiva
  Para asegurar satisfacción y soporte del proyecto

  # ─────────────────────────────────────────────────────────────
  # 1. IDENTIFICACIÓN DE STAKEHOLDERS
  # ─────────────────────────────────────────────────────────────

  Escenario: Registro de stakeholders
    Dado que se identifican stakeholders del proyecto
    Cuando se registra
    Entonces se documentan:
      | Stakeholder                | Rol                    | Interés | Influencia | Actitud |
      | Director de la maternidad | Patrocinador           | Alto    | Alta       | Positiva|
      | Médico general            | Usuario primario       | Alto    | Media      | Neutra  |
      | Enfermera obstétrica      | Usuario secundario     | Alto    | Media      | Neutra  |
      | Farmacéutico              | Usuario farmacia       | Medio   | Baja       | Neutra  |
      | COFEPRIS                  | Regulador              | Alto    | Alta       | Neutra  |
      | Secretaría de Salud       | Normativo              | Alto    | Alta       | Neutra  |
      | Pacientes                 | Beneficiarios          | Alto    | Baja       | Positiva|
      | Equipo de desarrollo      | Ejecutores             | Alto    | Media      | Positiva|

  # ─────────────────────────────────────────────────────────────
  # 2. ANÁLISIS DE STAKEHOLDERS
  # ─────────────────────────────────────────────────────────────

  Escenario: Matriz de poder-interés
    Dado que se clasifican stakeholders por poder e interés
    Cuando se genera matriz
    Entonces se muestra:
      | Cuadrante                  | Stakeholders           | Estrategia |
      | Alto poder, Alto interés  | Director maternidad, COFEPRIS | Gestionar de cerca |
      | Alto poder, Bajo interés | Secretaría de Salud    | Satisfacer |
      | Bajo poder, Alto interés | Médicos, enfermeras    | Mantener informados |
      | Bajo poder, Bajo interés | Pacientes generales    | Monitorear |

  Escenario: Plan de engagement de stakeholders
    Dado que se define plan de engagement
    Cuando se documenta
    Entonces se establece:
      | Stakeholder                | Acción                  | Frecuencia |
      | Director maternidad       | Reunión de avance       | Semanal    |
      | Médicos                   | Demo de funcionalidades | Quincenal  |
      | Enfermeras                | Capacitación práctica   | Mensual    |
      | COFEPRIS                  | Reporte de cumplimiento | Trimestral |
      | Equipo técnico            | Sprint review + retro   | Quincenal  |

  # ─────────────────────────────────────────────────────────────
  # 3. GESTIÓN DE ENGAGEMENT
  # ─────────────────────────────────────────────────────────────

  Escenario: Monitoreo de satisfacción de stakeholders
    Dado que se mide satisfacción de stakeholders
    Cuando se aplica encuesta
    Entonces se muestra:
      | Stakeholder                | Satisfacción | Quejas principales |
      | Director maternidad       | 9/10         | Ninguna            |
      | Médicos                   | 7/10         | Velocidad de UI    |
      | Enfermeras                | 8/10         | Capacitación insuficiente |
      | Farmacéutico              | 8/10         | Ninguna            |
    Y se proponen acciones correctivas para quejas

  Escenario: Gestión de resistencia al cambio
    Dado que hay resistencia al cambio en algunos usuarios
    Cuando se identifica resistencia
    Entonces se aplica estrategia:
      | Acción                    |
      | Involucrar desde el diseño|
      | Mostrar beneficios concretos |
      | Capacitación intensiva    |
      | Champion interno (médico que apoya) |
      | Piloto gradual            |
      | Feedback continuo         |
    