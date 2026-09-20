# language: es
# GUIX User First - Principios de Diseño Centrado en Usuario
@status:proposed
@type:acceptance
@domain:general
# FILOSOFÍA: El usuario es el centro de cada decisión de diseño
Característica: Principios de Diseño Centrado en Usuario (GUIX User First - GHE)
  Como diseñador UX del proyecto GHE
  Quiero que cada pantalla esté diseñada pensando en el usuario
  Para que médicos y enfermeras usen el sistema de forma intuitiva

  # ─────────────────────────────────────────────────────────────
  # 1. CONOCIMIENTO DEL USUARIO
  # ─────────────────────────────────────────────────────────────

  Escenario: Perfiles de usuario
    Dado que se definen perfiles de usuario
    Cuando se diseñan interfaces
    Entonces se considera:
      | Perfil                      | Necesidades          |
      | Médico rural               | Rápido, sin complicaciones |
      | Enfermera obstétrica       | Triage eficiente     |
      | Farmacéutico               | Dispensación ágil    |
      | Recepcionista              | Registro mínimo      |
      | Administrador              | Reportes claros      |
    Y cada perfil tiene flujos optimizados

  Escenario: Contexto de uso
    Dado que se considera contexto de uso
    Cuando se diseña
    Entonces:
      | Factor                      | Consideración        |
      | Entorno rural              | Pantalla soleada, ruido |
      | Conectividad               | Feedback offline     |
      | Equipamiento               | Computadora básica   |
      | Tiempo de consulta         | 5-10 minutos máximo  |
      | Experiencia tech           | Básica a intermedia  |

  # ─────────────────────────────────────────────────────────────
  # 2. PRINCIPIOS DE DISEÑO
  # ─────────────────────────────────────────────────────────────

  Escenario: Principios de diseño UX
    Dado que se definen principios de diseño
    Cuando se aplica a cada pantalla
    Entonces:
      | Principio                   | Aplicación en GHE    |
      | Simplicidad                 | Mínimo clicks para tareas core |
      | Consistencia               | Mismos patrones en toda la app |
      | Feedback inmediato          | Confirmación de cada acción |
      | Tolerancia al error         | Undo, confirmaciones |
      | Visibilidad de estado       | Siempre saber qué está pasando |
      | Reconocimiento vs. memoriza | Botones visibles, no atajos |
      | Flexibilidad                | Múltiples formas de hacer lo mismo |
      | Estética minimalista        | Sin distracciones, enfoque en datos |

  Escenario: Jerarquía visual
    Dado que se aplica jerarquía visual
    Cuando se diseña pantalla
    Entonces:
      | Elemento                    | Tratamiento          |
      | Acción principal            | Botón grande, color primario |
      | Acción secundaria           | Botón pequeño, outline |
      | Información crítica         | Rojo, bold, icono     |
      | Información normal          | Negro, regular        |
      | Información de soporte      | Gris, small           |
      | Datos del paciente          | Destacados, visibles  |

  # ─────────────────────────────────────────────────────────────
  # 3. FLUJOS DE USUARIO
  # ─────────────────────────────────────────────────────────────

  Escenario: Flujo de consulta rápida
    Dado que se diseña flujo de consulta
    Cuando el médico atiende paciente
    Entonces el flujo tiene máximo 5 pasos:
      | Paso                       | Acción               |
      | 1. Buscar paciente         | Click en buscar      |
      | 2. Abrir expediente        | Click en resultado   |
      | 3. Crear consulta          | Botón "Nueva consulta" |
      | 4. Llenar nota SOAP        | Formulario rápido    |
      | 5. Guardar y firmar        | Botón "Guardar"      |
    Y cada paso toma <30 segundos

  Escenario: Flujo de prescripción
    Dado que se diseña flujo de prescripción
    Cuando el médico receta
    Entonces el flujo tiene máximo 4 pasos:
      | Paso                       | Acción               |
      | 1. Seleccionar medicamento | Búsqueda o lista     |
      | 2. Indicar dosis           | Campos pre-llenados  |
      | 3. Indicar cantidad        | Calculadora automática|
      | 4. Firmar receta           | Botón "Firmar"       |
    Y la receta se envía a farmacia automáticamente

  # ─────────────────────────────────────────────────────────────
  # 4. MICROINTERACCIONES
  # ─────────────────────────────────────────────────────────────

  Escenario: Feedback de acciones
    Dado que el usuario realiza una acción
    Cuando se procesa
    Entonces:
      | Acción                      | Feedback             |
      | Guardar paciente            | Toast "Paciente guardado ✅" |
      | Error de validación         | Mensaje junto al campo |
      | Guardando...                | Spinner en botón     |
      | Sync completada             | Toast "Sincronizado ✅" |
      | Guardado offline            | Toast "Guardado localmente 📱" |
      | Eliminar                    | Confirmación modal   |
  