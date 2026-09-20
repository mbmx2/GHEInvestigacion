# language: es
# SOLID - O: Open/Closed Principle
@status:proposed
@type:acceptance
@domain:general
# PRINCIPIO: Entidades de software deben estar abiertas a extensión, cerradas a modificación
Característica: Principio Abierto/Cerrado (SOLID - O)
  Como desarrollador del proyecto GHE
  Quiero que el sistema sea extensible sin modificar código existente
  Para agregar nuevas funcionalidades de forma segura

  # ─────────────────────────────────────────────────────────────
  # 1. EXTENSIBILIDAD POR COMPOSICIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Extensión de tipos de consulta
    Dado que el sistema maneja múltiples tipos de consulta
    Cuando se agrega un nuevo tipo de consulta
    Entonces NO se modifica código existente:
      | Tipo existente             | Código modificado? |
      | Consulta general           | No                 |
      | Control prenatal           | No                 |
      | Consulta de urgencia       | No                 |
      | **Nueva: Consulta nutricional** | **No**        |
    Y se extiende mediante:
      | Mecanismo                  | Ejemplo            |
      | Protocol/Interface         | ConsultationType    |
      | Implementación nueva       | NutritionConsultation |
      | Registro en config         | Agregar a registry  |

  Escenario: Extensión de alertas de CDS (Clinical Decision Support)
    Dado que el sistema tiene alertas clínicas
    Cuando se agrega nueva regla de alerta
    Entonces se extiende sin modificar:
      | Regla existente            | Código modificado? |
      | Alerta por alergia         | No                 |
      | Alerta por interacción     | No                 |
      | **Nueva: Alerta por edad gestacional** | **No** |
    Y se implementa mediante:
      | Mecanismo                  |
      | Protocol/Interface         |
      | Nueva implementación       |
      | Inyección de dependencias  |

  Escenario: Extensión de formatos de exportación
    Dado que el sistema exporta expedientes
    Cuando se agrega nuevo formato
    Entonces se extiende sin modificar:
      | Formato existente          | Código modificado? |
      | PDF                        | No                 |
      | CSV                        | No                 |
      | **Nuevo: HL7 FHIR**        | **No**             |
    Y se implementa:
      | Mecanismo                  |
      | Protocol Exporter          |
      | FHIRExporter implementa    |

  # ─────────────────────────────────────────────────────────────
  # 2. VERIFICACIÓN DE CIERRE A MODIFICACIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Verificación de módulo Patient
    Dado que se verifica el módulo Patient
    Cuando se evalúa si está cerrado a modificación
    Entonces:
      | Operación                  | Requiere modificar Patient? |
      | Agregar campo al paciente  | No (extender)               |
      | Agregar validación         | No (strategy pattern)       |
      | Agregar formato de exportación | No (adapter pattern)   |
      | Agregar regla de negocio   | No (policy pattern)         |

  Escenario: Verificación de Pharmacy
    Dado que se verifica el módulo Pharmacy
    Cuando se evalúa extensibilidad
    Entonces:
      | Extensión                  | Mecanismo usado    |
      | Nuevo tipo de medicamento  | Strategy           |
      | Nueva regla de dispensación| Policy             |
      | Nuevo proveedor de inventario | Adapter         |
      | Nuevo formato de reporte   | Exporter pattern   |

  # ─────────────────────────────────────────────────────────────
  # 3. PATRONES QUE HABILITAN OCP
  # ─────────────────────────────────────────────────────────────

  Escenario: Uso de Strategy Pattern en CDS
    Dado que se implementan reglas de Clinical Decision Support
    Cuando se usa Strategy Pattern
    Entonces:
      | Interface                  | Implementaciones            |
      | CDSStrategy                | AllergyChecker              |
      |                           | InteractionChecker          |
      |                           | DoseValidator               |
      |                           | AgeGestationalValidator     |
    Y agregar nueva regla = nueva implementación
    Y NO se modifica el motor de CDS

  Escenario: Uso de Observer Pattern para eventos
    Dado que se usan eventos de dominio
    Cuando ocurre un evento
    Entonces múltiples observadores reaccionan sin acoplamiento:
      | Evento                     | Observadores               |
      | PrescriptionCreated        | PharmacyNotifier           |
      |                           | AuditLogger                |
      |                           | PatientHistoryUpdater      |
    Y agregar nuevo observador = registrar nuevo listener
    Y NO se modifica quien genera el evento
  