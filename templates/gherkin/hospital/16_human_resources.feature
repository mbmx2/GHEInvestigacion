# language: es
# Recursos Humanos
Característica: Gestión de Recursos Humanos (GHE Hospital)
  Como jefe de RRHH del hospital
  Quiero workflows de recursos humanos
  Para gestionar el personal de forma efectiva

  # ─────────────────────────────────────────────────────────────
  # 1. PROCESO DE SELECCIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Proceso de contratación
    Dado que se necesita cubrir un puesto
    Cuando se inicia proceso
    Entonces:
      | Paso                       |
      | Definir perfil del puesto |
      | Publicar vacante          |
      | Recepción de CVs          |
      | Preselección              |
      | Entrevista inicial        |
      | Prueba técnica            |
      | Entrevista final          |
      | Verificación de referencias|
      | Oferta laboral           |
      | Contratación             |

  # ─────────────────────────────────────────────────────────────
  # 2. INCORPORACIÓN (ONBOARDING)
  # ─────────────────────────────────────────────────────────────

  Escenario: Proceso de incorporación
    Dado que ingresa nuevo empleado
    Cuando se ejecuta onboard
    Entonces incluye:
      | Actividad                  | Duración |
      | Documentación legal       | 1 día    |
      | Capacitación en seguridad | 4 horas  |
      | Tour de instalaciones     | 2 horas  |
      | Presentación con equipo   | 1 hora   |
      | Capacitación en sistemas  | 4 horas  |
      | Periodo de prueba         | 3 meses  |

  # ─────────────────────────────────────────────────────────────
  # 3. CAPACITACIÓN Y DESARROLLO
  # ─────────────────────────────────────────────────────────────

  Escenario: Programa de capacitación
    Dado que se planifica capacitación
    Cuando se ejecuta
    Entonces incluye:
      | Tipo                       | Frecuencia |
      | Inducción (nuevos)         | Al ingreso |
      | Seguridad ocupacional     | Anual      |
      | Atención al paciente      | Semestral  |
      | Primeros auxilios         | Anual      |
      | Actualización profesional | Según necesidad |

  # ─────────────────────────────────────────────────────────────
  # 4. EVALUACIÓN DE DESEMPEÑO
  # ─────────────────────────────────────────────────────────────

  Escenario: Evaluación de desempeño
    Dado que se realiza evaluación
    Cuando se evalúa
    Entonces incluye:
      | Criterio                   | Escala |
      | Cumplimiento de objetivos | 1-5    |
      | Calidad del trabajo       | 1-5    |
      | Puntualidad              | 1-5    |
      | Trabajo en equipo        | 1-5    |
      | Iniciativa               | 1-5    |
      | Capacitación             | 1-5    |

  # ─────────────────────────────────────────────────────────────
  # 5. CONTROL DE ASISTENCIA
  # ─────────────────────────────────────────────────────────────

  Escenario: Control de asistencia
    Dado que se registra asistencia
    Cuando se verifica
    Entonces:
      | Campo                     |
      | Fecha                     |
      | Entrada                   |
      | Salida                    |
      | Horas trabajadas          |
      | Horas extras              |
      | Faltas                    |
      | Permisos justificados     |
      | Permisos injustificados   |

  Escenario: Gestión de vacaciones
    Dado que se gestionaPeriodo vacacional
    Cuando se planifica
    Entonces el sistema verifica:
      | Regla                       |
      | Mínimo 6 días después de 1 año |
      | Máximo 12 días después de 5 años |
      | No más de 2 empleados del mismo turno en vacaciones |
      | Solicitud con 30 días de anticipación |

  # ─────────────────────────────────────────────────────────────
  # 6. RELACIONES LABORALES
  # ─────────────────────────────────────────────────────────────

  Escenario: Manejo de quejas laborales
    Dado que un empleado presenta queja
    Cuando se registra
    Entonces:
      | Paso                       |
      | Recepción de la queja     |
      | Investigación             |
      | Mediación                 |
      | Resolución                |
      | Documentación             |
      | Seguimiento               |

  Escenario: Reglamento interno
    Dado que se establece reglamento
    Cuando se documenta
    Entonces incluye:
      | Sección                   |
      | Horarios y puntualidad    |
      | Código de vestimenta      |
      | Uso de equipo            |
      | Seguridad                |
      | Confidencialidad         |
      | Uso de celulares         |
      | Conducta esperada        |
