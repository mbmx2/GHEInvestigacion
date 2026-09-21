# language: es
# GUIX User First - Prevención de Errores
@status:proposed
# @requirement:PRACTICE-GHE-001
@type:acceptance
@domain:general
# PREVENCIÓN DE ERRORES: Evitar que el usuario cometa errores
Característica: Prevención de Errores (GUIX User First - GHE)
  Como usuario de GHE
  Quiero que el sistema prevenga mis errores
  Para que no haya información incorrecta en expedientes

  # ─────────────────────────────────────────────────────────────
  # 1. PREVENCIÓN EN ENTRADA
  # ─────────────────────────────────────────────────────────────

  Escenario: Campos con valores por defecto
    Dado que se pre-configuran campos
    Cuando se abre formulario
    Entonces:
      | Campo                      | Valor por defecto    |
      | Fecha de consulta          | Hoy                  |
      | Hora de consulta           | Ahora                |
      | Sexo del paciente          | (seleccionar)        |
      | Tipo de sangre            | (seleccionar)        |
      | Estado de la consulta     | Activa               |
    Y el usuario puede cambiar valores

  Escenario: Campos con opciones predefinidas
    Dado que se usan selectores en vez de texto libre
    Cuando se completa campo
    Entonces:
      | Campo                      | Tipo                 |
      | Sexo                       | Select (M/F/O)       |
      | Tipo de sangre            | Select               |
      | Grupo étnico              | Select               |
      | Motivo de consulta        | Select + otro        |
      | Nivel de riesgo           | Select (Bajo/Medio/Alto/Crítico) |
    Y se evitan typos y inconsistencias

  Escenario: Autocompletado inteligente
    Dado que se implementa autocompletado
    Cuando el usuario escribe
    Entonces:
      | Campo                      | Autocompletado       |
      | Nombre del paciente        | Búsqueda en DB       |
      | CURP                       | Validación en tiempo real |
      | Medicamento                | Búsqueda en vademécum |
      | Diagnóstico (CIE-10)       | Búsqueda por código/descripción |
    Y los resultados aparecen en <300ms

  # ─────────────────────────────────────────────────────────────
  # 2. CONFIRMACIONES
  # ─────────────────────────────────────────────────────────────

  Escenario: Confirmación antes de acciones destructivas
    Dado que el usuario intenta eliminar algo
    Cuando presiona eliminar
    Entonces:
      | Acción                      | Confirmación        |
      | Eliminar paciente          | Modal "¿Eliminar paciente [nombre]?" |
      | Eliminar consulta          | Modal "¿Eliminar esta consulta?" |
      | Eliminar prescripción      | Modal "¿Eliminar esta receta?" |
      | Cerrar sin guardar         | Modal "¿Descambios sin guardar?" |

  Escenario: Undo después de acción
    Dado que el usuario realiza acción
    Cuando se completa
    Entonces:
      | Acción                      | Undo                |
      | Guardar paciente           | Toast con "Deshacer" |
      | Eliminar registro          | Toast con "Deshacer" (5 seg) |
      | Modificar expediente       | Historial de cambios |

  # ─────────────────────────────────────────────────────────────
  # 3. ALERTAS DE SEGURIDAD CLÍNICA
  # ─────────────────────────────────────────────────────────────

  Escenario: Alertas de contraindicaciones
    Dado que el médico prescribe medicamento
    Cuando hay riesgo clínico
    Entonces:
      | Tipo de alerta             | Ejemplo              |
      | Alergia conocida           | "Paciente alérgica a Penicilina" |
      | Interacción medicamentosa  | "Warfarina + Ibuprofeno" |
      | Dosis excesiva             | "Dosis excede máximo diario" |
      | Embarazo + medicamento     | "Contraindicado en embarazo" |
    Y la alerta requiere decisión documentada del médico

  Escenario: Alertas de valores fuera de rango
    Dado que se registran signos vitales
    Cuando valor es anormal
    Entonces:
      | Signo vital                | Umbral de alerta     |
      | PA sistólica               | >140 o <90           |
      | PA diastólica              | >90                  |
      | Frecuencia cardíaca        | >100 o <60           |
      | Temperatura                | >38°C                |
      | Saturación O2              | <95%                 |
      | FCF fetal                  | >160 o <110          |
    Y la alerta se muestra en ROJO

  # ─────────────────────────────────────────────────────────────
  # 4. GUARDADO AUTOMÁTICO
  # ─────────────────────────────────────────────────────────────

  Escenario: Auto-save durante edición
    Dado que se implementa auto-save
    Cuando el usuario edita formulario
    Entonces:
      | Criterio                   | Estado    |
      | Guardado cada 30 segundos  | ✅         |
      | Guardado al cambiar de campo | ✅       |
      | Guardado al cerrar pestaña | ✅         |
      | Feedback de "Guardado"     | ✅         |
      | Sin pérdida de datos       | ✅         |
  