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
│   │   ├── patient_registration.feature
│   │   ├── prenatal_control.feature
│   │   ├── pharmacy_dispensing.feature
│   │   ├── triage.feature
│   │   └── prescription.feature
│   └── workflows/
│       ├── PATIENT_JOURNEY.md
│       └── CLINICAL_PROCESSES.md
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

## Acceso Rápido

- **Para desarrolladores:** [docs/architecture/ARCHITECTURE.md](docs/architecture/ARCHITECTURE.md)
- **Para clínicos:** [docs/clinical/WORKFLOWS.md](docs/clinical/WORKFLOWS.md)
- **Para compliance:** [docs/compliance/NOM004.md](docs/compliance/NOM004.md)
- **Para ejecutivos:** [docs/strategy/MISSION.md](docs/strategy/MISSION.md)
- **Para testers:** [docs/quality/TESTING.md](docs/quality/TESTING.md)

---

## Licencia

Proyecto privado — Maternidad de Altotonga, Veracruz, México.

---

*GHE: Tecnología con propósito social.*
