# Guía del Sistema Multiagente de Análisis de Casuística

> *"Un caso visto desde una sola perspectiva es una opinión. Visto desde siete, es conocimiento."*

---

## 1. ¿Qué es el Sistema Multiagente?

El **Sistema Multiagente de Análisis de Casuística** es un framework para analizar problemas complejos desde múltiples perspectivas disciplinarias de forma simultánea. Cada agente opera desde una disciplina distinta, produciendo tesis, antítesis y síntesis que se integran en una conclusión superadora.

### Principios

| Principio | Descripción |
|---|---|
| **Perspectivas múltiples** | Un mismo caso se analiza desde 3+ disciplinas |
| **Dialéctica rigurosa** | Cada perspectiva produce tesis → antítesis → síntesis |
| **Evidencia-based** | Cada argumento se sustenta con fuentes |
| **Comparabilidad** | Formatos estandarizados para comparar resultados |
| **Acción concreta** | Cada análisis genera recomendaciones accionables |

---

## 2. Estructura de un Análisis

### 2.1. Flujo del proceso

```
┌─────────────┐
│  CASO       │ → Se define el problema
└──────┬──────┘
       │
       ▼
┌─────────────┐
│ COORDINADOR │ → Distribuye a agentes
└──────┬──────┘
       │
       ├──→ Agente Jurídico → Tesis/Antítesis/Síntesis
       ├──→ Agente Económico → Tesis/Antítesis/Síntesis
       ├──→ Agente Ético → Tesis/Antítesis/Síntesis
       ├──→ Agente Sociológico → Tesis/Antítesis/Síntesis
       ├──→ Agente Técnico → Tesis/Antítesis/Síntesis
       ├──→ Agente Clínico → Tesis/Antítesis/Síntesis
       └──→ Agente de Datos → Tesis/Antítesis/Síntesis
                │
                ▼
       ┌─────────────────┐
       │ SÍNTESIS GLOBAL │ → Convergencias, divergencias
       └────────┬────────┘                │
                │                          │
                ▼                          ▼
       ┌─────────────────┐    ┌─────────────────┐
       │  RECOMENDACIONES│    │  MÉTRICAS DE    │
       │  ACCIONABLES    │    │  ÉXITO          │
       └─────────────────┘    └─────────────────┘
```

### 2.2. Formato por ruta

Cada ruta de análisis produce:

| Sección | Contenido |
|---|---|
| **Tesis** | Argumento principal con evidencia |
| **Antítesis** | Contraargumento riguroso |
| **Síntesis** | Integración superadora |
| **Evidencia** | Fuentes citadas |

---

## 3. Agentes Disponibles

| ID | Perspectiva | Especialización en GHE |
|---|---|---|
| AGENT-JUR | Jurídico | NOM-004, NOM-024, LFPDPPP, IEC 62304 |
| AGENT-ECO | Económico | ROI, costos, sostenibilidad financiera |
| AGENT-ETI | Ético | Bioética, principios, dilemas morales |
| AGENT-SOC | Sociológico | Impacto social, equidad, acceso |
| AGENT-TEC | Técnico | Arquitectura, seguridad, rendimiento |
| AGENT-CLI | Clínico | Guías de práctica clínica, evidencia |
| AGENT-DAT | De Datos | Privacidad, calidad, governance |

---

## 4. Casos Analizados

| ID | Título | Agentes | Convergencia |
|---|---|---|---|
| CASO-001 | Expediente Electrónico vs. Físico | Jur, Eco, Éti | 85% |
| CASO-002 | Privacidad vs. Salud Pública | Jur, Éti, Soc | 78% |
| CASO-003 | IA para Diagnóstico Rural | Tec, Éti, Cli | 72% |
| CASO-004 | Certificación con Recursos Limitados | Jur, Eco, Tec | 80% |

---

## 5. Cómo Usar el Sistema

### 5.1. Para nuevos casos

1. Copiar `MASTER_TEMPLATE.md`
2. Definir el caso en la ficha técnica
3. Asignar 3+ agentes (disciplinas)
4. Cada agente produce su análisis
5. Coordinador genera síntesis global
6. Documentar recomendaciones

### 5.2. Para comparar casos

Usar el formato YAML para dashboard:

```yaml
cases:
  - id: "CASO-001"
    convergence: 85
    recommendations: 6
    implemented: 2
  - id: "CASO-002"
    convergence: 78
    recommendations: 5
    implemented: 1
```

### 5.3. Para reporting

Generar reporte consolidado:

```markdown
## Resumen de Análisis Multiagente

| Caso     | Agentes | Convergencia | Recomendaciones | Implementadas |
|----------|---------|--------------|-----------------|---------------|
| CASO-001 | 3       | 85%          | 6               | 2             |
| CASO-002 | 3       | 78%          | 5               | 1             |
| CASO-003 | 3       | 72%          | 5               | 0             |
| CASO-004 | 3       | 80%          | 5               | 1             |
| **TOTAL**| **12**  | **79%**      | **21**          | **4**         |
```

---

## 6. Métricas de Calidad del Análisis

| Métrica | Objetivo | Cómo medir |
|---|---|---|
| Convergencia promedio | >75% | % de agreement entre rutas |
| Evidencia por ruta | ≥3 fuentes | Conteo de referencias |
| Recomendaciones accionables | 100% | Cada recomendación tiene responsable y plazo |
| Cobertura disciplinaria | ≥3 disciplinas | Número de agentes por caso |

---

## 7. Referencias

- **Dialéctica (Hegel):** Tesis → Antítesis → Síntesis
- **Pensamiento sistémico:** Ver el todo, no solo las partes
- **Delphi method:** Consenso de expertos
- **Multi-criteria decision analysis (MCDA):** Evaluación con múltiples criterios

---

*Sistema Multiagente de Análisis de Casuística: Porque un problema complejo requiere múltiples mentes.*
