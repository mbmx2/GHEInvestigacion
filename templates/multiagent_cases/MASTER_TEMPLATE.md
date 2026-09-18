# Plantilla Maestra: Análisis Multiagente de Casuística

> *"Un mismo caso, múltiples lentes, una verdad superadora."*

---

## 1. Estructura del Sistema Multiagente

### 1.1. Arquitectura de Agentes

```
┌─────────────────────────────────────────────────────────────┐
│                    COORDINADOR (Agente 0)                   │
│  - Recibe el caso                                           │
│  - Distribuye a agentes especializados                      │
│  - Recopila resultados                                      │
│  - Genera síntesis global                                   │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌──────────┐  │
│  │ Agente 1 │  │ Agente 2 │  │ Agente 3 │  │ Agente 4 │  │
│  │ Jurídico │  │ Económico│  │  Ético   │  │Sociológ.│  │
│  └──────────┘  └──────────┘  └──────────┘  └──────────┘  │
│                                                             │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐                 │
│  │ Agente 5 │  │ Agente 6 │  │ Agente 7 │                 │
│  │Técnico   │  │ Clínico  │  │ De Datos │                 │
│  └──────────┘  └──────────┘  └──────────┘                 │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### 1.2. Perspectivas Disciplinarias

| Agente | Perspectiva | Enfoque en GHE |
|---|---|---|
| **Jurídico** | Legal, normativo, cumplimiento | NOM-004, NOM-024, LFPDPPP, IEC 62304 |
| **Económico** | Costo-beneficio, ROI, sostenibilidad | Presupuesto, eficiencia, escalabilidad |
| **Ético** | Principios morales, dilemas | Beneficencia, no maleficencia, justicia, autonomía |
| **Sociológico** | Impacto social, comunidades | Equidad, acceso, inclusión, cultura |
| **Técnico** | Arquitectura, seguridad, rendimiento | Offline-first, hexagonal, testing |
| **Clínico** | Práctica médica, protocolos | Guías de práctica clínica, evidencia |
| **De Datos** | Privacidad, governance, calidad | LFPDPPP, calidad de datos, analytics |

---

## 2. Plantilla Maestra de Análisis

```markdown
# CASO [NÚMERO]: [TÍTULO DEL CASO]

## Ficha Técnica
| Campo                    | Valor                          |
|--------------------------|--------------------------------|
| ID del caso              | CASO-[XXX]                    |
| Fecha de análisis        | [DD/MM/AAAA]                  |
| Complejidad              | Baja / Media / Alta / Crítica |
| Urgencia                 | Inmediata / Corto plazo / Largo plazo |
| Stakeholders afectados   | [Lista]                       |
| Restricciones            | [Lista]                       |

## Descripción del Caso
[Descripción objetiva del caso, sin sesgos]

## Datos Relevantes
| Dato                       | Fuente           | Fiabilidad    |
|----------------------------|------------------|---------------|
| [Dato 1]                   | [Fuente]         | Alta/Media/Baja |
| [Dato 2]                   | [Fuente]         | Alta/Media/Baja |

## Contexto GHE
[Cómo se relaciona el caso con el proyecto GHE]

---

## RUTA 1: Análisis [Disciplina]
**Agente responsable:** [Nombre/ID del agente]

### Tesis
[Argumento principal desde la perspectiva disciplinaria]
- **Premisa 1:** [...]
- **Premisa 2:** [...]
- **Conclusión:** [...]

### Antítesis
[Contraargumento riguroso]
- **Objeción 1:** [...]
- **Objeción 2:** [...]
- **Contraconclusión:** [...]

### Síntesis
[Integración superadora de tesis y antítesis]
- **Puntos de convergencia:** [...]
- **Posición integrada:** [...]
- **Acción recomendada:** [...]

### Evidencia
| Fuente                     | Tipo           | Relevancia    |
|----------------------------|----------------|---------------|
| [Fuente 1]                 | Ley/Norma      | Alta          |
| [Fuente 2]                 | Estudio        | Media         |

---

## RUTA 2: Análisis [Disciplina]
**Agente responsable:** [Nombre/ID del agente]

### Tesis
[...]

### Antítesis
[...]

### Síntesis
[...]

### Evidencia
[...]

---

## RUTA 3: Análisis [Disciplina]
**Agente responsable:** [Nombre/ID del agente]

### Tesis
[...]

### Antítesis
[...]

### Síntesis
[...]

### Evidencia
[...]

---

## SÍNTESIS GLOBAL
**Agente coordinador:** [ID]

### Convergencias entre rutas
| Ruta 1              | Ruta 2              | Ruta 3              | Convergencia        |
|---------------------|---------------------|---------------------|---------------------|
| [Resultado R1]      | [Resultado R2]      | [Resultado R3]      | [Convergencia]      |

### Divergencias
| Ruta 1              | Ruta 2              | Ruta 3              | Naturaleza divergencia |
|---------------------|---------------------|---------------------|----------------------|
| [Posición R1]       | [Posición R2]       | [Posición R3]       | [Tipo]               |

### Conclusión Superadora
[Integración de todas las perspectivas en una conclusión que trasciende cada una individualmente]

### Recomendaciones Accionables
| #   | Recomendación              | Responsable  | Plazo     | Prioridad |
|-----|----------------------------|--------------|-----------|-----------|
| 1   | [Acción concreta]          | [Quién]      | [Cuándo]  | Alta/Media/Baja |
| 2   | [Acción concreta]          | [Quién]      | [Cuándo]  | Alta/Media/Baja |

### Riesgos de la Síntesis
| Riesgo                     | Probabilidad | Impacto | Mitigación |
|----------------------------|--------------|---------|------------|
| [Riesgo 1]                 | Media        | Alto    | [Acción]   |

### Métricas de Éxito
| Métrica                    | Objetivo             | Método de medición |
|----------------------------|----------------------|-------------------|
| [Métrica 1]                | [Target]             | [Cómo medir]      |

### Lecciones Aprendidas
| Lección                    | Aplicación futura    |
|----------------------------|----------------------|
| [Lección 1]                | [Aplicación]         |
```

---

## 3. Formato de Salida Estandarizado

### 3.1. Para comparación entre rutas

```yaml
case_id: "CASO-001"
case_title: "Título del caso"
analysis_date: "2024-09-18"
complexity: "high"

routes:
  - route_id: "R1"
    discipline: "jurídico"
    agent_id: "AGENT-01"
    thesis:
      conclusion: "..."
      confidence: "high/medium/low"
      evidence_count: 5
    antithesis:
      conclusion: "..."
      strength: "strong/moderate/weak"
    synthesis:
      integrated_position: "..."
      actionable_recommendation: "..."
      alignment_with_ghe: "aligned/neutral/conflict"
    
  - route_id: "R2"
    discipline: "económico"
    agent_id: "AGENT-02"
    thesis:
      conclusion: "..."
      confidence: "high/medium/low"
      evidence_count: 4
    antithesis:
      conclusion: "..."
      strength: "strong/moderate/weak"
    synthesis:
      integrated_position: "..."
      actionable_recommendation: "..."
      alignment_with_ghe: "aligned/neutral/conflict"
    
  - route_id: "R3"
    discipline: "ético"
    agent_id: "AGENT-03"
    thesis:
      conclusion: "..."
      confidence: "high/medium/low"
      evidence_count: 3
    antithesis:
      conclusion: "..."
      strength: "strong/moderate/weak"
    synthesis:
      integrated_position: "..."
      actionable_recommendation: "..."
      alignment_with_ghe: "aligned/neutral/conflict"

global_synthesis:
  convergence_score: 85  # 0-100
  divergences: 2
  final_recommendation: "..."
  risk_level: "low/medium/high"
  alignment_with_ghe: "aligned"
```

### 3.2. Para dashboard

```yaml
dashboard:
  total_cases_analyzed: 10
  avg_convergence_score: 78
  routes_by_discipline:
    jurídico: 10
    económico: 10
    ético: 10
    sociológico: 8
    técnico: 10
    clínico: 7
    de_datos: 6
  recommendations_generated: 45
  recommendations_implemented: 12
  avg_implementation_time: "2 weeks"
```

---

## 4. Instrucciones para Agentes

### 4.1. Instrucciones generales

```
Eres un agente de análisis de casuística especializado en [DISCIPLINA].

TUA TAREA:
1. Analizar el caso desde tu perspectiva disciplinaria
2. Producir una TESIS argumentada con evidencia
3. Producir una ANTÍTESIS que cuestione tu propia tesis
4. Producir una SÍNTESIS que integre ambas posiciones

REGLAS:
- Sé riguroso y cita fuentes
- No especules sin evidencia
- Considera el contexto de GHE (software médico, offline-first, rural)
- Produces salida en el formato estandarizado
- Sé conciso pero completo
```

### 4.2. Instrucciones por disciplina

| Disciplina | Enfoque específico | Fuentes típicas |
|---|---|---|
| **Jurídico** | Cumplimiento normativo, derechos, obligaciones | Leyes, normas, jurisprudencia |
| **Económico** | Costo-beneficio, ROI, sostenibilidad financiera | Estudios económicos, datos de mercado |
| **Ético** | Principios de bioética, dilemas morales | Códigos de ética, literatura bioética |
| **Sociológico** | Impacto social, equidad, acceso | Estudios sociales, encuestas, ENSANUT |
| **Técnico** | Viabilidad técnica, arquitectura, seguridad | Estándares técnicos, documentación |
| **Clínico** | Guías de práctica clínica, evidencia médica | GPC, revisiones sistemáticas, consensus |
| **De Datos** | Privacidad, calidad, governance | LFPDPPP, GDPR, best practices |

---

## 5. Casos Específicos para GHE

### Casos planteados:

1. **CASO-001**: ¿Puede GHE reemplazar el expediente físico en contextos rurales?
2. **CASO-002**: ¿Cómo equilibrar privacidad de datos con necesidades de salud pública?
3. **CASO-003**: ¿Es ético usar IA para diagnóstico en zonas sin especialistas?
4. **CASO-004**: ¿Cómo certificar software médico en contextos de recursos limitados?
5. **CASO-005**: ¿Debe GHE compartir datos con investigadores para mejorar salud pública?
6. **CASO-006**: ¿Cómo manejar el rechazo del equipo médico a usar el sistema?
7. **CASO-007**: ¿Qué hacer cuando el sistema offline falla durante una emergencia?
8. **CASO-008**: ¿Cómo priorizar features cuando los recursos son limitados?
9. **CASO-009**: ¿Es seguro depender de SQLite para datos de salud críticos?
10. **CASO-010**: ¿Cómo manejar la interoperabilidad con sistemas del IMSS/ISSSTE?

---

*Sistema Multiagente de Análisis de Casuística: Una perspectiva no es suficiente.*
