# Especificaciones NOM para GHE

**Fecha:** 2026-09-21
**Versión:** 1.0.0

---

## 1. NOM-004-SSA3-2012: Expediente Clínico

### 1.1. Alcance
Regula la elaboración, integración, uso, manejo, archivo, conservación, propiedad, titularidad y confidencialidad del expediente clínico.

### 1.2. Requisitos Obligatorios

| # | Requisito | GHE implementa | Evidencia |
|---|---|---|---|
| 1 | Ficha de identificación del paciente | ✅ | Spec: :ghe.patient/patient |
| 2 | Historia clínica completa | ✅ | Feature: clinical_history |
| 3 | Antecedentes heredofamiliares | ✅ | Workflow: prenatal_control |
| 4 | Antecedentes personales patológicos | ✅ | Workflow: clinical_history |
| 5 | Antecedentes personales no patológicos | ✅ | Workflow: clinical_history |
| 6 | Padecimiento actual cronológico | ✅ | Feature: clinical_safety/02 |
| 7 | Exploración física completa | ✅ | Feature: clinical_safety/02 |
| 8 | Impresión diagnóstica con CIE-10 | ✅ | Medical calculations |
| 9 | Plan terapéutico | ✅ | Feature: prescription |
| 10 | Nota de evolución | ✅ | Feature: prenatal_control |
| 11 | Firma del médico | ✅ | Feature: prescription |
| 12 | Conservación 5 años mínimo | ✅ | Infrastructure: sync + backup |
| 13 | Confidencialidad | ✅ | OWASP: encryption + RBAC |

### 1.3. Tipos de Notas

| Tipo | GHE lo cubre | Feature |
|---|---|---|
| Nota inicial | ✅ | clinical_safety/02 |
| Nota de evolución | ✅ | prenatal_control |
| Nota de referencia | ✅ | referral.feature |
| Nota de contrarreferencia | ✅ | referral.feature |
| Nota de interconsulta | ✅ | referral.feature |
| Consentimiento informado | ✅ | clinical_safety/01 |

### 1.4. Requisitos Formales

| Requisito | GHE implementa | Estado |
|---|---|---|
| Fecha y hora en cada nota | Timestamp automático | ✅ |
| Nombre y cédula del profesional | Vinculado a usuario | ✅ |
| Firma electrónica | Firma digital | ✅ |
| Sin abreviaturas no aprobadas | Validación en UI | ⚠️ Parcial |
| Sin tachaduras | Registros inmutables | ✅ |

---

## 2. NOM-024-SSA3-2012: Sistemas de Información

### 2.1. Alcance
Regula los Sistemas de Información de Registro Electrónico (SIRES) para el sector salud.

### 2.2. Requisitos de Seguridad

| # | Requisito | GHE implementa | Evidencia |
|---|---|---|---|
| 1 | Autenticación de usuarios | ✅ | bcrypt + tokens |
| 2 | Control de acceso por roles | ✅ | RBAC por rol |
| 3 | Cifrado de datos en reposo | ✅ | AES-256 (SQLCipher) |
| 4 | Cifrado de datos en tránsito | ✅ | TLS 1.3 |
| 5 | Registro de auditoría | ✅ | SHA-256 audit log |
| 6 | Disponibilidad del sistema | ✅ | Offline-first |
| 7 | Integridad de datos | ✅ | Specs + validación |
| 8 | Backup periódico | ✅ | Backup automático diario |
| 9 | Plan de recuperación | ✅ | Restore documentado |
| 10 | Gestión de cambios | ✅ | Git + PR |

### 2.3. GIIS Aplicables

| GIIS | Nombre | GHE cubre |
|---|---|---|
| SGSI | Sistema de Gestión de Seguridad de la Información | ✅ |
| SIS-CEX | Consulta Externa | ✅ |
| SIS-CSB | Salud Bucal | ❌ (no aplica) |
| SIS-CSM | Salud Mental | ❌ (no aplica) |
| SIS-CPF | Planificación Familiar | 🔄 Futuro |

### 2.4. Proceso de Certificación

| Paso | Acción | Responsable |
|---|---|---|
| 1 | Mapear requisitos NOM-024 vs. estado actual | Tech Lead |
| 2 | Identificar gaps | Tech Lead |
| 3 | Crear documentación faltante | Tech Lead + QA |
| 4 | Implementar controles faltantes | Desarrollador |
| 5 | Ejecutar pruebas de seguridad | QA |
| 6 | Preparar paquete de certificación | Tech Lead |
| 7 | Enviar solicitud a DGIS | Director |
| 8 | Acompañar proceso de evaluación | Tech Lead |

---

## 3. NOM-007-SSA1-2016: Atención Prenatal

### 3.1. Alcance
Establece la atención, actividades y procedimientos de vigilancia del embarazo normal.

### 3.2. Protocolo de Control Prenatal

| Semana | Actividad | GHE lo cubre | Feature |
|---|---|---|---|
| 4-8 | Confirmación de embarazo | ✅ | maternity/15_pre_pregnancy |
| 4-8 | FUR, baseline labs | ✅ | maternity/PHASE_0 |
| 12 | Tamizaje 1er trimestre | ✅ | maternity/01_validation |
| 16-20 | Ecografía de estructura fetal | ✅ | hospital/20_imaging |
| 20-24 | Curva de tolerancia a la glucosa | ✅ | medical_calculations |
| 24-28 | Anti-D (si Rh-) | ✅ | maternity/01_validation |
| 24-28 | BHC, perfil hepático | ✅ | laboratory/01 |
| 28-32 | Control quincenal | ✅ | maternity/01_validation |
| 32-36 | Control semanal | ✅ | maternity/01_validation |
| 36-40 | Control 2 veces/semana | ✅ | maternity/01_validation |
| >40 | Inducción si >41 semanas | ✅ | maternity/10_emergency |

### 3.3. Signos de Alarma (OMS)

| # | Signo de alarma | GHE lo cubre |
|---|---|---|
| 1 | Cefalea intensa | ✅ Alerta en UI |
| 2 | Trastornos visuales | ✅ Alerta en UI |
      | 3 | Hinchazón de cara y manos | ✅ Alerta en UI |
      | 4 | Sangrado genital | ✅ Alerta en UI |
      | 5 | Fiebre >38°C | ✅ Alerta en UI |
      | 6 | Dolor abdominal intenso | ✅ Alerta en UI |
      | 7 | Disminución de movimientos fetales | ✅ Alerta en UI |
      | 8 | Dificultad respiratoria | ✅ Alerta en UI |

---

## 4. NOM-019-SSA3-2013: Para Actividades de Evaluación de la Calidad

### 4.1. Aplicabilidad
GHE debe implementar un sistema de gestión de calidad para validar que el software cumple con las normas.

| Requisito | GHE lo cubre |
|---|---|
| Evaluación de la calidad | 🔄 En proceso |
| Auditorías internas | 🔄 En proceso |
| Acciones correctivas | 🔄 En proceso |
| Mejora continua | 🔄 En proceso |

---

## 5. LFPDPPP: Ley Federal de Protección de Datos Personales en Posesión de los Particulares

### 5.1. Requisitos

| # | Requisito | GHE implementa | Evidencia |
|---|---|---|---|
| 1 | Aviso de privacidad | ✅ | Feature: security/04 |
| 2 | Consentimiento informado | ✅ | Feature: clinical_safety/01 |
| 3 | Derechos ARCO | ✅ | Feature: patient_lifecycle/01 |
| 4 | Minimización de datos | ✅ | ADR-005 (agentes IA) |
| 5 | Seguridad de datos | ✅ | AES-256 + RBAC + auditoría |
| 6 | Transferencia internacional | N/A | No aplica actualmente |

---

## 6. Matriz de Cumplimiento Consolidada

| Norma | Requisitos | Cumplidos | Pendientes | % |
|---|---|---|---|---|
| NOM-004 | 13 | 11 | 2 | 85% |
| NOM-024 | 10 | 8 | 2 | 80% |
| NOM-007 | 11 | 11 | 0 | 100% |
| LFPDPPP | 6 | 6 | 0 | 100% |
| IEC 62304 | 12 | 2 | 10 | 17% |
| ISO 14971 | 4 | 1 | 3 | 25% |
| **TOTAL** | **56** | **35** | **21** | **63%** |

### Gap Crítico: IEC 62304
El mayor gap es la documentación de IEC 62304 (solo 17% de cumplimiento). Esto se debe a que la mayor parte del trabajo de documentación IEC 62304 está en los features Gherkin pero falta convertirlo en documentación formal.

---

## Referencias

- NOM-004-SSA3-2012
- NOM-024-SSA3-2012
- NOM-007-SSA1-2016
- NOM-019-SSA3-2013
- LFPDPPP (2010)
- Decreto DOF 15 enero 2026 (Salud Digital)
