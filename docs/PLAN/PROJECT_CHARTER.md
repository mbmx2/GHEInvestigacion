# Acta Constitutiva del Proyecto GHE

**Versión:** 1.0.0
**Fecha de constitución:** 2026-09-21
**Documento de referencia:** ADR-001 a ADR-007

---

## 1. Identificación del Proyecto

| Campo | Valor |
|---|---|
| **Nombre** | GHE - Gestor Hospitalario Electrónico |
| **Siglas** | GHE |
| **Ubicación** | Maternidad de Altotonga, Veracruz, México |
| **Director del proyecto** | [Por designar] |
| **Director médico** | [Por designar] |
| **Director de TI** | [Por designar] |
| **Patrocinador** | Maternidad de Altotonga |

---

## 2. Declaración de Propósito

### 2.1. Misión

Mejorar la calidad de atención médica en hospitales rurales de México mediante un sistema de gestión hospitalaria que funcione sin internet, gestione toda la operación del hospital, y asista a los profesionales de salud con agentes de IA consultivos.

### 2.2. Visión

Que cada hospital rural de México tenga acceso a tecnología de gestión hospitalaria de clase mundial, sin importar su conectividad o presupuesto.

### 2.3. Valores

| Valor | Descripción |
|---|---|
| **Seguridad del paciente** | Cada decisión prioriza la vida del paciente |
| **Offline-first** | El sistema funciona siempre, sin excepción |
| **Transparencia** | Sin datos ocultos, sin ambigüedades |
| **Simplicidad** | Complejidad técnica invisible para el usuario |
| **Cumplimiento normativo** | Cada estándar se cumple con evidencia verificable |

---

## 3. Alcance

### 3.1. Incluido en GHE v1.0

| Área | Alcance |
|---|---|
| **Gestión clínica** | Expediente, consultas, prescripciones, historial |
| **Agenda digital** | Motor de workflows, cascada de tareas |
| **Ginecología** | Consulta, patologías, cirugía ginecológica |
| **Obstetricia** | Control prenatal, triaje, emergencias, parto |
| **Pediatría/neonatología** | Crecimiento, desarrollo, vacunas, enfermedades |
| **Farmacia** | Inventario, dispensación, medicamentos controlados |
| **Laboratorio** | Solicitación, procesamiento, resultados |
| **Imagenología** | Radiografía, ecografía, TAC |
| **Urgencias** | Triaje, protocolos, código azul |
| **Anestesiología** | Evaluación preanestésica, monitoreo |
| **Hospitalización** | Admisión, alta, protocolos por patología |
| **Farmacia hospitalaria** | Medicamentos, IV, controlados |
| **Cocina/dieta** | Dietas por patología, HACCP |
| **Limpieza** | Protocolos de desinfección, residuos |
| **Lavandería** | Ropa hospitalaria, esterilización |
| **Mantenimiento** | Equipos, infraestructura, gas medicinal |
| **RRHH** | Personal, turnos, capacitación |
| **Contabilidad** | Facturación, pagos, reportes |
| **Administración** | Dirección, compras, almacén |
| **Seguridad informática** | OWASP, cifrado, auditoría |
| **Agentes de IA** | Consultivos exclusivamente |
| **Accesibilidad** | WCAG 2.1 nivel AA |
| **Offline-first** | 100% funcional sin internet |

### 3.2. Excluido (fase futura)

- Telemedicina
- App móvil nativa
- Multi-tenant (múltiples hospitales en una instancia)
- Agentes de IA ejecutivos
- Integración con IMSS/ISSSTE
- Interoperabilidad FHIR completa
- Machine learning predictivo

---

## 4. Restricciones

| Restricción | Descripción | Impacto |
|---|---|---|
| Conectividad | 2G/EDGE intermitente | Todo offline-first |
| Personal TI | Experiencia limitada | UI simplificada, capacitación |
| Presupuesto | Limitado | Open source, hardware mínimo |
| Cumplimiento | NOM-004, NOM-024, IEC 62304, ISO 14971 | Documentación completa |
| Seguridad IA | Agentes solo consultivos | Sin automatización de decisiones |
| Tamaño de BD | 2GB máximo (SQLite) | Archivo único por hospital |

---

## 5. Riesgos Principales

| # | Riesgo | Probabilidad | Impacto | Mitigación | Owner |
|---|---|---|---|---|---|
| R1 | Pérdida de datos | Baja | Crítico | Backup automático + cifrado AES-256 + offline | Dev Lead |
| R2 | Error de prescripción | Media | Crítico | CDS + validación + doble check | Médico |
| R3 | Rechazo del equipo médico | Media | Alto | Capacitación + champion + UX simple | Admin |
| R4 | Fallo de hardware | Baja | Alto | UPS + plan de contingencia | TI |
| R5 | Cambio normativo | Media | Alto | Monitoreo regulatorio trimestral | Compliance |
| R6 | Brecha de seguridad | Baja | Crítico | OWASP + pentest + auditoría | Security Lead |
| R7 | Error de sincronización | Media | Medio | Outbox + conflict resolution + hash | Dev Lead |
| R8 | Agente IA causa daño | Baja | Crítico | Solo consultivos + auditoría | Architect |

---

## 6. Hitos Principales

| # | Hito | Fecha objetivo | Criterio de éxito | Dependencias |
|---|---|---|---|---|
| H1 | ADRs aprobados | Q3 2026 | 7 ADRs revisados | — |
| H2 | Framework de templates completado | Q3 2026 | 171+ features Gherkin | H1 |
| H3 | Core clínico funcional | Q1 2027 | Registro + consultas + prescripciones con tests | H2 |
| H4 | Agenda digital activa | Q2 2027 | 100% áreas conectadas, cascada funcional | H3 |
| H5 | Agentes IA en producción | Q3 2027 | 0 errores de seguridad, solo consultivos | H4 |
| H6 | Certificación NOM-024 | Q4 2027 | Certificado ante DGIS | H3 |
| H7 | Certificación IEC 62304 | Q1 2028 | Paquete completo | H3, H6 |
| H8 | Piloto 3 meses | Q2 2028 | 0 incidentes críticos | H7 |
| H9 | Evaluación y publicación | Q3 2028 | Paper publicado | H8 |
| H10 | Expansión a 5 maternidades | Q4 2028+ | 5 hospitales conectados | H8, H9 |

---

## 7. Equipo del Proyecto

| Rol | Responsabilidad | Dedicación |
|---|---|---|
| Director del proyecto | Estrategia, presupuesto, stakeholders | 50% |
| Director médico | Validación clínica, protocolos | 25% |
| Director de TI | Arquitectura, infraestructura | 50% |
| Tech lead | Diseño, desarrollo, QA | 100% |
| Desarrollador Clojure | Implementación | 100% |
| QA Engineer | Testing, validación | 50% |
| Consultor clínico | Validación workflows | 25% |
| UX Designer | Interfaz, usabilidad | 25% |

---

## 8. Aprobación

| Rol | Nombre | Firma | Fecha |
|---|---|---|---|
| Director del proyecto | | | |
| Director médico | | | |
| Director de TI | | | |
| Patrocinador | | | |

---

## Referencias

- ADR-001 a ADR-007 (Decisiones arquitectónicas)
- docs/quality/IEC62304_CLASS_C.md (Especificaciones IEC 62304)
- docs/quality/ISO14971_RISK.md (Gestión de riesgos)
- docs/compliance/NOM_STANDARDS.md (Normativas mexicanas)
- docs/PLAN/ROADMAP.md (Cronograma)
