# language: es
# @id GHE-SAFETY-WP-001
# @type safety
# @domain clinical_safety
# @layer clinical
# @risk s0
# @owner medical-director
# @status proposed
# @requirement REQ-SAFETY-WP
# @risk-control CTRL-SAFETY-WP
# @regulation NOM-004
@domain:clinical_safety @type:safety @risk:s0 @status:proposed
Característica: Prevención de Error de Paciente, Lugar y Procedimiento
  Como responsable de seguridad del paciente
  Quiero que NUNCA se administre tratamiento al paciente equivocado,
    en el sitio equivocado o de procedimiento equivocado
  Para prevenir Never Events que causan muerte

  Regla: Toda administración requiere identificación positiva de paciente

    Escenario: Verificación de identidad antes de medicamento
      Dado que se va a administrar medicamento
      Cuando se verifica identidad
      Entonces se comprueba:
        | Verificación              |
        | Nombre completo verbal   |
        | CURP o identificación visual |
        | Fecha de nacimiento verbal |
      Y si no coincide → se detiene la administración

    Escenario: Verificación de identidad antes de procedimiento
      Dado que se va a realizar un procedimiento
      Cuando se verifica identidad
      Entonces se comprueba contra la orden médica

  Regla: Toda cirugía requiere marcado del sitio

    Escenario: Marcado quirúrgico
      Dado que se programa cirugía
      Cuando se marca el sitio
      Entonces:
        | Verificación              |
        | Cirujano marca el sitio   |
        | Paciente confirma         |
        | Marca visible antes de anestesia |
        | Verificación en quirófano |

  Regla: El checklist quirúrgico OMS se ejecuta

    Escenario: Time-out quirúrgico
      Dado que se realiza cirugía
      Cuando se ejecuta time-out
      Entonces se verifica:
        | Verificación              |
        | Identidad del paciente    |
        | Sitio quirúrgico          |
        | Procedimiento planeado    |
        | Consentimiento            |
        | Alergias                  |
        | Antibioticoprofilaxis    |

  # @invariante INV-WP-001: No se ejecuta ningún acto clínico sin verificación de identidad
  Regla: Identificación verificada siempre

    Escenario: Acto sin verificación
      Dado que se va a ejecutar un acto clínico
      Cuando NO se verifica identidad
      Entonces el acto es BLOQUEADO
      Y se registra el intento
