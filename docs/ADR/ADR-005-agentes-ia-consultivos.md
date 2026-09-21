# ADR-005: Agentes de IA Exclusivamente Informativos y Consultivos

**Estado:** Aprobado (2026-09-21)
**Fecha:** 2026-09-21
**Decisor:** Director del hospital
**Revisado por:** Director médico, Director de TI, Asesor legal

---

## Contexto

Los agentes de IA en un hospital pueden causar daño si ejecutan acciones sin supervisión humana. La responsabilidad legal de las decisiones clínicas recae exclusivamente en profesionales humanos (médicos, enfermeras). Un error de la IA que modifique datos clínicos podría causar la muerte de un paciente y generar responsabilidad penal.

## Decisión

Los agentes de IA son **EXCLUSIVAMENTE informativos y consultivos**. Nunca ejecutan acciones que modifiquen el estado del sistema.

## Política aprobada

### Capacidades permitidas (lo que la IA PUEDE hacer):

| Capacidad | Descripción |
|---|---|
| Consultar información | Leer datos de agenda, inventario, horarios |
| Informar resultados | Mostrar resultados de laboratorio, interpretaciones |
| Mostrar disponibilidad | Estado de quirófanos, camas, personal |
| Generar gráficos/reportes | Visualización de datos, dashboards |
| Detectar conflictos | Identificar solapamientos, insumos faltantes |
| Proponer acciones | Sugerir horarios, recursos, alternativas |
| Explicar consecuencias | Mostrar impacto de cada opción |
| Señalar alertas | Notificar valores críticos |

### Capacidades prohibidas (lo que la IA NO PUEDE hacer):

| Capacidad | Riesgo |
|---|---|
| Crear/editar/eliminar datos | Corrupción de expedientes |
| Confirmar/cancelar cirugías | Pérdida de recursos quirúrgicos |
| Asignar recursos (quirófanos, personal) | Desorganización hospitalaria |
| Modificar expedientes clínicos | Errores que causan muerte |
| Autorizar compras/pagos | Fraude financiero |
| Cambiar protocolos | Incumplimiento normativo |
| Cambiar permisos/roles | Brechas de seguridad |
| Escribir datos persistentes | Corrupción de datos |

### Regla fundamental:

> **"Una propuesta de IA nunca constituye una decisión ejecutada."**

La aprobación humana debe ejecutarse **fuera del agente** y mediante el **flujo autorizado del sistema**.

## Consecuencias

### Positivas
- Seguridad: ningún dato clínico modificado por IA
- Responsabilidad clara: humano siempre decide
- Confiabilidad: sistema predecible y auditado
- Cumplimiento normativo: IA no reemplaza juicio clínico

### Negativas
- Menor automatización de tareas rutinarias
- Requiere más interacción humana
- Velocidad limitada por disponibilidad del personal

## Referencias
- ADR-006 (Agenda como Workflow Engine)
- Policy: IA como consultor exclusivo (templates/framework/)
- ISO 14971: Gestión de riesgos
