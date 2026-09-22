# language: es
# @id GHE-CISSP-027
# @type business-rule
# @domain security
# @layer zero-trust
# @risk s1
# @owner zero-trust-architect
# @status proposed
# @requirement REQ-CISSP-027
# @risk-control CTRL-CISSP-027
# @regulation CISSP-D5 ISC2
@domain:isc2_cissp @type:business-rule @risk:s1 @status:proposed
Característica: CISSP — Arquitectura Zero Trust para Hospital
  Como arquitecto de seguridad
  Quiero arquitectura Zero Trust para GHE
  Para que la seguridad no dependa de la ubicación de red

  Regla: Principios Zero Trust se implementan

    Escenario: Fundamentos de Zero Trust
      Dado que se implementa Zero Trust en hospital
      Cuando se definen principios
      Entonces se verifica:
        | Principio                  | Implementación              |
        | Nunca confiar, siempre verificar| Autenticación en cada acceso|
        | Acceso mínimo              | Solo lo necesario           |
        | Asumir brecha              | Monitoreo continuo          |
        | Verificación explícita     | MFA obligatorio             |
        | Microsegmentación          | Red segmentada              |

    Escenario: Microsegmentación de red
      Dado que hospital tiene múltiples sistemas
      Cuando se aplica microsegmentación
      Entonces se verifica:
        | Zona                   | Acceso permitido            |
        | Expedientes            | Soloapp GHE + médicos       |
        | Farmacia               | Solo farmacéuticos + app   |
        | Lab                    | Solo laboratorio + app      |
        | Admin                  | Solo administración         |
        | IoT médico             | Solo monitoreo              |

  Regla: Acceso se verifica continuamente

    Escenario: Verificación continua
      Dado que usuario tiene sesión activa
      Cuando se verifica acceso continuamente
      Entonces se verifica:
        | Elemento                    |
        | Re-autenticación periódica  |
        | Evaluación de contexto      |
        | Ajuste de permisos dinámico |
        | Revocación inmediata si riesgo|

    Escenario: Acceso basado en contexto
      Dado que usuario solicita acceso
      Cuando se evalúa contexto
      Entonces se verifica:
        | Contexto                   | Acción                    |
        | Dispositivo registrado + MFA| Acceso completo           |
        | Dispositivo no registrado  | Acceso limitado + registro|
        | Ubicación inusual          | MFA adicional             |
        | Hora fuera de horario      | Registro + notificación   |

  Regla: Datos se protegen independientemente de ubicación

    Escenario: Protección de datos en Zero Trust
      Dado que datos están en cualquier ubicación
      Cuando se protegen
      Entonces se verifica:
        | Elemento                    |
        | Cifrado independiente de ubicación|
        | Control de acceso basado en identidad|
        | DLP en todas las capas      |
        | Monitoreo de acceso a datos |
