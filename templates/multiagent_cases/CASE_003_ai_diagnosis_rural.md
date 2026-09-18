# CASO-003: IA para Diagnóstico en Zonas sin Especialistas

---

## Ficha Técnica

| Campo                    | Valor                          |
|--------------------------|--------------------------------|
| ID del caso              | CASO-003                      |
| Fecha de análisis        | 2024-09-18                    |
| Complejidad              | Crítica                        |
| Urgencia                 | Largo plazo                   |
| Stakeholders afectados   | Pacientes, médicos, desarrolladores, reguladores |
| Restricciones            | IEC 62304, NOM-024, conectividad, validación clínica |

---

## Descripción del Caso

GHE podría implementar un módulo de IA para: (1) sugerir diagnósticos diferenciales, (2) detectar patrones de riesgo, (3) recomendar tratamiento. Esto sería especialmente valioso en Altotonga donde no hay especialistas. **¿Es seguro, ético y regulatoriamente viable implementar IA diagnóstica en un contexto rural sin supervisión especialista inmediata?**

---

## RUTA 1: Análisis Técnico

**Agente responsable:** AGENT-TEC-003

### Tesis

**IA diagnóstica es técnicamente viable con modelos entrenados en datos de bajo recurso.**

- **Premisa 1:** Modelos como临床决策支持系统 (CDSS) ya funcionan en contextos similares (India, África).
- **Premisa 2:** GHE tiene 5,573 tests automatizados que pueden validar la IA.
- **Premisa 3:** La IA puede funcionar offline con modelos optimizados (ONNX, TensorFlow Lite).
- **Conclusión:** La implementación técnica es viable con las herramientas adecuadas.

### Antítesis

**La IA diagnóstica sin validación clínica rigurosa es peligrosa.**

- **Objeción 1:** Los modelos de IA tienen sesgos. Si se entrenan con datos urbanos, pueden fallar en poblaciones rurales (diferencias genéticas, ambientales, culturales).
- **Objeción 2:** La IEC 62304 requiere validación clínica para software médico Clase C. Un sistema de IA diagnóstica es Clase C.
- **Objeción 3:** Sin conectividad, la IA no puede actualizarse con nueva evidencia.
- **Contraconclusión:** La IA solo es segura si se valida específicamente para la población de Altotonga y se mantiene actualizada.

### Síntesis

**La IA es viable solo como herramienta de apoyo (no reemplazo) con validación local y actualización periódica.**

- **Posición integrada:** (1) IA como sugerencia, no decisión. (2) Validación con datos de Altotonga. (3) Actualización semestral. (4) Siempre supervisión médica humana.
- **Acción recomendada:** Piloto de IA como "second opinion" con validación clínica.

---

## RUTA 2: Análisis Ético

**Agente responsable:** AGENT-ETI-003

### Tesis

**La IA diagnóstica es éticamente necesaria para reducir la brecha de acceso a especialistas.**

- **Premisa 1:** El principio de justicia exige que las poblaciones rurales tengan acceso a la misma calidad de diagnóstico que las urbanas.
- **Premisa 2:** La IA puede ser "especialista disponible 24/7" donde no hay especialistas humanos.
- **Premisa 3:** El principio de beneficencia permite usar tecnología que mejore el diagnóstico.
- **Conclusión:** No usar IA disponible es éticamente cuestionable cuando hay vidas en juego.

### Antítesis

**Usar IA no validada en poblaciones vulnerables es una forma de experimentación no consentida.**

- **Objeción 1:** Las pacientes no son conscientes de que una IA está sugiriendo diagnósticos. Esto viola el derecho a la información.
- **Objeción 2:** Si la IA falla y causa daño, ¿quién es responsable? ¿El médico? ¿El desarrollador? ¿El sistema?
- **Objeción 3:** La IA puede crear una falsa sensación de seguridad en el médico ("la IA no lo detectó, entonces no hay problema").
- **Contraconclusión:** La IA solo es ética si hay consentimiento informado, responsabilidad clara y supervisión humana garantizada.

### Síntesis

**La IA es ética solo con transparencia, consentimiento y supervisión humana.**

- **Posición integrada:** (1) Informar al paciente que la IA asiste al médico. (2) Responsabilidad final siempre del médico. (3) Supervisión humana de cada sugerencia de IA. (4) Auditoría de errores de IA.

---

## RUTA 3: Análisis Clínico

**Agente responsable:** AGENT-CLI-003

### Tesis

**La IA puede mejorar significativamente el diagnóstico en medicina general rural.**

- **Premisa 1:** En medicina general, la IA puede ayudar con: diagnósticos diferenciales, alertas de medicamentos, recordatorios de筛查.
- **Premisa 2:** La evidencia muestra que la IA mejora la precisión diagnóstica en 10-15% en contextos de bajo recurso.
- **Premisa 3:** En obstetricia, la IA puede detectar patrones de riesgo que el médico puede pasar por alto.
- **Conclusión:** La IA como herramienta de apoyo mejora la calidad diagnóstica.

### Antítesis

**La IA no reemplaza la clínica y puede generar sobre-diagnóstico.**

- **Objeción 1:** La IA no tiene capacidad de examen físico. Un diagnóstico sin examen es incompleto.
- **Objeción 2:** La IA puede generar sobre-diagnóstico (falsos positivos), lo que leads a sobre-tratamiento.
- **Objeción 3:** La relación médico-paciente se deteriora si el médico depende de la IA en vez de su juicio clínico.
- **Contraconclusión:** La IA es útil pero debe ser complemento, nunca sustituto del juicio clínico.

### Síntesis

**La IA es un potenciador del juicio clínico, no un reemplazo.**

- **Posición integrada:** (1) IA como segunda opinión, no primera. (2) Siempre decisión humana final. (3) Auditoría de sugerencias de IA vs. decisiones humanas. (4) Capacitación en uso crítico de IA.

---

## SÍNTESIS GLOBAL

### Conclusión Superadora

**GHE debe implementar IA diagnóstica siguiendo un modelo de "IA de Apoyo" (AI-assisted, no AI-driven):**

1. **Transparencia:** El paciente sabe que la IA asiste
2. **Supervisión:** El médico decide, la IA sugiere
3. **Validación:** Datos locales de Altotonga
4. **Responsabilidad:** El médico es responsable final
5. **Actualización:** Modelos actualizados semestralmente
6. **Auditoría:** Tracking de aciertos/errores de IA

### Recomendaciones

| #   | Recomendación              | Plazo     | Prioridad |
|-----|----------------------------|-----------|-----------|
| 1   | Recopilar dataset local de Altotonga | 6 meses | Crítica |
| 2   | Entrenar modelo con datos locales | 6 meses | Alta |
| 3   | Validar con specialists externos | 3 meses | Alta |
| 4   | Implementar como "second opinion" | Inmediato | Media |
| 5   | Auditoría mensual de accuracy | Continua | Alta |
