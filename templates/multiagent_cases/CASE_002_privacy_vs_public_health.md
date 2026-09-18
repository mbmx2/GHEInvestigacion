# CASO-002: Privacidad de Datos vs. Necesidades de Salud Pública

---

## Ficha Técnica

| Campo                    | Valor                          |
|--------------------------|--------------------------------|
| ID del caso              | CASO-002                      |
| Fecha de análisis        | 2024-09-18                    |
| Complejidad              | Crítica                        |
| Urgencia                 | Inmediata                      |
| Stakeholders afectados   | Pacientes, médicos, COFEPRIS, Secretaría de Salud, investigadores |
| Restricciones            | LFPDPPP, NOM-004, NOM-024, Decreto 2026 |

---

## Descripción del Caso

La Secretaría de Salud solicita datos agregados de las pacientes atendidas en la maternidad para: (1) reporte epidemiológico SUIVE, (2) investigación sobre mortalidad materna en zonas rurales, (3) planificación de recursos. GHE tiene datos detallados: diagnósticos, tratamientos, resultados, datos demográficos. **¿Cuántos datos compartir, con quién, y bajo qué condiciones?**

---

## RUTA 1: Análisis Jurídico

**Agente responsable:** AGENT-JUR-002

### Tesis

**La sharing de datos agregados es obligatoria por ley y no viola la LFPDPPP.**

- **Premisa 1:** La Ley General de Salud obliga a los establecimientos a reportar datos epidemiológicos (art. 225).
- **Premisa 2:** La LFPDPPP permite el tratamiento de datos sensibles sin consentimiento cuando es necesario para la salubridad pública (art. 10, fracción VI).
- **Premisa 3:** El SUIVE es un sistema de notificación obligatoria de enfermedades.
- **Conclusión:** Los datos agregados para reportes epidemiológicos son obligatorios y legalmente permitidos sin consentimiento individual.

### Antítesis

**La sharing excesiva viola la LFPDPPP y el principio de minimización.**

- **Objeción 1:** La LFPDPPP establece el principio de minimización: solo datos necesarios para el propósito específico. ¿Se están compartiendo más datos de los necesarios?
- **Objeción 2:** El consentimiento informado es el estándar dorado. Aunque la ley exenta para salubridad, éticamente debería informarse al paciente.
- **Objeción 3:** Los datos anonimizados pueden ser re-anonimizados con técnicas de linkage. La anonimización no es garantía de privacidad.
- **Contraconclusión:** La sharing debe ser mínima, con anonimización robusta y notificación a pacientes.

### Síntesis

**Compartir datos agregados y anonimizados es correcto, pero con garantías.**

- **Posición integrada:** (1) Datos agregados (sin identificadores) son obligatorios. (2) Datos individuales solo con consentimiento o orden judicial. (3) Anonimización con k-anonymity ≥5. (4) Notificación a pacientes sobre uso de datos.
- **Acción recomendada:** Política de sharing de datos + anonimización + notificación.

### Evidencia

| Fuente                     | Tipo           | Relevancia    |
|----------------------------|----------------|---------------|
| Ley General de Salud art. 225 | Ley | Alta |
| LFPDPPP art. 10 fracc. VI | Ley | Alta |
| NOM-004-SSA3-2012 | Norma | Alta |
| Guías de anonimización (ARCA) | Best practice | Media |

---

## RUTA 2: Análisis Ético

**Agente responsable:** AGENT-ETI-002

### Tesis

**Compartir datos para salud pública es un imperativo ético de justicia social.**

- **Premisa 1:** El principio de justicia requiere que los datos de poblaciones vulnerables se usen para mejorar las condiciones de salud de esas mismas poblaciones.
- **Premisa 2:** La mortalidad materna en zonas rurales es un problema de salud pública que requiere datos para diseñar intervenciones efectivas.
- **Premisa 3:** Los datos anonimizados no causan daño individual pero generan beneficio colectivo.
- **Conclusión:** No compartir datos cuando puede salvar vidas es éticamente cuestionable.

### Antítesis

**Los pacientes vulnerables merecen protección especial, no explotación de sus datos.**

- **Objeción 1:** Las pacientes de Altotonga son población vulnerable. Usar sus datos sin consentimiento explícito es una forma de explotación, incluso si es para "su beneficio".
- **Objeción 2:** El poder asimétrico médico-paciente puede viciar el consentimiento. Si el médico pide "firme aquí para sus datos", ¿es realmente voluntario?
- **Objeción 3:** La historia de investigación médica está llena de abusos contra poblaciones vulnerables (Tuskegee, etc.).
- **Contraconclusión:** El consentimiento informado debe ser real, no formal. Los datos solo deben compartirse con garantías de que no habrá daño.

### Síntesis

**El beneficio colectivo justifica la sharing, pero solo con consentimiento informado real y garantías de anonimización.**

- **Posición integrada:** (1) Consentimiento informado específico para cada uso de datos. (2) Comité de ética que revise cada solicitud. (3) Anonimización robusta. (4) Devolución de beneficios a la comunidad.
- **Acción recomendada:** Comité de ética + consentimiento informado + anonimización + devolución.

### Evidencia

| Fuente                     | Tipo           | Relevancia    |
|----------------------------|----------------|---------------|
| Principios de bioética (Belmont Report) | Teoría | Alta |
| Declaración de Helsinki | Norma | Alta |
| Caso Tuskegee | Precedente | Alta |
| Guías CIOMS investigación vulnerable | Norma | Media |

---

## RUTA 3: Análisis Sociológico

**Agente responsable:** AGENT-SOC-002

### Tesis

**Los datos son una herramienta para reducir la brecha de salud entre zonas urbanas y rurales.**

- **Premisa 1:** Las zonas rurales tienen datos limitados sobre salud materna. Sin datos, no hay evidencia para mejorar servicios.
- **Premisa 2:** La sharing de datos con investigadores puede generar estudios que mejoren la atención en Altotonga y comunidades similares.
- **Premisa 3:** La exclusión de datos rurales de la investigación perpetúa la inequidad.
- **Conclusión:** No compartir datos es una forma de invisibilizar a las poblaciones rurales.

### Antítesis

**La sharing de datos puede generar extractivismo de datos (data colonialism).**

- **Objeción 1:** Los investigadores de universidades urbanas pueden usar datos de Altotonga para publicar papers sin beneficio para la comunidad.
- **Objeción 2:** La comunidad no fue consultada sobre el uso de sus datos. Esto viola el principio de participación.
- **Objeción 3:** Los datos pueden ser usados para justificar recortes presupuestarios ("ya tienen suficiente data, no necesitan más recursos").
- **Contraconclusión:** La sharing debe ser participativa, con beneficios directos para la comunidad.

### Síntesis

**Los datos deben compartirse pero con participación comunitaria y devolución de beneficios.**

- **Posición integrada:** (1) Comité comunitario que apruebe sharing. (2) Devolución de resultados a la comunidad. (3) Publicación con autoría incluyendo a personal local. (4) Uso de datos para mejorar servicios en Altotonga primero.
- **Acción recomendada:** Comité comunitario + convenio de sharing + devolución.

### Evidencia

| Fuente                     | Tipo           | Relevancia    |
|----------------------------|----------------|---------------|
| Principios FAIR data | Best practice | Alta |
| Data colonialism literature | Académico | Media |
| Comunidad Local de Salud (CLS) | Modelo | Media |

---

## SÍNTESIS GLOBAL

### Conclusión Superadora

**La sharing de datos debe implementarse bajo un modelo de "Data Governance Comunitario" que integre:**

1. **Capa jurídica:** Cumplimiento de LFPDPPP, consentimiento informado, anonimización k≥5
2. **Capa ética:** Comité de ética que revise cada solicitud, devolución de beneficios
3. **Capa sociológica:** Comité comunitario, participación en diseño de estudios, autoría inclusiva

### Modelo de Data Governance

```
┌─────────────────────────────────────────────────┐
│           DATA GOVERNANCE COMUNITARIO            │
├─────────────────────────────────────────────────┤
│                                                  │
│  Solicitante → Comité de Ética → Aprobación?    │
│       ↓              ↓                ↓          │
│  Propósito      Anonimización    Consentimiento  │
│  específico     k≥5              informado       │
│       ↓              ↓                ↓          │
│  Sharing → Devolución de resultados             │
│            a la comunidad                       │
│                                                  │
└─────────────────────────────────────────────────┘
```

### Recomendaciones Accionables

| #   | Recomendación              | Responsable  | Plazo     | Prioridad |
|-----|----------------------------|--------------|-----------|-----------|
| 1   | Crear Comité de Ética de Datos | Director | 2 semanas | Crítica |
| 2   | Diseñar formulario de consentimiento informado para sharing | Jurídico | 2 semanas | Crítica |
| 3   | Implementar anonimización k≥5 en módulo de reportes | Técnico | 1 mes | Alta |
| 4   | Crear Comité Comunitario | Sociólogo | 2 meses | Alta |
| 5   | Establecer convenio de sharing con Secretaría de Salud | Jurídico | 1 mes | Media |
