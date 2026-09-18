# Plantilla de Propuestas de Mejora

> *"Cada mejora propuesta debe ser accionable, medible y alineada con la misión de GHE."*

---

## 1. Formato Estándar de Propuesta

### 1.1. Propuesta de Mejora Completa

```markdown
# PROPUESTA DE MEJORA #[NÚMERO]

## Ficha Técnica
| Campo                    | Valor                          |
|--------------------------|--------------------------------|
| ID                       | IMP-[XXX]                     |
| Fecha                    | [DD/MM/AAAA]                  |
| Autor                    | [Nombre/Rol]                  |
| Estado                   | Propuesta/En revisión/Aprobada/Implementada |
| Prioridad                | Crítica/Alta/Media/Baja       |
| Categoría                | Funcional/Técnica/Proceso/Seguridad/UX |
| Esfuerzo estimado        | [Horas/días/semanas]          |
| Impacto estimado         | Alto/Medio/Bajo               |

## Problema Actual
[Descripción del problema que resuelve la mejora]

## Solución Propuesta
[Descripción de la solución]

## Beneficios Esperados
| Beneficio                 | Métrica                       | Valor esperado |
|---------------------------|-------------------------------|----------------|
| [Beneficio 1]             | [Métrica]                     | [Valor]        |
| [Beneficio 2]             | [Métrica]                     | [Valor]        |

## Alternativas Consideradas
| Alternativa               | Pros                          | Contras         |
|---------------------------|-------------------------------|-----------------|
| [Alternativa 1]           | [Pros]                        | [Contras]       |
| [Alternativa 2]           | [Pros]                        | [Contras]       |

## Plan de Implementación
| Fase                       | Actividades                   | Duración        |
|----------------------------|-------------------------------|-----------------|
| Fase 1: Diseño             | [Actividades]                 | [Duración]      |
| Fase 2: Desarrollo         | [Actividades]                 | [Duración]      |
| Fase 3: Testing            | [Actividades]                 | [Duración]      |
| Fase 4: Despliegue         | [Actividades]                 | [Duración]      |

## Riesgos
| Riesgo                     | Probabilidad | Impacto | Mitigación |
|----------------------------|--------------|---------|------------|
| [Riesgo 1]                 | Alta/Media/Baja | Alto/Medio/Bajo | [Acción] |

## Métricas de Éxito
| Métrica                    | Actual      | Target      | Método de medición |
|----------------------------|-------------|-------------|-------------------|
| [Métrica 1]                | [Valor]     | [Target]    | [Cómo medir]      |

## Aprobación
| Aprobado por               | Fecha       | Comentarios  |
|----------------------------|-------------|--------------|
| [Nombre]                   | [Fecha]     | [Comentarios]|
```

---

## 2. Banco de Propuestas

### 2.1. Propuestas Funcionales

| # | Propuesta | Prioridad | Esfuerzo | Impacto |
|---|---|---|---|---|
| IMP-001 | Módulo de telemedicina | Alta | 3 meses | Alto |
| IMP-002 | Módulo de laboratorio | Alta | 2 meses | Alto |
| IMP-003 | Dashboard ejecutivo | Alta | 1 mes | Alto |
| IMP-004 | App móvil nativa | Media | 4 meses | Medio |
| IMP-005 | Multi-idioma | Baja | 1 mes | Bajo |
| IMP-006 | Modo oscuro | Baja | 1 semana | Bajo |
| IMP-007 | PWA (Progressive Web App) | Media | 2 semanas | Medio |

### 2.2. Propuestas Técnicas

| # | Propuesta | Prioridad | Esfuerzo | Impacto |
|---|---|---|---|---|
| IMP-010 | Interoperabilidad FHIR R4 | Alta | 3 meses | Alto |
| IMP-011 | Migración a PostgreSQL (futuro) | Baja | 6 meses | Medio |
| IMP-012 | API GraphQL | Baja | 2 meses | Bajo |
| IMP-013 | Cache distribuido (Redis) | Baja | 1 mes | Bajo |
| IMP-014 | Monitoreo con Prometheus | Media | 2 semanas | Medio |

### 2.3. Propuestas de Calidad

| # | Propuesta | Prioridad | Esfuerzo | Impacto |
|---|---|---|---|---|
| IMP-020 | Certificación NOM-024 | Crítica | 3 meses | Crítico |
| IMP-021 | Pentest semestral | Alta | 2 días | Alto |
| IMP-022 | Audit de accessibility WCAG | Media | 1 día | Medio |
| IMP-023 | Code review automatizado | Media | 2 semanas | Medio |

### 2.4. Propuestas de Proceso

| # | Propuesta | Prioridad | Esfuerzo | Impacto |
|---|---|---|---|---|
| IMP-030 | CI/CD automatizado | Alta | 2 semanas | Alto |
| IMP-031 | Documentation as Code | Media | 1 semana | Medio |
| IMP-032 | Retrospectiva mensual | Media | 2 horas/mes | Medio |
| IMP-033 | Knowledge base interna | Baja | 1 mes | Bajo |

### 2.5. Propuestas de UX

| # | Propuesta | Prioridad | Esfuerzo | Impacto |
|---|---|---|---|---|
| IMP-040 | Onboarding wizard | Media | 1 semana | Medio |
| IMP-041 | Tooltips contextuales | Baja | 3 días | Bajo |
| IMP-042 | Keyboard shortcuts | Baja | 2 días | Bajo |
| IMP-043 | Dark mode | Baja | 1 semana | Bajo |

---

## 3. Proceso de Propuestas

### 3.1. Flujo

```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│  PROPUESTA  │ →  │  REVISIÓN   │ →  │  APROBACIÓN │
│  Cualquiera │    │  Tech Lead  │    │  Director   │
└─────────────┘    └─────────────┘    └─────────────┘
       │                  │                  │
       ▼                  ▼                  ▼
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│  BACKLOG    │ →  │  PLANNING   │ →  │  IMPLEMENTAR│
│  Priorizada │    │  Sprint     │    │  Desarrollo │
└─────────────┘    └─────────────┘    └─────────────┘
```

### 3.2. Criterios de Aceptación

| Criterio                    | Requisito                      |
|-----------------------------|--------------------------------|
| Alineación con misión       | Contribuye a salud materna     |
| Viabilidad técnica          | Implementable con stack actual |
| Impacto medible             | Tiene métricas de éxito        |
| Sin riesgo de regresión     | No rompe funcionalidad existente|
| Compatible con offline-first| Funciona sin internet          |
| Cumple normativa            | No viola NOM-004/NOM-024      |

---

## 4. Tracking de Propuestas

```yaml
# Dashboard de propuestas
proposals_dashboard:
  total: 43
  by_status:
    proposed: 12
    in_review: 5
    approved: 15
    implemented: 8
    rejected: 3
  
  by_priority:
    critical: 3
    high: 12
    medium: 18
    low: 10
  
  by_category:
    functional: 7
    technical: 5
    quality: 4
    process: 4
    ux: 4
  
  implementation_rate: "19%"  # 8/43
  avg_implementation_time: "2.5 weeks"
```

---

*Propuestas de Mejora: Cada idea tiene un camino hacia la implementación.*
