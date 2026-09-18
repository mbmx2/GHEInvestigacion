# Workflows Agénticos: Vinculación Integral de Templates

> *"Cada template es una pieza. El workflow agéntico es el rompecabezas completo."*

---

## 1. Mapa de Vinculación

### 1.1. Grafo de Dependencias

```
┌─────────────────────────────────────────────────────────────────────┐
│                    WORKFLOW MAESTRO DE GHE                          │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  FASE 1: DISEÑO ──────────────────────────────────────────────     │
│  │                                                                   │
│  ├── SWEBOK KA-01 (Requirements)                                    │
│  │   └──→ PMBOK KA-02 (Scope)                                       │
│  │                                                                   │
│  ├── SWEBOK KA-02 (Design)                                          │
│  │   ├──→ Hexagonal Architecture                                    │
│  │   ├──→ SOLID Principles                                          │
│  │   └──→ Secure by Design                                          │
│  │                                                                   │
│  ├── GUIX User First (UX Design)                                    │
│  │   └──→ Accessibility (WCAG)                                      │
│  │                                                                   │
│  └── Spec Driven Design                                             │
│      └──→ Domain Specs                                              │
│                                                                     │
│  FASE 2: DESARROLLO ──────────────────────────────────────────     │
│  │                                                                   │
│  ├── TDD (Red-Green-Refactor)                                       │
│  │   ├──→ Unit Testing                                              │
│  │   ├──→ Integration Testing                                       │
│  │   └──→ Acceptance Testing                                        │
│  │                                                                   │
│  ├── Spec Driven Design                                             │
│  │   ├──→ API Design                                                │
│  │   ├──→ Database Schemas                                          │
│  │   └──→ UI Forms                                                  │
│  │                                                                   │
│  ├── SWEBOK KA-03 (Construction)                                    │
│  │   └──→ Coding Standards                                          │
│  │                                                                   │
│  └── Offline-First Architecture                                     │
│      ├──→ Local Storage (SQLite)                                    │
│      ├──→ Sync Engine                                               │
│      └──→ Conflict Resolution                                       │
│                                                                     │
│  FASE 3: VERIFICACIÓN ────────────────────────────────────────     │
│  │                                                                   │
│  ├── SWEBOK KA-04 (Testing)                                         │
│  │   ├──→ Unit Tests (5,573+)                                       │
│  │   ├──→ Integration Tests                                         │
│  │   ├──→ E2E Tests                                                 │
│  │   └──→ PEAEH (Meta-testing)                                      │
│  │                                                                   │
│  ├── OWASP Top 10                                                   │
│  │   ├──→ A01-A10 Verification                                      │
│  │   └──→ ASVS Compliance                                           │
│  │                                                                   │
│  ├── Secure by Design                                               │
│  │   ├──→ Threat Modeling                                           │
│  │   └──→ Security Testing                                          │
│  │                                                                   │
│  └── Cálculos Médicos                                               │
│      ├──→ Blood Count, Chemistry                                    │
│      ├──→ Blood Gas                                                 │
│      ├──→ Health Calculators                                        │
│      └──→ Clinical History                                          │
│                                                                     │
│  FASE 4: DESPLIEGUE ──────────────────────────────────────────     │
│  │                                                                   │
│  ├── PMBOK KA-03 (Schedule)                                         │
│  ├── PMBOK KA-04 (Cost)                                             │
│  ├── PMBOK KA-06 (Resources)                                        │
│  └── SWEBOK KA-06 (Config Management)                               │
│                                                                     │
│  FASE 5: OPERACIONES ──────────────────────────────────────────    │
│  │                                                                   │
│  ├── SWEBOK KA-05 (Maintenance)                                     │
│  ├── SWEBOK KA-08 (Process)                                         │
│  ├── Technical Debt Management                                      │
│  ├── PMBOK KA-08 (Risk)                                             │
│  └── PMBOK KA-10 (Stakeholders)                                     │
│                                                                     │
│  FASE 6: ANÁLISIS ────────────────────────────────────────────     │
│  │                                                                   │
│  └── Multi-Agent Case Analysis                                      │
│      ├──→ Legal, Economic, Ethical                                  │
│      ├──→ Sociological, Technical                                   │
│      └──→ Clinical, Data                                            │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

---

## 2. Workflows Agénticos Específicos

### 2.1. Workflow: Nueva Funcionalidad

```yaml
workflow: "Nueva Funcionalidad"
trigger: "Solicitud de feature nueva"
agents:
  - id: "AGENT-PM"
    role: "Project Manager"
    templates: ["PMBOK-KA01", "PMBOK-KA02", "PMBOK-KA07"]
    actions:
      - "Definir alcance (PMBOK KA-02)"
      - "Crear ticket con criterios de aceptación"
      - "Estimar esfuerzo"
      - "Asignar a desarrollador"
    
  - id: "AGENT-REQ"
    role: "Requirements Analyst"
    templates: ["SWEBOK-KA01", "Spec-Driven-02"]
    actions:
      - "Capturar requisitos"
      - "Crear spec de dominio"
      - "Validar con stakeholders"
      - "Documentar en SRS"
    
  - id: "AGENT-ARCH"
    role: "Architect"
    templates: ["Hexagonal-01", "Hexagonal-02", "SOLID", "Secure-by-Design"]
    actions:
      - "Diseñar bounded context"
      - "Definir puertos"
      - "Verificar SOLID"
      - "Evaluar seguridad"
    
  - id: "AGENT-DEV"
    role: "Developer"
    templates: ["TDD-01", "Spec-Driven-03", "Coding-Standards"]
    actions:
      - "Escribir tests (TDD Red)"
      - "Implementar código (TDD Green)"
      - "Refactorizar (TDD Refactor)"
      - "Validar specs"
    
  - id: "AGENT-QA"
    role: "QA Engineer"
    templates: ["SWEBOK-KA04", "OWASP", "Testing-Strategy"]
    actions:
      - "Ejecutar suite de tests"
      - "Verificar cobertura >85%"
      - "Ejecutar security scan"
      - "Validar aceptación"
    
  - id: "AGENT-DOC"
    role: "Documentation"
    templates: ["SWEBOK-KA06", "Changelog"]
    actions:
      - "Actualizar documentación"
      - "Crear changelog"
      - "Documentar decisiones"
```

### 2.2. Workflow: Corrección de Bug Crítico

```yaml
workflow: "Bug Crítico en Producción"
trigger: "Bug que afecta seguridad o datos de pacientes"
agents:
  - id: "AGENT-INCIDENT"
    role: "Incident Commander"
    templates: ["SWEBOK-KA05", "PMBOK-KA08"]
    actions:
      - "Clasificar severidad (S1)"
      - "Activar protocolo de incidente"
      - "Notificar stakeholders"
      - "Coordinar respuesta"
    
  - id: "AGENT-SECURITY"
    role: "Security Analyst"
    templates: ["OWASP-A01-A10", "Secure-by-Design-07"]
    actions:
      - "Evaluar impacto de seguridad"
      - "Verificar si hay breach"
      - "Activar respuesta si aplica"
    
  - id: "AGENT-DEV"
    role: "Developer (Hotfix)"
    templates: ["TDD-01", "Hexagonal", "Coding-Standards"]
    actions:
      - "Escribir test que reproduzca el bug (RED)"
      - "Implementar fix (GREEN)"
      - "Verificar que test pasa"
      - "Code review urgente"
    
  - id: "AGENT-QA"
    role: "QA (Verification)"
    templates: ["SWEBOK-KA04", "OWASP"]
    actions:
      - "Ejecutar todos los tests"
      - "Verificar que bug está corregido"
      - "Ejecutar security scan"
      - "Aprobar para deploy"
    
  - id: "AGENT-OPS"
    role: "Operations"
    templates: ["SWEBOK-KA06", "Deployment"]
    actions:
      - "Crear backup antes de deploy"
      - "Desplegar hotfix"
      - "Verificar en producción"
      - "Monitorear 24 horas"
```

### 2.3. Workflow: Auditoría de Seguridad

```yaml
workflow: "Auditoría de Seguridad Trimestral"
trigger: "Calendario (cada 3 meses)"
agents:
  - id: "AGENT-SEC-LEAD"
    role: "Security Lead"
    templates: ["OWASP", "Secure-by-Design", "ASVS"]
    actions:
      - "Coordinar auditoría"
      - "Definir alcance"
      - "Asignar tareas"
    
  - id: "AGENT-SAST"
    role: "Static Analysis"
    templates: ["OWASP-A03", "OWASP-A06"]
    actions:
      - "Ejecutar SAST (clj-kondo)"
      - "Ejecutar dependency scan"
      - "Revisar vulnerabilidades"
      - "Generar reporte"
    
  - id: "AGENT-DAST"
    role: "Dynamic Analysis"
    templates: ["OWASP-A01-A10", "ASVS"]
    actions:
      - "Ejecutar OWASP ZAP"
      - "Ejecutar pentest básico"
      - "Verificar headers de seguridad"
      - "Generar reporte"
    
  - id: "AGENT-COMPLIANCE"
    role: "Compliance"
    templates: ["NOM004", "NOM024", "IEC62304", "LFPDPPP"]
    actions:
      - "Verificar cumplimiento NOM-004"
      - "Verificar cumplimiento NOM-024"
      - "Verificar LFPDPPP"
      - "Generar matriz de cumplimiento"
    
  - id: "AGENT-REPORT"
    role: "Reporter"
    templates: ["PMBOK-KA07", "Technical-Debt-06"]
    actions:
      - "Consolidar hallazgos"
      - "Generar reporte ejecutivo"
      - "Presentar a dirección"
      - "Crear plan de remediación"
```

### 2.4. Workflow: Release de Software

```yaml
workflow: "Release de Software"
trigger: "Feature completada + bug fixes acumulados"
agents:
  - id: "AGENT-PM"
    role: "Release Manager"
    templates: ["PMBOK-KA03", "PMBOK-KA04", "PMBOK-KA07"]
    actions:
      - "Verificar que todos los features están completos"
      - "Verificar que no hay bugs S1/S2 abiertos"
      - "Crear release branch"
      - "Notificar al equipo"
    
  - id: "AGENT-QA"
    role: "QA (Release Testing)"
    templates: ["SWEBOK-KA04", "TDD-06"]
    actions:
      - "Ejecutar suite completa de tests"
      - "Verificar cobertura >85%"
      - "Ejecutar E2E tests"
      - "Firmar off de calidad"
    
  - id: "AGENT-SECURITY"
    role: "Security (Pre-release)"
    templates: ["OWASP", "Secure-by-Design"]
    actions:
      - "Ejecutar security scan final"
      - "Verificar dependencias"
      - "Firmar off de seguridad"
    
  - id: "AGENT-DOC"
    role: "Documentation"
    templates: ["SWEBOK-KA06", "Changelog"]
    actions:
      - "Actualizar changelog"
      - "Actualizar documentación de API"
      - "Crear release notes"
    
  - id: "AGENT-OPS"
    role: "Operations (Deploy)"
    templates: ["Deployment", "SWEBOK-KA06"]
    actions:
      - "Crear backup de BD"
      - "Desplegar a staging"
      - "Verificar en staging"
      - "Desplegar a producción"
      - "Monitorear post-deploy"
    
  - id: "AGENT-STAKEHOLDER"
    role: "Stakeholder Communication"
    templates: ["PMBOK-KA10", "PMBOK-KA07"]
    actions:
      - "Notificar a stakeholders"
      - "Actualizar dashboard"
      - "Documentar lecciones aprendidas"
```

### 2.5. Workflow: Capacitación de Nuevo Equipo

```yaml
workflow: "Onboarding de Nuevo Miembro"
trigger: "Nuevo miembro se une al equipo"
agents:
  - id: "AGENT-ONBOARD"
    role: "Onboarding Lead"
    templates: ["PMBOK-KA06", "SWEBOK-KA11"]
    actions:
      - "Preparar materiales de onboarding"
      - "Asignar buddy"
      - "Crear cuenta de acceso"
    
  - id: "AGENT-TECH"
    role: "Technical Mentor"
    templates: ["Hexagonal", "SOLID", "TDD", "Spec-Driven"]
    actions:
      - "Explicar arquitectura hexagonal"
      - "Explicar principios SOLID"
      - "Demostrar flujo TDD"
      - "Explicar uso de specs"
    
  - id: "AGENT-CLINICAL"
    role: "Clinical Mentor"
    templates: ["Medical-Calculations", "Clinical-History", "Workflows-Medicos"]
    actions:
      - "Explicar flujos clínicos"
      - "Demostrar calculadoras médicas"
      - "Revisar templates de historia clínica"
    
  - id: "AGENT-SECURITY"
    role: "Security Training"
    templates: ["OWASP", "Secure-by-Design", "Compliance"]
    actions:
      - "Capacitar en OWASP Top 10"
      - "Explicar NOM-004/NOM-024"
      - "Demostrar prácticas seguras"
```

---

## 3. Matriz de Vinculación Template → Workflow

| Template | Workflow 1 | Workflow 2 | Workflow 3 | Workflow 4 | Workflow 5 |
|---|---|---|---|---|---|
| SWEBOK-KA01 | ✅ | — | — | — | — |
| SWEBOK-KA02 | ✅ | — | — | — | — |
| SWEBOK-KA03 | ✅ | ✅ | — | — | — |
| SWEBOK-KA04 | ✅ | ✅ | ✅ | ✅ | — |
| SWEBOK-KA05 | — | ✅ | — | — | — |
| SWEBOK-KA06 | — | — | — | ✅ | — |
| PMBOK-KA01 | ✅ | — | — | — | — |
| PMBOK-KA02 | ✅ | — | — | — | — |
| PMBOK-KA03 | — | — | — | ✅ | — |
| PMBOK-KA04 | — | — | — | ✅ | — |
| PMBOK-KA06 | — | — | — | — | ✅ |
| PMBOK-KA07 | — | — | ✅ | ✅ | — |
| PMBOK-KA08 | — | ✅ | — | — | — |
| PMBOK-KA10 | — | — | — | ✅ | — |
| Hexagonal | ✅ | ✅ | — | — | ✅ |
| SOLID | ✅ | ✅ | — | — | ✅ |
| TDD | ✅ | ✅ | — | ✅ | ✅ |
| OWASP | — | ✅ | ✅ | ✅ | ✅ |
| Secure-by-Design | ✅ | ✅ | ✅ | — | ✅ |
| Offline-First | ✅ | — | — | — | — |
| Spec-Driven | ✅ | — | — | — | ✅ |
| GUIX-User-First | ✅ | — | — | — | — |
| Technical-Debt | — | — | — | — | — |
| Medical-Calculations | — | — | — | — | ✅ |
| Multi-Agent | — | — | ✅ | — | — |

---

*Workflows Agénticos: Cada template conectado, cada acción orquestada.*
