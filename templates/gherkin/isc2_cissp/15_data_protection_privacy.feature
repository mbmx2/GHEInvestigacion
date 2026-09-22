# language: es
# @id GHE-CISSP-015
# @type business-rule
# @domain security
# @layer data-protection
# @risk s1
# @owner dpo
# @status proposed
# @requirement REQ-CISSP-015
# @risk-control CTRL-CISSP-015
# @regulation CISSP-D2 ISC2 LFPDPPP
@domain:isc2_cissp @type:business-rule @risk:s1 @status:proposed
Característica: CISSP — Protección de Datos y Privacidad
  Como oficial de protección de datos
  Quiero protección de datos conforme CISSP y LFPDPPP
  Para que los datos sensibles de pacientes estén protegidos

  Regla: Datos sensibles se identifican

    Escenario: Clasificación de datos sensibles
      Dado que se procesan datos de pacientes
      Cuando se clasifican
      Entonces se identifican como sensibles:
        | Tipo de dato               | Sensibilidad |
        | Historial clínico          | Crítico      |
        | Diagnósticos               | Crítico      |
        | Prescripciones             | Crítico      |
        | Datos genéticos            | Crítico      |
        | Datos de identidad         | Alto         |
        | Datos financieros          | Alto         |
        | Datos de contacto          | Medio        |

  Regla: Consentimiento se gestiona

    Escenario: Consentimiento informado para datos
      Dado que se recopilan datos personales
      Cuando se solicita consentimiento
      Entonces se verifica:
        | Elemento                    |
        | Información clara sobre uso |
        | Consentimiento explícito    |
        | Derecho de revocación       |
        | Registro de consentimiento  |
        | Menores: consentimiento parental|

  Regla: Transferencias internacionales se controlan

    Escenario: Transferencia de datos al extranjero
      Dado que datos se transfieren fuera de México
      Cuando se evalúa
      Entonces se verifica:
        | Elemento                    |
        | Nivel de protección equivalente|
        | Consentimiento del titular  |
        | Cláusulas contractuales     |
        | Registro de transferencia   |

  Regla: Brechas de datos se notifican

    Escenario: Notificación de brecha
      Dado que ocurre brecha de datos personales
      Cuando se evalúa
      Entonces se verifica:
        | Elemento                    |
        | Evaluación de riesgo        |
        | Notificación a INAI         |
        | Notificación a titulares    |
        | Plazo: 72 horas             |
        | Acciones correctivas        |
