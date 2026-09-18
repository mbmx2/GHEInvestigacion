# Guía SWEBOK para el Proyecto GHE

> *"SWEBOK no es burocracia — es la verificación de que cada proceso de ingeniería está cubierto."*

---

## 1. ¿Qué es SWEBOK?

**SWEBOK** (Software Engineering Body of Knowledge) es el estándar **ISO/IEC 25010** que define el cuerpo de conocimiento generalmente aceptado para la ingeniería de software. Proporciona un marco de referencia para:

- Estructurar procesos de desarrollo
- Verificar que no hay áreas olvidadas
- Establecer estándares de calidad
- Facilitar la comunicación del equipo

---

## 2. Áreas de Conocimiento (KA) Aplicadas a GHE

### Mapeo SWEBOK → GHE

| KA | Nombre | Aplicación en GHE | Feature File |
|---|---|---|---|
| **KA-01** | Software Requirements | Requisitos clínicos y normativos | `KA01_requirements.feature` |
| **KA-02** | Software Design | Arquitectura hexagonal, DDD | `KA02_design.feature` |
| **KA-03** | Software Construction | Código Clojure, estándares | `KA03_construction.feature` |
| **KA-04** | Software Testing | Pirámide de testing, PEAEH | `KA04_testing.feature` |
| **KA-05** | Software Maintenance | Correctivo, adaptativo, perfectivo | `KA05_maintenance.feature` |
| **KA-06** | Configuration Management | Git, CI/CD, versionado | `KA06_configuration_management.feature` |
| **KA-07** | Engineering Management | Gestión de proyecto, sprints | `KA07_management.feature` |
| **KA-08** | Engineering Process | Ciclo de vida, retrospectivas | `KA08_process.feature` |
| **KA-09** | Models & Methods | DDD, Hexagonal, SOLID | `KA09_models_methods.feature` |
| **KA-10** | Software Quality | ISO 25010, IEC 62304 | `KA10_quality.feature` |
| **KA-11** | Professional Practice | Ética, responsabilidad social | `KA11_professional_practice.feature` |
| **KA-12** | Engineering Economics | Costo-beneficio, ROI | `KA12_economics.feature` |

---

## 3. ¿Cómo Usar Estos Templates?

### 3.1. Para Validación de Proceso

Cada feature file contiene escenarios que verifican que un proceso específico está siendo seguido. Usarlos como **checklist viviente**:

```bash
# Ejecutar validación de un KA específico
lein test --features swebok/KA01_requirements.feature

# Ejecutar todas las validaciones SWEBOK
lein test --features swebok/
```

### 3.2. Para Auditorías

Los templates SWEBOK sirven como evidencia de que los procesos están documentados y seguidos. Cada escenario es una verificación auditable.

### 3.3. Para Onboarding

Cuando un nuevo miembro se une al equipo, revisar los templates SWEBOK le da una visión completa de CÓMO se hace el trabajo en GHE.

---

## 4. Relación con IEC 62304

SWEBOK complementa IEC 62304:

| IEC 62304 Requiere | SWEBOK KA que Cubre |
|---|---|
| Plan de desarrollo | KA-07 (Management), KA-08 (Process) |
| Análisis de requisitos | KA-01 (Requirements) |
| Diseño de arquitectura | KA-02 (Design) |
| Implementación | KA-03 (Construction) |
| Verificación | KA-04 (Testing) |
| Validación | KA-04 (Testing), KA-10 (Quality) |
| Mantenimiento | KA-05 (Maintenance) |
| Gestión de configuración | KA-06 (Configuration Management) |
| Gestión de riesgos | KA-12 (Economics) |
| Trazabilidad | KA-01 (Requirements), KA-06 (CM) |

---

## 5. Checklist de Cobertura SWEBOK

Antes de cada release, verificar que todos los KA están cubiertos:

- [ ] **KA-01**: Requisitos documentados y aprobados
- [ ] **KA-02**: Arquitectura documentada con ADRs
- [ ] **KA-03**: Código sigue estándares de Clojure
- [ ] **KA-04**: Tests pasan, cobertura >85%
- [ ] **KA-05**: Proceso de mantenimiento definido
- [ ] **KA-06**: Git limpio, CI/CD funcionando
- [ ] **KA-07**: Sprint completado, retrospectiva realizada
- [ ] **KA-08**: Proceso documentado y seguido
- [ ] **KA-09**: DDD y Arquitectura Hexagonal aplicados
- [ ] **KA-10**: Calidad verificada (ISO 25010)
- [ ] **KA-11**: Ética y responsabilidad social documentadas
- [ ] **KA-12**: Análisis económico actualizado

---

## 6. Métricas SWEBOK para Dashboard

```yaml
# Métricas por KA para monitoreo continuo
swebok_metrics:
  KA01_requirements:
    total_requirements: 50
    approved: 45
    implemented: 40
    verified: 38
    coverage: "84%"
  
  KA02_design:
    adr_count: 12
    bounded_contexts: 6
    design_patterns_used: 8
  
  KA03_construction:
    coding_standards_compliance: "95%"
    static_analysis_issues: 2
  
  KA04_testing:
    total_tests: 5573
    passing: 5573
    coverage: "92%"
    peaeh_pass: true
  
  KA05_maintenance:
    open_defects: 5
    mttr_hours: 4
    tech_debt_days: 3
  
  KA06_cm:
    branches_clean: true
    ci_passing: true
    last_release: "v1.0.0"
  
  KA07_management:
    velocity: 25
    sprint_completion: "90%"
    burndown_on_track: true
  
  KA08_process:
    retrospectives_completed: 12
    action_items_completed: "85%"
  
  KA09_models:
    ddd_applied: true
    hexagonal_applied: true
    solid_compliance: "95%"
  
  KA10_quality:
    iso25010_score: 88
    iec62304_progress: "75%"
  
  KA11_professional:
    code_of_ethics_documented: true
    stakeholder_collaboration: "monthly"
  
  KA12_economics:
    budget_variance: "-8%"
    roi_estimated: "positive"
```

---

## 7. Roadmap de Implementación SWEBOK

| Fase | KAs a Implementar | Duración | Objetivo |
|---|---|---|---|
| **Fase 1** | KA-01, KA-02, KA-09 | Mes 1-2 | Fundamentos de diseño |
| **Fase 2** | KA-03, KA-04, KA-06 | Mes 2-4 | Construcción y testing |
| **Fase 3** | KA-07, KA-08, KA-10 | Mes 4-6 | Gestión y calidad |
| **Fase 4** | KA-05, KA-11, KA-12 | Mes 6-8 | Mantenimiento y ética |

---

## 8. Referencias

- **ISO/IEC 25010**: Systems and software engineering — Quality model
- **ISO/IEC 12207**: Systems and software engineering — Software life cycle processes
- **IEEE SWEBOK**: Guide to the Software Engineering Body of Knowledge
- **IEC 62304**: Medical device software — Software life cycle processes
- **ISO 14971**: Medical devices — Application of risk management

---

*SWEBOK en GHE: Cada proceso tiene dueño, cada decisión tiene registro.*
