# language: es
# @id GHE-CISSP-003
# @type business-rule
# @domain security
# @layer ethics
# @risk s2
# @owner ciso
# @status proposed
# @requirement REQ-CISSP-003
# @risk-control CTRL-CISSP-003
# @regulation CISSP-D1 ISC2
@domain:isc2_cissp @type:business-rule @risk:s2 @status:proposed
Característica: CISSP Dominio 1 — Ética Profesional y Código de Conducta
  Como profesional de seguridad de la información
  Quiero adherirme a código de ética CISSP/ISC2
  Para que las prácticas de seguridad sean éticas y responsables

  Regla: Código de ética ISC2 se implementa

    Escenario: Adherencia al código de ética
      Dado que personal de seguridad certificado CISSP
      Cuando ejerce
      Entonces se adhiere a:
        | Principio                   |
        | Proteger el interés público |
        | Actuar con honradez         |
        | Proporcionar servicio competente|
        | Avanzar y proteger la profesión|
        | Mantener confidencialidad   |

    Escenario: Dilemas éticos se resuelven
      Dado que surge dilema ético en seguridad
      Cuando se evalúa
      Entonces se sigue proceso:
        | Paso | Acción                              |
        | 1    | Identificar stakeholders afectados  |
        | 2    | Evaluar opciones                    |
        | 3    | Consultar código de ética           |
        | 4    | Buscar asesoría legal               |
        | 5    | Documentar decisión                 |
        | 6    | Implementar y monitorear            |

  Regla: Conflicto de intereses se gestiona

    Escenario: Declaración de conflictos
      Dado que personal tiene posible conflicto de interés
      Cuando se identifica
      Entonces se declara:
        | Elemento                    |
        | Naturaleza del conflicto    |
        | Partes afectadas            |
        | Medidas de mitigación       |
        | Aprobación de supervisión   |

  Regla: Responsabilidad profesional se define

    Escenario: Responsabilidades del CISO
      Dado que CISO tiene responsabilidades definidas
      Cuando se documentan
      Entonces incluyen:
        | Responsabilidad             |
        | Proteger activos de información|
        | Reportar incidentes         |
        | Mantener competencia        |
        | Colaborar en auditorías     |
        | Educar a la organización    |
        | Cumplir regulaciones        |
