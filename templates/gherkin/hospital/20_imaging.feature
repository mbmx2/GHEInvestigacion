# language: es
# Imagenología / Diagnóstico por Imagen
Característica: Gestión de Imagenología (GHE Hospital)
  Como radiólogo del hospital
  Quiero workflows de imagenología
  Para generar estudios de imagen de calidad

  # ─────────────────────────────────────────────────────────────
  # 1. CATÁLOGO DE ESTUDIOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Estudios de imagen disponibles
    Dado que se lista estudios disponibles
    Cuando se consulta
    Entonces:
      | Estudio                    | Indicación |
      | Radiografía de tórax      | Dolor torácico, IRA |
      | Radiografía de abdomen    | Dolor abdominal |
      | Ecografía abdominal       | Dolor abdominal, masas |
      | Ecografía obstétrica      | Control prenatal |
      | Ecocardiograma            | Dolor torácico, IC |
      | TAC craneal               | ACV, trauma       |
      | TAC abdomen               | Dolor abdominal agudo |
      | Mamografía                | Tamizaje mama     |
      | Densitometría ósea        | Osteoporosis      |

  # ─────────────────────────────────────────────────────────────
  # 2. FLUJO DE TRABAJO
  # ─────────────────────────────────────────────────────────────

  Escenario: Flujo completo de estudio de imagen
    Dado que se solicita estudio de imagen
    Cuando se ejecuta el flujo
    Entonces:
      | Paso                       | Responsable |
      | Solicitud del estudio     | Médico      |
      | Verificación de indicación| Radiólogo   |
      | Preparación del paciente  | Técnico     |
      | Adquisición de imagen     | Técnico     |
      | Interpretación            | Radiólogo   |
      | Dictado del reporte       | Radiólogo   |
      | Notificación al médico   | Sistema     |
      | Archivo en expediente     | Sistema     |

  # ─────────────────────────────────────────────────────────────
  # 3. PROTECCIÓN RADIOLÓGICA
  # ─────────────────────────────────────────────────────────────

  Escenario: Protección del paciente
    Dado que se realiza estudio con radiación
    Cuando se verifica protección
    Entonces:
      | Verificación               |
      | Indicación justificada    |
      | Protección gonadal        |
      | Protección tiroides       |
      | Colimación adecuada       |
      | Parámetros optimizados   |

  Escenario: Control de dosis
    Dado que se monitorea dosis de radiación
    Cuando se registra
    Entonces:
      | Dato                       |
      | Dosis por estudio         |
      | Dosis acumulada paciente  |
      | Dosis límite anual        |
      | Estudios realizados/mes   |

  # ─────────────────────────────────────────────────────────────
  # 4. CALIDAD DE IMAGEN
  # ─────────────────────────────────────────────────────────────

  Escenario: Control de calidad de imagen
    Dado que se verifica calidad de imagen
    Cuando se evalúa
    Entonces:
      | Criterio                   | Estado |
      | Imagen nítida             | ✅ |
      | Exposición adecuada       | ✅ |
      | Colimación correcta       | ✅ |
      | Sin artefactos            | ✅ |
      | Identificación del paciente visible | ✅ |

  # ─────────────────────────────────────────────────────────────
  # 5. ECOCARDIOGRAMA
  # ─────────────────────────────────────────────────────────────

  Escenario: Interpretación de ecocardiograma
    Dado que se realiza ecocardiograma
    Cuando se interpreta
    Entonces el sistema registra:
      | Parámetro                  |
      | FEVI (fracción de eyección)|
      | Motilidad parietal         |
      | Válvulas                   |
      | Pericardio                 |
      | Cavidades                  |
      | Presiones estimadas       |
    Y clasifica:
      | FEVI    | Clasificación |
      | >55%    | Normal        |
      | 40-55%  | Leve-disminuida |
      | 30-40%  | Moderadamente disminuida |
      | <30%    | Severamente disminuida |

  # ─────────────────────────────────────────────────────────────
  # 6. MAMOGRAFÍA
  # ─────────────────────────────────────────────────────────────

  Escenario: Interpretación de mamografía
    Dado que se realiza mamografía
    Cuando se interpreta
    Entonces el sistema usa BI-RADS:
      | Categoría                  | Acción |
      | BI-RADS 0                  | Estudio complementario |
      | BI-RADS 1                  | Negativo |
      | BI-RADS 2                  | Benigno |
      | BI-RADS 3                  | Probablemente benigno |
      | BI-RADS 4                  | Sospechoso → biopsia |
      | BI-RADS 5                  | Altamente sospechoso → biopsia |
      | BI-RADS 6                  | Confirmado maligno |
