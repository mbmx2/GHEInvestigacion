# language: es
# Patient Experience
@status:proposed
@type:acceptance
@domain:clinical_safety
Característica: Experiencia del Paciente (GHE Maternidad)
  Como paciente de la maternidad
  Quiero que mi experiencia sea positiva y respetuosa
  Para sentirme cuidada y segura

  # ─────────────────────────────────────────────────────────────
  # 1. JOURNEY DEL PACIENTE
  # ─────────────────────────────────────────────────────────────

  Escenario: Mapa del recorrido del paciente
    Dado que se mapea el journey del paciente
    Cuando se documenta
    Entonces incluye:
      | Etapa                      | Touchpoints |
      | Llegada                   | Recepción, sala de espera |
      | Registro                  | Formulario, identificación |
      | Triaje                    | Evaluación inicial |
      | Consulta                  | Médico, expediente |
      | Farmacia                  | Dispensación |
      | Salida                    | Indicaciones, próxima cita |
      | Seguimiento               | WhatsApp, llamadas |

  # ─────────────────────────────────────────────────────────────
  # 2. GESTIÓN DE TIEMPOS DE ESPERA
  # ─────────────────────────────────────────────────────────────

  Escenario: Monitoreo de tiempos de espera
    Dado que se monitorea tiempo de espera
    Cuando se evalúa
    Entonces:
      | Nivel de triaje | Tiempo máximo | Actual |
      | Nivel 1         | Inmediato     | Verificar |
      | Nivel 2         | 10 min        | Verificar |
      | Nivel 3         | 30 min        | Verificar |
      | Nivel 4         | 60 min        | Verificar |
      | Nivel 5         | 120 min       | Verificar |

  Escenario: Alerta de espera excesiva
    Dado que un paciente espera más del tiempo máximo
    Cuando se detecta
    Entonces el sistema alerta:
      | Alerta                      |
      | "Paciente [nombre] espera [X] minutos (máximo: [Y])" |
      | "Nivel de triaje: [nivel]"  |
      | "Acción: Evaluar o re-clasificar" |

  # ─────────────────────────────────────────────────────────────
  # 3. COMUNICACIÓN CON PACIENTE
  # ─────────────────────────────────────────────────────────────

  Escenario: Guiones de comunicación
    Dado que se definen guiones de comunicación
    Cuando se usan
    Entonces incluyen:
      | Situación                  | Guion |
      | Saludo inicial            | "Buenos días, ¿cómo se llama? ¿Cómo la puedo ayudar?" |
      | Explicar procedimiento    | "Vamos a [procedimiento]. Esto consiste en..." |
      | Dar malas noticias       | "Lamento informarle que..." |
      | Despedida               | "Recuerde [indicaciones]. Si tiene dudas, llame al..." |

  # ─────────────────────────────────────────────────────────────
  # 4. QUEJAS Y SUGERENCIAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Registro de quejas
    Dado que un paciente presenta una queja
    Cuando se registra
    Entonces el sistema captura:
      | Campo                      |
      | Fecha y hora              |
      | Tipo de queja             |
      | Descripción               |
      | Área afectada             |
      | Acción tomada             |
      | Fecha de resolución       |
      | Satisfacción post-resolución |

  Escenario: Clasificación de quejas
    Dado que se clasifican quejas
    Cuando se evalúa
    Entonces:
      | Tipo de queja              | Prioridad |
      | Seguridad del paciente    | Crítica   |
      | Calidad de atención       | Alta      |
      | Tiempo de espera          | Media     |
      | Instalaciones             | Baja      |
      | Trato del personal        | Media     |

  # ─────────────────────────────────────────────────────────────
  # 5. SENSIBILIDAD CULTURAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Atención con sensibilidad cultural
    Dado que se atiende a paciente indígena
    Cuando se evalúa
    Entonces:
      | Acción                      |
      | Respetar lengua materna   |
      | Usar intérprete si es necesario |
      | Respetar creencias culturales |
      | Adaptar educación al contexto cultural |
      | Documentar necesidades especiales |

  # ─────────────────────────────────────────────────────────────
  # 6. ACCESO EN MÚLTIPLES IDIOMAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Soporte multilingüe
    Dado que se atiende a hablantes de lengua indígena
    Cuando se necesita traducción
    Entonces:
      | Recurso                      |
      | Intérprete disponible       |
      | Material educativo en náhuatl (futuro) |
      | Formularios con imágenes   |
      | Guías visuales para pacientes |
