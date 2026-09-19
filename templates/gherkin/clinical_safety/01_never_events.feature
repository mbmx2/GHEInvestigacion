# language: es
# Patient Safety: Never Events y Sentinel Events
Característica: Seguridad del Paciente - Eventos Prevenibles (GHE)
  Como responsable de seguridad del paciente
  Quiero protocols para eventos que NUNCA deberían ocurrir
  Para prevenir muertes y lesiones prevenibles

  # ─────────────────────────────────────────────────────────────
  # 1. NEVER EVENTS (EVENTOS QUE NUNCA DEBERÍAN OCURRIR)
  # ─────────────────────────────────────────────────────────────

  Escenario: Never Event - Paciente equivocado
    Dado que se administra tratamiento
    Cuando se verifica identidad
    Entonces el sistema requiere:
      | Verificación               | Método |
      | Identidad del paciente     | Nombre + CURP |
      | Coincidencia con orden médica | Verificación cruzada |
      | Bandera de identificación | Verificada |
    Y el sistema BLOQUEA si hay discrepancia

  Escenario: Never Event - Sitio quirúrgico equivocado
    Dado que se prepara procedimiento quirúrgico
    Cuando se verifica sitio
    Entonces el sistema requiere:
      | Verificación               | Momento |
      | Sitio marcado por cirujano | Pre-ingreso |
      | Verificación con paciente | Pre-anestesia |
      | Verificación en quirófano | Pre-incisión |
      | Time-out quirúrgico       | Pre-incisión |

  Escenario: Never Event - Medicamento equivocado
    Dado que se administra medicamento
    Cuando se verifica
    Entonces el sistema requiere:
      | Verificación               | Método |
      | 5 Correctos               | Verificación |
      | Paciente correcto         | ✅ |
      | Medicamento correcto      | ✅ |
      | Dosis correcta            | ✅ |
      | Vía correcta              | ✅ |
      | Hora correcta             | ✅ |

  Escenario: Never Event - Dosis equivocada
    Dado que se administra medicamento
    Cuando se verifica dosis
    Entonces el sistema:
      | Verificación               | Estado |
      | Dosis dentro de rango     | ✅ |
      | Dosis segura para peso    | ✅ |
      | Dosis segura para edad    | ✅ |
      | Dosis segura para embarazo| ✅ |
    Y BLOQUEA si dosis excede máximo

  # ─────────────────────────────────────────────────────────────
  # 2. SENTINEL EVENTS
  # ─────────────────────────────────────────────────────────────

  Escenario: Definición de sentinel events
    Dado que se clasifican sentinel events
    Cuando se evalúa
    Entonces incluyen:
      | Evento                      | Acción |
      | Muerte o daño grave no relacionado con el curso natural | Investigación inmediata |
      | Pérdida fetal >20 semanas  | Investigación inmediata |
      | Escapada/abandono de paciente | Investigación inmediata |
      | Cirugía en sitio equivocado | Investigación inmediata |
      | Medicamento equivocado con daño | Investigación inmediata |

  Escenario: Respuesta a sentinel event
    Dado que ocurre un sentinel event
    Cuando se activa respuesta
    Entonces:
      | Paso                       | Tiempo |
      | 1. Asegurar seguridad del paciente | Inmediato |
      | 2. Preservar evidencia | Inmediato |
      | 3. Notificar a dirección | <1 hora |
      | 4. Activar equipo de respuesta | <1 hora |
      | 5. Iniciar RCA (Root Cause Analysis) | <24 horas |

  # ─────────────────────────────────────────────────────────────
  # 3. ROOT CAUSE ANALYSIS (RCA)
  # ─────────────────────────────────────────────────────────────

  Escenario: Ejecución de RCA
    Dado que se inicia RCA post-evento
    Cuando se ejecuta
    Entonces el sistema guía:
      | Paso                       | Herramienta |
      | 1. Formar equipo multidisciplinario | Checklist |
      | 2. Recopilar hechos       | Formulario |
      | 3. Identificar causas raíz | Ishikawa / 5 Whys |
      | 4. Clasificar causas      | Categorías |
      | 5. Desarrollar acciones correctivas | Plan |
      | 6. Implementar acciones   | Seguimiento |
      | 7. Verificar eficacia     | Métricas |

  Escenario: Modelo 5 Whys
    Dado que se usa técnica 5 Whys
    Cuando se aplica a un evento
    Entonces:
      | Why 1                       | ¿Por qué murió el paciente? |
      | Why 2                       | Porque no se detectó la complicación |
      | Why 3                       | Porque el sistema no alertó |
      | Why 4                       | Porque la configuración de alertas estaba incorrecta |
      | Why 5                       | Porque no se revisó después de la actualización |

  # ─────────────────────────────────────────────────────────────
  # 4. SWISS CHEESE MODEL
  # ─────────────────────────────────────────────────────────────

  Escenario: Aplicación del modelo Swiss Cheese
    Dado que se aplica el modelo de James Reason
    Cuando se evalúa protección
    Entonces cada capa tiene agujeros:
      | Capa                        | Control           |
      | 1. Diseño del software     | Specs, validación |
      | 2. Implementación          | Tests, review     |
      | 3. Despliegue              | CI/CD, verificación |
      | 4. Uso (humano)            | Capacitación, protocols |
      | 5. Monitoreo               | Alertas, auditoría |
    Y la seguridad es cuando los agujeros NO se alinean

  # ─────────────────────────────────────────────────────────────
  # 5. IDENTIFICACIÓN DE PACIENTE
  # ─────────────────────────────────────────────────────────────

  Escenario: Protocolo de identificación
    Dado que se identifica paciente
    Cuando se verifica
    Entonces el sistema requiere:
      | Verificación               | Método |
      | Nombre completo           | Verbal |
      | CURP o identificación     | Visual (bandera) |
      | Fecha de nacimiento       | Verbal |
      | Alergias conocidas        | Bandera |
    Y se verifica ANTES de cada medicamento, procedimiento o transfusión
