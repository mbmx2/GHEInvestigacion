# Guía SOLID para el Proyecto GHE

> *"SOLID no es dogma — es la verificación de que el código es mantenible y extensible."*

---

## 1. ¿Qué es SOLID?

**SOLID** es un acrónimo de 5 principios de diseño orientado a objetos, definidos por Robert C. Martin (Uncle Bob). Proporcionan guías para crear código que sea:

- **Mantenible**: Fácil de modificar sin romper nada
- **Extensible**: Fácil de agregar nuevas funcionalidades
- **Testable**: Fácil de probar con tests
- **Reutilizable**: Fácil de usar en diferentes contextos

---

## 2. Principios SOLID Aplicados a GHE

### S - Single Responsibility Principle (SRP)

> *"Cada módulo debe tener una, y solo una, razón para cambiar."*

**Aplicación en GHE:**

| Bounded Context | Responsabilidad Única |
|---|---|
| Patient | Registro y datos demográficos |
| Clinical | Consultas médicas y notas SOAP |
| Obstetric | Control prenatal y triaje |
| Pharmacy | Inventario y dispensación |
| Prescription | Prescripción y validación |
| Reporting | Estadísticas y reportes |

**Archivos:**
- Feature: `templates/gherkin/solid/SRP_single_responsibility.feature`
- Verificación: Cada bounded context tiene 1 responsabilidad principal

---

### O - Open/Closed Principle (OCP)

> *"Las entidades de software deben estar abiertas a extensión, cerradas a modificación."*

**Aplicación en GHE:**

| Extensión | Mecanismo | Código existente modificado? |
|---|---|---|
| Nuevo tipo de consulta | Strategy Pattern | No |
| Nueva regla de CDS | Observer Pattern | No |
| Nuevo formato de exportación | Adapter Pattern | No |
| Nuevo tipo de alerta | Plugin architecture | No |

**Archivos:**
- Feature: `templates/gherkin/solid/OCP_open_closed.feature`
- Patrones usados: Strategy, Observer, Adapter, Plugin

---

### L - Liskov Substitution Principle (LSP)

> *"Los objetos de un subtipo deben ser sustituibles por objetos del supertipo sin alterar el comportamiento correcto del programa."*

**Aplicación en GHE:**

| Supertipo | Subtipos | Sustituible? |
|---|---|---|
| Consultation | PrenatalConsultation, GeneralConsultation, EmergencyConsultation | ✅ |
| Repository | SQLiteRepository, InMemoryRepository | ✅ |
| Notifier | WhatsAppNotifier, MockNotifier | ✅ |
| Exporter | PDFExporter, CSVExporter, FHIRExporter | ✅ |

**Archivos:**
- Feature: `templates/gherkin/solid/LSP_liskov_substitution.feature`
- Verificación: Todos los subtipos pasan los mismos tests

---

### I - Interface Segregation Principle (ISP)

> *"Ningún cliente debería ser forzado a depender de interfaces que no usa."*

**Aplicación en GHE:**

| Interface "Gorda" (❌) | Interfaces Segregadas (✅) |
|---|---|
| DataService (25 métodos) | PatientReader, PatientWriter, PatientSearcher |
| Repository (12 métodos) | Reader, Writer, Searcher, Exporter |
| Notifier (8 métodos) | UrgencyNotifier, StockAlertNotifier, Reminder |

**Archivos:**
- Feature: `templates/gherkin/solid/ISP_interface_segregation.feature`
- Métrica: Promedio <5 métodos por interface

---

### D - Dependency Inversion Principle (DIP)

> *"Los módulos de alto nivel no deben depender de módulos de bajo nivel. Ambos deben depender de abstracciones."*

**Aplicación en GHE:**

```
┌─────────────────────────────────────────────────┐
│              Domain Layer (Alto nivel)           │
│  - PatientDomain                                │
│  - ClinicalDomain                               │
│  - PharmacyDomain                               │
│                                                 │
│  Depende de: Interfaces (Puertos)               │
│  NO depende de: SQLite, HTTP, UI                │
├─────────────────────────────────────────────────┤
│           Infrastructure Layer (Bajo nivel)      │
│  - SQLitePatientRepository (implementa Puerto)  │
│  - HTTPAdapter (implementa Puerto)              │
│  - WebUI (implementa Puerto)                    │
│                                                 │
│  Depende de: Interfaces (Puertos del dominio)   │
│  Implementa: Comportamiento concreto            │
└─────────────────────────────────────────────────┘
```

**Archivos:**
- Feature: `templates/gherkin/solid/DIP_dependency_inversion.feature`
- Patrones: Repository, Strategy, Event-driven

---

## 3. Relación SOLID ↔ Arquitectura Hexagonal

SOLID es la base de la Arquitectura Hexagonal:

| Principio SOLID | Hexagonal |
|---|---|
| **SRP** | Cada bounded context = 1 responsabilidad |
| **OCP** | Puertos permiten extensión sin modificación |
| **LSP** | Cualquier adaptador funciona donde se espere el puerto |
| **ISP** | Puertos son interfaces pequeñas y específicas |
| **DIP** | Dominio depende de puertos, no de adaptadores |

---

## 4. Checklist de Verificación SOLID

### SRP (Responsabilidad Única)
- [ ] Cada bounded context tiene 1 responsabilidad principal
- [ ] Ninguna función hace más de 1 cosa
- [ ] LCOM < 0.5 en todos los módulos

### OCP (Abierto/Cerrado)
- [ ] Nuevas funcionalidades se agregan sin modificar código existente
- [ ] Se usan patrones: Strategy, Observer, Adapter
- [ ] No hay switch/case gigantes

### LSP (Sustitución de Liskov)
- [ ] Todos los subtipos pasan los mismos tests
- [ ] No se lanzan excepciones inesperadas en subtipos
- [ ] Comportamiento consistente en herencia

### ISP (Segregación de Interfaces)
- [ ] Interfaces <5 métodos en promedio
- [ ] No hay interfaces "gordas"
- [ ] Clientes no implementan métodos vacíos

### DIP (Inversión de Dependencias)
- [ ] Dominio no importa infraestructura
- [ ] Se usa inyección de dependencias
- [ ] Tests usan mocks/in-memory
- [ ] No hay `new` en el dominio

---

## 5. Métricas SOLID para Dashboard

```yaml
solid_metrics:
  SRP:
    lcom_average: 0.25
    modules_with_single_responsibility: "95%"
    god_objects_found: 0
  
  OCP:
    extension_points: 12
    modifications_for_new_features: 0
    patterns_used: ["Strategy", "Observer", "Adapter"]
  
  LSP:
    subtypes_passing_tests: "100%"
    polymorphic_test_coverage: "95%"
    substitution_violations: 0
  
  ISP:
    avg_methods_per_interface: 4.2
    max_methods_per_interface: 7
    interfaces_over_7_methods: 1
  
  DIP:
    domain_dependencies_to_concrete: 0
    domain_dependencies_to_interfaces: 15
    testability_score: "95%"
```

---

## 6. Referencias

- **Clean Architecture**: Robert C. Martin
- **Agile Software Development**: Robert C. Martin
- **Head First Design Patterns**: Freeman & Robson
- **Domain-Driven Design**: Eric Evans
- **Object-Oriented Software Construction**: Bertrand Meyer

---

*SOLID en GHE: Código que respeta principios es código que dura.*
