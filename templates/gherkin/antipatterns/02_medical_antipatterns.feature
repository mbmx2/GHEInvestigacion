# language: es
# Anti-Patrones de Software Médico
@status:proposed
# @evidence:code
@type:acceptance
@domain:quality
Característica: Anti-Patrones Médicos (GHE)
  Como responsable de calidad del proyecto GHE
  Quiero identificar anti-patrones específicos de software médico
  Para prevenir errores que puedan costar vidas

  # ─────────────────────────────────────────────────────────────
  # 1. SIN VALIDACIÓN DE ENTRADA CLÍNICA
  # ─────────────────────────────────────────────────────────────

  Escenario: Detectar falta de validación clínica
    Dado que se procesan datos clínicos
    Cuando se evalúa validación
    Entonces se identifica si:
      | Anti-patrón                | Consecuencia      |
      | Sin validar PA diastólica < sistólica | Datos incorrectos |
      | Sin validar Hb > 0         | Errores de cálculo |
      | Sin validar rango por trimestre | Diagnóstico erróneo |
    Y se corrige: "Implementar specs de validación por trimestre"

  # ─────────────────────────────────────────────────────────────
  # 2. SIN VERIFICACIÓN DE MEDICAMENTOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Detectar prescripción sin verificación
    Dado que se prescriben medicamentos
    Cuando se evalúa seguridad
    Entonces se identifica si:
      | Anti-patrón                | Consecuencia      |
      | Sin verificar teratogenicidad | Malformación fetal |
      | Sin verificar interacciones | Efectos adversos  |
      | Sin verificar dosis por peso | Sobredosis        |
    Y se corrige: "Implementar vademécum obstétrico con validación automática"

  # ─────────────────────────────────────────────────────────────
  # 3. SIN ALERTAS DE ESCALAMIENTO
  # ─────────────────────────────────────────────────────────────

  Escenario: Detectar falta de escalamiento
    Dado que se registran signos vitales
    Cuando se evalúa sistema de alertas
    Entonces se identifica si:
      | Anti-patrón                | Consecuencia      |
      | PA 160/110 sin alerta     | Eclampsia no detectada |
      | Hb 6 sin alerta           | Muerte por anemia  |
      | FCF <110 sin alerta       | Sufrimiento fetal |
    Y se corrige: "Implementar sistema de alertas de escalamiento"

  # ─────────────────────────────────────────────────────────────
  # 4. SIN CONTEXTO DE EMBARAZO
  # ─────────────────────────────────────────────────────────────

  Escenario: Detectar falta de contexto obstétrico
    Dado que se procesan datos de embarazada
    Cuando se evalúa
    Entonces se identifica si:
      | Anti-patrón                | Consecuencia      |
      | Usar valores normales genéricos | Diagnóstico erróneo |
      | No preguntar trimestre    | Alerta perdida     |
      | No verificar edad gestacional | Protocolo inadecuado |
    Y se corrige: "Implementar tabla de valores por trimestre"

  # ─────────────────────────────────────────────────────────────
  # 5. SIN DOBLE VERIFICACIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Detectar falta de doble verificación
    Dado que se procesan datos críticos
    Cuando se evalúa
    Entonces se identifica si:
      | Anti-patrón                | Consecuencia      |
      | Sin doble verificación de prescripción | Error |
      | Sin verificación cruzada  | Error             |
      | Sin confirmación de procedimiento | Error     |
    Y se corrige: "Implementar doble verificación para actos críticos"

  # ─────────────────────────────────────────────────────────────
  # 6. SIN AUDITORÍA CLÍNICA
  # ─────────────────────────────────────────────────────────────

  Escenario: Detectar falta de auditoría
    Dado que se procesan datos de pacientes
    Cuando se evalúa auditoría
    Entonces se identifica si:
      | Anti-patrón                | Consecuencia      |
      | Sin log de acceso          | Sin trazabilidad  |
      | Sin log de modificaciones  | Sin rendición     |
      | Sin log de prescripciones  | Sin accountability |
    Y se corrige: "Implementar audit log inmutable con SHA-256"

  # ─────────────────────────────────────────────────────────────
  # 7. SIN CONSENTIMIENTO INFORMADO
  # ─────────────────────────────────────────────────────────────

  Escenario: Detectar falta de consentimiento
    Dado que se procesan datos de salud
    Cuando se evalúa consentimiento
    Entonces se identifica si:
      | Anti-patrón                | Consecuencia      |
      | Sin consentimiento para ECE | Violación LFPDPPP |
      | Sin consentimiento para sharing | Violación legal |
      | Consentimiento genérico    | No específico      |
    Y se corrige: "Implementar consentimiento informado específico"

  # ─────────────────────────────────────────────────────────────
  # 8. SIN PLAN DE CONTINGENCIA
  # ─────────────────────────────────────────────────────────────

  Escenario: Detectar falta de plan de contingencia
    Dado que se evalúa resiliencia del sistema
    Cuando se verifica
    Entonces se identifica si:
      | Anti-patrón                | Consecuencia      |
      | Sin backup de datos        | Pérdida irreversible |
      | Sin plan de emergencia     | Sistema cae       |
      | Sin rollback plan          | No se puede revertir |
    Y se corrige: "Implementar backup automático + plan de contingencia"

  # ─────────────────────────────────────────────────────────────
  # 9. SIN CAPACITACIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Detectar falta de capacitación
    Dado que se implementa sistema médico
    Cuando se evalúa adopción
    Entonces se identifica si:
      | Anti-patrón                | Consecuencia      |
      | Sin capacitación al equipo | Sistema no usado  |
      | Sin documentación de usuario | Errores frecuentes |
      | Sin champion interno      | Resistencia al cambio |
    Y se corrige: "Programa de capacitación + champion + documentación"

  # ─────────────────────────────────────────────────────────────
  # 10. SIN VALIDACIÓN CLÍNICA
  # ─────────────────────────────────────────────────────────────

  Escenario: Detectar falta de validación clínica
    Dado que se implementa funcionalidad clínica
    Cuando se evalúa
    Entonces se identifica si:
      | Anti-patrón                | Consecuencia      |
      | Sin revisión por médico    | Errores clínicos  |
      | Sin piloto clínico        | No probado en campo |
      | Sin métricas de outcome   | Sin evidencia     |
    Y se corrige: "Revisión clínica obligatoria + piloto + métricas"
