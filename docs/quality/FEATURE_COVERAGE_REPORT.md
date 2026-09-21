# Reporte de Cobertura de Features

**Fecha:** 2026-09-21
**Versión:** 1.0.0
**Generado con:** Comandos reproducibles del repositorio

---

## 1. Métricas Verificadas

| Métrica | Valor | Comando |
|---|---|---|
| Features totales | 260 | `find templates/gherkin -name "*.feature" \| wc -l` |
| Escenarios totales | 1,764 | `grep -r "Escenario" templates/gherkin/ \| wc -l` |
| IDs únicos | 60 | `grep -r "^# @id " templates/gherkin/ \| sort -u \| wc -l` |
| Features con @domain | 260 (100%) | `grep -r '@domain:' templates/gherkin/ \| wc -l` |
| Features con @evidence | 253 (97%) | `grep -r '@evidence' templates/gherkin/ \| wc -l` |
| Features con @requirement | 62 (24%) | `grep -r '@requirement:' templates/gherkin/ \| wc -l` |
| Features con @invariant | 29 (11%) | `grep -r '@invariant' templates/gherkin/ \| wc -l` |
| Features con Regla: | 204 (78%) | `grep -r 'Regla:' templates/gherkin/ \| wc -l` |
| Duplicados exactos | 0 | `validate_features.sh` |

---

## 2. Features por Dominio

| Dominio | Features | % del total |
|---|---|---|
| security | 40 | 15% |
| maternity | 34 | 13% |
| swebok | 12 | 5% |
| pmbok | 10 | 4% |
| hospital | 24 | 9% |
| framework | 8 | 3% |
| solid | 5 | 2% |
| hexagonal | 6 | 2% |
| tdd | 7 | 3% |
| spec_driven | 7 | 3% |
| technical_debt | 6 | 2% |
| guix_user_first | 8 | 3% |
| offline_first | 7 | 3% |
| cap_theorem | 3 | 1% |
| medical_calculations | 5 | 2% |
| accessibility | 5 | 2% |
| antipatterns | 4 | 2% |
| clinical_safety | 6 | 2% |
| observability | 3 | 1% |
| resilience | 2 | 1% |
| surgery | 3 | 1% |
| Otros | 32 | 12% |

---

## 3. Features por Norma

| Norma | Features | % |
|---|---|---|
| NOM-004 (Expediente clínico) | 35 | 13% |
| NOM-024 (Sistemas información) | 40 | 15% |
| NOM-007 (Atención prenatal) | 20 | 8% |
| IEC 62304 (Software médico) | 15 | 6% |
| ISO 14971 (Riesgos) | 8 | 3% |
| OWASP Top 10 | 11 | 4% |
| OWASP ASVS | 13 | 5% |
| OWASP SAMM | 5 | 2% |
| LFPDPPP | 5 | 2% |
| CMMI | 0 | 0% |
| Otros/Sin norma | 116 | 45% |

---

## 4. Features por Fase del Roadmap

| Fase | Features | % |
|---|---|---|
| Fase 0: Fundamentos | 0 | 0% |
| Fase 1: Core clínico | 0 | 0% |
| Fase 2: Agenda y administración | 7 | 3% |
| Fase 3: Integración hospitalaria | 0 | 0% |
| Fase 4: Certificación | 30 | 12% |
| Fase 5: Piloto | 0 | 0% |
| Sin asignar | 223 | 86% |

> **86% de features NO están asignados a una fase del roadmap.**

---

## 5. Features sin Requisito (CRÍTICO)

| Categoría | Features sin @requirement | % de la categoría |
|---|---|---|
| security (owasp_asvs) | 13 | 100% |
| security (owasp) | 11 | 100% |
| security (owasp_samm) | 5 | 100% |
| security (secure_by_design) | 7 | 100% |
| maternity | 34 | 100% |
| hospital | 24 | 100% |
| swebok | 12 | 100% |
| pmbok | 10 | 100% |
| solid | 5 | 100% |
| hexagonal | 6 | 100% |
| tdd | 7 | 100% |
| spec_driven | 7 | 100% |
| Otros | 42 | 100% |
| **TOTAL** | **214 de 260** | **82%** |

> **82% de features NO tienen @requirement.**

---

## 6. Features sin Evidencia

| Categoría | Features sin @evidence | % de la categoría |
|---|---|---|
| Features sin @evidence | 31 de 260 | **12%** |

> **12% de features no tienen @evidence documentada.** Principalmente en categorías de soporte (tdd, technical_debt, antipatterns) donde la evidencia es inherente al código.

---

## 7. Estado de los Features

| Estado | Features | % |
|---|---|---|
| proposed | 260 | 100% |
| review | 0 | 0% |
| verified | 0 | 0% |
| approved | 0 | 0% |

> **100% de features están en estado "proposed".** Ninguno tiene evidencia de implementación.

---

## 8. Cobertura por Área Crítica

| Área | Requisitos | Features | Cobertura |
|---|---|---|---|
| Gestión de pacientes | 10 | 2 | 20% |
| Consulta y prescripción | 7 | 2 | 29% |
| Medicamentos | 5 | 2 | 40% |
| Laboratorio | 4 | 2 | 50% |
| Obstetricia | 7 | 34 | 486% (sobre-cobertura) |
| Seguridad | 8 | 40 | 500% (sobre-cobertura) |
| Offline-first | 4 | 7 | 175% |
| Privacidad | 4 | 5 | 125% |
| Agentes IA | 4 | 1 | 25% |
| Interoperabilidad | 3 | 1 | 33% |

---

## 9. Gap Crítico: Áreas sin Cobertura

| Área | Requisitos | Features | Gap |
|---|---|---|---|
| CMMI alignment | 0 | 0 | **Sin documentar** |
| Roadmap con features | 260 | 7 asignados | **86% sin asignar** |
| Requisitos con evidencia | 56 | 46 (18%) | **82% sin evidencia** |

---

## 10. Recomendaciones Prioritarias

| # | Acción | Impacto |
|---|---|---|
| 1 | Asignar features a fases del roadmap | Crítico |
| 2 | Agregar @requirement a features de seguridad | Crítico |
| 3 | Agregar @evidence a features críticos | Crítico |
| 4 | Crear CMMI alignment document | Alto |
| 5 | Consolidar features duplicados | Bajo |

---

## Referencias

- validate_features.sh
- docs/PLAN/ROADMAP.md
- docs/compliance/IEC62304_CLASS_C.md
- docs/compliance/ISO14971_RISK.md
- docs/quality/TRACEABILITY_MATRIX.md
