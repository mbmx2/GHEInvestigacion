# CASO-001: Expediente Electrónico vs. Físico en Contextos Rurales

---

## Ficha Técnica

| Campo                    | Valor                          |
|--------------------------|--------------------------------|
| ID del caso              | CASO-001                      |
| Fecha de análisis        | 2024-09-18                    |
| Complejidad              | Alta                          |
| Urgencia                 | Corto plazo                   |
| Stakeholders afectados   | Médicos, enfermeras, pacientes, COFEPRIS, administración |
| Restricciones            | Conectividad intermitente, personal con experiencia limitada en tecnología, normativa NOM-004/NOM-024 |

---

## Descripción del Caso

La Maternidad de Altotonga opera con expedientes físicos en papel. GHE propone migrar a expediente clínico electrónico (ECE) offline-first. El equipo médico muestra resistencia: "¿Qué pasa si se daña la computadora? ¿Dónde quedan los expedientes?" La administración pregunta: "¿Cumple la NOM-024? ¿COFEPRIS nos va a sancionar?" Los pacientes preguntan: "¿Mis datos están seguros?"

**Pregunta central:** ¿Es seguro, viable y beneficioso migrar de expediente físico a electrónico en un contexto rural con conectividad intermitente?

---

## RUTA 1: Análisis Jurídico

**Agente responsable:** AGENT-JUR-001

### Tesis

**El ECE offline-first es legalmente viable y cumple con la normativa mexicana vigente.**

- **Premisa 1:** La NOM-004-SSA3-2012 acepta expediente electrónico como válido, siempre que cumpla con los requisitos de integridad, confidencialidad, disponibilidad y trazabilidad.
- **Premisa 2:** La NOM-024-SSA3-2012 regula los Sistemas de Información de Registro Electrónico (SIRES) y establece requisitos técnicos que GHE puede cumplir: cifrado, auditoría, autenticación.
- **Premisa 3:** El decreto de enero 2026 hace obligatoria la digitalización del sector salud, lo que convierte a GHE de "opción" a "necesidad".
- **Conclusión:** GHE cumple los requisitos legales para operar como ECE. La migración es legalmente requerida, no opcional.

### Antítesis

**La migración sin preparación legal expone a la maternidad a sanciones.**

- **Objeción 1:** La NOM-024 requiere certificación ante DGIS. GHE aún no tiene certificación. Operar sin ella podría generar sanciones de COFEPRIS.
- **Objeción 2:** La LFPDPPP requiere consentimiento expreso del paciente para tratamiento de datos sensibles. ¿Se ha implementado un sistema de consentimiento digital válido?
- **Objeción 3:** El derecho de acceso, rectificación, cancelación y oposición (ARCO) debe ser funcional en el ECE. ¿GHE permite al paciente exportar o eliminar su expediente?
- **Contraconclusión:** Sin certificación NOM-024 y sin implementación completa de derechos ARCO, la migración tiene riesgos legales.

### Síntesis

**La migración es legalmente correcta pero requiere completar requisitos antes de operar.**

- **Puntos de convergencia:** Tanto tesis como antítesis coinciden en que la normativa exige ECE. La divergencia está en la preparación.
- **Posición integrada:** GHE debe completar: (1) certificación NOM-024, (2) implementación de consentimiento digital, (3) funcionalidad ARCO completa, antes de la migración total.
- **Acción recomendada:** Fase de piloto con expedientes paralelos (físico + electrónico) durante 3 meses, mientras se completa la certificación.

### Evidencia

| Fuente                     | Tipo           | Relevancia    |
|----------------------------|----------------|---------------|
| NOM-004-SSA3-2012          | Norma oficial  | Alta          |
| NOM-024-SSA3-2012          | Norma oficial  | Alta          |
| Decreto DOF 15 enero 2026  | Ley            | Alta          |
| LFPDPPP                    | Ley            | Alta          |
| DGIS certificados publicados | Registro oficial | Media      |

---

## RUTA 2: Análisis Económico

**Agente responsable:** AGENT-ECO-001

### Tesis

**La inversión en ECE se recovering en 18 meses y mejora la eficiencia operativa.**

- **Premisa 1:** El costo de papel, tóner, archivado y espacio físico para expedientes físicos es de aproximadamente $50,000 MXN/año.
- **Premisa 2:** El costo de implementación de GHE (hardware + capacitación) es de $80,000 MXN una vez.
- **Premisa 3:** La reducción de tiempo de búsqueda de expediente (de 5-10 min a <30 seg) genera ahorro de tiempo médico estimado en 200 horas/año.
- **Conclusión:** ROI positivo en 18 meses. Ahorro neto de $120,000 MXN en 3 años.

### Antítesis

**El costo oculto de capacitación y resistencia al cambio puede duplicar la inversión.**

- **Objeción 1:** El personal médico y administrativo necesita capacitación. Si 10 personas necesitan 40 horas cada una, eso es 400 horas × costo/hora = $200,000 MXN.
- **Objeción 2:** La resistencia al cambio genera pérdida de productividad durante la transición. Si la eficiencia cae 30% por 3 meses, el costo es significativo.
- **Objeción 3:** El hardware (computadora + UPS) puede fallar. Sin backup físico, la pérdida de datos es catastrófica.
- **Contraconclusión:** El ROI real puede ser de 36 meses, no 18, y el riesgo de falla de hardware requiere plan de contingencia.

### Síntesis

**La inversión es justificable pero requiere planificación de contingencias y capacitación realista.**

- **Puntos de convergencia:** Ambas posiciones coinciden en que hay beneficios económicos. La divergencia es en el timing y los costos ocultos.
- **Posición integrada:** (1) Presupuestar $200,000 MXN para implementación (incluyendo capacitación). (2) Plan de contingencia con backup físico periódico. (3) Piloto de 3 meses antes de migración completa.
- **Acción recomendada:** Análisis costo-beneficio detallado con datos reales de la maternidad.

### Evidencia

| Fuente                     | Tipo           | Relevancia    |
|----------------------------|----------------|---------------|
| Datos de gastos en papel (maternidad) | Dato interno | Alta |
| Costo de hardware local    | Cotización     | Alta          |
| Benchmark de ROI en EHR    | Estudios       | Media         |

---

## RUTA 3: Análisis Ético

**Agente responsable:** AGENT-ETI-001

### Tesis

**Migrar a ECE es éticamente Obligatorio porque mejora la continuidad y calidad del cuidado.**

- **Premisa 1:** El principio de beneficencia exige usar las mejores herramientas disponibles para cuidar a los pacientes.
- **Premisa 2:** El expediente físico se pierde, se daña, no es consultable remotamente. Esto pone en riesgo la continuidad del cuidado.
- **Premisa 3:** El ECE permite: (a) alertas de contraindicaciones, (b) seguimiento de crónicos, (c) referencia rápida, (d) backup automático.
- **Conclusión:** No usar ECE cuando es posible es una forma de negligencia tecnológica.

### Antítesis

**La migración forzada puede violar la autonomía del paciente y la autoeficacia del médico.**

- **Objeción 1:** El principio de autonomía exige que el paciente elija cómo se guarda su información. Si el paciente prefiere papel, ¿se le puede obligar a usar digital?
- **Objeción 2:** El principio de justicia exige que la tecnología no cree una brecha. Si los médicos no están capacitados, el sistema puede causar más daño que beneficio.
- **Objeción 3:** El principio de no maleficencia exige que no se implemente tecnología que pueda fallar en momentos críticos (emergencia obstétrica sin computadora).
- **Contraconclusión:** La migración debe ser gradual, voluntaria y con plan de contingencia físico.

### Síntesis

**La migración es éticamente correcta solo si se implementa con respeto a la autonomía y con garantías de seguridad.**

- **Puntos de convergencia:** Ambas posiciones valoran la seguridad del paciente. La divergencia es en el método.
- **Posición integrada:** (1) Consentimiento informado del paciente para ECE. (2) Capacitación antes de migración. (3) Plan de contingencia físico siempre disponible. (4) Derecho del paciente a solicitar copia física.
- **Acción recomendada:** Protocolo de consentimiento informado + plan de contingencia + capacitación.

### Evidencia

| Fuente                     | Tipo           | Relevancia    |
|----------------------------|----------------|---------------|
| Principios de bioética (Beauchamp & Childress) | Teoría | Alta |
| Código de ética médica (México) | Norma | Alta |
| Declaración de Helsinki | Norma internacional | Media |

---

## SÍNTESIS GLOBAL

### Convergencias entre rutas

| Ruta Jurídica           | Ruta Económica          | Ruta Ética              | Convergencia            |
|-------------------------|-------------------------|-------------------------|-------------------------|
| Legalmente requerido    | Económicamente viable   | Éticamente correcto     | **Migrar es correcto**  |
| Necesita certificación  | Necesita planificación  | Necesita gradualidad    | **Preparación antes de migrar** |

### Divergencias

| Ruta Jurídica           | Ruta Económica          | Ruta Ética              | Naturaleza              |
|-------------------------|-------------------------|-------------------------|-------------------------|
| Certificación como requisito | ROI como justificación | Autonomía como límite   | **Timing y método**     |

### Conclusión Superadora

**GHE debe implementar el ECE en Altotonga siguiendo un modelo de transición de 3 fases:**

1. **Fase 1 (Meses 1-3):** Piloto paralelo. Expediente físico + electrónico. Certificación NOM-024 en proceso. Consentimiento informado.
2. **Fase 2 (Meses 4-6):** Migración gradual. Capacitación completa. Backup automático. Plan de contingencia físico.
3. **Fase 3 (Mes 7+):** Operación completa. Auditoría de calidad. Mejora continua.

### Recomendaciones Accionables

| #   | Recomendación              | Responsable  | Plazo     | Prioridad |
|-----|----------------------------|--------------|-----------|-----------|
| 1   | Iniciar proceso de certificación NOM-024 | Director | Inmediato | Crítica |
| 2   | Diseñar protocolo de consentimiento informado para ECE | Jurídico | 2 semanas | Alta |
| 3   | Capacitar al equipo en uso de GHE | Capacitación | 1 mes | Alta |
| 4   | Implementar backup físico diario | TI | 1 semana | Alta |
| 5   | Ejecutar piloto de 3 meses con expedientes paralelos | Médico director | 3 meses | Alta |
| 6   | Evaluar resultados del piloto con métricas | Calidad | 3 meses | Media |

### Riesgos de la Síntesis

| Riesgo                     | Probabilidad | Impacto | Mitigación |
|----------------------------|--------------|---------|------------|
| Falla de hardware durante emergencia | Baja | Crítico | UPS + backup físico |
| Rechazo del equipo médico | Media | Alto | Capacitación + champion interno |
| Sanción de COFEPRIS | Baja | Alto | Certificación NOM-024 |

### Métricas de Éxito

| Métrica                    | Objetivo             | Método de medición |
|----------------------------|----------------------|-------------------|
| Tiempo de búsqueda de expediente | <30 seg         | Timestamps del sistema |
| Completitud de expedientes | >95%                 | Auditoría mensual |
| Satisfacción del equipo    | >80%                 | Encuesta trimestral |
| Incidentes de seguridad    | 0                    | Registro de incidentes |
