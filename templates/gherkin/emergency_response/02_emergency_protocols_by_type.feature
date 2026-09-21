# language: es
# @id GHE-EMERGENCY-TRAUMA-001
# @type safety
# @domain emergency
# @layer clinical
# @risk s0
# @owner emergency-director
# @status proposed
# @requirement REQ-EMERGENCY-TRAUMA
# @risk-control CTRL-EMERGENCY-TRAUMA
# @regulation NOM-004
@domain:emergency @type:safety @risk:s0 @status:proposed
Característica: Protocolos de Emergencia por Tipo
  Como médico de urgencias del hospital
  Quiero protocolos específicos por tipo de emergencia
  Para actuar rápido según la situación

  Regla: Emergencias se clasifican por sistema afectado

    Escenario: Clasificación por sistema
      Dado que llega paciente con emergencia
      Cuando se evalúa
      Entonces:
        | Sistema                   | Protocolo |
        | Cardiovascular            | Dolor torácico, ACV, arritmia |
        | Respiratorio              | Dificultad respiratoria, asma |
        | Neurológico               | Convulsiones, cefalea severa |
        | Gastrointestinal          | Abdomen agudo, hemorragia |
      Y cada sistema tiene protocolo específico

  Regla: Emergencias obstétricas tienen protocolo propio

    Escenario: Emergencia obstétrica
      Dado que llega paciente con emergencia obstétrica
      Cuando se evalúa
      Entonces usa protocolo de maternidad, no general

  Regla: El tiempo de respuesta se mide

    Escenario: Tiempo de respuesta
      Dado que paciente llega a urgencias
      Cuando se evalúa tiempo
      Entonces se registra: hora llegada, hora atención, tiempo total
