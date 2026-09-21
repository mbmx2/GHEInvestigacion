# language: es
# @id GHE-CMMI-CAR-001
# @type compliance
# @domain process
# @layer support
# @risk s2
# @owner qa-lead
# @status proposed
# @requirement CMMI-CAR
# @risk-control CTRL-CMMI-CAR
# @regulation N/A
@domain:process @type:compliance @risk:s2 @status:proposed
Característica: CMMI - Análisis de Causa y Resolución (CAR)
  Como responsable de calidad del proyecto GHE
  Quiero análisis de causa raíz formal
  Para que cada defecto se resuelva en su origen

  Regla: Todo defecto crítico tiene análisis de causa raíz

    Escenario: RCA para defecto crítico
      Dado que se detecta defecto crítico
      Cuando se ejecuta RCA
      Entonces incluye:
        | Elemento                    |
        | Descripción del defecto    |
        | Impacto                    |
        | Causa raíz (5 Whys)       |
        | Categoría de causa        |
        | Acciones correctivas      |
        | Verificación de eficacia  |
      # @evidence EVID-CMMI-CAR-001

  Regla: Se usan herramientas de análisis de causa

    Escenario: Herramientas de RCA
      Dado que se ejecuta análisis
      Cuando se usa herramienta
      Entonces se puede usar:
        | Herramienta               |
        | 5 Whys                    |
        | Diagrama de Ishikawa     |
        | Árbol de fallas           |
        | Análisis de Pareto       |
      # @evidence EVID-CMMI-CAR-002

  Regla: Las acciones correctivas se verifican

    Escenario: Verificación de eficacia
      Dado que se implementan acciones correctivas
      Cuando se verifica
      Entonces se confirma que:
        | Verificación              |
        | El defecto no recurre     |
        | La causa raíz fue eliminada|
        | No se introdujeron nuevos defectos |
      # @evidence EVID-CMMI-CAR-003

  Regla: Las lecciones aprendidas se documentan

    Escenario: Documentación de lecciones
      Dado que se completa análisis de causa
      Cuando se documenta
      Entonces se registra:
        | Campo                      |
        | Lección aprendida         |
        | Aplicación futura         |
        | Acción preventiva         |
      # @evidence EVID-CMMI-CAR-004
