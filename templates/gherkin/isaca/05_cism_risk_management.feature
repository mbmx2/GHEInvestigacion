# language: es
# @id GHE-ISACA-CISM-002
# @type business-rule
# @domain security
# @layer risk
# @risk s1
# @owner security-director
# @status proposed
# @requirement REQ-CISM-002
# @risk-control CTRL-CISM-002
# @regulation CISM ISACA
@domain:isaca @type:business-rule @risk:s1 @status:proposed
Característica: CISM — Gestión de Riesgos de Seguridad de la Información
  Como gerente de seguridad
  Quiero gestión de riesgos de seguridad conforme CISM
  Para que los riesgos de seguridad se identifiquen, evalúen y mitiquen sistemáticamente

  Regla: Evaluación de riesgos de seguridad es periódica

    Escenario: Evaluación semestral de riesgos
      Dado que se realiza evaluación de riesgos de seguridad
      Cuando se ejecuta metodología CISM
      Entonces se evalúan:
        | Activo de información         | Amenazas potenciales           |
        | Expedientes clínicos          | Robo, alteración, divulgación  |
        | Sistema de prescripción       | Manipulación, error intencional|
        | Base de datos de pacientes    | Brecha, ransomware             |
        | Infraestructura de red        | Ataque DDoS, intrusión         |
        | Dispositivos médicos IoT      | Intercepción, manipulación     |

    Escenario: Análisis de amenazas del sector salud
      Dado que se analizan amenazas específicas
      Cuando se revisa intelligence de amenazas
      Entonces se monitorean:
        | Amenaza                       | Fuente        |
        | Ransomware dirigido a salud   | HHS, CISA     |
        | Phishing a personal médico   | ISACA, ENISA  |
        | Explotación de dispositivos   | FDA, ICS-CERT |
        | Insider threats               | Verizon DBIR  |
        | Estado-nación                 | CISA alerts    |

  Regla: Evaluación de impacto usa criterios de negocio

    Escenario: Impacto en continuidad clínica
      Dado que se evalúa impacto de un riesgo
      Cuando se mide impacto en negocio
      Entonces se usa escala:
        | Nivel     | Criterio clínico                   |
        | Crítico   | Pérdida de vida potencial          |
        | Alto      | Interrupción de atención >4 horas  |
        | Medio     | Degradación de calidad de atención |
        | Bajo      | Inconveniencia administrativa      |

  Regla: Respuesta a riesgos se prioriza

    Escenario: Priorización de mitigación
      Dado que se tienen múltiples riesgos evaluados
      Cuando se priorizan para mitigación
      Entonces se usa criterio:
        | Prioridad | Impacto + Probabilidad |
        | 1         | Crítico + Alta/Media   |
        | 2         | Alto + Alta            |
        | 3         | Medio + Alta           |
        | 4         | Resto                 |

  Regla: Controles de seguridad se seleccionan

    Escenario: Selección de controles
      Dado que se seleccionan controles para mitigar riesgo
      Cuando se evalúa efectividad
      Entonces se consideran:
        | Tipo de control | Ejemplos                       |
        | Preventivo      | Cifrado, autenticación, firewalls |
        | Detectivo       | IDS, SIEM, monitoreo de anomalías|
        | Correctivo      | Respuesta a incidentes, backups  |
        | Disuasorio      | Políticas, capacitación, acuerdos|

  Regla: Aceptación de riesgo se documenta

    Escenario: Riesgo aceptado formalmente
      Dado que riesgo residual es aceptable
      Cuando se formaliza aceptación
      Entonces se documenta:
        | Campo                    |
        | Riesgo residual calculado|
        | Justificación de aceptación|
        | Aprobación de propietario|
        | Fecha de revisión        |
        | Condiciones de re-evaluación|

  Regla: Riesgos se monitorean y reportan

    Escenario: Reporte trimestral de riesgos
      Dado que es fin de trimestre
      Cuando se genera reporte
      Entonces incluye:
        | Sección                    |
        | Riesgos nuevos identificados|
        | Riesgos cerrados           |
        | Estado de planes de tratamiento|
        | Cambios en apetito de riesgo|
        | Recomendaciones a dirección|
