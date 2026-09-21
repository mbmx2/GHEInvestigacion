# Framework de Interacción GHE - Template Maestro

> *"Cada interacción genera evidencia. Cada evidencia es trazable. Cada trazabilidad es verificable."*

---

## 1. Estructura del Framework

```
┌─────────────────────────────────────────────────────────────┐
│              FRAMEWORK DE INTERACCIÓN GHE                    │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  CAPA 1: GOBERNANZA                                        │
│  ├── agents.md (configuración de agents)                   │
│  ├── governance.md (reglas del juego)                      │
│  └── lifecycle.md (ciclo de vida de cada interacción)      │
│                                                             │
│  CAPA 2: PROCESO                                           │
│  ├── task_template.md (cómo recibir tareas)                │
│  ├── response_template.md (cómo responder)                 │
│  └── validation_template.md (cómo validar)                 │
│                                                             │
│  CAPA 3: DOCUMENTOS GENERADOS                              │
│  ├── requirements.md (requisitos)                          │
│  ├── specifications.md (especificaciones)                  │
│  ├── design.md (diseño)                                   │
│  ├── implementation.md (implementación)                    │
│  ├── testing.md (pruebas)                                  │
│  └── evidence.md (evidencia)                               │
│                                                             │
│  CAPA 4: AUTOMATIZACIÓN                                   │
│  ├── validate.sh (validación automática)                   │
│  ├── audit.sh (auditoría)                                 │
│  └── report.sh (generación de reportes)                    │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## 2. Flujo de una Interacción

```
USUARIO → TASK_TEMPLATE → AGENTE PROCESA → RESPONSE_TEMPLATE → EVIDENCIA → VALIDATION
   │           │                    │                │              │            │
   │    Define qué se pide    Aplica 15 reglas   Genera doc    Verifica    Auto-verifica
   │                            + 12 secciones     estructurado  结果       resultados
   ▼                              ▼                  ▼             ▼            ▼
   Petición               Análisis completo     Documento     Pruebas    Reporte
                          (diagnóstico→valor→   genera-       ejecutadas  de calidad
                           PMBOK→SWEBOK→SOLID   do + evidencia
                           →antipatrones→
                           implementación→
                           validación→
                           riesgos→decisión)
```
