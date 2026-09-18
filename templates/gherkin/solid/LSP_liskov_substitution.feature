# language: es
# SOLID - L: Liskov Substitution Principle
# PRINCIPIO: Objetos de un subtipo deben ser sustituibles por objetos del supertipo sin alterar comportamiento
Característica: Principio de Sustitución de Liskov (SOLID - L)
  Como desarrollador del proyecto GHE
  Quiero que los subtipos sean sustituibles por sus supertipos
  Para garantizar correcta herencia y polimorfismo

  # ─────────────────────────────────────────────────────────────
  # 1. VERIFICACIÓN DE SUSTITUBILIDAD
  # ─────────────────────────────────────────────────────────────

  Escenario: Sustitución de tipos de consulta
    Dado que existe un supertipo Consultation
    Cuando se usan subtipos
    Entonces cada subtipo es sustituible:
      | Subtipo                    | Comportamiento heredado | Comportamiento propio |
      | PrenatalConsultation       | Crear consulta ✅       | Registro obstétrico   |
      | GeneralConsultation        | Crear consulta ✅       | Interrogatorio general|
      | EmergencyConsultation      | Crear consulta ✅       | Triaje de emergencia  |
      | FollowUpConsultation       | Crear consulta ✅       | Comparar con anterior |
    Y cualquiera puede usarse donde se espere una Consultation

  Escenario: Verificación de contrato de tipos de consulta
    Dado que se verifica contrato LSP
    Cuando se evalúa cada subtipo
    Entonces se cumple:
      | Subtipo                    | Precondiciones          | Postcondiciones       | Estado |
      | PrenatalConsultation       | Paciente embarazada     | Edad gestacional registrada | ✅ |
      | GeneralConsultation        | Paciente activo         | Nota SOAP creada      | ✅ |
      | EmergencyConsultation      | Paciente en urgencia    | Clasificación de riesgo | ✅  |
      | FollowUpConsultation       | Consulta previa existe  | Comparación realizada | ✅     |

  # ─────────────────────────────────────────────────────────────
  # 2. VERIFICACIÓN DE TIPOS DE REPOSITORIO
  # ─────────────────────────────────────────────────────────────

  Escenario: Sustitución de repositorios
    Dado que existe un supertipo Repository
    Cuando se usan implementaciones
    Entonces cada implementación es sustituible:
      | Implementación             | Supertipo    | Comportamiento |
      | SQLiteRepository           | Repository   | CRUD ✅        |
      | InMemoryRepository (test)  | Repository   | CRUD ✅        |
      | MockRepository (test)      | Repository   | CRUD ✅        |
    Y el dominio NO sabe qué implementación usa

  Escenario: Verificación de comportamiento de repositorios
    Dado que se prueban repositorios con tests polymorphic
    Cuando se ejecutan tests con cada implementación
    Entonces todas pasan los mismos tests:
      | Test                       | SQLite | InMemory | Mock |
      | save_retrieves_same_data   | ✅     | ✅       | ✅   |
      | find_by_id_returns_correct | ✅     | ✅       | ✅   |
      | delete_removes_record      | ✅     | ✅       | ✅   |
      | find_all_returns_list      | ✅     | ✅       | ✅   |

  # ─────────────────────────────────────────────────────────────
  # 3. DETECCIÓN DE VIOLACIONES
  # ─────────────────────────────────────────────────────────────

  Escenario: Detección de violación de LSP
    Dado que se revisa código en busca de violaciones LSP
    Cuando se encuentra un subtipo que altera comportamiento
    Entonces se identifica:
      | Subtipo detectado          | Violación              | Acción |
      | RestrictedPatient (paciente con acceso limitado) | No permite lectura completa | Refactorizar |
    Y se corrige usando:
      | Solución                   |
      | Composite pattern         |
      | Decorator pattern         |
      | Separar interfaces        |

  Escenario: Verificación de excepciones
    Dado que se verifica manejo de excepciones en subtipos
    Cuando un subtipo lanza excepción
    Entonces:
      | Criterio                   | Estado    |
      | No lanza excepciones que el supertipo no lanza | ✅ |
      | No lanza excepciones nuevas| ✅         |
      | Comportamiento ante errores| Consistente | ✅ |
  