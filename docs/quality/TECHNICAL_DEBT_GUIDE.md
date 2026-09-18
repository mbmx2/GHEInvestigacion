# Guía de Deuda Técnica para el Proyecto GHE

> *"La deuda técnica es como la deuda financiera: si la ignoras, los intereses te consumen."*

---

## 1. ¿Qué es Deuda Técnica?

**Deuda Técnica** es el costo implícito de rework causado por elegir una solución fácil ahora en lugar de usar un enfoque mejor que tomaría más tiempo. Fue acuñada por **Ward Cunningham** en 1992.

### Metáfora financiera

| Concepto financiero | Equivalente técnico |
|---|---|
| **Capital** | Código limpio, funcional |
| **Deuda** | Código sucio, hacks, shortcuts |
| **Intereses** | Tiempo extra para cada cambio futuro |
| **Pago** | Refactorización, mejora de código |
| **Quiebra** | Sistema ingobernable, rewrite completo |

---

## 2. Deuda Técnica en GHE

### 2.1. Estado Actual

| Métrica | Valor | Objetivo | Estado |
|---|---|---|---|
| Complejidad ciclomática | 4.2 | <5 | ✅ |
| Duplicación de código | 2.1% | <3% | ✅ |
| Cobertura de tests | 92% | >85% | ✅ |
| Funciones >50 líneas | 3 | 0 | ⚠️ |
| Dependencias desactualizadas | 2 | 0 | ⚠️ |
| Deuda total estimada | 25 horas | <20 horas | ⚠️ |

### 2.2. Items de Deuda Actuales

| Item | Severidad | Esfuerzo | Prioridad |
|---|---|---|---|
| Funciones >50 líneas en domain | Media | 4h | Media |
| Tests UI incompletos | Media | 8h | Media |
| Documentación API parcial | Baja | 4h | Baja |
| 2 dependencias por actualizar | Media | 2h | Media |
| Sin certificación NOM-024 | Alta | 80h | Alta |

---

## 3. Estrategias de Reducción

### 3.1. Boy Scout Rule

> *"Deja el campground más limpio de como lo encontraste."*

En cada commit, mejorar algo del código que tocas:
- Agregar un test
- Renombrar una variable
- Extraer una función
- Agregar un docstring

### 3.2. Technical Debt Budget

- **20% del sprint** para reducir deuda técnica
- **Deuda crítica** se trata inmediatamente
- **Deuda acumulada >100 horas** requiere sprint dedicado

### 3.3. TDD para Refactor

```
1. Escribir tests que cubran código actual
2. Verificar que tests pasan
3. Refactorizar incrementalmente
4. Ejecutar tests después de cada cambio
5. Si test falla → revertir
```

---

## 4. Prevención

| Práctica | Implementación |
|---|---|
| **TDD** | Tests primero, código después |
| **Code review** | 1+ aprobación antes de merge |
| **Definition of Done** | Checklist antes de marcar "listo" |
| **Linting** | clj-kondo en cada commit |
| **Análisis estático** | cloverage, lein ancient en CI/CD |

---

## 5. Métricas para Dashboard

```yaml
technical_debt_dashboard:
  current:
    total_items: 5
    critical: 0
    high: 1
    medium: 3
    low: 1
    estimated_hours: 25
  
  code_quality:
    cyclomatic_complexity: 4.2
    duplication: "2.1%"
    coverage: "92%"
    functions_over_50_lines: 3
  
  dependencies:
    outdated: 2
    with_cve: 0
    without_maintainer: 0
  
  trend:
    last_month: "improving"
    debt_change: "-5 hours"
    items_closed: 3
    items_opened: 1
```

---

## 6. Checklist

### Identificación:
- [ ] Ejecutar análisis estático mensualmente
- [ ] Revisar cobertura de tests en cada PR
- [ ] Identificar code smells en code review
- [ ] Verificar dependencias con lein ancient

### Priorización:
- [ ] Evaluar impacto en seguridad
- [ ] Evaluar impacto en calidad clínica
- [ ] Evaluar impacto en mantenibilidad
- [ ] Usar matriz impacto/esfuerzo

### Reducción:
- [ ] 20% del sprint para deuda
- [ ] Boy Scout Rule en cada commit
- [ ] TDD para refactorizaciones
- [ ] Code review para cambios grandes

### Prevención:
- [ ] Definition of Done completa
- [ ] Linting automático
- [ ] Specs definidos antes de código
- [ ] Retrospectiva de calidad mensual

---

## 7. Referencias

- **"Managing Technical Debt"**: Robert C. Martin
- **"Refactoring: Improving the Design of Existing Code"**: Martin Fowler
- **"Clean Code"**: Robert C. Martin
- **"The Mikado Method"**: Ola Ellnestam, Daniel Brolund
- **"Technical Debt Quadrant"**: Martin Fowler

---

*Deuda Técnica en GHE: Gestionarla proactivamente es más barato que ignorarla.*
