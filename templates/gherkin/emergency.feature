# language: es
Característica: Atención de Urgencias
  Como médico de urgencias
  Quiero atender emergencias de forma rápida
  Para estabilizar y salvar vidas

  Contexto:
    Dado que el sistema está activo
    Y que el usuario tiene rol de médico de urgencias

  Escenario: Nivel 1 - Resucitación
    Dado que paciente llega con Glasgow 6, PA 70/40, SpO2 82%
    Cuando se evalúa
    Entonces el sistema:
      | Acción                          | Resultado         |
      | Clasificar                      | NIVEL 1 ROJO     |
      | Generar ALARMA MÁXIMA          | ✅                |
      | Notificar TODO el equipo       | ✅                |
      | Mensaje                       | ATENCIÓN INMEDIATA|

  Escenario: Nivel 2 - Emergencia
    Dado que paciente llega con dolor torácico intenso, PA 160/100
    Cuando se evalúa
    Entonces el sistema:
      | Acción                          | Resultado         |
      | Clasificar                      | NIVEL 2 NARANJA  |
      | Alertar cardiólogo de guardia  | ✅                |
      | Estimar espera                 | 10 min           |

  Escenario: Nivel 3 - Urgente
    Dado que paciente llega con fiebre 39.5°C + cefalea + rigidez de nuca
    Cuando se evalúa
    Entonces el sistema:
      | Acción                          |
      | Clasificar NIVEL 3 AMARILLO   |
      | Sugerir punción lumbar        |
      | Estimar espera: 30 min       |

  Escenario: Nivel 4 - Menos urgente
    Dado que paciente llega con traumatismo de muñeca
    Cuando se evalúa
    Entonces sistema clasifica NIVEL 4 VERDE, espera 60 min

  Escenario: Nivel 5 - No urgente
    Dado que paciente llega con resfriado común
    Cuando se evalúa
    Entonces sistema clasifica NIVEL 5 AZUL, sugiere consulta externa, espera 120 min

  Escenario: Politraumatismo
    Dado que paciente llega en politraumatismo por accidente vial
    Cuando médico realiza evaluación primaria (ATLS)
      | Vía aérea    | Permeable       |
      | Respiración  | 24 rpm          |
      | Circulación  | PA 90/60, FC 120|
      | Glasgow      | 14              |
    Y evaluación secundaria
      | Hallazgo     | Detalle         |
      | Tórax        | Tórax inestable |
      | Abdomen      | Dolor difuso    |
      | Extremidades  | Fx abierta fémur|
    Entonces el sistema genera:
      | Acción                          |
      | Hoja de trauma automática     |
      | Registrar tiempos (llegada, evaluación) |
      | Sugerir: RX tórax/pelvis, TAC craneal, FAST |

  Escenario: Paro cardíaco
    Dado que paciente presenta PCR
    Cuando se inicia RCP
    Entonces el sistema registra:
      | Hito                     | Hora            |
      | Detección del paro       | Automática      |
      | Inicio RCP               | Automática      |
      | Desfibrilación           | Si aplica       |
      | Adrenalina               | Si aplica       |
    Y muestra cronómetro + genera reporte post-RCP

  Escenario: Intoxicación por paracetamol
    Dado que paciente ingirió 20 tabletas de paracetamol hace 2h
    Cuando médico registra intoxicación
    Entonces el sistema:
      | Acción                          |
      | Calcular dosis: 10,000mg      |
      | Cruzar con nomograma          |
      | Sugerir NAC según protocolo   |
      | Generar labs: paracetam sérico, BHC, función hepática |

  Escenario: Nota de egreso
    Dado que paciente fue estabilizado
    Cuando médico genera nota de egreso
    Entonces el sistema genera documento con:
      | Sección                   |
      | Motivo, exploración, diagnóstico |
      | Tratamiento, indicaciones |
      | Destino (domicilio/hospitalización/referencia) |
    Y genera receta de egreso

  Escenario: Historial de visitas
    Dado que paciente tiene visitas previas a urgencias
    Cuando médico abre expediente
    Entonces sistema muestra historial con frecuencia de visitas
