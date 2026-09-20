# language: es
# Offline-First - Arquitectura Base
@status:proposed
@type:acceptance
@domain:general
# FILOSOFÍA: El sistema funciona SIN internet como si tuviera conexión
Característica: Arquitectura Offline-First (GHE)
  Como arquitecto del proyecto GHE
  Quiero que el sistema funcione completamente sin internet
  Para garantizar atención en zonas con conectividad intermitente (2G/EDGE)

  # ─────────────────────────────────────────────────────────────
  # 1. PRINCIPIOS FUNDAMENTALES
  # ─────────────────────────────────────────────────────────────

  Escenario: Principios de Offline-First
    Dado que se diseña arquitectura offline-first
    Cuando se verifica
    Entonces:
      | Principio                   | Implementación       |
      | Local-first                | SQLite como fuente de verdad |
      | Sin dependencia de red     | 100% funcional offline |
      | Sync como secundario       | Sync mejora, no es necesaria |
      | Conflictos manejables      | Resolución automática + manual |
      | Datos siempre disponibles  | Acceso instantáneo   |
      | Transacciones locales      | ACID en SQLite       |

  Escenario: Operación sin internet
    Dado que el sistema NO tiene conexión a internet
    Cuando el médico realiza una consulta
    Entonces:
      | Operación                  | Funciona? |
      | Registrar paciente nuevo   | ✅         |
      | Abrir expediente existente | ✅         |
      | Crear consulta             | ✅         |
      | Registrar signos vitales   | ✅         |
      | Crear prescripción         | ✅         |
      | Sur medicamento (farmacia) | ✅         |
      | Generar receta             | ✅         |
      | Generar reporte            | ✅         |
      | Buscar pacientes           | ✅         |
    Y todas las operaciones son instantáneas (<500ms)

  # ─────────────────────────────────────────────────────────────
  # 2. MODELO DE ARQUITECTURA
  # ─────────────────────────────────────────────────────────────

  Escenario: Capas de la arquitectura offline-first
    Dado que se verifica arquitectura
    Cuando se analiza
    Entonces:
      | Capa                      | Responsabilidad      |
      | UI (ClojureScript)        | Interfaz de usuario  |
      | Application Layer         | Casos de uso         |
      | Domain Layer              | Lógica de negocio    |
      | Local Storage (SQLite)    | Persistencia local   |
      | Sync Engine               | Sincronización       |
      | Network Layer             | Detección de red     |
      | Cloud Storage             | Persistencia remota  |
    Y las capas inferiores NUNCA dependen de las superiores

  Escenario: Flujo de datos offline
    Dado que se ejecuta una operación offline
    Cuando se procesa
    Entonces el flujo es:
      | Paso                       |
      | 1. UI captura input        |
      | 2. Application valida      |
      | 3. Domain procesa          |
      | 4. Local Storage guarda    |
      | 5. Sync Queue agrega operación |
      | 6. UI muestra confirmación |
      | 7. Cuando haya internet, sync ejecuta |
    Y el usuario NUNCA espera a que sync termine

  # ─────────────────────────────────────────────────────────────
  # 3. GARANTÍAS DE DISPONIBILIDAD
  # ─────────────────────────────────────────────────────────────

  Escenario: Disponibilidad 100% offline
    Dado que se verifica disponibilidad
    Cuando se evalúa cada funcionalidad
    Entonces:
      | Funcionalidad              | Disponible offline? |
      | Registro de pacientes      | ✅ 100%             |
      | Consultas médicas          | ✅ 100%             |
      | Prescripciones             | ✅ 100%             |
      | Farmacia (dispensación)    | ✅ 100%             |
      | Reportes locales           | ✅ 100%             |
      | Búsqueda de pacientes      | ✅ 100%             |
      | Historial de paciente      | ✅ 100%             |
      | Sync con cloud             | ❌ Requiere internet |
      | WhatsApp notificaciones    | ❌ Requiere internet |
      | Reportes a COFEPRIS        | ❌ Requiere internet |
  