# Alineación con CMMI (Capability Maturity Model Integration)

**Fecha:** 2026-09-21
**Versión:** 1.0.0
**Referencia:** CMMI for Development v2.0 (SEI/CMU)
**Estado:** Alineación documentada. NO certificación.

---

## 1. Aclaración Importante

> **Este documento documenta la ALINEACIÓN de GHE con CMMI, NO la certificación.**
> GHE NO está certificado CMMI. Este documento describe el nivel de madurez interno
> y las brechas que existen.

---

## 2. Áreas de Proceso CMMI Aplicables

### 2.1. Gobernanza (Governance)

| Práctica CMMI | GHE implementa | Nivel actual | Evidencia |
|---|---|---|---|
| Establecer política de calidad | Política documentada | 1 | docs/quality/ |
| Establecer objetivos de calidad | Objetivos definidos | 1 | MATURITY_MODEL.md |
| Monitorear calidad | Métricas definidas | 1 | FEATURE_COVERAGE_REPORT.md |

### 2.2. Planificación (Planning)

| Práctica CMMI | GHE implementa | Nivel actual | Evidencia |
|---|---|---|---|
| Plan de desarrollo | ROADMAP.md | 2 | docs/PLAN/ |
| Estimación de esfuerzo | Planificación por fases | 1 | ROADMAP.md |
| Gestión de riesgos | ISO 14971 | 2 | docs/compliance/ISO14971_RISK.md |

### 2.3. Gestión del Proceso (Process Management)

| Práctica CMMI | GHE implementa | Nivel actual | Evidencia |
|---|---|---|---|
| Definición del proceso | SWEBOK documentado | 2 | docs/quality/SWEBOK_GUIDE.md |
| Mejora del proceso | Retrospectivas | 1 | PMBOK KA-08 |
| Medición del proceso | Métricas definidas | 1 | FEATURE_COVERAGE_REPORT.md |

### 2.4. Ingeniería de Requisitos (Requirements)

| Práctica CMMI | GHE implementa | Nivel actual | Evidencia |
|---|---|---|---|
| Gestión de requisitos | SRS.md | 1 | docs/requirements/SRS.md |
| Desarrollo de requisitos | Features Gherkin | 2 | templates/gherkin/ |
| Verificación de requisitos | Trazabilidad | 1 | TRACEABILITY_MATRIX.md |

### 2.5. Diseño y Desarrollo (Design & Development)

| Práctica CMMI | GHE implementa | Nivel actual | Evidencia |
|---|---|---|---|
| Diseño de arquitectura | Hexagonal | 2 | ADR-001 |
| Diseño de detalle | Specs | 2 | spec_driven/ |
| Implementación | Clojure + TDD | 2 | coding standards |
| Integración | Bounded contexts | 2 | hexagonal/ |

### 2.6. Verificación (Verification)

| Práctica CMMI | GHE implementa | Nivel actual | Evidencia |
|---|---|---|---|
| Verificación de componentes | Unit tests | 2 | 5,573 tests |
| Verificación de integración | Integration tests | 1 | tdd/ |
| Verificación de sistema | E2E tests | 1 | tdd/ |
| Pruebas de aceptación | Features Gherkin | 1 | 260 features |

### 2.7. Validación (Validation)

| Práctica CMMI | GHE implementa | Nivel actual | Evidencia |
|---|---|---|---|
| Validación clínica | Piloto planificado | 0 | ROADMAP.md |
| Validación de usabilidad | WCAG + GUIX | 1 | accessibility/ |
| Validación con usuarios | Pendiente | 0 | — |

### 2.8. Gestión de Configuración (Configuration Management)

| Práctica CMMI | GHE implementa | Nivel actual | Evidencia |
|---|---|---|---|
| Identificación de configuración | Tags @id | 1 | templates/gherkin/ |
| Control de cambios | Git + PR | 2 | .git/ |
| Auditoría de configuración | validate_features.sh | 1 | validate_features.sh |

### 2.9. Medición y Análisis (Measurement & Analysis)

| Práctica CMMI | GHE implementa | Nivel actual | Evidencia |
|---|---|---|---|
| Medición del proceso | Métricas definidas | 1 | FEATURE_COVERAGE_REPORT.md |
| Análisis de datos | Dashboard pendiente | 0 | — |

### 2.10. Análisis y Resolución de Problemas

| Práctica CMMI | GHE implementa | Nivel actual | Evidencia |
|---|---|---|---|
| Detección de problemas | validate_features.sh | 1 | validate_features.sh |
| Análisis de causa raíz | technical_debt/ | 1 | templates/gherkin/technical_debt/ |

---

## 3. Niveles de Madurez CMMI

| Nivel | Descripción | GHE actual |
|---|---|---|
| Nivel 1 - Inicial | Procesos caóticos | ❌ No aplica |
| Nivel 2 - Gestionado | Procesos gestionados por proyecto | ✅ Parcial |
| Nivel 3 - Definido | Procesos estandarizados en la organización | 🔄 En proceso |
| Nivel 4 - Cuantitativamente gestionado | Procesos medidos | ❌ No aplica |
| Nivel 5 - En optimización | Mejora continua | ❌ No aplica |

**Nivel actual estimado: 1.5** (entre Inicial y Gestionado)

---

## 4. Brechas Principales

| Brecha | Nivel actual | Nivel objetivo | Acción |
|---|---|---|---|
| Validación clínica | 0 | 2 | Planificar piloto |
| Medición de procesos | 1 | 2 | Implementar dashboard |
| Gestión de configuración | 1 | 2 | Completar tags y validación |
| Análisis de problemas | 1 | 2 | Formalizar proceso RCA |
| Documentación de procesos | 2 | 3 | Estandarizar con templates |

---

## Referencias

- CMMI for Development v2.0 (SEI/CMU)
- docs/quality/MATURITY_MODEL.md
- docs/quality/SWEBOK_GUIDE.md
- docs/PLAN/ROADMAP.md
