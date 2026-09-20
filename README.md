# GHE — Sistema de Gestión Hospitalaria Electrónica

## Maternidad de Altotonga, Veracruz, México

> *"La tecnología al servicio de la vida, donde más se necesita."*

---

## Resumen Ejecutivo

GHE es un sistema médico offline-first diseñado para la Maternidad de Altotonga, una comunidad rural en la sierra de Veracruz, México. Combina expedientes clínicos electrónicos, farmacia, triaje obstétrico y recetas en una arquitectura hexagonal robusta y certificable.

### Datos Clave

| Métrica | Valor |
|---|---|
| Ubicación | Altotonga, Veracruz (sierra rural) |
| Conectividad | 2G/EDGE (intermitente) |
| Población objetivo | Mujeres embarazadas, familias de bajos recursos |
| Stack | Clojure, SQLite, Architecture Hexagonal |
| Tests automatizados | 5,573+ |
| Meta-testing | PEAEH (verificación de tests) |
| Certificación | IEC 62304 en proceso |
| Normativa | NOM-004, NOM-007, NOM-024 |

### Estado del Repositorio (Verificado 2024-09-20)

| Métrica | Valor | Nota |
|---|---|---|
| Archivos totales | 534 | features + docs |
| Feature files Gherkin | 424 | Verificado con `find` |
| Documentos .md | 110 | Verificado con `find` |
| Escenarios Gherkin | 1,478 | Verificado con `grep` |
| Líneas en features | 43,012 | Verificado con `wc` |
| Líneas en docs | 25,010 | Verificado con `wc` |
| Categorías de templates | 31 | Directorios activos |
| Commits | 35+ | Verificado con `git log` |

> **Nota:** Las métricas anteriores (248 archivos, 34,148 líneas) estaban desactualizadas. Las cifras aquí son las verificadas con comandos de sistema de archivos.

---

## Especialidades Médicas Cubiertas

GHE incluye workflows completos para todas las áreas de especialización médica:

| Especialidad | Archivo | Escenarios | Casos de uso |
|---|---|---|---|
| **Urgencias** | `emergency.feature` | 10 | Triaje 5 niveles, politraumatismo, PCR, intoxicación |
| **Cirugía** | `surgery.feature` | 8 | Preoperatorio, intraoperatorio, recuperación, ISQ |
| **Pediatría** | `pediatrics.feature` | 8 | Niño sano, vacunas, crecimiento, IRA, emergencia |
| **Medicina Interna** | `internal_medicine.feature` | 8 | Diabetes, HTA, ERC, asma, cetoacidosis, diálisis |
| **Cardiología** | `cardiology.feature` | 7 | Dolor torácico, ECG, ecocardiograma, ICFE, MAPA |
| **Neurología** | `neurology.feature` | 7 | Cefalea, Glasgow, epilepsia, ictus, Parkinson |
| **Ginecología** | `gynecology.feature` | 7 | PAP, miomas, endometriosis, aborto, anticoncepción |
| **Psiquiatría** | `psychiatry.feature` | 8 | Depresión, ansiedad, riesgo suicida, litio, TEC |
| **Laboratorio** | `laboratory.feature` | 8 | Solicitud, procesamiento, valores críticos, QC |
| **Imagenología** | `radiology.feature` | 8 | RX, ecografía, TAC, dosis radiación, lista espera |
| **Nutrición** | `nutrition.feature` | 8 | Evaluación, plan alimentario, diabéticos, oncológico |
| **Rehabilitación** | `rehabilitation.feature` | 7 | Evaluación, sesión, progreso, terapia de lenguaje |
| **Odontología** | `dentistry.feature` | 7 | Odontograma, caries, profilaxis, urgencia, plan |
| **Referencia** | `referral.feature` | 7 | Referencia, contrarreferencia, interconsulta, seguimiento |
| **Enf. Crónicas** | `chronic_disease.feature` | 8 | Registro, dashboard, adherencia, complicaciones |
| **Obstetricia** | `prenatal_control.feature` | 8 | Control prenatal, preeclampsia, CIUR |
| **Farmacia** | `pharmacy_dispensing.feature` | 8 | Dispensación, stock, interacciones, controlados |
| **Triaje** | `triage.feature` | 7 | 4 niveles, emergencia, historial |
| **Receta** | `prescription.feature` | 8 | Generación, alergias, dosis, interacciones |
| **Registro** | `patient_registration.feature` | 7 | Walk-in, CURP, duplicados, offline |

**Total: 20 archivos, 151 escenarios Gherkin**

---

## Estructura del Proyecto

```
GHEInvestigacion/
├── README.md                          # Este archivo
├── docs/
│   ├── strategy/
│   │   ├── MISSION.md                 # Misión y responsabilidad social
│   │   ├── MARKET.md                  # Análisis de mercado
│   │   └── COMPETITIVE.md             # Análisis competitivo
│   ├── architecture/
│   │   ├── ARCHITECTURE.md            # Arquitectura hexagonal
│   │   ├── STANDARDS.md              # Estándares técnicos
│   │   └── INTEROPERABILITY.md       # HL7 FHIR e interoperabilidad
│   ├── compliance/
│   │   ├── NOM004.md                  # Expediente clínico
│   │   ├── NOM007.md                  # Atención prenatal
│   │   ├── NOM024.md                  # Sistemas de información
│   │   ├── IEC62304.md               # Software médico
│   │   └── LFPDPPP.md               # Protección de datos
│   ├── clinical/
│   │   ├── WORKFLOWS.md              # Flujos clínicos
│   │   ├── TEMPLATES.md              # Plantillas de documentación
│   │   └── SAFETY.md                 # Seguridad del paciente
│   ├── quality/
│   │   ├── QUALITY_STANDARDS.md      # Estándares de calidad
│   │   ├── TESTING.md                # Estrategia de testing
│   │   └── AUDIT.md                  # Auditorías
│   └── operations/
│       ├── DEPLOYMENT.md             # Despliegue
│       ├── MONITORING.md             # Monitoreo
│       └── DISASTER_RECOVERY.md      # Recuperación
├── templates/
│   ├── gherkin/
│   │   ├── patient_registration.feature   # Registro de pacientes
│   │   ├── prenatal_control.feature       # Control prenatal
│   │   ├── pharmacy_dispensing.feature    # Dispensación farmacia
│   │   ├── triage.feature                 # Triaje obstétrico
│   │   ├── prescription.feature           # Receta electrónica
│   │   ├── emergency.feature              # Urgencias
│   │   ├── surgery.feature                # Cirugía
│   │   ├── pediatrics.feature             # Pediatría
│   │   ├── internal_medicine.feature      # Medicina Interna
│   │   ├── cardiology.feature             # Cardiología
│   │   ├── neurology.feature              # Neurología
│   │   ├── gynecology.feature             # Ginecología
│   │   ├── psychiatry.feature             # Psiquiatría
│   │   ├── laboratory.feature             # Laboratorio
│   │   ├── radiology.feature              # Imagenología
│   │   ├── nutrition.feature              # Nutrición
│   │   ├── rehabilitation.feature         # Rehabilitación
│   │   ├── dentistry.feature              # Odontología
│   │   ├── referral.feature               # Referencia/Contrarreferencia
│   │   └── chronic_disease.feature        # Enfermedades Crónicas
│   └── workflows/
│       └── PATIENT_JOURNEY.md             # Journey del paciente
├── standards/
│   ├── CODING_STANDARDS.md
│   ├── SECURITY_STANDARDS.md
│   └── DATA_STANDARDS.md
├── src/                               # Código fuente
└── tests/                             # Tests automatizados
```

---

## Visión General del Sistema

### Módulos Principales

1. **Expediente Clínico Electrónico (ECE)**
   - Historia clínica completa
   - Notas de evolución SOAP
   - Consentimientos informados
   - Cumple NOM-004-SSA3-2012

2. **Triaje Obstétrico**
   - Clasificación de riesgo
   - Signos vitales maternos
   - Monitoreo fetal
   - Cumple NOM-007-SSA1-2016

3. **Farmacia**
   - Inventario de medicamentos
   - Dispensación con receta electrónica
   - Control de lotes y caducidades
   - Alertas de contraindicaciones

4. **Receta Electrónica**
   - Prescripción digital
   - Vinculada al expediente
   - Firma electrónica del médico
   - Cumple NOM-004

5. **Reportes y Estadísticas**
   - Hoja diaria de pacientes
   - Reporte SUIVE (COFEPRIS)
   - Indicadores obstétricos
   - Dashboard ejecutivo

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
| ISO 13485 | Objetivo | Sistema de gestión de calidad |
| ISO 14971 | Objetivo | Gestión de riesgos |

---

## Métricas del Repositorio

| Métrica | Valor |
|---|---|
| **Archivos totales** | 144 |
| **Líneas totales** | 19,190 |
| **Escenarios Gherkin** | 151+ |
| **Especialidades médicas** | 20 |
| **Marcos de referencia** | 10 |
| **Casos multiagente** | 4 |
| **Guías de referencia** | 12 |

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
| **Seguridad** | OWASP + Secure by Design | `docs/quality/OWASP_GUIDE.md` |
| **UX/UI** | GUIX User First | `docs/quality/GUIX_USER_FIRST_GUIDE.md` |
| **Multiagente** | Análisis de casos | `templates/multiagent_cases/` |

### Por framework:

| Framework | Directorio | Contenido |
|---|---|---|
| **SWEBOK** | `templates/gherkin/swebok/` | 12 áreas de ingeniería |
| **PMBOK** | `templates/gherkin/pmbok/` | 10 áreas de gestión |
| **SOLID** | `templates/gherkin/solid/` | 5 principios de diseño |
| **Hexagonal** | `templates/gherkin/hexagonal/` | 6 componentes |
| **OWASP** | `templates/gherkin/owasp/` | 11 vulnerabilidades |
| **TDD** | `templates/gherkin/tdd/` | 7 prácticas |
| **Secure by Design** | `templates/gherkin/secure_by_design/` | 7 componentes |
| **Offline-First** | `templates/gherkin/offline_first/` | 7 componentes |
| **GUIX User First** | `templates/gherkin/guix_user_first/` | 8 componentes |
| **Spec Driven** | `templates/gherkin/spec_driven/` | 7 componentes |
| **Deuda Técnica** | `templates/gherkin/technical_debt/` | 6 componentes |
| **Cálculos Médicos** | `templates/gherkin/medical_calculations/` | 5 componentes |

### Documentación final:

| Documento | Contenido |
|---|---|
| `docs/AGENTIC_WORKFLOWS.md` | Workflows que vinculan todos los templates |
| `docs/COMPLETE_PROJECT_DOCS.md` | Qué, por qué, cómo del proyecto |
| `docs/VALUE_ADD_PROPOSALS.md` | Propuestas de valor añadido |

---

## Licencia

Proyecto privado — Maternidad de Altotonga, Veracruz, México.

---

*GHE: Tecnología con propósito social, documentación completa, conocimiento transferible.*
