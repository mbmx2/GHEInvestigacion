# language: es
# Propuesta 4: Telemedicina Obstétrica
Característica: Telemedicina para Embarazo (GHE Maternidad)
  Como paciente embarazada en zona remota
  Quiero consultar con mi médico por video
  Para no tener que viajar horas para un control

  # ─────────────────────────────────────────────────────────────
  # 1. VIDEOCONSULTA
  # ─────────────────────────────────────────────────────────────

  Escenario: Agendar videoconsulta
    Dado que la paciente necesita control prenatal
    Cuando solicita videoconsulta
    Entonces el sistema:
      | Paso                       |
      | 1. Verifica que esté en control activo |
      | 2. Muestra horarios disponibles |
      | 3. Agenda cita virtual    |
      | 4. Envía enlace por WhatsApp |
      | 5. Recuerda 30 min antes  |

  Escenario: Ejecución de videoconsulta
    Dado que es hora de la videoconsulta
    Cuando médico y paciente se conectan
    Entonces el sistema:
      | Componente                  | Disponible          |
      | Video WebRTC               | ✅                   |
      | Chat de texto              | ✅                   |
      | Compartir pantalla         | ✅                   |
      | Grabación (con consentimiento) | ⚠️ Futuro      |

  Escenario: Registro de videoconsulta
    Dado que se completa videoconsulta
    Cuando se guarda
    Entonces incluye:
      | Campo                      |
      | Fecha y hora               |
      | Duración                   |
      | Motivo de consulta         |
      | Signos vitales auto-reportados |
      | Diagnóstico                |
      | Tratamiento                |
      | Próxima cita               |

  # ─────────────────────────────────────────────────────────────
  # 2. MONITOREO REMOTO
  # ─────────────────────────────────────────────────────────────

  Escenario: Auto-registro de signos vitales
    Dado que la paciente tiene equipo básico en casa
    Cuando mide sus signos vitales
    Entonces el sistema:
      | Acción                      |
      | Recibe datos por WhatsApp   |
      | Valida contra rangos        |
      | Almacena en expediente      |
      | Alerta si valor crítico     |

  Escenario: Alerta remota por PA alta
    Dado que la paciente reporta PA 150/95 por WhatsApp
    Cuando el sistema valida
    Entonces:
      | Acción                      |
      | Clasifica como "PA alta"   |
      | Notifica al médico         |
      | Envía mensaje a paciente: "Su PA está alta. Acuda a emergencia o llame a su médico." |

  # ─────────────────────────────────────────────────────────────
  # 3. RECETA DIGITAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Receta digital post-videoconsulta
    Dado que el médico indica tratamiento
    Cuando genera receta
    Entonces:
      | Acción                      |
      | Receta se genera en PDF     |
      | Se envía por WhatsApp       |
      | Se vincula a expediente     |
      | Farmacia recibe notificación|

  # ─────────────────────────────────────────────────────────────
  # 4. MÉTRICAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Métricas de telemedicina
    Dado que se mide efectividad
    Cuando se genera reporte
    Entonces:
      | Métrica                    | Target     |
      | Videoconsultas/mes         | >20        |
      | Satisfacción paciente      | >85%       |
      | Tiempo de espera           | <15 min    |
      | Tasa de no-show            | <10%       |
      | Detección de complicaciones| +20%       |
