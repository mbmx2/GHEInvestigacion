# Especificación de Requisitos de Software - GHE

**Versión:** 1.0.0
**Fecha:** 2026-09-21
**Estado:** Propuesto (pendiente de verificación)

---

## Convención de IDs

| Tipo | Formato | Ejemplo |
|---|---|---|
| Objetivo | OBJ-GHE-NNN | OBJ-GHE-001 |
| Requisito | REQ-GHE-NNN | REQ-GHE-001 |
| Riesgo | RISK-GHE-NNN | RISK-GHE-001 |
| Control | CTRL-GHE-NNN | CTRL-GHE-001 |
| Feature | GHE-DOM-SUB-NNN | GHE-PATIENT-REG-001 |

---

## 1. Requisitos de Gestión de Pacientes

| ID | Requisito | Prioridad | Norma | Feature | Estado |
|---|---|---|---|---|---|
| REQ-GHE-001 | Registrar paciente con CURP válida | Must | NOM-004 | GHE-PATIENT-REG-001 | Propuesto |
| REQ-GHE-002 | Generar expediente con ID único | Must | NOM-004 | GHE-PATIENT-REG-001 | Propuesto |
| REQ-GHE-003 | Validar campos obligatorios | Must | NOM-004 | GHE-PATIENT-REG-001 | Propuesto |
| REQ-GHE-004 | Detectar CURP duplicada | Must | NOM-004 | GHE-PATIENT-REG-001 | Propuesto |
| REQ-GHE-005 | Buscar paciente por nombre/CURP | Must | — | GHE-PATIENT-REG-001 | Propuesto |
| REQ-GHE-006 | Registrar antecedentes | Must | NOM-004 | GHE-PATIENT-LIFECYCLE-001 | Propuesto |
| REQ-GHE-007 | Generar plan de seguimiento | Should | NOM-007 | GHE-PATIENT-LIFECYCLE-001 | Propuesto |
| REQ-GHE-008 | Exportar expediente PDF | Should | NOM-004 | GHE-PATIENT-REG-001 | Propuesto |
| REQ-GHE-009 | Derecho ARCO (acceso) | Must | LFPDPPP | GHE-PATIENT-LIFECYCLE-001 | Propuesto |
| REQ-GHE-010 | Derecho ARCO (eliminación) | Must | LFPDPPP | GHE-PATIENT-LIFECYCLE-001 | Propuesto |

## 2. Requisitos de Consulta y Prescripción

| ID | Requisito | Prioridad | Norma | Feature | Estado |
|---|---|---|---|---|---|
| REQ-GHE-011 | Crear nota SOAP completa | Must | NOM-004 | GHE-CLINICAL-SAFETY-02 | Propuesto |
| REQ-GHE-012 | Firmar notas electrónicamente | Must | NOM-004 | GHE-PRESCRIPTION-001 | Propuesto |
| REQ-GHE-013 | Generar receta electrónica | Must | NOM-004 | GHE-PRESCRIPTION-001 | Propuesto |
| REQ-GHE-014 | Verificar interacciones medicamentosas | Must | — | GHE-CDS-001 | Propuesto |
| REQ-GHE-015 | Bloquear medicamentos contraindicados | Must | — | GHE-CDS-001 | Propuesto |
| REQ-GHE-016 | Validar dosis por peso | Must | — | GHE-CDS-001 | Propuesto |
| REQ-GHE-017 | Alertar valores críticos | Must | — | GHE-CDS-001 | Propuesto |

## 3. Requisitos de Gestión de Medicamentos

| ID | Requisito | Prioridad | Norma | Feature | Estado |
|---|---|---|---|---|---|
| REQ-GHE-018 | Registrar lote y caducidad | Must | NOM-004 | GHE-MEDICATION-001 | Propuesto |
| REQ-GHE-019 | Dispensar solo con receta válida | Must | NOM-004 | GHE-MEDICATION-001 | Propuesto |
| REQ-GHE-020 | Control de medicamentos controlados | Must | NOM | GHE-MEDICATION-001 | Propuesto |
| REQ-GHE-021 | Actualizar inventario en tiempo real | Must | — | GHE-MEDICATION-001 | Propuesto |
| REQ-GHE-022 | Rechazar medicamentos caducados | Must | — | GHE-MEDICATION-001 | Propuesto |

## 4. Requisitos de Laboratorio

| ID | Requisito | Prioridad | Norma | Feature | Estado |
|---|---|---|---|---|---|
| REQ-GHE-023 | Generar orden de laboratorio | Must | NOM-004 | GHE-LAB-001 | Propuesto |
| REQ-GHE-024 | Notificar valores críticos inmediatamente | Must | — | GHE-LAB-001 | Propuesto |
| REQ-GHE-025 | Vincular resultado a expediente | Must | NOM-004 | GHE-LAB-001 | Propuesto |
| REQ-GHE-026 | Trazabilidad de muestras | Must | NOM-024 | GHE-LAB-001 | Propuesto |

## 5. Requisitos de Obstetricia

| ID | Requisito | Prioridad | Norma | Feature | Estado |
|---|---|---|---|---|---|
| REQ-GHE-027 | Calcular FUR/FPP automáticamente | Must | NOM-007 | GHE-PRENATAL-001 | Propuesto |
| REQ-GHE-028 | Usar valores por trimestre | Must | NOM-007 | GHE-MATERNITY-01 | Propuesto |
| REQ-GHE-029 | Alertar preeclampsia | Must | NOM-007 | GHE-MATERNITY-04 | Propuesto |
| REQ-GHE-030 | Bloquear medicamentos contraindicados | Must | — | GHE-MATERNITY-01 | Propuesto |
| REQ-GHE-031 | Generar plan de parto | Should | NOM-007 | GHE-MATERNITY-10 | Propuesto |
| REQ-GHE-032 | Calcular APGAR | Must | — | GHE-MED-CALC-05 | Propuesto |
| REQ-GHE-033 | Calcular Glasgow | Must | — | GHE-MED-CALC-05 | Propuesto |

## 6. Requisitos de Seguridad

| ID | Requisito | Prioridad | Norma | Feature | Estado |
|---|---|---|---|---|---|
| REQ-GHE-034 | Autenticación con bcrypt | Must | NOM-024 | GHE-SEC-OWASP-A07 | Propuesto |
| REQ-GHE-035 | RBAC por roles | Must | NOM-024 | GHE-SEC-OWASP-A01 | Propuesto |
| REQ-GHE-036 | Cifrado AES-256 | Must | NOM-024, LFPDPPP | GHE-SEC-OWASP-A02 | Propuesto |
| REQ-GHE-037 | TLS 1.3 en tránsito | Must | NOM-024 | GHE-SEC-ASVS-V09 | Propuesto |
| REQ-GHE-038 | Audit log inmutable | Must | NOM-024 | GHE-SEC-OWASP-A09 | Propuesto |
| REQ-GHE-039 | Parameterized queries 100% | Must | — | GHE-SEC-OWASP-A03 | Propuesto |
| REQ-GHE-040 | Rate limiting | Should | — | GHE-SEC-OWASP-A07 | Propuesto |
| REQ-GHE-041 | Backup automático | Must | NOM-024 | GHE-OFFLINE-001 | Propuesto |

## 7. Requisitos de Offline-First

| ID | Requisito | Prioridad | Feature | Estado |
|---|---|---|---|---|
| REQ-GHE-042 | 100% funcional sin internet | Must | GHE-OFFLINE-001 | Propuesto |
| REQ-GHE-043 | Sync con outbox pattern | Must | GHE-OFFLINE-003 | Propuesto |
| REQ-GHE-044 | Resolución de conflictos | Must | GHE-OFFLINE-004 | Propuesto |
| REQ-GHE-045 | Backup automático diario | Must | GHE-OFFLINE-001 | Propuesto |

## 8. Requisitos de Privacidad

| ID | Requisito | Prioridad | Norma | Feature | Estado |
|---|---|---|---|---|---|
| REQ-GHE-046 | Consentimiento informado | Must | LFPDPPP | GHE-SEC-ASVS-V08 | Propuesto |
| REQ-GHE-047 | Derechos ARCO | Must | LFPDPPP | GHE-PATIENT-LIFECYCLE-001 | Propuesto |
| REQ-GHE-048 | Retención de datos 5 años | Must | NOM-004 | GHE-PATIENT-LIFECYCLE-001 | Propuesto |
| REQ-GHE-049 | Ofuscación en logs | Must | LFPDPPP | GHE-SEC-OWASP-A09 | Propuesto |

## 9. Requisitos de Agentes IA

| ID | Requisito | Prioridad | Feature | Estado |
|---|---|---|---|---|
| REQ-GHE-050 | Agentes solo consultivos | Must | GHE-AGENDA-AI-001 | Propuesto |
| REQ-GHE-051 | IA no modifica datos clínicos | Must | GHE-AGENDA-AI-001 | Propuesto |
| REQ-GHE-052 | Toda interacción registrada | Must | GHE-AGENDA-AI-001 | Propuesto |
| REQ-GHE-053 | Datos pseudonimizados | Must | GHE-AGENDA-AI-001 | Propuesto |

## 10. Requisitos de Interoperabilidad

| ID | Requisito | Prioridad | Feature | Estado |
|---|---|---|---|---|
| REQ-GHE-054 | Intercambio vía FHIR R4 | Should | GHE-INT-001 | Propuesto |
| REQ-GHE-055 | Autenticación con sistemas externos | Must | GHE-INT-001 | Propuesto |
| REQ-GHE-056 | Sync offline con cola | Must | GHE-OFFLINE-003 | Propuesto |

## Resumen

| Categoría | Total | Must | Should | Propuesto |
|---|---|---|---|---|
| Gestión de pacientes | 10 | 7 | 3 | 10 |
| Consulta y prescripción | 7 | 7 | 0 | 7 |
| Medicamentos | 5 | 5 | 0 | 5 |
| Laboratorio | 4 | 4 | 0 | 4 |
| Obstetricia | 7 | 6 | 1 | 7 |
| Seguridad | 8 | 8 | 0 | 8 |
| Offline-first | 4 | 4 | 0 | 4 |
| Privacidad | 4 | 4 | 0 | 4 |
| Agentes IA | 4 | 4 | 0 | 4 |
| Interoperabilidad | 3 | 1 | 2 | 3 |
| **TOTAL** | **56** | **48** | **8** | **56** |

---

## Referencias

- NOM-004-SSA3-2012
- NOM-024-SSA3-2012
- NOM-007-SSA2-2016
- LFPDPPP
- OWASP ASVS 4.0
- IEC 62304:2006+AMD1:2015
