# Template: Tarea del Framework

> *Este template se usa para recibir y estructurar cada tarea.*

---

## CONTEXTO

| Campo | Valor |
|---|---|
| Proyecto | GHE - Sistema de Gestión Hospitalaria Electrónica |
| Módulo | [Nombre del módulo afectado] |
| Archivos afectados | [Lista de archivos] |
| Estado actual | [Qué existe hoy] |
| Problema observado | [Qué está mal o qué falta] |

---

## OBJETIVO DE VALOR

El cambio debe:
- **Resolver:** [Problema específico]
- **Beneficiar a:** [Quién se beneficia]
- **Evitar:** [Qué se previene]
- **Mantener compatible:** [Qué no debe romperse]

---

## ALCANCE PMBOK

| Campo | Valor |
|---|---|
| Interesados | [Quiénes están involucrados] |
| Entregable esperado | [Qué se entrega] |
| Riesgos conocidos | [Qué puede salir mal] |
| Supuestos | [Qué damos por hecho] |
| Restricciones | [Qué limita el alcance] |
| Dependencias | [De qué depende] |
| Criterios de aceptación | [Cómo se verifica que está bien] |
| Criterios de exclusión | [Qué NO se incluye] |

---

## BASE SWEBOK

**Área de conocimiento principal:** [Área SWEBOK más relevante]

### Prácticas exigidas:

| Práctica | Aplicación en esta tarea |
|---|---|
| Identificar entradas y salidas | [Qué entra, qué sale] |
| Mantener trazabilidad | [De dónde viene cada decisión] |
| Definir verificación | [Cómo se comprueba que funciona] |
| Definir validación | [Cómo se comprueba que es lo correcto] |
| Registrar decisiones | [Qué se decidió y por qué] |
| Controlar cambios | [Cómo se gestiona el cambio] |
| Medir el resultado | [Qué métricas confirman éxito] |

---

## BASE SOLID

### Principios afectados:

| Principio | Pregunta | Estado |
|---|---|---|
| SRP | ¿Cada componente tiene una responsabilidad? | [Sí/No/Pendiente] |
| OCP | ¿Se puede extender sin modificar? | [Sí/No/Pendiente] |
| LSP | ¿Los subtipos son sustituibles? | [Sí/No/Pendiente] |
| ISP | ¿Las interfaces son específicas? | [Sí/No/Pendiente] |
| DIP | ¿Depende de abstracciones? | [Sí/No/Pendiente] |

### Antipatrones que deben evitarse:

- [ ] Función con demasiadas responsabilidades
- [ ] Acoplamiento directo a infraestructura
- [ ] Duplicación de reglas
- [ ] Condicionales que crecen sin control
- [ ] Dependencias difíciles de sustituir en tests
- [ ] Interfaces innecesariamente grandes

---

## IMPLEMENTACIÓN ESPERADA

El agente debe:
1. [ ] Inspeccionar el código cercano
2. [ ] Formular una hipótesis verificable
3. [ ] Identificar la causa raíz
4. [ ] Proponer el cambio mínimo
5. [ ] Implementar respetando la arquitectura
6. [ ] Añadir o actualizar pruebas
7. [ ] Ejecutar validaciones focalizadas
8. [ ] Documentar decisiones y riesgos

---

## EVIDENCIA OBLIGATORIA

Debe entregar:
- [ ] Archivos modificados
- [ ] Problema raíz
- [ ] Relación PMBOK
- [ ] Relación SWEBOK
- [ ] Relación SOLID
- [ ] Tests ejecutados
- [ ] Resultado de los tests
- [ ] Riesgos residuales
- [ ] Trabajo pendiente
