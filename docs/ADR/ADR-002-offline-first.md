# ADR-002: Arquitectura Offline-First

**Estado:** Aceptado
**Fecha:** 2026-09-21
**Decisor:** Director técnico
**Revisado por:** Director médico

---

## Contexto

La Maternidad de Altotonga se encuentra en la sierra de Veracruz con conectividad 2G/EDGE intermitente. Un sistema que requiera internet para funcionar sería inútil durante la mayoría del tiempo de operación. La atención médica no puede detenerse por falta de conectividad.

## Decisión

Todo el sistema debe funcionar 100% offline. La sincronización con cloud es un proceso secundario que mejora la experiencia pero NO es necesaria para la operación.

## Criterios de decisión evaluados

| Criterio | Peso | Offline-First | Cloud-First | Hybrid |
|---|---|---|---|---|
| Disponibilidad sin internet | 35% | 10 | 0 | 5 |
| Rendimiento local | 25% | 10 | 3 | 6 |
| Complejidad de sync | 20% | 6 | 10 | 4 |
| Consistencia global | 15% | 6 | 9 | 7 |
| Costo de infraestructura | 5% | 9 | 3 | 6 |
| **Total ponderado** | | **8.7** | **2.8** | **5.5** |

## Consecuencias

### Positivas
- Disponibilidad 100% sin internet
- Sin dependencia de cloud
- Funcionamiento inmediato
- Backup = copiar archivo SQLite
- Rendimiento excepcional en consultas locales

### Negativas
- Sin datos en tiempo real entre dispositivos
- Resolución de conflictos post-sync
- Complejidad de sincronización
- Tamaño máximo de BD: 2GB (suficiente para hospital único)
- Sin replicación automática

## Especificaciones técnicas

| Componente | Especificación |
|---|---|
| Motor de BD | SQLite 3.40+ con SQLCipher (AES-256) |
| Patrón de sync | Outbox pattern |
| Estrategia de sync | Delta sync (solo cambios desde last_sync) |
| Retry | Backoff exponencial: 5s → 25s → 2min → 10min → 30min |
| Conflict resolution | Last-write-wins para datos no críticos; manual para datos clínicos |
| Integrity check | SHA-256 hash por registro |
| Compresión | gzip antes de transmitir |
| Queue management | Máximo 1,000 operaciones pendientes |

## Alternativas descartadas

| Alternativa | Por qué se descartó |
|---|---|
| Cloud-first | El sistema sería inúvil 80% del tiempo (sin internet) |
| Hybrid (cloud-first con fallback) | Complejidad innecesaria. El offline-first cubre el hybrid |
| PWA con Service Workers | No resuelve persistencia de datos completa |

## Referencias
- ADR-004 (SQLite con cifrado)
- Offline-First Architecture Guide (docs/architecture/OFFLINE_FIRST_GUIDE.md)
- CAP Theorem (templates/gherkin/cap_theorem/)
