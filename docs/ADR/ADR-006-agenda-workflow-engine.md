# ADR-006: Agenda Digital como Motor de Workflows

**Estado:** Aceptado
**Fecha:** 2026-09-21
**Decisor:** Director del hospital
**Revisado por:** Director médico, Director administrativo

---

## Contexto

Un hospital tiene cientos de eventos diarios (consultas, cirugías, laboratorios, procedimientos) que desencadenan tareas administrativas (facturación, inventario, personal, limpieza). Un calendario simple no conecta las áreas. La agenda debe ser el motor central que conecte clínica con administración.

## Decisión

La agenda digital es el motor central de workflows del hospital. Cada evento médico detona automáticamente una cascada de tareas administrativas.

## Mecanismo

Cada evento en la agenda es un estado que se transforma. El cambio de estado dispara subtareas:

| Evento médico | Cascada administrativa |
|---|---|
| Cirugía programada | Verificar insumos, preautorización, quirófano, personal, limpieza |
| Consulta completada | Seguimiento, estudios, recordatorios, facturación |
| Laboratorio listo | Notificar médico, alertar si crítico, vincular a expediente |
| Emergencia | Reorganizar agenda, priorizar recursos, notificar pacientes |
| Alta de paciente | Control posplan, seguimiento, facturación final |

### Áreas conectadas por la agenda:

| Área | Qué consulta la agenda | Qué genera |
|---|---|---|
| Clínica | Citas del médico | Consultas, referencias |
| Farmacia | Medicamentos programados | Dispensación, inventario |
| Cirugía | Quirófanos disponibles | Procedimientos |
| Laboratorio | Estudios pendientes | Resultados |
| Imagenología | Estudios de imagen | Reportes |
| Facturación | Procedimientos realizados | Cargos |
| RRHH | Horarios del personal | Asignaciones |
| Limpieza | Habitaciones/quirófanos | Limpiezas |
| Administración | Dashboard de indicadores | Decisiones |

## Consecuencias

### Positivas
- Ningún paso se olvida en la atención al paciente
- Conexión clínica-administrativa automática
- Visibilidad total del hospital en tiempo real
- Reducción de errores por olvido

### Negativas
- Complejidad de diseño del motor de workflows
- Dependencia de la agenda para toda la operación
- Si la agenda falla, todas las áreas se afectan
- Requiere que todas las áreas registren eventos en la agenda

## Alternativas descartadas

| Alternativa | Por qué se descartó |
|---|---|
| Calendario simple | No conecta áreas ni genera tareas |
| BPMN separado | Complejidad innecesaria, duplicación |
| Microservicios de workflows | Complejidad desproporcionada |

## Referencias
- templates/gherkin/agenda/ (7 features)
- docs/AGENTIC_WORKFLOWS.md
