# language: es
# @id GHE-SWEBOK-KA01-001
# @type practice
# @domain engineering
# @layer process
# @risk s2
# @owner tech-lead
# @status proposed
# @requirement PRACTICE-GHE-001
# @risk-control CTRL-SWEBOK-KA01
# @regulation N/A
@domain:engineering @type:practice @risk:s2 @status:proposed
Característica: SWEBOK KA-01 - Requisitos de Software
  Como ingeniero de software del proyecto GHE
  Quiero gestionar requisitos de forma estructurada
  Para que cada funcionalidad tenga origen, criterio y verificación

  Regla: Cada requisito tiene ID, descripción y criterio de aceptación

    Escenario: Requisito bien formado
      Dado que se define un requisito para GHE
      Cuando se documenta
      Entonces incluye: ID único, descripción clara, fuente, prioridad, criterio de aceptación, estado
      # @evidence EVID-SWEBOK-KA01-001

    Escenario: Requisito incompleto
      Dado que se detecta requisito sin criterio de aceptación
      Cuando se revisa
      Entonces se bloquea hasta completar
      # @evidence EVID-SWEBOK-KA01-001-N

  Regla: Los requisitos se priorizan con MoSCoW

    Escenario: Priorización correcta
      Dado que se priorizan requisitos
      Cuando se evalúa
      Entonces cada requisito tiene clasificación Must/Should/Could/Won't
      Y "Must" incluye: expediente clínico, offline-first, NOM-004

  # @invariante INV-KA01-001: Todo requisito aprobado tiene feature asociado
  Regla: Todo requisito tiene feature

    Escenario: Trazabilidad completa
      Dado que se tiene un requisito
      Cuando se verifica
      Entonces tiene feature Gherkin asociado con escenarios
      # @evidence EVID-SWEBOK-KA01-002

    Escenario: Requisito sin feature
      Dado que se detecta requisito sin feature
      Cuando se audita
      Entonces se crea feature o se marca como pendiente

  Regla: Cambios de requisitos se gestionan

    Escenario: Cambio controlado
      Dado que un requisito necesita cambio
      Cuando se solicita
      Entonces se evalúa impacto, se aprueba, se actualiza trazabilidad
      # @evidence EVID-SWEBOK-KA01-003
