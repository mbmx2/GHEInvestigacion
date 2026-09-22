# language: es
# @id GHE-IMAGING-002
# @type business-rule
# @domain imaging
# @layer safety
# @risk s1
# @owner radiology-director
# @status proposed
# @requirement REQ-IMAGING-002
# @risk-control CTRL-IMAGING-002
# @regulation NOM-024 NOM-206
@domain:imaging @type:business-rule @risk:s1 @status:proposed
Característica: Seguridad Radiológica y Dosimetría
  Como físico médico
  Quiero controlar dosis de radiación y verificar protección
  Para minimizar riesgo a pacientes y personal

  Regla: Toda exposición se registra y limita

    Escenario: Registro de dosis por paciente
      Dado que se realiza estudio con radiación ionizante
      Cuando se completa el examen
      Entonces se registra:
        | Campo               |
        | Dosis efectiva (mSv)|
        | Índice de calidad   |
        | Área irradiada      |
        | Tiempo de exposición|
      Y se vincula al expediente del paciente

    Escenario: Límite de dosis superada
      Dado que paciente excede dosis límite anual
      Cuando se intenta programar nuevo estudio
      Entonces sistema genera alerta de sobredosificación
      Y requiere aprobación del físico médico
      # @invariante INV-IMG-DOSIMETRY-001

  Regla: Embarazadas requieren protección especial

    Escenario: Verificación de embarazo antes de RX
      Dado que paciente es mujer en edad fértil
      Cuando se solicita estudio con radiación
      Entonces sistema verifica: última menstruación, posibilidad de embarazo
      Y sugiere alternativa sin radiación si aplica
      # @evidence EVID-IMG-DOSIMETRY-001

    Escenario: Embarazada requiere doble protección
      Dado que paciente está embarazada confirmado
      Cuando se realiza estudio radiológico justificado
      Entonces se aplica: delantal plomado, colir plomado, dosis mínima
      Y se documenta justificación médica

  Regla: Control de calidad de equipos

    Escenario: Calibración trimestral de equipo
      Dado que equipo de rayos X requiere calibración
      Cuando físico médico ejecuta control de calidad
      Entonces verifica:
        | Parámetro              | Acceptable    |
        | Concentración de focal | ≤1.2          |
        | Homogeneidad del campo | ≤30%          |
        | Precisión de mAs       | ±10%          |
        | Fuga de radiación      | ≤1 mGy/h     |

    Escenario: Equipo fuera de tolerancia
      Dado que equipo no cumple tolerancia
      Cuando se detecta
      Entonces se retira de servicio
      Y se genera orden de mantenimiento correctivo

  Regla: Monitoreo de personal expuesto

    Escenario: Dosímetro personal verificado
      Dado que personal de radiología usa dosímetro
      Cuando se revisa dosimetría mensual
      Entonces se verifica que no exceda límites:
        | Categoría        | Límite trimestral |
        | Ocupacional       | 50 mSv/año        |
        | Embarazada        | 1 mSv restante     |
        | Visitante         | 0.5 mSv           |

  Regla: Seguridad opera offline

    Escenario: Registro de dosis sin conexión
      Dado que no hay conexión a red
      Cuando se realiza estudio radiológico
      Entonces se registra dosis localmente
      Y se sincroniza con el sistema central al recuperar conexión
