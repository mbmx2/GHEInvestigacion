# language: es
# Propuesta 10: Capacitación Comunitaria
Característica: Programa de Capacitación (GHE Maternidad)
  Como director de la maternidad
  Quiero capacitar a promotoras de salud en uso de GHE
  Para detectar complicaciones en la comunidad

  # ─────────────────────────────────────────────────────────────
  # 1. CURSO DE CAPACITACIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Programa de capacitación para promotoras
    Dado que se diseña programa de capacitación
    Cuando se ejecuta
    Entonces incluye:
      | Módulo | Duración | Contenido |
      | 1. Uso de GHE | 8 horas | Búsqueda, registro, lectura de expediente |
      | 2. Signos de alarma | 8 horas |识别 de complicaciones |
      | 3. Primeros auxilios | 8 horas | Manejo básico de emergencias |
      | 4. Comunicación | 8 horas | Cómo referir paciente |
      | 5. Práctica | 8 horas | Casos simulados |

  Escenario: Evaluación de competencia
    Dado que la promotora completa el curso
    Cuando se evalúa
    Entonces debe aprobar:
      | Evaluación                  | Nota mínima |
      | Examen teórico              | 8/10        |
      | Práctica con caso simulado  | 8/10        |
      | Demostración de uso de GHE  | Competente  |

  # ─────────────────────────────────────────────────────────────
  # 2. MATERIAL DIDÁCTICO
  # ─────────────────────────────────────────────────────────────

  Escenario: Material en lenguaje simple
    Dado que se crea material didáctico
    Cuando se revisa
    Entonces incluye:
      | Recurso                      |
      | Guía ilustrada de signos de alarma |
      | Tarjetas de referencia rápida |
      | Guía de uso de GHE (paso a paso) |
      | Protocolo de referencia      |
      | Números de emergencia        |

  # ─────────────────────────────────────────────────────────────
  # 3. SEGUIMIENTO
  # ─────────────────────────────────────────────────────────────

  Escenario: Seguimiento post-capacitación
    Dado que la promotora está en campo
    Cuando se hace seguimiento
    Entonces:
      | Actividad                   | Frecuencia          |
      | Llamada de mentoría         | Semanal primer mes  |
      | Reunión de grupo            | Mensual             |
      | Evaluación de desempeño     | Trimestral          |
      | Actualización de conocimiento | Cuando cambie protocolo |

  Escenario: Impacto de capacitación
    Dado que se mide impacto
    Cuando se compara antes/después
    Entonces:
      | Métrica                    | Antes  | Después |
      | Detección de complicaciones| 30%    | 65%     |
      | Referencias oportunas      | 40%    | 80%     |
      | Adherencia a controles     | 50%    | 80%     |
      | Satisfacción de pacientes  | 70%    | 90%     |
