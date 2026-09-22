# language: es
# @id GHE-EMRG-003
# @type business-rule
# @domain emergency-response
# @layer disaster
# @risk s1
# @owner emergency-coordinator
# @status proposed
# @requirement REQ-EMRG-003
# @risk-control CTRL-EMRG-003
# @regulation NOM-024
@domain:emergency_response @type:business-rule @risk:s1 @status:proposed
Característica: Protocolos de Emergencia por Tipo de Desastre
  Como coordinador de emergencias
  Quiero protocolos específicos por tipo de desastre
  Para responder efectivamente a cada escenario

  Regla: Terremoto activa protocolo específico

    Escenario: Alerta sísmica
      Dado que se detecta sismo significativo
      Cuando se activa protocolo
      Entonces se ejecuta:
        | Acción                          |
        | Evacuación de pacientes ambulatorios |
        | Asegurar pacientes hospitalizados    |
        | Cortar gas y electricidad          |
        | Activar generador de emergencia    |
        | Verificar estructura del edificio  |
        | Conteo de personal y pacientes     |
        | Activar red de apoyo mutuo        |

    Escenario: Post-terremoto
      Dado que sismo ha pasado
      Cuando se evalúa situación
      Entonces se clasifica por nivel:
        | Nivel  | Acción                              |
        | Verde  | Retorno gradual                     |
        | Amarillo| Triaje externo, refugio temporal  |
        | Rojo   | Evacuación total, búsqueda y rescate|

  Regla: Inundación tiene protocolo de protección

    Escenario: Alerta de inundación
      Dado que nivel de río supera umbral
      Cuando se activa protocolo
      Entonces se ejecuta:
        | Acción                          |
        | Mover pacientes de planta baja  |
        | Resguardar equipos críticos     |
        | Elevar servidores si aplica     |
        | Preparar botiquín de emergencia |
        | Activar bombas de achique       |

  Regla: Incendio tiene protocolo de evacuación

    Escenario: Alarm de incendio
      Dado que se activa alarma de incendio
      Cuando se verifica foco
      Entonces se ejecuta:
        | Acción                          |
        | Evacuación según plan de emergencia|
        | Uso de extintores si seguro     |
        | Llamada a bomberos              |
        | Conteo de pacientes             |
        | Asegurar oxígeno y medicamentos|

  Regorte: Epidemia activa protocolo de contención

    Escenario: Brote infeccioso
      Dado que se detecta incremento de casos sospechosos
      Cuando se evalúa
      Entonces se ejecuta:
        | Acción                          |
        | Aislamiento de casos sospechosos|
        | Activación de protocolo de IEQ |
        | Uso de EPP según riesgo         |
        | Notificación a autoridad sanitaria|
        | Rastreo de contactos            |
        | Capacidad de aislamiento verificada|

  Regla: Emergencia dual gestiona madre y feto

    Escenario: Emergencia obstétrica en desastre
      Dado que hay embarazada en emergencia durante sismo
      Cuando se evalúa
      Entonces prioridad es:
        | Acción                          |
        | Estabilizar a la madre primero  |
        | Monitorear signos fetales       |
        | Evacuar a zona segura           |
        | Preparar para posibles parto    |
        | Contactar neonatólogo           |

  Regla: Comunicación es crítica

    Escenario: Red de comunicación de emergencia
      Dado que comunicación principal está caída
      Cuando se activa red alternativa
      Entonces se usa:
        | Canal             | Prioridad |
        | Radio HF          | 1         |
        | Satelital         | 2         |
        | Mensajería cifrada| 3         |
        | Correo electrónico | 4         |
