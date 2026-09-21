# language: es
# Hexagonal Architecture - Testing
@status:proposed
# @requirement:PRACTICE-GHE-001
@type:acceptance
@domain:general
# TESTING: Cómo la arquitectura hexagonal facilita el testing
Característica: Testing con Arquitectura Hexagonal (GHE)
  Como desarrollador del proyecto GHE
  Quiero que la arquitectura facilit Testing
  Para poder probar cada capa de forma aislada

  # ─────────────────────────────────────────────────────────────
  # 1. TESTING DE DOMINIO (UNIT)
  # ─────────────────────────────────────────────────────────────

  Escenario: Tests de dominio sin infraestructura
    Dado que se testea lógica de dominio
    Cuando se ejecutan tests
    Entonces NO se necesita:
      | Recurso                    | Necesario? |
      | Base de datos              | No         |
      | Servidor web               | No         |
      | Conexión a internet        | No         |
      | Sistema de archivos        | No         |
    Y los tests son:
      | Característica             | Estado    |
      | Rápidos (<100ms)          | ✅         |
      | Determinísticos            | ✅         |
      | Independientes             | ✅         |
      | Sin efectos secundarios    | ✅         |

  Escenario: Test de validación de dominio
    Dado que se testea validación de CURP
    Cuando se ejecuta test
    Entonces:
      | Test                        | Input           | Expected  |
      | CURP válida                 | "GOGC531015MVZRRL04" | Válida |
      | CURP inválida (corta)       | "ABC123"        | Inválida  |
      | CURP nula                   | nil             | Error     |
      | CURP con minúsculas         | "gogc531015mvzrrl04" | Inválida |
    Y el test NO usa base de datos
    Y el test tarda <10ms

  # ─────────────────────────────────────────────────────────────
  # 2. TESTING DE USE CASES (INTEGRATION)
  # ─────────────────────────────────────────────────────────────

  Escenario: Tests de use cases con adaptadores mock
    Dado que se testea PatientService
    Cuando se usan adaptadores mock
    Entonces:
      | Mock                        | Comportamiento       |
      | InMemoryPatientRepository  | Guarda y retorna     |
      | InMemoryEventPublisher     | Registra eventos     |
      | InMemoryAuditLogger        | Registra auditoría   |
    Y se verifica:
      | Verificación               | Estado    |
      | Paciente guardado correctamente | ✅  |
      | Evento publicado           | ✅         |
      | Auditoría registrada       | ✅         |

  Escenario: Tests de use cases con verificación
    Dado que se testea un flujo completo de use case
    Cuando se ejecuta
    Entonces se verifica:
      | Paso                        | Verificación         |
      | Input válido               | Use case ejecuta     |
      | Paciente creado            | Repository lo guarda |
      | Evento emitted             | EventPublisher lo registra |
      | Acción auditada            | AuditLogger lo registra |
      | Output válido              | Respuesta correcta   |

  # ─────────────────────────────────────────────────────────────
  # 3. TESTING DE ADAPTADORES (INTEGRATION)
  # ─────────────────────────────────────────────────────────────

  Escenario: Tests de adaptador SQLite
    Dado que se testea SQLitePatientRepository
    Cuando se usa base de datos de prueba
    Entonces:
      | Operación                  | Verificación         |
      | save + findById            | Datos correctos      |
      | findByCURP                 | Búsqueda exacta      |
      | findAll                    | Lista completa       |
      | update                     | Modificación guardada|
      | delete                     | Eliminación correcta |
    Y se usa base de datos temporal (se borra después)

  Escenario: Tests de adaptador REST
    Dado que se testea REST PatientAdapter
    Cuando se envía petición de prueba
    Entonces:
      | Petición                   | Respuesta esperada   |
      | POST /api/patients (válido)| 201 Created          |
      | GET /api/patients/:id      | 200 OK + JSON        |
      | GET /api/patients/invalid  | 404 Not Found        |
      | POST /api/patients (inválido)| 400 Bad Request    |
    Y se usa HTTP client de prueba (sin servidor real)

  # ─────────────────────────────────────────────────────────────
  # 4. TESTING E2E (SYSTEM)
  # ─────────────────────────────────────────────────────────────

  Escenario: Tests E2E con adaptadores reales
    Dado que se testea flujo completo E2E
    Cuando se ejecuta con adaptadores de prueba
    Entonces:
      | Componente                  | Implementación usada |
      | Domain                     | Real (dominio)       |
      | Ports                      | Reales (interfaces)  |
      | SQLite Adapter             | Base de datos temp   |
      | REST Adapter               | Servidor de prueba   |
      | Event Publisher             | InMemory             |
    Y se verifica flujo completo:
      | Flujo                       | Estado    |
      | Registro → Consulta → Receta| ✅ Pass   |
      | Triaje → Referencia        | ✅ Pass   |
      | Farmacia → Dispensación    | ✅ Pass   |

  # ─────────────────────────────────────────────────────────────
  # 5. VENTAJAS DE TESTING HEXAGONAL
  # ─────────────────────────────────────────────────────────────

  Escenario: Comparación de testing con vs sin hexagonal
    Dado que se compara testing
    Cuando se evalúa
    Entonces:
      | Métrica                    | Sin hexagonal | Con hexagonal |
      | Tiempo de tests unit       | 500ms         | 50ms          |
      | Tests que necesitan DB     | 80%           | 15%           |
      | Tests que necesitan red    | 40%           | 0%            |
      | Facilidad de mock          | Difícil       | Fácil         |
      | Cobertura de dominio       | 60%           | 95%           |
      | Flakiness de tests         | Alta          | Baja          |
  