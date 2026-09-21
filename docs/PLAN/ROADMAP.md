# Roadmap del Proyecto GHE

**Fecha:** 2026-09-21
**Versión:** 1.0.0
**Horizonte:** 24 meses (Q3 2026 - Q2 2028)

---

## Visión del Roadmap

```
2026                    2027                              2028
Q3──────Q4──────Q1──────Q2──────Q3──────Q4──────Q1──────Q2
│        │        │        │        │        │        │        │
│ FASE 0 │ FASE 1 │ FASE 2 │ FASE 3 │ FASE 4 │ FASE 5 │ FASE 6 │
│ Funda- │ Core   │ Agenda │ Integra│ Certif.│ Piloto │ Expans.│
│ mentos │ Clínic │ Admin  │ ción   │        │        │        │
│        │        │        │        │        │        │        │
│ ADR    │ Pacien-│ Agenda │ Farmacia│ NOM-024│ 3 meses│ 5 mat. │
│ Specs  │ tes    │ digital│ Labora-│ IEC    │ piloto │ conec- │
│ BD     │ Validar│ Cascada│ torio  │ 62304  │        │ tadas  │
│ Vademéc│ Guías  │ IA     │ Imagen │        │        │        │
```

---

## FASE 0: Fundamentos (Semanas 1-8)

### Objetivo
Establecer la base técnica, documental y normativa del proyecto.

| Semana | Entregable | Features/Archivos | Criterio de éxito | Responsable |
|---|---|---|---|---|
| 1-2 | ADRs aprobados | ADR-001 a ADR-007 | Revisión director | Tech Lead |
| 3-4 | Vademécum obstétrico | maternity/PHASE_0_FOUNDATIONS.md | Validado por médico | Médico |
| 4-5 | Specs de dominio | spec_driven/01-02 | 100% entidades cubiertas | Tech Lead |
| 5-6 | Modelo de datos | Archivo SQL en maternity/PHASE_0 | BD diseñada | Tech Lead |
| 6-7 | Contrato del plan | PROJECT_CHARTER.md, SCOPE.md | Aprobado | Director |
| 7-8 | Roadmap y plan de calidad | ROADMAP.md, MATURITY_MODEL.md | Aprobado | Director |

---

## FASE 1: Core Clínico (Semanas 9-20)

### Objetivo
Que el sistema pueda registrar pacientes, crear consultas y prescribir medicamentos.

| Semana | Entregable | Features | Criterio de éxito | Dependencias |
|---|---|---|---|---|
| 9-10 | src/ structure + composition root | Archivos Clojure | Proyecto compila | Fase 0 |
| 11-12 | Patient domain + repository | patient_lifecycle/01 | 5,573+ unit tests | src/ |
| 13-14 | Clinical domain (SOAP) | clinical_safety/02 | Workflow SOAP funcional | Patient |
| 15-16 | Prescription domain + CDS | prescription.feature, CDS | Prescripción validada | Clinical |
| 17-18 | Validation obstétrica | maternity/01_validation | 100% coverage specs | Clinical |
| 19-20 | Clinical guidelines | maternity/02_clinical_guidelines | Médico aprueba 7 protocolos | Validation |

---

## FASE 2: Agenda y Administración (Semanas 21-32)

### Objetivo
La agenda digital conecte todas las áreas del hospital.

| Semana | Entregable | Features | Criterio de éxito | Dependencias |
|---|---|---|---|---|
| 21-22 | Agenda data model + states | agenda/02_data_model | Estados y transiciones documentados | Fase 1 |
| 23-24 | Agenda workflow engine | agenda/01_workflow_engine | 100% offline funcional | Data model |
| 25-26 | Cascada de tareas | agenda/03_cascade | 5 áreas conectadas | Engine |
| 27-28 | Agentes IA consultivos | agenda/04_ai_agents, ADR-005 | 0 errores de seguridad | Cascade |
| 29-30 | RDD/DDD/CDD | agenda/05-07 | Enfoques documentados | Agentes |
| 31-32 | Integración clínica-admin | Validación cruzada | Todas las áreas conectadas | Todos |

---

## FASE 3: Integración Hospitalaria (Semanas 33-44)

### Objetivo
Que cada área del hospital tenga su módulo funcional.

| Semana | Entregable | Features | Criterio de éxito | Dependencias |
|---|---|---|---|---|
| 33-34 | Farmacia completa | hospital/18, medication/01 | Sync offline OK | Fase 1 |
| 35-36 | Laboratorio completo | laboratory/01, hospital/08 | Flujo completo | Fase 1 |
| 37-38 | Imagenología | imaging/01, hospital/20 | Flujo completo | Fase 1 |
| 39-40 | Hospitalización + Cirugía | hospital/02-03, 11-12 | Protocolos activos | Fase 1 |
| 41-42 | Anestesiología + Emergencias | hospital/07, 19, 21 | Emergencias documentadas | Fase 1 |
| 43-44 | Áreas de soporte | hospital/04-06, 13-17, 24 | Todas las áreas activas | Fase 1 |

---

## FASE 4: Certificación (Semanas 45-52)

### Objetivo
Obtener certificaciones normativas.

| Semana | Entregable | Features | Criterio de éxito | Dependencias |
|---|---|---|---|---|
| 45-46 | Documentación IEC 62304 | compliance/IEC62304_class_c.md | Paquete completo | Fase 1-3 |
| 47-48 | Documentación ISO 14971 | compliance/ISO14971_risk.md | Análisis de riesgos | Fase 1-3 |
| 49-50 | Preparación NOM-024 | compliance/NOM_standards.md | Expediente listo | Fase 1-3 |
| 51-52 | Envío y seguimiento DGIS | Documentos enviados | Solicitud formalizada | Fase 1-3 |

---

## FASE 5: Piloto (Semanas 53-64)

### Objetivo
Probar el sistema en producción real con supervisión.

| Semana | Entregable | Features | Criterio de éxito | Dependencias |
|---|---|---|---|---|
| 53-54 | Capacitación del equipo | clinical_safety/03_staff_competency | Equipo capacitado | Fase 1-3 |
| 55-56 | Instalación en producción | Deployment | Sistema funcionando | Capacitación |
| 57-58 | Mes 1 del piloto | Monitoreo continuo | 0 incidentes críticos | Instalación |
| 59-60 | Mes 2 del piloto | Monitoreo continuo | Métricas estables | Mes 1 |
| 61-62 | Mes 3 del piloto | Evaluación completa | Satisfacción >85% | Mes 2 |
| 63-64 | Evaluación y cierre | quality/01_quality_summary | Publicación de resultados | Mes 3 |

---

## FASE 6: Expansión (Q4 2028+)

### Objetivo
Escalar a múltiples maternidades.

| Hito | Alcance | Dependencias |
|---|---|---|
| 2a maternidad | Implementación replicada | Piloto exitoso |
| 5 maternidades | Red con sync central | 2a maternidad |
| Publicación científica | Paper en revista indexada | Datos de 6+ meses |
| Certificación IEC 62304 completa | Paquete de certificación | Piloto exitoso |
| Expansión LATAM | Adaptación a otro país | 5 maternidades |

---

## Resumen de Hitos

| # | Hito | Fecha | Features |
|---|---|---|---|
| H1 | ADRs aprobados | Q3 2026 | ADR-001 a ADR-007 |
| H2 | Framework completo | Q3 2026 | 171+ features |
| H3 | Core clínico | Q1 2027 | patient_lifecycle, clinical, prescription |
| H4 | Agenda digital | Q2 2027 | agenda/01-04 |
| H5 | Agentes IA | Q3 2027 | agenda/04, ADR-005 |
| H6 | NOM-024 | Q4 2027 | compliance/NOM |
| H7 | IEC 62304 | Q1 2028 | compliance/IEC |
| H8 | Piloto | Q2 2028 | Todos |
| H9 | Publicación | Q3 2028 | Resultados |
| H10 | Expansión | Q4 2028+ | 5+ maternidades |

---

## Asignación de Features por Fase

### Fase 0: Fundamentos (Semanas 1-8)
| Categoría | Features | Total |
|---|---|---|
| spec_driven | 01-07 | 7 |
| hexagonal | 01-06 | 6 |
| solid | 01-05 | 5 |
| cap_theorem | 01-03 | 3 |
| offline_first | 01-07 | 7 |
| guiX_user_first | 01-08 | 8 |
| **Total Fase 0** | | **36** |

### Fase 1: Core Clínico (Semanas 9-20)
| Categoría | Features | Total |
|---|---|---|
| patient_lifecycle | 01 | 1 |
| clinical_decision_support | 01 | 1 |
| maternity | 01-05, 10-11 | 7 |
| medical_calculations | 01-05 | 5 |
| clinical_safety | 01-06 | 6 |
| **Total Fase 1** | | **20** |

### Fase 2: Agenda y Administración (Semanas 21-32)
| Categoría | Features | Total |
|---|---|---|
| agenda | 01-07 | 7 |
| **Total Fase 2** | | **7** |

### Fase 3: Integración Hospitalaria (Semanas 33-44)
| Categoría | Features | Total |
|---|---|---|
| hospital | 01-24 | 24 |
| medication_management | 01 | 1 |
| laboratory_workflows | 01 | 1 |
| imaging_workflows | 01 | 1 |
| emergency_response | 01 | 1 |
| **Total Fase 3** | | **28** |

### Fase 4: Seguridad y Cumplimiento (Semanas 45-52)
| Categoría | Features | Total |
|---|---|---|
| owasp | A01-A10 + ASVS | 11 |
| owasp_asvs | V01-V14 | 13 |
| owasp_samm | 01-05 | 5 |
| secure_by_design | 01-07 | 7 |
| **Total Fase 4** | | **36** |

### Fase 5: Piloto (Semanas 53-64)
| Categoría | Features | Total |
|---|---|---|
| maternity (piloto) | Validación con datos reales | — |
| clinical_safety | 03 (competency) | 1 |
| quality_compliance | 01 | 1 |
| **Total Fase 5** | | **2** |

### Features sin fase asignada (requieren decisión)
| Categoría | Features | Total |
|---|---|---|
| technical_debt | 01-06 | 6 |
| tdd | 01-07 | 7 |
| antipatterns | 01-04 | 4 |
| observability | 01-03 | 3 |
| resilience | 01-02 | 2 |
| performance | 01 | 1 |
| disaster_recovery | 01 | 1 |
| cicd_pipeline | 01 | 1 |
| code_review | 01 | 1 |
| domain_events | 01 | 1 |
| incident_response | 01 | 1 |
| api_patterns | 01 | 1 |
| integration | 01 | 1 |
| financial_management | 01 | 1 |
| reporting_analytics | 01 | 1 |
| quality | 01-02 | 2 |
| **Total sin fase** | | **28** |

### Resumen

| Fase | Features | % del total |
|---|---|---|
| Fase 0: Fundamentos | 36 | 14% |
| Fase 1: Core Clínico | 20 | 8% |
| Fase 2: Agenda | 7 | 3% |
| Fase 3: Integración | 28 | 11% |
| Fase 4: Seguridad | 36 | 14% |
| Fase 5: Piloto | 2 | 1% |
| Sin fase | 28 | 11% |
| Ya existentes (maternity/hospital) | 58 | 22% |
| ASVS/SAMM | 39 | 15% |
| **TOTAL** | **260** | **100%** |

---

## Referencias

- PROJECT_CHARTER.md
- SCOPE.md
- MATURITY_MODEL.md
- ADR-001 a ADR-006
- FEATURE_COVERAGE_REPORT.md
