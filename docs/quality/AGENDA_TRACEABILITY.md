# Matriz de Trazabilidad - Features de Agenda

| Requisito | Feature | Regla | Escenario positivo | Escenario negativo | Invariante | Riesgo | Evidencia | Estado |
|---|---|---|---|---|---|---|---|---|
| REQ-AGENDA-001 | 01_workflow_engine | Cirugía requiere recursos | Confirmación con todos los recursos | Confirmación sin insumo/falta quirófano/sin permiso | INV-AGENDA-001 (sala duplicada) | s1 | EVID-AGENDA-001 a 019 | review |
| REQ-AGENDA-002 | 03_cascade | Cascada de tareas | Cirugía genera subtareas | Faltan insumos, cancelación | INV-AGENDA-007 (reversión) | s1 | EVID-AGENDA-030 a 043 | review |
| REQ-AGENDA-003 | 04_ai_agents | Límites de agente | Agente consulta/sugiere | Agente no ejecuta acciones críticas | INV-AGENDA-008/009 | s1 | EVID-AGENDA-050 a 064 | review |
| REQ-AGENDA-004 | 02_data_model | Estados e invariantes | Transiciones válidas | Transición prohibida | INV-AGENDA-004/005/006 | s2 | EVID-AGENDA-020 a 027 | review |
| REQ-AGENDA-005 | 05_rdd | REPL interactivo | Prueba en vivo exitosa | Dato falle en prueba | INV-AGENDA-010 | s2 | EVID-AGENDA-070 a 076 | review |
| REQ-AGENDA-006 | 06_ddd | Datos inmutables | Transformación preserva estado | Dato inválido rechazado | INV-AGENDA-011 | s2 | EVID-AGENDA-080 a 085 | review |
| REQ-AGENDA-007 | 07_cdd | Conversaciones registradas | Interacción registrada | Datos sensibles filtrados | — | s2 | EVID-AGENDA-090 a 095 | review |

### Invariantes

| ID | Descripción | Feature | Escenario de verificación |
|---|---|---|---|
| INV-AGENDA-001 | Una sala no puede tener dos procedimientos simultáneos | 01_workflow | Asignación incompatible rechazada |
| INV-AGENDA-002 | La agenda tiene una única versión de la verdad | 01_workflow | Múltiples áreas ven mismo estado |
| INV-AGENDA-003 | Ninguna modificación elimina el estado anterior | 01_workflow | Historial preservado |
| INV-AGENDA-004 | Una sala no puede tener dos procedimientos simultáneos | 02_data_model | Asignación incompatible rechazada |
| INV-AGENDA-005 | Un paciente no puede tener dos registros incompatibles | 02_data_model | Creación duplicada rechazada |
| INV-AGENDA-006 | Toda modificación preserva estado anterior | 02_data_model | Historial visible |
| INV-AGENDA-007 | Una reprogramación por emergencia siempre puede revertirse | 03_cascade | Restauración exitosa |
| INV-AGENDA-008 | El agente nunca modifica datos clínicos | 04_ai_agents | Notificación sin modificación |
| INV-AGENDA-009 | El agente nunca almacena CURP ni datos sensibles | 04_ai_agents | Pseudonimización verificada |
| INV-AGENDA-010 | Las pruebas en entorno vivo no afectan datos reales | 05_rdd | Aislamiento verificado |
| INV-AGENDA-011 | El estado anterior de la agenda nunca se pierde | 06_ddd | Estado preservado |

### Decisiones pendientes de validación clínica

| Decisión | Feature | Pregunta |
|---|---|---|
| Política de conflicto de agenda | 01_workflow | ¿Última escritura gana o requiere revisión humana para datos clínicos? |
| Límites de agente IA | 04_ai_agents | ¿Qué acciones puede ejecutar automáticamente sin aprobación? |
| Tiempo de respuesta de emergencia | 03_cascade | ¿Cuánto tiempo máximo antes de reorganizar agenda? |

### Decisiones pendientes de validación operativa

| Decisión | Feature | Pregunta |
|---|---|---|
| Protocolo de sync | 01_workflow, 02_data_model | ¿Cómo se resuelven conflictos entre dispositivos? |
| Horarios de sync | 02_data_model | ¿Cada cuánto se sincroniza? |
| Límites de cola de sync | 02_data_model | ¿Cuántas operaciones pendientes se toleran? |
