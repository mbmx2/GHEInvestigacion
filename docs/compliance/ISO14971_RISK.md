# Especificaciones ISO 14971 para GHE

**Fecha:** 2026-09-21
**Versión:** 1.0.0
**Referencia:** ISO 14971:2019

---

## 1. Alcance

Gestión de riesgos para software médico GHE (Clase C según IEC 62304).

---

## 2. Proceso de Gestión de Riesgos

### 2.1. Análisis de Peligros

| # | Peligro | Componente afectado |
|---|---|---|
| P1 | Error en prescripción médica | Módulo prescription |
| P2 | Pérdida de expediente | SQLite + sync |
| P3 | Error en cálculo médico | medical_calculations |
| P4 | Fallo de disponibilidad del sistema | Infraestructura |
| P5 | Acceso no autorizado a datos | Autenticación + autorización |
| P6 | Error en sincronización de datos | sync engine |
| P7 | Alerta CDS no generada | clinical_decision_support |
| P8 | Error en impresión de receta | Módulo prescription |
| P9 | Pérdida de conexión durante emergencia | Conectividad |
| P10 | Error en interprestación de laboratorio | laboratory |

### 2.2. Matriz de Evaluación de Riesgo

| Peligro | Severidad (1-5) | Probabilidad (1-5) | Nivel de riesgo |
|---|---|---|---|
| P1: Error en prescripción | 5 | 2 | 10 (Alto) |
| P2: Pérdida de expediente | 4 | 1 | 4 (Bajo) |
| P3: Error en cálculo | 5 | 2 | 10 (Alto) |
| P4: Fallo disponibilidad | 3 | 1 | 3 (Bajo) |
| P5: Acceso no autorizado | 4 | 2 | 8 (Medio) |
| P6: Error sincronización | 3 | 2 | 6 (Medio) |
| P7: Alerta CDS no generada | 4 | 2 | 8 (Medio) |
| P8: Error impresión receta | 3 | 2 | 6 (Medio) |
| P9: Pérdida conexión emergencia | 3 | 2 | 6 (Medio) |
| P10: Error laboratorio | 4 | 2 | 8 (Medio) |

### 2.3. Controles de Riesgo

| Peligro | Control | Tipo | Riesgo residual |
|---|---|---|---|
| P1: Error prescripción | CDS + validación + specs + tests | Prevención | Bajo |
| P2: Pérdida expediente | Backup + cifrado + offline-first | Prevención | Bajo |
| P3: Error cálculo | Specs + tests + validación por trimestre | Prevención | Bajo |
| P4: Fallo disponibilidad | Offline-first + backup | Prevención | Bajo |
| P5: Acceso no autorizado | RBAC + cifrado + auditoría | Detección | Medio |
| P6: Error sincronización | Outbox + conflict resolution + hash | Prevención | Bajo |
| P7: Alerta CDS no generada | Monitoreo + redundancia | Detección | Medio |
| P8: Error impresión | Verificación post-impresión | Detección | Bajo |
| P9: Pérdida conexión emergencia | Offline-first completo | Prevención | Bajo |
| P10: Error laboratorio | Doble verificación + alertas | Detección | Bajo |

### 2.4. Matriz de Severidad × Probabilidad

```
                    Probabilidad
                    1       2       3       4       5
              ┌───────┬───────┬───────┬───────┬───────┐
          5   │  5    │  10   │  15   │  20   │  25   │  ← Inaceptable
              │       │  ★P1  │       │       │       │
              ├───────┼───────┼───────┼───────┼───────┤
Severidad 4   │  4    │  8    │  12   │  16   │  20   │  ← Alto
              │       │ ★P5,P7 │       │       │       │
              ├───────┼───────┼───────┼───────┼───────┤
          3   │  3    │  6    │   9   │  12   │  15   │  ← Medio
              │       │★P4,P6  │       │       │       │
              │       │★P8,P9  │       │       │       │
              ├───────┼───────┼───────┼───────┼───────┤
          2   │  2    │  4    │   6   │   8   │  10   │  ← Bajo
              │       │ ★P2    │       │       │       │
              ├───────┼───────┼───────┼───────┼───────┤
          1   │  1    │  2    │   3   │   4   │   5   │  ← Aceptable
              └───────┴───────┴───────┴───────┴───────┘
```

### 2.5. Revisión Periódica

| Frecuencia | Actividad | Responsable |
|---|---|---|
| Por cada cambio significativo | Análisis de impacto en riesgos | Tech Lead |
| Trimestral | Revisión de incidentes | Director médico |
| Semestral | Revisión de controles | QA Lead |
| Anual | Revisión completa de riesgos | Director proyecto |

### 2.6. Registro de Riesgos

| Campo | Descripción |
|---|---|
| ID del riesgo | Identificador único |
| Fecha de identificación | Cuándo se detectó |
| Peligro asociado | Peligro que lo causa |
| Severidad | 1-5 |
| Probabilidad | 1-5 |
| Nivel de riesgo | Severidad × Probabilidad |
| Control implementado | Qué se hace |
| Responsable | Quién monitorea |
| Estado | Abierto/En proceso/Cerrado |
| Fecha de revisión | Próxima revisión |

---

## Referencias

- ISO 14971:2019
- IEC 62304:2006+AMD1:2015
- PROJECT_CHARTER.md §5 (Riesgos principales)
- docs/quality/ISO14971_RISK.md
