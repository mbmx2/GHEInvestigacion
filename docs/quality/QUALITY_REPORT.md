# Informe de Calidad - GHEInvestigacion v1.0.0

> *"Generado automáticamente con validadores reproducibles"*

---

## Metadata

| Campo | Valor |
|---|---|
| Fecha de generación | 2026-09-20 |
| Commit verificado | ead6965 |
| Validador | validate_features.sh |
| Estado | ✅ APROBADO |

---

## 1. Métricas Verificadas

| Métrica | Valor | Comando de verificación |
|---|---|---|
| Feature files | 217 | `find templates/gherkin -name '*.feature' -type f \| wc -l` |
| Documentos .md | 58 | `find . -name '*.md' -not -path './.kilo/*' \| wc -l` |
| Total archivos | 275 | `find . -type f \( -name '*.md' -o -name '*.feature' \) \| wc -l` |
| Líneas en features | 22,280 | `find templates/gherkin -name '*.feature' -exec cat {} + \| wc -l` |
| Líneas en docs | 12,783 | `find . -name '*.md' -exec cat {} + \| wc -l` |
| Líneas totales | 35,063 | Suma de ambas |
| Escenarios | 1,463 | `grep -r 'Escenario:' templates/gherkin/ \| wc -l` |
| Scenario Outlines | 8 features | `grep -rl 'Escenario Outline' templates/gherkin/` |
| Features con tags | 217/217 (100%) | `grep -r '@domain:' templates/gherkin/ \| wc -l` |
| IDs únicos | 8 | `grep -r '^# @id ' templates/gherkin/` |
| Duplicados | 0 | `md5sum \| uniq -d` |

---

## 2. Validación Automática

| Verificación | Resultado |
|---|---|
| Todos los features tienen @domain | ✅ 217/217 |
| Todos los features tienen @type | ✅ 217/217 |
| Todos los features tienen @status | ✅ 217/217 |
| Formato '# language: es' | ✅ 217/217 |
| Contiene 'Característica:' | ✅ 217/217 |
| Tiene escenarios | ✅ 217/217 |
| Sin features vacíos | ✅ 0 vacíos |
| Sin duplicados exactos | ✅ 0 duplicados |
| IDs únicos | ✅ 8 únicos |

---

## 3. Cobertura por Dominio

| Dominio | Features | Escenarios | Estado |
|---|---|---|---|
| maternity | 34 | ~350 | Propuesto |
| hospital | 24 | ~200 | Propuesto |
| security | 12 | ~100 | Propuesto |
| owasp | 11 | ~75 | Propuesto |
| swebok | 12 | ~66 | Propuesto |
| pmbok | 10 | ~39 | Propuesto |
| guix_user_first | 8 | ~55 | Propuesto |
| offline_first | 7 | ~47 | Propuesto |
| hexagonal | 6 | ~40 | Propuesto |
| clinical_safety | 6 | ~55 | Propuesto |
| solid | 5 | ~36 | Propuesto |
| spec_driven | 7 | ~51 | Propuesto |
| tdd | 7 | ~43 | Propuesto |
| medical_calculations | 5 | ~47 | Propuesto |
| technical_debt | 6 | ~45 | Propuesto |
| antipatterns | 4 | ~43 | Propuesto |
| accessibility | 5 | ~37 | Propuesto |
| secure_by_design | 7 | ~46 | Propuesto |
| surgery | 3 | ~8 | Propuesto |
| observability | 3 | ~21 | Propuesto |
| resilience | 2 | ~14 | Propuesto |
| Otros | 19 | ~150 | Propuesto |

---

## 4. Estado de Implementación

| Estado | Features | Porcentaje |
|---|---|---|
| Propuesto (solo documentación) | 217 | 100% |
| Parcialmente implementado | 0 | 0% |
| Verificado (con código + tests) | 0 | 0% |

> **Nota:** Este repositorio contiene documentación y templates. No contiene código ejecutable, tests ni implementación. Las features describen workflows que deben ser implementados en el sistema GHE.

---

## 5. Deuda Técnica Documentada

| Categoría | Items | Prioridad |
|---|---|---|
| Features sin Scenario Outline | 209/217 | Media |
| Features sin owner específico | ~100 | Media |
| Métricas de features sin evidencia | 217 | Alta |
| Referencias a src/ y tests/ inexistentes | Múltiples | Alta |

---

*Informe generado automáticamente. Reproducible con `bash validate_features.sh`*
