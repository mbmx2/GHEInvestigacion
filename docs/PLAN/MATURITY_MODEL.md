# Modelo de Madurez del Proyecto GHE

**Fecha:** 2026-09-21
**Versión:** 1.0.0

---

## Niveles de Madurez

| Nivel | Nombre | Descripción |
|---|---|---|
| 0 | **Inicial** | Sin proceso documentado |
| 1 | **Repetible** | Procesos básicos documentados |
| 2 | **Definido** | Procesos estandarizados y medidos |
| 3 | **Gestionado** | Procesos medidos y controlados cuantitativamente |
| 4 | **Optimizado** | Mejora continua basada en datos |

---

## Evaluación por Área

| Área | Nivel Actual | Nivel Objetivo | Gap |
|---|---|---|---|
| **Requisitos** | 1 | 3 | Proceso definido pero no medido |
| **Diseño** | 2 | 3 | Arquitectura documentada, falta métricas |
| **Construcción** | 2 | 3 | TDD implementado, falta métricas de deuda |
| **Testing** | 2 | 4 | 5,573 tests, falta automatización completa |
| **Seguridad** | 1 | 3 | OWASP documentado, falta pentest real |
| **Gestión de config** | 1 | 3 | Git activo, falta CI/CD |
| **Mantenimiento** | 0 | 2 | Sin proceso documentado |
| **Calidad** | 1 | 3 | Métricas definidas, falta dashboard |
| **Documentación** | 2 | 3 | Extensa, falta validación |
| **Agentes IA** | 1 | 2 | Política definida, falta implementación |

---

## Plan de Mejora por Nivel

### Nivel 0 → 1 (Inicial → Repetible)
- Documentar procesos existentes
- Definir roles y responsabilidades
- Establecer básicos de calidad

### Nivel 1 → 2 (Repetible → Definido)
- Estandarizar procesos
- Implementar métricas básicas
- Establecer templates reutilizables
- Definir Definition of Done

### Nivel 2 → 3 (Definido → Gestionado)
- Medir procesos cuantitativamente
- Implementar dashboards
- Establecer SLAs internos
- Ejecutar auditorías regulares

### Nivel 3 → 4 (Gestionado → Optimizado)
- Mejora continua basada en datos
- Optimización predictiva
- Innovación en procesos
- Benchmarking externo

---

## Estado Actual del Proyecto

| Área | Nivel | Evidencia |
|---|---|---|
| Arquitectura | 2 | ADRs aprobados, hexagonal documentada |
| Testing | 2 | 5,573 tests, PEAEH, coverage >85% |
| Documentación | 2 | 171+ features, 38 docs |
| Seguridad | 1 | OWASP documentado, falta pentest |
| Gestión | 1 | PMBOK documentado, falta ejecución |
| Calidad | 1 | SWEBOK documentado, falta métricas |
| Agentes IA | 1 | Política definida, falta implementación |

**Nivel promedio actual: 1.3**
**Nivel objetivo: 3.0 (en 24 meses)**

---

## Referencias

- PROJECT_CHARTER.md
- docs/quality/SWEBOK_GUIDE.md
- docs/quality/PMBOK_GUIDE.md
- IEC 62304:2006+AMD1:2015
