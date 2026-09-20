# Matriz de Trazabilidad: Requisito → Feature → Escenario → Evidencia

> *"Si no puedes trazar un requisito hasta una prueba, no estás seguro de que funciona."*

---

## 1. Convención de IDs

Cada feature y escenario debe tener un ID estable que no cambie aunque cambie el texto.

### Formato de ID

```
GHE-[DOMINIO]-[SUBDOMINIO]-[NÚMERO]

Ejemplos:
GHE-PATIENT-REG-001          → Registro de paciente
GHE-OBSTETRIC-PRENATAL-001   → Control prenatal
GHE-PHARMACY-DISP-001        → Dispensación
GHE-SECURITY-OWASP-A01-001   → OWASP A01
GHE-HOSPITAL-ADMIN-001       → Administración
```

### Formato de Tags

```gherkin
@domain:patient @layer:ui @type:acceptance @risk:s2 @owner:dev-frontend
@domain:pharmacy @layer:domain @type:contract @risk:s1 @owner:dev-backend
@domain:security @layer:api @type:security @risk:s1 @owner:security-lead
@domain:maternity @layer:clinical @type:clinical @risk:s1 @owner:medical-director
```

### Formato de Metadatos por Feature

```gherkin
# @id GHE-PATIENT-REG-001
# @type acceptance
# @domain patient
# @layer ui
# @risk s2
# @owner dev-frontend
# @status verified
# @evidence test:patient_registration_test.clj
# @norm NOM-004
# @version 1.0
# @last_review 2024-09-20
```

---

## 2. Matriz de Trazabilidad por Dominio

### 2.1. Pacientes

| Requisito | Feature | Escenario | Evidencia | Estado |
|---|---|---|---|---|
| Registrar paciente con CURP | patient_registration | Registro exitoso | test:register_patient | Propuesto |
| Validar CURP 18 caracteres | patient_registration | Rechazo sin CURP | test:validate_curp | Propuesto |
| Detectar CURP duplicada | patient_registration | CURP duplicada | test:detect_duplicate | Propuesto |
| Buscar paciente existente | patient_registration | Búsqueda | test:search_patient | Propuesto |
| Registro offline | patient_registration | Registro offline | test:offline_register | Propuesto |
| Exportar expediente PDF | patient_registration | Exportación | test:export_pdf | Propuesto |

### 2.2. Maternidad/Obstetricia

| Requisito | Feature | Escenarios | Evidencia | Estado |
|---|---|---|---|---|
| Control prenatal completo | maternity/01_validation | 11 escenarios | test:validation_* | Propuesto |
| Detección de preeclampsia | maternity/01_validation | PA >140/90 | test:detect_preeclampsia | Propuesto |
| Validar medicamentos en embarazo | maternity/01_validation | Bloquear contraindicados | test:block_medication | Propuesto |
| Predicción de complicaciones | maternity/04_prediction | 8 modelos | test:prediction_* | Propuesto |
| Protocolo de emergencia | maternity/10_emergency | 7 protocolos | test:emergency_* | Propuesto |
| Alertas de escalamiento | maternity/01_validation | 4 niveles | test:escalation_alert | Propuesto |

### 2.3. Seguridad

| Requisito | Feature | Escenarios | Evidencia | Estado |
|---|---|---|---|---|
| OWASP A01: Access Control | security/01b + owasp/A01 | 10 escenarios | test:auth_* | Propuesto |
| OWASP A02: Cryptography | security/03c + owasp/A02 | 8 escenarios | test:crypto_* | Propuesto |
| OWASP A03: Injection | security/01a + owasp/A03 | 12 escenarios | test:injection_* | Propuesto |
| Pentest completo | security/01a-01c | 12 escenarios | test:pentest_* | Propuesto |
| Hardening servidor | security/03a | 2 escenarios | test:hardening_* | Propuesto |
| LFPDPPP compliance | security/04_data_privacy | 5 escenarios | test:privacy_* | Propuesto |

### 2.4. Hospital

| Requisito | Feature | Escenarios | Evidencia | Estado |
|---|---|---|---|---|
| Ginecología | hospital/01 + 10 | 20 escenarios | test:gynecology_* | Propuesto |
| Hospitalización | hospital/02 + 12 | 16 escenarios | test:hospitalization_* | Propuesto |
| Cirugía | surgery/01-03 | 8 escenarios | test:surgery_* | Propuesto |
| Farmacia | hospital/18 | 7 escenarios | test:pharmacy_full_* | Propuesto |
| Administración | hospital/06 | 10 escenarios | test:admin_* | Propuesto |
| RRHH | hospital/16 | 8 escenarios | test:hr_* | Propuesto |

### 2.5. Ingeniería de Software

| Requisito | Feature | Escenarios | Evidencia | Estado |
|---|---|---|---|---|
| Arquitectura hexagonal | hexagonal/01-06 | 40 escenarios | test:hexagonal_* | Propuesto |
| SOLID | solid/01-05 | 36 escenarios | test:solid_* | Propuesto |
| TDD | tdd/01-07 | 43 escenarios | test:tdd_* | Propuesto |
| OWASP | owasp/A01-A10+ASVS | 75 escenarios | test:owasp_* | Propuesto |
| SWEBOK | swebok/KA01-KA12 | 66 escenarios | test:swebok_* | Propuesto |
| PMBOK | pmbok/KA01-KA10 | 39 escenarios | test:pmbok_* | Propuesto |

---

## 3. Matriz de Estado

| Estado | Significado | Criterio |
|---|---|---|
| `propuesto` | Feature definido, sin implementación | Solo Gherkin |
| `parcial` | Parte implementada | Código parcial + tests parciales |
| `verificado` | Completamente implementado y testeado | Código + tests + evidencia |
| `obsoleto` | Ya no aplica | Marcado para eliminación |

**Estado actual estimado: 100% propuesto** (no hay código ejecutable equivalente)
