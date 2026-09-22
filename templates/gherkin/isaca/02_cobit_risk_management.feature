# language: es
# @id GHE-ISACA-COBIT-002
# @type business-rule
# @domain governance
# @layer compliance
# @risk s1
# @owner governance-director
# @status proposed
# @requirement REQ-COBIT-002
# @risk-control CTRL-COBIT-002
# @regulation COBIT-2019
@domain:isaca @type:business-rule @risk:s1 @status:proposed
Característica: COBIT 2019 — Gestión de Riesgos de TI
  Como gestor de riesgos
  Quiero gestionar riesgos de TI conforme COBIT 2019
  Para que los riesgos tecnológicos se mantengan dentro del apetito de riesgo del hospital

  Regla: Identificación de riesgos es sistemática

    Escenario: Registro de riesgos de TI
      Dado que se realiza identificación de riesgos
      Cuando se registra cada riesgo
      Entonces se documenta:
        | Campo                | Descripción                    |
        | ID del riesgo        | Identificador único            |
        | Categoría            | Operacional/estratégico/legal  |
        | Descripción          | Qué puede fallar               |
        | Causa raíz           | Por qué podría ocurrir         |
        | Impacto              | Consecuencia en el negocio     |
        | Probabilidad         | Likelihood de ocurrencia       |
        | Propietario          | Responsable del riesgo         |
        | Controls existentes  | Mitigaciones actuales          |

    Escenario: Riesgos críticos de hospital digital
      Dado que se identifican riesgos específicos del contexto hospitalario
      Cuando se evalúan
      Entonces se incluyen:
        | Riesgo                              | Impacto |
        | Pérdida de expedientes clínicos     | Crítico |
        | Fallo de sistema de prescripción    | Crítico |
        | Brecha de datos de pacientes        | Crítico |
        | Fallo de sincronización offline     | Alto    |
        | Error en cálculos médicos           | Crítico |
        | Ransomware en infraestructura       | Crítico |

  Regla: Evaluación de riesgos usa criterios definidos

    Escenario: Matriz de valoración de riesgos
      Dado que se evalúa un riesgo
      Cuando se calcula valor de riesgo
      Entonces se usa fórmula: Riesgo = Impacto × Probabilidad
      Y se clasifica:
        | Valor | Clasificación | Acción           |
        | 20-25 | Crítico       | Mitigar inmediato|
        | 15-19 | Alto          | Plan de acción   |
        | 10-14 | Medio         | Monitoreo        |
        | 5-9   | Bajo          | Aceptar          |
        | 1-4   | Mínimo        | Documentar       |

  Regla: Respuesta a riesgos se documenta

    Escenario: Selección de estrategia de respuesta
      Dado que riesgo ha sido evaluado
      Cuando se selecciona estrategia
      Entonces se elige entre:
        | Estrategia   | Cuándo aplicarla            |
        | Mitigar      | Reducir impacto/probabilidad|
        | Transferir   | Seguro o tercero            |
        | Aceptar      | Costo-beneficio justificado |
        | Evitar       | Eliminar la actividad       |

    Escenario: Plan de tratamiento documentado
      Dado que se selecciona estrategia de mitigación
      Cuando se crea plan de tratamiento
      Entonces incluye:
        | Campo               |
        | Acciones específicas|
        | Responsable         |
        | Fecha de cierre     |
        | Presupuesto         |
        | Evidencia de cierre |

  Regla: Apetito de riesgo se define y comunica

    Escenario: Definición de apetito de riesgo
      Dado que comité de gobierno define apetito de riesgo
      Cuando se establece
      Entonces se define para cada categoría:
        | Categoría            | Apetito     |
        | Seguridad de datos   | Cero tolerancia|
        | Disponibilidad       | >99.5%      |
        | Integridad clínica   | Cero tolerancia|
        | Cumplimiento normativo| 100%        |
        | Continuidad del negocio| >99%       |

  Regla: Riesgos se monitorean continuamente

    Escenario: Tablero de riesgos
      Dado que se consulta tablero de riesgos
      Entonces muestra:
        | Métrica                     | Valor esperado  |
        | Riesgos críticos abiertos   | <3              |
        | Riesgos mitigados este mes  | >5              |
        | Planes de tratamiento vencidos| 0             |
        | Cobertura de evaluación     | 100%            |
        | Tiempo promedio de cierre   | <30 días        |
