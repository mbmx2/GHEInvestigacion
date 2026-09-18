# CASO-004: Certificación de Software Médico en Contextos de Recursos Limitados

---

## Ficha Técnica

| Campo                    | Valor                          |
|--------------------------|--------------------------------|
| ID del caso              | CASO-004                      |
| Fecha de análisis        | 2024-09-18                    |
| Complejidad              | Alta                          |
| Urgencia                 | Corto plazo                   |
| Stakeholders afectados   | Equipo GHE, COFEPRIS, DGIS, maternidad |
| Restricciones            | Presupuesto limitado, tiempo, conocimiento |

---

## Descripción del Caso

GHE necesita certificación NOM-024 para operar legalmente. El proceso de certificación ante DGIS es costoso ($50,000-100,000 MXN) y complejo. La maternidad tiene presupuesto limitado. **¿Cómo lograr certificación con recursos limitados? ¿Se puede operar sin ella temporalmente?**

---

## RUTA 1: Análisis Jurídico

**Agente responsable:** AGENT-JUR-004

### Tesis

**La certificación NOM-024 es obligatoria e ineludible.**

- **Premisa 1:** La NOM-024 es de observancia obligatoria para sistemas de información de registro electrónico en salud.
- **Premisa 2:** El decreto 2026 refuerza la obligatoriedad.
- **Premisa 3:** COFEPRIS puede sancionar a establecimientos que usen SIRES no certificados.
- **Conclusión:** Sin certificación, GHE opera ilegalmente.

### Antítesis

**La certificación puede diferirse mientras se implementan controles equivalentes.**

- **Objeción 1:** Muchos sistemas operan sin certificación NOM-024 sin ser sancionados (realidad práctica).
- **Objeción 2:** La certificación es un proceso largo. Mientras tanto, el sistema puede operar con controles manuales equivalentes.
- **Objeción 3:** La DGIS tiene backlog de solicitudes. El proceso puede tomar meses.
- **Contraconclusión:** Se puede operar temporalmente con documentación de controles equivalentes mientras se gestiona la certificación.

### Síntesis

**Iniciar proceso de certificación inmediatamente, con plan de contingencia.**

- **Posición integrada:** (1) Solicitar certificación inmediatamente. (2) Documentar controles equivalentes. (3) Operar con expediente paralelo (físico + electrónico) durante el proceso.

---

## RUTA 2: Análisis Económico

**Agente responsable:** AGENT-ECO-004

### Tesis

**La inversión en certificación se recovered con la evitación de sanciones y la mejora de credibilidad.**

- **Premisa 1:** Una sanción de COFEPRIS puede costar $100,000-500,000 MXN.
- **Premisa 2:** La certificación da credibilidad ante aseguradoras e instituciones.
- **Premisa 3:** El costo de certificación ($50,000-100,000) es menor que una sanción.
- **Conclusión:** La certificación es una inversión, no un gasto.

### Antítesis

**El costo de certificación puede ser prohibitorio para una maternidad rural.**

- **Objeción 1:** $50,000-100,000 MXN es significativo para una maternidad con presupuesto limitado.
- **Objeción 2:** El proceso requiere consultor externo ($30,000-50,000 adicionales).
- **Objeción 3:** El ROI de certificación no es inmediato.
- **Contraconclusión:** Se necesitan fuentes de financiamiento alternativas (gobierno, donantes, grants).

### Síntesis

**Buscar financiamiento externo para cubrir costos de certificación.**

- **Posición integrada:** (1) Solicitar subsidio de gobierno estatal. (2) Buscar donantes internacionales. (3) Considerar alianza con universidad para certificación a costo reducido.

---

## RUTA 3: Análisis Técnico

**Agente responsable:** AGENT-TEC-004

### Tesis

**GHE ya cumple la mayoría de requisitos NOM-024 técnicamente.**

- **Premisa 1:** GHE tiene: cifrado AES-256, TLS 1.3, RBAC, audit log, backup automático.
- **Premisa 2:** La arquitectura hexagonal facilita la documentación de componentes.
- **Premisa 3:** Los 5,573 tests automatizados demuestran calidad de software.
- **Conclusión:** El gap técnico para certificación es pequeño.

### Antítesis

**La documentación requerida por NOM-024 es extensa y requiere expertise específico.**

- **Objeción 1:** La NOM-024 requiere documentación específica: plan de seguridad, análisis de riesgos, plan de continuidad.
- **Objeción 2:** La DGIS evalúa no solo el código sino el proceso de desarrollo.
- **Objeción 3:** La documentación debe estar en formato específico y ser verificable.
- **Contraconclusión:** Se necesita consultant experto en NOM-024 para preparar documentación.

### Síntesis

**GHE tiene la base técnica, pero necesita documentación específica para certificación.**

- **Posición integrada:** (1) Mapear requisitos NOM-024 vs. estado actual de GHE. (2) Identificar gaps. (3) Crear documentación faltante con experto. (4) Preparar paquete de certificación.

---

## SÍNTESIS GLOBAL

### Conclusión Superadora

**Plan de certificación NOM-024 en 3 fases:**

1. **Fase 1 (Semanas 1-2):** Mapeo de requisitos y gaps
2. **Fase 2 (Semanas 3-8):** Documentación y remediation
3. **Fase 3 (Semanas 9-12):** Envío y seguimiento ante DGIS

### Recomendaciones

| #   | Recomendación              | Plazo     | Prioridad |
|-----|----------------------------|-----------|-----------|
| 1   | Contratar consultant NOM-024 | 1 semana | Crítica |
| 2   | Mapear requisitos vs. gaps | 2 semanas | Alta |
| 3   | Solicitar subsidio gobierno | 1 mes | Alta |
| 4   | Crear documentación faltante | 2 meses | Alta |
| 5   | Enviar solicitud DGIS | 3 meses | Alta |
