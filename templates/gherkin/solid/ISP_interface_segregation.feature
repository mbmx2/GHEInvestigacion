# language: es
# SOLID - I: Interface Segregation Principle
@status:proposed
@type:acceptance
@domain:general
# PRINCIPIO: No forzar a los clientes a depender de interfaces que no usan
Característica: Principio de Segregación de Interfaces (SOLID - I)
  Como desarrollador del proyecto GHE
  Quiero interfaces pequeñas y específicas
  Para reducir acoplamiento y mejorar mantenibilidad

  # ─────────────────────────────────────────────────────────────
  # 1. SEGREGACIÓN DE INTERFACES
  # ─────────────────────────────────────────────────────────────

  Escenario: Interfaces de repositorio segregadas
    Dado que se diseñan interfaces de repositorio
    Cuando se evalúa granularidad
    Entonces se separan interfaces:
      | Interface                   | Operaciones            |
      | PatientReader              | findById, findAll      |
      | PatientWriter              | save, update, delete   |
      | PatientSearcher            | findByCURP, findByName |
      | PatientExporter            | toPDF, toCSV           |
    Y cada implementación solo implementa las interfaces que necesita
    Y no hay interfaces "gordas" con operaciones innecesarias

  Escenario: Interfaces de servicio segregadas
    Dado que se diseñan interfaces de servicio
    Cuando se evalúa granularidad
    Entonces:
      | Interface                   | Responsabilidad       |
      | ConsultationCreator        | Crear consulta        |
      | ConsultationReader         | Leer consultas        |
      | ConsultationUpdater        | Actualizar consulta   |
      | ConsultationSearcher       | Buscar consultas      |
      | ConsultationExporter       | Exportar consultas    |
    Y cada clase implementa solo la interface que necesita

  Escenario: Interfaces de notificación segregadas
    Dado que se diseñan interfaces de notificación
    Cuando se evalúa granularidad
    Entonces:
      | Interface                   | Responsabilidad       |
      | UrgencyNotifier            | Alertas críticas      |
      | StockAlertNotifier         | Alertas de inventario |
      | AppointmentReminder        | Recordatorios de citas|
      | AuditLogger                | Log de auditoría      |
    Y cada notificador implementa solo su interface

  # ─────────────────────────────────────────────────────────────
  # 2. VERIFICACIÓN DE NO DEPENDENCIA
  # ─────────────────────────────────────────────────────────────

  Escenario: Verificación de dependencias
    Dado que se analizan dependencias de módulos
    Cuando se verifica qué interfaces usa cada módulo
    Entonces:
      | Módulo                     | Interfaces que usa    | Interfaces que NO usa |
      | Patient Domain             | PatientReader, PatientWriter | PatientExporter |
      | Clinical Domain            | ConsultationCreator, ConsultationReader | ConsultationExporter |
      | Pharmacy Domain            | InventoryReader       | PatientReader, ConsultationReader |

  Escenario: Verificación de clientes no forzados
    Dado que se verifica que ningún cliente depende de interface que no usa
    Cuando se analiza acoplamiento
    Entonces ningún módulo:
      | Violación                   | Estado    |
      | Importa interface completa cuando solo necesita 1 método | No |
      | Implementa métodos vacíos por obligación | No |
      | Tiene dependencias circulares | No        |

  # ─────────────────────────────────────────────────────────────
  # 3. DETECCIÓN DE VIOLACIONES
  # ─────────────────────────────────────────────────────────────

  Escenario: Detección de interface "gorda"
    Dado que se revisa código en busca de interfaces con excesivos métodos
    Cuando se encuentra interface con >7 métodos
    Entonces se identifica:
      | Interface detectada         | Métodos | Acción |
      | DataService (god interface)| 25      | Segregar |
    Y se propone segregación:
      | Nueva interface             | Métodos |
      | DataReader                  | 5       |
      | DataWriter                  | 5       |
      | DataExporter                | 5       |
      | DataValidator               | 5       |

  Escenario: Métricas de granularidad
    Dado que se miden métricas de interfaces
    Cuando se evalúa promedio de métodos por interface
    Entonces se verifica:
      | Métrica                    | Objetivo  | Actual |
      | Promedio métodos/interface | <5        | 4.2    |
      | Máximo métodos/interface   | <8        | 7      |
      | Interfaces >7 métodos     | 0         | 1      |
      | % interfaces SRP           | >90%      | 92%    |
  