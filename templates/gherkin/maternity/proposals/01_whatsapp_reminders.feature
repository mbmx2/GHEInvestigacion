# language: es
# Propuesta 1: App de Recordatorios WhatsApp
@status:proposed
@type:acceptance
@domain:maternity
Característica: Bot de Recordatorios WhatsApp (GHE Maternidad)
  Como paciente embarazada de la maternidad
  Quiero recibir recordatorios por WhatsApp
  Para no olvidar controles, medicamentos y señales de alarma

  # ─────────────────────────────────────────────────────────────
  # 1. RECORDATORIO DE CONTROL PRENATAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Recordatorio automático de próximo control
    Dado que la paciente tiene control programado para el viernes
    Cuando se acerca 48 horas antes
    Entonces el sistema envía WhatsApp:
      | Mensaje                      |
      | "Hola [nombre], recuerde su control prenatal el viernes [fecha] a las [hora]. Traiga sus últimos análisis. Si tiene alguna duda, responda este mensaje." |

  Escenario: Recordatorio de control con estudios pendientes
    Dado que la paciente tiene curva de tolerancia pendiente
    Cuando se acerca el control
    Entonces el sistema agrega:
      | Mensaje adicional            |
      | "Recuerde traer: ayuno 8 horas previas para curva de tolerancia a la glucosa." |

  # ─────────────────────────────────────────────────────────────
  # 2. RECORDATORIO DE MEDICAMENTOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Recordatorio diario de suplementos
    Dado que la paciente toma hierro y ácido fólico
    Cuando son las 8:00 AM
    Entonces el sistema envía:
      | Mensaje                      |
      | "Buenos días [nombre]. Recuerde tomar su hierro y ácido fólico con el desayuno. 💊" |

  Escenario: Recordatorio de medicamento con horario específico
    Dado que la paciente toma Labetalol cada 12 horas
    Cuando son las 8:00 AM y 8:00 PM
    Entonces el sistema envía:
      | Mensaje                      |
      | "Es hora de tomar su Labetalol 100mg. Tráguelo con alimentos." |

  # ─────────────────────────────────────────────────────────────
  # 3. RECORDATORIO DE ESTUDIOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Recordatorio de curva de tolerancia
    Dado que la paciente necesita curva de tolerancia a las 24 semanas
    Cuando se acerca la semana 23
    Entonces el sistema envía:
      | Mensaje                      |
      | "Su próxima semana es ideal para la curva de tolerancia a la glucosa. Recuerde ayunar 8 horas antes. Llame para agendar." |

  Escenario: Recordatorio de Anti-D
    Dado que la paciente es Rh negativo
    Cuando llega a la semana 27
    Entonces el sistema envía:
      | Mensaje                      |
      | "Importante: a las 28 semanas necesita aplicarse Anti-D (vacuna para Rh negativo). Agende su cita." |

  # ─────────────────────────────────────────────────────────────
  # 4. EDUCACIÓN Y SIGNOS DE ALARMA
  # ─────────────────────────────────────────────────────────────

  Escenario: Educación semanal por trimestre
    Dado que la paciente está en el trimestre 2
    Cuando es lunes de cada semana
    Entonces el sistema envía contenido educativo:
      | Semana | Mensaje educativo |
      | 14 | "Semana 14: Su bebé mide 9 cm. Es momento de la ecografía de estructura fetal." |
      | 18 | "Semana 18: El bebé puede oír su voz. Mantenga buena alimentación." |
      | 22 | "Semana 22: Los movimientos del bebé se hacen más fuertes." |
      | 26 | "Semana 26: El bebé abre los ojos. Tire de lado para dormir." |

  Escenario: Alerta de signos de alarma
    Dado que la paciente está en el tercer trimestre
    Cuando el sistema detecta sem >=28
    Entonces envía educación sobre signos de alarma:
      | Mensaje                      |
      | "⚠️ Si presenta: cefalea intensa, visión borrosa, dolor abdominal alto, hinchazón súbita, sangrado vaginal, fiebre >38°C, disminución de movimientos del bebé... ACUDA A EMERGENCIA INMEDIATAMENTE." |

  # ─────────────────────────────────────────────────────────────
  # 5. SEGUIMIENTO POSPARTO
  # ─────────────────────────────────────────────────────────────

  Escenario: Recordatorio de control posparto
    Dado que la paciente tuvo parto hace 5 días
    Cuando se acerca la semana 6 posparto
    Entonces el sistema envía:
      | Mensaje                      |
      | "Su control posparto es la semana que viene. Recuerde traer su expediente y resultados de laboratorio." |

  Escenario: Screening de depresión posparto
    Dado que la paciente tiene 2 semanas posparto
    Cuando el sistema envía encuesta
    Entonces:
      | Mensaje                      |
      | "Hola [nombre], ¿cómo se siente? Responda estas 2 preguntas: 1) ¿Se siente triste o sin esperanza? (Sí/No) 2) ¿Ha perdido interés en cosas que le gustaban? (Sí/No)" |
    Y si responde Sí a ambas:
      | Mensaje                      |
      | "Gracias por su honestidad. Le recomendamos hablar con su médico en la próxima consulta. Si necesita ayuda inmediata, llame al [número]." |

  # ─────────────────────────────────────────────────────────────
  # 6. MÉTRICAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Métricas del bot de WhatsApp
    Dado que se mide efectividad del bot
    Cuando se genera reporte
    Entonces:
      | Métrica                    | Target     |
      | Tasa de entrega           | >95%       |
      | Tasa de lectura           | >80%       |
      | Tasa de respuesta         | >30%       |
      | Adherencia a controles    | +30%       |
      | Detección temprana        | +25%       |
