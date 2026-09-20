# language: es
Característica: Seguridad de Phishing con IA y Sync
@status:proposed
@type:acceptance
@domain:security
  Como responsable de seguridad del hospital
  Quiero proteger contra phishing avanzado y ataques a sincronización
  Para que datos de pacientes no se comprometan

  Contexto:
    Dado que el sistema está activo
    Y que el usuario tiene rol de seguridad

  Escenario: Phishing avanzado con IA
    Dado que se evalúa riesgo de phishing con IA
    Cuando se protege al personal
    Entonces:
      | Medida                     |
      | Capacitación en detección |
      | Simulacros de phishing    |
      | Email filtering avanzado  |
      | Verificación de enlaces   |

  Escenario: Spear phishing contra personal médico
    Dado que se dirigen al personal
    Cuando se evalúa riesgo
    Entonces:
      | Medida                     |
      | Verificar remitente siempre|
      | No abrir adjuntos sospechosos |
      | Reportar emails sospechosos|
      | Simulacros trimestrales   |

  Escenario: Protección del sync engine
    Dado que GHE sincroniza datos
    Cuando se evalúa seguridad
    Entonces:
      | Medida                     |
      | Datos cifrados en tránsito |
      | Datos cifrados en reposo  |
      | Autenticación de sync     |
      | Verificación de integridad|
      | Resolución de conflictos determinista |

  Escenario: Prevención de automatización de ataques
    Dado que se usan bots para atacar
    Cuando se protege el sistema
    Entonces:
      | Medida                     |
      | Rate limiting adaptativo  |
      | Detección de patrones     |
      | Bloqueo automático de IPs |
      | Monitoreo de comportamiento anómalo |
