# Guía PMBOK para el Proyecto GHE

> *"PMBOK no es paperwork — es la verificación de que el proyecto está siendo gestionado profesionalmente."*

---

## 1. ¿Qué es PMBOK?

**PMBOK** (Project Management Body of Knowledge) es el estándar del **PMI** (Project Management Institute) que define las buenas prácticas de gestión de proyectos. Proporciona un marco de referencia para:

- Planificar y ejecutar proyectos de forma estructurada
- Gestionar alcance, tiempo, costo y calidad
- Identificar y mitigar riesgos
- Comunicar efectivamente con stakeholders
- Asegurar satisfacción del cliente

---

## 2. Áreas de Conocimiento (KA) Aplicadas a GHE

### Mapeo PMBOK → GHE

| KA | Nombre | Aplicación en GHE | Feature File |
|---|---|---|---|
| **KA-01** | Integration Management | Charter, plan de proyecto | `KA01_integration.feature` |
| **KA-02** | Scope Management | EDT/WBS, control de cambios | `KA02_scope.feature` |
| **KA-03** | Schedule Management | Cronograma, ruta crítica, EVM | `KA03_schedule.feature` |
| **KA-04** | Cost Management | Presupuesto, valor ganado | `KA04_cost.feature` |
| **KA-05** | Quality Management | Estándares, QA, métricas | `KA05_quality.feature` |
| **KA-06** | Resource Management | Equipo, RACI, competencias | `KA06_resources.feature` |
| **KA-07** | Communications Management | Matriz de comunicaciones | `KA07_communications.feature` |
| **KA-08** | Risk Management | Identificación, análisis, respuesta | `KA08_risk.feature` |
| **KA-09** | Procurement Management | Make or buy, proveedores | `KA09_procurement.feature` |
| **KA-10** | Stakeholder Management | Identificación, engagement | `KA10_stakeholders.feature` |

---

## 3. Relación PMBOK ↔ SWEBOK ↔ IEC 62304

Los tres marcos se complementan:

| Ámbito | PMBOK | SWEBOK | IEC 62304 |
|---|---|---|---|
| **Gestión de proyecto** | ✅ KA-01, KA-03, KA-04 | Parcial KA-07 | — |
| **Ingeniería de software** | — | ✅ KA-01 a KA-12 | ✅ Lifecycle completo |
| **Calidad** | ✅ KA-05 | ✅ KA-10 | ✅ Proceso de verificación |
| **Riesgos** | ✅ KA-08 | — | ✅ ISO 14971 |
| **Configuración** | — | ✅ KA-06 | ✅ CM requerido |
| **Requisitos** | ✅ KA-02 | ✅ KA-01 | ✅ Análisis de requisitos |
| **Stakeholders** | ✅ KA-10 | — | — |
| **Recursos** | ✅ KA-06 | — | — |
| **Comunicaciones** | ✅ KA-07 | — | — |
| **Adquisiciones** | ✅ KA-09 | — | — |

---

## 4. ¿Cómo Usar Estos Templates?

### 4.1. Para Gestión de Proyecto

Cada sprint, verificar que los procesos PMBOK están siendo seguidos:

```bash
# Ejecutar validación de un KA específico
lein test --features pmbok/KA03_schedule.feature

# Ejecutar todas las validaciones PMBOK
lein test --features pmbok/
```

### 4.2. Para Auditorías

Los templates PMBOK sirven como evidencia de gestión profesional del proyecto. Cada escenario es una verificación auditable.

### 4.3. Para Reporting

Usar los templates como base para reportes de avance a stakeholders.

---

## 5. Checklist de Cobertura PMBOK

Antes de cada release, verificar que todas las KAs están cubiertas:

- [ ] **KA-01**: Charter aprobado, plan de proyecto actualizado
- [ ] **KA-02**: EDT actualizado, control de cambios funcionando
- [ ] **KA-03**: Cronograma actualizado, ruta crítica monitoreada
- [ ] **KA-04**: Presupuesto controlado, EVM calculado
- [ ] **KA-05**: Estándares documentados, QA ejecutándose
- [ ] **KA-06**: Equipo asignado, RACI actualizado
- [ ] **KA-07**: Comunicaciones ejecutándose según matriz
- [ ] **KA-08**: Register de riesgos actualizado
- [ ] **KA-09**: Adquisiciones gestionadas
- [ ] **KA-10**: Stakeholders monitoreados

---

## 6. Métricas PMBOK para Dashboard

```yaml
pmbok_metrics:
  KA01_integration:
    charter_approved: true
    plan_updated: "2024-09-18"
    change_requests_open: 2
  
  KA02_scope:
    wbs_items: 45
    scope_changes_this_month: 3
    acceptance_criteria_met: "90%"
  
  KA03_schedule:
    spi: 0.94
    critical_path_on_track: true
    milestones_met: "85%"
  
  KA04_cost:
    cpi: 0.98
    budget_variance: "-8%"
    eac: "$484,694"
  
  KA05_quality:
    defect_density: 0.3
    test_coverage: "92%"
    review_pass_rate: "92%"
  
  KA06_resources:
    team_utilization: "85%"
    competency_gaps: 2
    training_planned: 3
  
  KA07_communications:
    meetings_held: 48
    reports_delivered: 12
    stakeholder_satisfaction: "88%"
  
  KA08_risks:
    risks_identified: 8
    risks_mitigated: 5
    risks_materialized: 1
    risk_response_effectiveness: "75%"
  
  KA09_procurement:
    contracts_active: 2
    contracts_completed: 1
    vendor_satisfaction: "85%"
  
  KA10_stakeholders:
    stakeholders_identified: 8
    engagement_level: "Manage Closely"
    resistance_items: 1
```

---

## 7. Roadmap de Implementación PMBOK

| Fase | KAs a Implementar | Duración | Objetivo |
|---|---|---|---|
| **Fase 1** | KA-01, KA-02, KA-10 | Mes 1 | Fundamentos del proyecto |
| **Fase 2** | KA-03, KA-04, KA-06 | Mes 1-2 | Planificación detallada |
| **Fase 3** | KA-05, KA-07, KA-08 | Mes 2-3 | Calidad y comunicación |
| **Fase 4** | KA-09 | Mes 3+ | Adquisiciones según necesidad |

---

## 8. Referencias

- **PMBOK Guide 7th Edition**: Project Management Institute
- **ISO 21500**: Guidance on project management
- **ISO 21502**: Project, programme and portfolio management
- **ISO 21503**: Project, programme and portfolio management — Guidance on programme management

---

*PMBOK en GHE: Cada proyecto tiene plan, cada plan tiene seguimiento.*
