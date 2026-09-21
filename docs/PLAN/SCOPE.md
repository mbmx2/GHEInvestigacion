# Alcance del Proyecto GHE

**Fecha:** 2026-09-21
**Versión:** 1.0.0
**Referencia:** PROJECT_CHARTER.md, ADR-001 a ADR-007

---

## 1. Alcance Incluido

### 1.1. Gestión Clínica

| Módulo | Funcionalidades | Features |
|---|---|---|
| **Pacientes** | Registro, expediente, búsqueda, exportación | patient_lifecycle/01 |
| **Consultas** | Nota SOAP, evolución, firma | clinical_safety/02 |
| **Prescripciones** | Receta electrónica, validación CDS | prescription.feature |
| **Control prenatal** | FUR/FPP, controles, ecografías | maternity/01-02 |
| **Triaje obstétrico** | 5 niveles, clasificación de riesgo | triage.feature |
| **Emergencias** | Protocolos, cascada, documentación | maternity/10 |
| **Farmacia** | Inventario, dispensación, controlados | medication/01 |
| **Laboratorio** | Solicitud, procesamiento, resultados | laboratory/01 |
| **Imagenología** | Radiografía, ecografía | imaging/01 |
| **Calculadoras** | BMI, APGAR, Glasgow, Bishop, etc. | medical_calculations/ |
| **Enfermería** | Triaje, signos vitales, handoff | maternity/06 |

### 1.2. Gestión Administrativa

| Módulo | Funcionalidades | Features |
|---|---|---|
| **Agenda digital** | Motor de workflows, cascada de tareas | agenda/01-04 |
| **Hospitalización** | Admisión, alta, protocolos | hospital/02, 12 |
| **Cirugía** | Pre/intra/post-operatorio | surgery/01-03 |
| **Anestesiología** | Evaluación, monitoreo | hospital/07, 21 |
| **Farmacia hospitalaria** | Inventario, IV, controlados | hospital/18 |
| **Cocina/dieta** | Dietas por patología, HACCP | hospital/04, 23 |
| **Limpieza** | Desinfección, residuos | hospital/05 |
| **Lavandería** | Ropa hospitalaria | hospital/13 |
| **Mantenimiento** | Equipos, gas medicinal | hospital/09, 24 |
| **RRHH** | Personal, turnos, capacitación | hospital/16 |
| **Contabilidad** | Facturación, pagos | hospital/17 |
| **Administración** | Compras, almacén | hospital/06, 14-15 |
| **Laboratorio completo** | Flujo completo | hospital/08, 22 |
| **Imagenología completa** | Flujo completo | hospital/20 |

### 1.3. Seguridad y Calidad

| Módulo | Funcionalidades | Features |
|---|---|---|
| **OWASP Top 10** | 10 vulnerabilidades + ASVS | owasp/ (11 archivos) |
| **Secure by Design** | 7 componentes de seguridad | secure_by_design/ (7) |
| **Pentesting** | Reconocimiento, ataques, validación | security/01a-01c |
| **IA Security** | ML models, LLM, phishing | security/02a-02c |
| **Server Hardening** | OS, BD, aplicación, red | security/03a-03c |
| **Vulnerability Mgmt** | Escaneo, parches, incidentes | security/03d |
| **Data Privacy** | LFPDPPP, ARCO, consentimiento | security/04 |
| **Accesibilidad** | WCAG 2.1 AA completo | accessibility/ (5) |
| **Clinical Safety** | Never events, workflows, competencia | clinical_safety/ (6) |

### 1.4. Ingeniería de Software

| Módulo | Funcionalidades | Features |
|---|---|---|
| **SWEBOK** | 12 áreas de conocimiento | swebok/ (12) |
| **PMBOK** | 10 áreas de gestión | pmbok/ (10) |
| **SOLID** | 5 principios de diseño | solid/ (5) |
| **Hexagonal** | Arquitectura hexagonal | hexagonal/ (6) |
| **TDD** | 7 prácticas de testing | tdd/ (7) |
| **Spec Driven** | clojure.spec | spec_driven/ (7) |
| **Deuda Técnica** | Identificación, métricas, reducción | technical_debt/ (6) |
| **Anti-patrones** | 38 anti-patrones + CRAP | antipatterns/ (4) |
| **CAP Theorem** | Consistencia, disponibilidad | cap_theorem/ (3) |
| **Offline-First** | Sync, conflictos, integridad | offline_first/ (7) |
| **GUIX User First** | UX, WCAG, responsive | guix_user_first/ (8) |

### 1.5. Agentes de IA

| Módulo | Funcionalidades | Features |
|---|---|---|
| **Agenda AI** | Agentes consultivos | agenda/04 |
| **Gobernanza** | Framework de agents | governance/ (3) |
| **Multiagente** | Análisis de casos | multiagent_cases/ (6) |

---

## 2. Alcance Excluido (Fase Futura)

| Área | Razón | Cuándo |
|---|---|---|
| Telemedicina | Requiere video WebRTC | Fase 5+ |
| App móvil nativa | Requiere React Native/Flutter | Fase 5+ |
| Multi-tenant | Requiere diseño multi-tenant | Fase 6+ |
| Agentes IA ejecutivos | Riesgo regulatorio | Investigación |
| FHIR completo | Requiere validación externa | Fase 4+ |
| ML predictivo | Requiere datos acumulados | Fase 6+ |
| IMSS/ISSSTE integration | Requiere convenio institucional | Fase 5+ |

---

## 3. Dependencias Externas

| Dependencia | Tipo | Estado |
|---|---|---|
| Clojure/ClojureScript | Stack tecnológico | Disponible |
| SQLite + SQLCipher | Persistencia | Disponible |
| NOM-004-SSA3-2012 | Normativa | Vigente |
| NOM-024-SSA3-2012 | Normativa | Vigente |
| IEC 62304:2006+AMD1:2015 | Estándar internacional | Vigente |
| ISO 14971:2019 | Estándar internacional | Vigente |
| LFPDPPP | Ley | Vigente |
| COFEPRIS | Regulador | Activo |

---

## Referencias

- PROJECT_CHARTER.md
- ADR-001 a ADR-007
- docs/quality/IEC62304_CLASS_C.md
- docs/quality/ISO14971_RISK.md
- docs/compliance/NOM_STANDARDS.md
