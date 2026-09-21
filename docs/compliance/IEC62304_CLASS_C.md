# Especificaciones IEC 62304 Clase C para GHE

**Fecha:** 2026-09-21
**Versión:** 1.0.0
**Referencia:** IEC 62304:2006+AMD1:2015

---

## 1. Clasificación

**Clase C:** Software que puede contribuir a una situación peligrosa que resulte en **muerte o lesión grave**.

### Justificación de Clase C
- GHE gestiona prescripciones médicas → error puede causar muerte
- GHE monitorea signos vitales maternos → fallo puede causar no-detección de complicaciones
- GHE gestiona farmacia → error de dispensación puede causar daño fetal
- GHE calcula dosis → error de cálculo puede causar sobredosis

---

## 2. Requisitos por Sección

### 5.1. Planificación del Desarrollo de Software

| Requisito | Estado GHE | Evidencia |
|---|---|---|
| Plan de desarrollo documentado | 🔄 En proceso | ROADMAP.md |
| Actividades de seguridad incluidas | 🔄 En proceso | ADR-005 |
| Recursos asignados | 🔄 En proceso | PROJECT_CHARTER.md |
| Cronograma definido | 🔄 En proceso | ROADMAP.md |

### 5.2. Análisis de Requisitos de Software

| Requisito | Estado GHE | Evidencia |
|---|---|---|
| Requisitos funcionales | 🔄 En proceso | 171+ features Gherkin |
| Requisitos de seguridad | ✅ | templates/gherkin/security/ |
| Requisitos de rendimiento | 🔄 En proceso | templates/gherkin/performance/ |
| Requisitos de interoperabilidad | 🔄 En proceso | templates/gherkin/hl7_fhir/ |
| Trazabilidad de requisitos | 🔄 En proceso | docs/quality/TRACEABILITY_MATRIX.md |

### 5.3. Diseño de Arquitectura de Software

| Requisito | Estado GHE | Evidencia |
|---|---|---|
| Arquitectura documentada | ✅ | docs/architecture/ARCHITECTURE.md |
| Descomposición en módulos | ✅ | Bounded contexts definidos |
| Análisis de riesgos de arquitectura | 🔄 En proceso | ADR-001 |
| Requisitos de interfaz | 🔄 En proceso | templates/gherkin/hexagonal/ |
| Trazabilidad arquitectura → requisitos | 🔄 En proceso | docs/quality/TRACEABILITY_MATRIX.md |

### 5.4. Diseño de Detalle de Software

| Requisito | Estado GHE | Evidencia |
|---|---|---|
| Diseño de cada módulo | 🔄 En proceso | docs/architecture/ |
| Interfaces entre módulos | 🔄 En proceso | templates/gherkin/hexagonal/02_ports.feature |
| Diseño de bases de datos | 🔄 En proceso | docs/clinical/maternity/PHASE_0_FOUNDATIONS.md |
| Trazabilidad diseño → arquitectura | 🔄 En proceso | docs/quality/TRACEABILITY_MATRIX.md |

### 5.5. Implementación de Software

| Requisito | Estado GHE | Evidencia |
|---|---|---|
| Código según estándares | 🔄 En proceso | standards/CODING_STANDARDS.md |
| Análisis estático | 🔄 En proceso | clj-kondo |
| Code review | 🔄 En proceso | templates/gherkin/code_review/ |
| Tests unitarios >95% cobertura | 🔄 En proceso | 5,573 tests |

### 5.6. Integración y Pruebas

| Requisito | Estado GHE | Evidencia |
|---|---|---|
| Pruebas de integración | 🔄 En proceso | templates/gherkin/tdd/ |
| Verificación de interfaces | 🔄 En proceso | templates/gherkin/hexagonal/ |
| Pruebas de rendimiento | 🔄 En proceso | templates/gherkin/performance/ |

### 5.7. Pruebas del Sistema

| Requisito | Estado GHE | Evidencia |
|---|---|---|
| Pruebas de sistema completas | 🔄 En proceso | templates/gherkin/tdd/ |
| Pruebas de aceptación | 🔄 En proceso | templates/gherkin/ (217 features) |
| Pruebas de seguridad | 🔄 En proceso | templates/gherkin/owasp/ |
| Pruebas de usabilidad | 🔄 En proceso | templates/gherkin/guix_user_first/ |

### 5.8. Liberación y Entrega

| Requisito | Estado GHE | Evidencia |
|---|---|---|
| Proceso de liberación | 🔄 En proceso | docs/operations/DEPLOYMENT.md |
| Verificación pre-liberación | 🔄 En proceso | validate_features.sh |
| Paquete de liberación | 🔄 En proceso | CHANGELOG.md |

### 5.9. Mantenimiento

| Requisito | Estado GHE | Evidencia |
|---|---|---|
| Proceso de mantenimiento | 🔄 En proceso | templates/gherkin/technical_debt/ |
| Clasificación de cambios | 🔄 En proceso | CHANGELOG.md |
| Verificación de cambios | 🔄 En proceso | templates/gherkin/tdd/ |

### 5.10. Gestión de Riesgos

| Requisito | Estado GHE | Evidencia |
|---|---|---|
| ISO 14971 aplicada | 🔄 En proceso | docs/quality/ISO14971_RISK.md |
| Análisis de riesgos por componente | 🔄 En proceso | docs/quality/ISO14971_RISK.md |
| Controles documentados | 🔄 En proceso | PROJECT_CHARTER.md §5 |
| Revisión periódica | 🔄 En proceso | MATURITY_MODEL.md |

### 5.11. Gestión de Configuración

| Requisito | Estado GHE | Evidencia |
|---|---|---|
| Plan de gestión | 🔄 En proceso | standards/ |
| Identificación de elementos | ✅ | validate_features.sh |
| Control de cambios | ✅ | git + PR |
| Auditoría de configuración | 🔄 En proceso | templates/gherkin/framework/ |
| Reporte de estado | 🔄 En proceso | docs/quality/ |

### 5.12. Resolución de Problemas

| Requisito | Estado GHE | Evidencia |
|---|---|---|
| Proceso de reporte | 🔄 En proceso | GitHub Issues |
| Causa raíz | 🔄 En proceso | templates/gherkin/technical_debt/ |
| Acciones correctivas | 🔄 En proceso | CHANGELOG.md |
| Verificación de eficacia | 🔄 En proceso | templates/gherkin/tdd/ |

---

## 3. Documentación Requerida (Checklist)

- [ ] Plan de desarrollo de software → ROADMAP.md
- [ ] Especificación de requisitos → 171+ features Gherkin
- [ ] Documento de arquitectura → ARCHITECTURE.md
- [ ] Documento de diseño de detalle → specs_driven/
- [ ] Plan de verificación → TESTING.md
- [ ] Plan de validación → Pendiente
- [ ] Plan de mantenimiento → technical_debt/
- [ ] Plan de gestión de configuración → standards/
- [ ] Registro de problemas → GitHub Issues
- [ ] Matriz de trazabilidad → TRACEABILITY_MATRIX.md

---

## Referencias

- IEC 62304:2006+AMD1:2015
- ISO 14971:2019
- docs/compliance/NOM_STANDARDS.md
- PROJECT_CHARTER.md
