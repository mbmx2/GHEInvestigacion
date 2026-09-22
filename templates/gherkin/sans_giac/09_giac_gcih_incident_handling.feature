# language: es
# @id GHE-GIAC-009
# @type business-rule
# @domain security
# @layer incident-handling
# @risk s1
# @owner ir-analyst
# @status proposed
# @requirement REQ-GIAC-009
# @risk-control CTRL-GIAC-009
# @regulation GIAC-GCIH SANS
@domain:sans_giac @type:business-rule @risk:s1 @status:proposed
Característica: GIAC GCIH — Manejo de Incidentes de Seguridad
  Como analista de incidentes certificado GCIH
  Quiero metodología GCIH de manejo de incidentes
  Para que los incidentes se manejen con técnicas avanzadas

  Regla: Preparación avanzada

    Escenario: Equipo GCIH preparado
      Dado que equipo tiene certificación GCIH
      Cuando se prepara
      Entonces se verifica:
        | Elemento                    |
        | Playbooks actualizados      |
        | Herramientas forenses listas|
        | Comunicación planificada    |
        | Capacidad de contención     |
        | Preservación de evidencia   |

  Regla: Detección avanzada

    Escenario: Detección de indicadores de compromiso
      Dado que se detecta posible incidente
      Cuando se analiza con técnicas GCIH
      Entonces se verifica:
        | Elemento                    |
        | IoCs técnicos identificados |
        | Patrones de comportamiento  |
        | Correlación de eventos      |
        | Timeline reconstruida       |
        | Alcance determinado         |

  Regla: Contención y erradicación

    Escenario: Contención avanzada
      Dado que incidente está confirmado
      Cuando se contiene
      Entonces se verifica:
        | Elemento                    |
        | Contención por segmento     |
        | Preservación de evidencia   |
        | Servicios críticos          |
        | Comunicación efectiva       |
        | Erradicación completa       |

  Regla: Recuperación y lecciones

    Escenario: Recuperación verificada
      Dado que amenaza está erradicada
      Cuando se recupera
      Entonces se verifica:
        | Elemento                    |
        | Sistemas verificados limpios|
        | Servicios restaurados       |
        | Monitoreo reforzado         |
        | Lecciones documentadas      |
        | Playbooks actualizados      |
