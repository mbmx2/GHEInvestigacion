# language: es
# Hexagonal Architecture - Driving Adapters (Input)
@status:proposed
# @requirement:PRACTICE-GHE-001
@type:acceptance
@domain:general
# ADAPTADORES DE ENTRADA: Conectan el mundo exterior con los puertos de entrada
Característica: Driving Adapters - Adaptadores de Entrada (Arquitectura Hexagonal)
  Como desarrollador del proyecto GHE
  Quiero adaptadores de entrada que conecten UI/API con el dominio
  Para que múltiples interfaces usen la misma lógica de negocio

  # ─────────────────────────────────────────────────────────────
  # 1. ADAPTADOR WEB (REST API)
  # ─────────────────────────────────────────────────────────────

  Escenario: Adaptador REST API
    Dado que se implementa adaptador REST para pacientes
    Cuando un cliente envía petición HTTP
    Entonces el adaptador:
      | Paso                       |
      | 1. Recibe petición HTTP    |
      | 2. Parsea body a map       |
      | 3. Valida formato de entrada|
      | 4. Llama a PatientUseCase  |
      | 5. Convierte resultado a JSON |
      | 6. Retorna respuesta HTTP  |
    Y el adaptador NO contiene lógica de negocio
    Y el adaptador solo traduce entre HTTP y dominio

  Escenario: Endpoints del adaptador REST
    Dado que se documentan endpoints REST
    Cuando se lista
    Entonces:
      | Método  | Endpoint                | UseCase llamado      |
      | POST    | /api/patients           | registerPatient      |
      | GET     | /api/patients/:id       | findPatient          |
      | PUT     | /api/patients/:id       | updatePatient        |
      | DELETE  | /api/patients/:id       | deletePatient        |
      | POST    | /api/consultations      | startConsultation    |
      | GET     | /api/consultations/:id  | findConsultation     |
      | POST    | /api/prescriptions      | createPrescription   |
    Y cada endpoint delega al use case correspondiente

  # ─────────────────────────────────────────────────────────────
  # 2. ADAPTADOR CLI
  # ─────────────────────────────────────────────────────────────

  Escenario: Adaptador CLI (Command Line Interface)
    Dado que se implementa adaptador CLI
    Cuando se ejecuta comando desde terminal
    Entonces el adaptador:
      | Paso                       |
      | 1. Recibe argumentos CLI   |
      | 2. Parsea argumentos       |
      | 3. Llama a UseCase         |
      | 4. Imprime resultado       |
    Y el adaptador CLI comparte los mismos use cases que REST
    Y se puede cambiar de CLI a REST sin modificar dominio

  # ─────────────────────────────────────────────────────────────
  # 3. ADAPTADOR WEB UI (Frontend)
  # ─────────────────────────────────────────────────────────────

  Escenario: Adaptador Web UI (ClojureScript)
    Dado que se implementa adaptador Web UI
    Cuando el usuario interactúa con la interfaz
    Entonces el adaptador:
      | Paso                       |
      | 1. Captura evento de UI    |
      | 2. Serializa a formato     |
      | 3. Llama a REST API (misma aplicación) |
      | 4. Actualiza UI con respuesta |
    Y el adaptador UI usa los mismos endpoints REST
    Y NO contiene lógica de negocio

  # ─────────────────────────────────────────────────────────────
  # 4. VERIFICACIÓN DE ADAPTADORES DE ENTRADA
  # ─────────────────────────────────────────────────────────────

  Escenario: Verificación de que adaptadores son delgados
    Dado que se verifican adaptadores de entrada
    Cuando se analiza complejidad
    Entonces:
      | Adaptador                   | Líneas de código | Complejidad |
      | REST PatientAdapter        | <50              | Baja        |
      | CLI PatientAdapter         | <30              | Baja        |
      | WebUI PatientAdapter       | <100             | Baja        |
    Y los adaptadores NO contienen:
      | Contenido prohibido         | Estado    |
      | Lógica de validación de negocio | No    |
      | Acceso a base de datos      | No        |
      | Lógica de reglas clínicas   | No        |
    