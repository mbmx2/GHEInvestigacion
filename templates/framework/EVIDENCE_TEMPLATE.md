# Template: Evidencia

```markdown
# Evidencia de Cambio - [ID DEL CAMBIO]
# Fecha: [DD/MM/AAAA]
# Autor: [Nombre]

---

## 1. Resumen del Cambio
| Campo | Valor |
|---|---|
| ID | [CAMBIO-XXX] |
| Título | [Descripción corta] |
| Tipo | [Bug fix/Feature/Refactor/Config] |
| Módulo | [Módulo afectado] |
| Prioridad | [Crítica/Alta/Media/Baja] |

## 2. Problema Raíz
| Campo | Valor |
|---|---|
| Problema | [Qué estaba mal] |
| Causa raíz | [Por qué estaba mal] |
| Impacto | [Qué afectaba] |

## 3. Solución Implementada
| Archivo | Cambio | Líneas affected |
|---------|--------|-----------------|
| [archivo] | [qué cambió] | +/- XX |

## 4. Pruebas
| Tipo | Tests | Resultado | Cobertura |
|------|-------|-----------|-----------|
| Unit | [N tests] | [Pass/Fail] | [%] |
| Integration | [N tests] | [Pass/Fail] | [%] |
| Acceptance | [N tests] | [Pass/Fail] | [%] |

## 5. Validación
| Comando | Resultado |
|---------|-----------|
| `lein test` | [Pass/Fail, N tests] |
| `lein cloverage` | [% cobertura] |
| `clj-kondo` | [0 warnings] |
| Build | [Success/Failure] |

## 6. Evidencia Visual
| Tipo | Ubicación |
|------|-----------|
| Screenshot antes | [ruta] |
| Screenshot después | [ruta] |
| Log de ejecución | [ruta] |

## 7. Decisiones Tomadas
| Decisión | Justificación | Alternativas descartadas |
|----------|---------------|--------------------------|
| [Decisión] | [Por qué] | [Qué más se consideró] |

## 8. Riesgos Residuales
| Riesgo | Probabilidad | Impacto | Mitigación |
|--------|--------------|---------|------------|
| [Riesgo] | [A/M/B] | [A/M/B] | [Acción] |

## 9. Trabajo Pendiente
- [ ] [Tarea pendiente 1]
- [ ] [Tarea pendiente 2]
```
