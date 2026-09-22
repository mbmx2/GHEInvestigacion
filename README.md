# GHE — Sistema de Gestión Hospitalaria Electrónica

## Maternidad de Altotonga, Veracruz, México

> *"La tecnología al servicio de la vida, donde más se necesita."*

**Release Candidate v1.1.0** — Septiembre 2024

---

## Resumen Ejecutivo

GHE es un sistema médico offline-first diseñado para la Maternidad de Altotonga, una comunidad rural en la sierra de Veracruz, México. Este repositorio contiene la **especificación completa** del sistema: 334 feature files Gherkin con 2,157 escenarios que cubren 49 dominios de conocimiento. No es una implementación funcional terminada, sino el esqueleto especificativo que guiará el desarrollo de GHE-v1.

### Datos Clave

| Métrica | Valor |
|---|---|
| Ubicación | Altotonga, Veracruz (sierra rural) |
| Conectividad | 2G/EDGE (intermitente) |
| Población objetivo | Mujeres embarazadas, familias de bajos recursos |
| Stack objetivo | Clojure, SQLite, Architecture Hexagonal |
| Certificación | IEC 62304 en proceso |
| Normativa | NOM-004, NOM-007, NOM-024, LFPDPPP |

---

## Estado del Repositorio — Release Candidate

Métricas verificadas con comandos de sistema de archivos (`find`, `grep`, `wc`, `git log`).

| Métrica | Valor | Verificación |
|---|---|---|
| **Feature files Gherkin** | 334 | `find templates/gherkin -name "*.feature" \| wc -l` |
| **Escenarios Gherkin** | 2,157 | `grep -c "Escenario" ... \| awk` |
| **Líneas en features** | 28,968 | `wc -l templates/gherkin/**/*.feature` |
| **Categorías de dominio** | 49 | `find templates/gherkin -mindepth 1 -maxdepth 1 -type d` |
| **Categorías con 2+ features** | 49/49 (100%) | Verificado por inventario completo |
| **Commits** | 72 | `git log --oneline \| wc -l` |
| **Archivos totales en repo** | 135 | `find . -maxdepth 3 -type f \| wc -l` |

### Estado de Profundización

| Fase | Estado | Detalle |
|---|---|---|
| Profundización de categorías | ✅ Completada | 49/49 categorías con 2+ features |
| Hardening de calidad | ✅ Completado | 11 categorías reforzadas con escenarios negativos, edge cases e invariantes |
| Release Candidate | ✅ Lista | Documentación cerrada, CHANGELOG actualizado |

### Nuevos en v1.1.0

**Phase 1 — Cierre de gaps (7 features):**
- `imaging_workflows` (1→3): seguridad radiológica, dosimetría, QA por modalidad
- `quality_compliance` (1→3): audit trail inmutable, envío regulatorio SUIVE/COFEPRIS
- `iso_13485` (0→3): SGQ, controles de diseño, CAPA

**Phase 2 — Hardening (11 features):**
- `surgery`: checklist por tipo (cesárea, cardíaca), count quirúrgico, negativos
- `security`: pentesting avanzado (BOLA, SSRF, replay, deserialización)
- `medical_calculations`: edge cases (IMC extremo, TFG pediátrica, GCS incompleto)
- `secure_by_design`: invariantes PHI/TLS/sesiones, SAST/DAST en CI/CD
- `emergency_response`: protocolos por tipo de desastre (sismo, inundación, incendio, epidemia)
- `resilience`: circuit breaker, bulkhead, retry, degradación graceful
- `financial_management`: costo por paciente, GDG, facturación aseguradoras
- `integration`: ADT HL7v2, validación, tolerancia a fallos
- `disaster_recovery`: ransomware, contención, recuperación, RTO/RPO
- `incident_response`: post-mortem, playbooks, lecciones aprendidas
- `performance`: benchmarks sync offline 2G/WiFi, cola prioritaria

---

## Especialidades Médicas Cubiertas

| Especialidad | Archivo | Dominio |
|---|---|---|
| **Urgencias** | `emergency.feature` | Clínica |
| **Cirugía** | `surgery/` (4 features) | Quirúrgico |
| **Pediatría** | `pediatrics.feature` | Clínica |
| **Medicina Interna** | `internal_medicine.feature` | Clínica |
| **Cardiología** | `cardiology.feature` | Clínica |
| **Neurología** | `neurology.feature` | Clínica |
| **Ginecología** | `gynecology.feature` | Clínica |
| **Psiquiatría** | `psychiatry.feature` | Clínica |
| **Laboratorio** | `laboratory_workflows/` (3 features) | Diagnóstico |
| **Imagenología** | `imaging_workflows/` (3 features) | Diagnóstico |
| **Nutrición** | `nutrition.feature` | Clínica |
| **Rehabilitación** | `rehabilitation.feature` | Clínica |
| **Odontología** | `dentistry.feature` | Clínica |
| **Referencia** | `referral.feature` | Interconsulta |
| **Enf. Crónicas** | `chronic_disease.feature` | Crónico |
| **Obstetricia** | `prenatal_control.feature` | Materno |
| **Farmacia** | `pharmacy_dispensing.feature` | Farmacia |
| **Triaje** | `triage.feature` | Urgencias |
| **Receta** | `prescription.feature` | Farmacia |
| **Registro** | `patient_registration.feature` | Administrativo |

---

## Categorías de Dominio (49)

### Dominios Clínicos (standalone)
20 archivos `.feature` en raíz de `templates/gherkin/`

### Dominios de Infraestructura y Estándares (49 directorios)

| Categoría | Features | Foco |
|---|---|---|
| `hospital/` | 24 | Hospital completo (24 áreas) |
| `maternity/` | 34 | Maternidad (24 + 10 propuestas) |
| `clinical_safety/` | 20 | Seguridad del paciente |
| `owasp_asvs/` | 13 | Verificación de seguridad |
| `security/` | 13 | Pentesting y defensa |
| `swebok/` | 12 | Ingeniería de software |
| `owasp/` | 11 | Vulnerabilidades web |
| `cmmi/` | 10 | Madurez de procesos |
| `nist/` | 10 | Ciberseguridad |
| `pmbok/` | 10 | Gestión de proyectos |
| `framework/` | 8 | Framework de agentes |
| `guix_user_first/` | 8 | UX/UI médico |
| `agenda/` | 7 | Agenda y workflow engine |
| `offline_first/` | 7 | Arquitectura offline |
| `secure_by_design/` | 8 | Seguridad por diseño |
| `spec_driven/` | 7 | Diseño por especificación |
| `tdd/` | 7 | Testing驱动 development |
| `technical_debt/` | 6 | Deuda técnica |
| `hexagonal/` | 6 | Arquitectura hexagonal |
| `accessibility/` | 5 | Accesibilidad WCAG |
| `medical_calculations/` | 6 | Cálculos clínicos |
| `owasp_samm/` | 5 | MADUREZ DE SEGURIDAD |
| `solid/` | 5 | Principios SOLID |
| `antipatterns/` | 4 | Anti-patrones |
| `patient_lifecycle/` | 4 | Ciclo del paciente |
| `cap_theorem/` | 3 | Teorema CAP |
| `clinical_decision_support/` | 3 | CDSS |
| `laboratory_workflows/` | 3 | Flujos de laboratorio |
| `medication_management/` | 3 | Gestión de medicamentos |
| `observability/` | 3 | Observabilidad |
| `surgery/` | 4 | Checklist quirúrgico |
| `imaging_workflows/` | 3 | Imagenología |
| `quality_compliance/` | 3 | Calidad y cumplimiento |
| `iso_13485/` | 3 | SGQ ISO 13485 |
| `api_patterns/` | 2 | Patrones de API |
| `cicd_pipeline/` | 2 | CI/CD |
| `code_review/` | 2 | Revisión de código |
| `disaster_recovery/` | 3 | Recuperación |
| `domain_events/` | 2 | Eventos de dominio |
| `emergency_response/` | 3 | Respuesta a emergencias |
| `financial_management/` | 3 | Gestión financiera |
| `hl7_fhir/` | 2 | Interoperabilidad |
| `incident_response/` | 3 | Respuesta a incidentes |
| `integration/` | 3 | Integración de sistemas |
| `iso_14971/` | 2 | Gestión de riesgos |
| `performance/` | 3 | Ingeniería de rendimiento |
| `quality/` | 2 | Calidad |
| `reporting_analytics/` | 2 | Reportes |
| `resilience/` | 3 | Resiliencia |

---

## Arquitectura

```
┌─────────────────────────────────────────────────────┐
│                    GHE System                        │
├─────────────────────────────────────────────────────┤
│  ┌──────────┐  ┌──────────┐  ┌──────────┐          │
│  │ Expediente│  │  Triaje  │  │ Farmacia │          │
│  │ Clínico   │  │Obstétrico│  │          │          │
│  └────┬─────┘  └────┬─────┘  └────┬─────┘          │
│       │              │              │                │
│  ┌────┴──────────────┴──────────────┴─────┐         │
│  │     Domain Layer (Clojure)             │         │
│  │     - Bounded Contexts                 │         │
│  │     - Domain Events                     │         │
│  │     - Aggregate Roots                   │         │
│  └────────────────┬───────────────────────┘         │
│                   │                                  │
│  ┌────────────────┴───────────────────────┐         │
│  │     Infrastructure Layer               │         │
│  │     - SQLite (offline-first)            │         │
│  │     - Local sync queue                  │         │
│  │     - Encryption at rest                │         │
│  └────────────────────────────────────────┘         │
│                                                     │
│  ┌────────────────────────────────────────┐         │
│  │     Interface Layer                     │         │
│  │     - Web UI (responsive)               │         │
│  │     - REST API                           │         │
│  │     - FHIR R4 endpoints (future)        │         │
│  └────────────────────────────────────────┘         │
└─────────────────────────────────────────────────────┘
```

---

## Certificación y Cumplimiento

| Estándar | Estado | Alcance |
|---|---|---|
| IEC 62304 | En proceso | Lifecycle de software médico |
| NOM-004-SSA3-2012 | Cumple | Expediente clínico |
| NOM-007-SSA1-2016 | Cumple | Atención prenatal |
| NOM-024-SSA3-2012 | En proceso | Sistemas de información |
| ISO 13485 | Especificado | SGQ (3 features) |
| ISO 14971 | Especificado | Gestión de riesgos |
| OWASP Top 10 + ASVS | Cubierto | 24 features de seguridad |
| LFPDPPP | Cumple | Protección de datos |

---

## Acceso Rápido

### Por audiencia:

| Audiencia | Documento clave | URL |
|---|---|---|
| **Desarrolladores** | Arquitectura + Estándares | `docs/architecture/ARCHITECTURE.md` |
| **Médicos** | Flujos clínicos | `docs/clinical/WORKFLOWS.md` |
| **Compliance** | NOM-004/NOM-024/IEC 62304 | `docs/compliance/` |
| **Ejecutivos** | Misión + Estrategia | `docs/strategy/MISSION.md` |
| **QA/Testing** | Estrategia de testing | `docs/quality/TESTING.md` |
| **Seguridad** | OWASP + Secure by Design | `templates/gherkin/owasp/` |
| **UX/UI** | GUIX User First | `templates/gherkin/guix_user_first/` |

### Por framework:

| Framework | Directorio | Features |
|---|---|---|
| **SWEBOK** | `templates/gherkin/swebok/` | 12 |
| **PMBOK** | `templates/gherkin/pmbok/` | 10 |
| **SOLID** | `templates/gherkin/solid/` | 5 |
| **Hexagonal** | `templates/gherkin/hexagonal/` | 6 |
| **OWASP** | `templates/gherkin/owasp/` | 11 |
| **TDD** | `templates/gherkin/tdd/` | 7 |
| **Secure by Design** | `templates/gherkin/secure_by_design/` | 8 |
| **Offline-First** | `templates/gherkin/offline_first/` | 7 |
| **GUIX User First** | `templates/gherkin/guix_user_first/` | 8 |
| **Spec Driven** | `templates/gherkin/spec_driven/` | 7 |
| **Deuda Técnica** | `templates/gherkin/technical_debt/` | 6 |
| **Cálculos Médicos** | `templates/gherkin/medical_calculations/` | 6 |
| **ISO 13485** | `templates/gherkin/iso_13485/` | 3 |
| **ISO 14971** | `templates/gherkin/iso_14971/` | 2 |
| **CMMI** | `templates/gherkin/cmmi/` | 10 |
| **NIST** | `templates/gherkin/nist/` | 10 |

---

## Licencia

MIT License — Ver `LICENSE` para detalles completos.

Proyecto con excepción para uso en salud pública: sin costo de licencia para instituciones de salud, siempre que se mantenga el copyright y se contribuyan mejoras.

---

*GHE: Tecnología con propósito social, especificación completa, conocimiento transferible.*
