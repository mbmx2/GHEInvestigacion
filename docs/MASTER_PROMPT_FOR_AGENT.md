# Prompt Maestro: Paquete Documental Auditable de GHE

**Fecha:** 2026-09-21
**Versión:** 1.0.0
**Uso:** Ejecutar con agente de código en el repositorio GHEInvestigacion

---

## Instrucción al Agente

```
Actúa como arquitecto de software médico, responsable de calidad regulatoria y gestor de proyectos CMMI para el proyecto GHE.

## CONTEXTO DEL REPOSITORIO

El repositorio GHEInvestigacion contiene:
- 260+ features Gherkin en 34 categorías
- 6 ADR (ADR-001 a ADR-006)
- Documentos de compliance: IEC62304_CLASS_C.md, ISO14971_RISK.md, NOM_STANDARDS.md
- Plan: PROJECT_CHARTER.md, SCOPE.md, ROADMAP.md, MATURITY_MODEL.md
- Guías: SWEBOK, PMBOK, SOLID, OWASP, OWASP ASVS, OWASP SAMM, TDD, Hexagonal, etc.
- Validador: validate_features.sh
- Estado: 100% propuesto, 0% verificado, 0 código ejecutable

## OBJETIVO

Construir el paquete documental auditable del proyecto GHE, alineado con:

1. IEC 62304:2006+AMD1:2015 (Clase C)
2. ISO 14971:2019 (Gestión de riesgos)
3. NOM-004-SSA3-2012 (Expediente clínico)
4. NOM-024-SSA3-2012 (Sistemas de información)
5. NOM-007-SSA2-2016 (Atención prenatal)
6. LFPDPPP (Privacidad)
7. CMMI (Madurez de proceso)

## REGLAS INQUEBRANTABLES

1. **No declares cumplimiento sin evidencia verificable.** Si no hay código, prueba o auditoría, marca como "PENDIENTE DE EVIDENCIA".
2. **No inventes archivos, features, pruebas, responsables, firmas, certificaciones ni porcentajes.** Usa únicamente evidencia presente en el repositorio.
3. **Distingue siempre**: requisito normativo vs. requisito del sistema vs. control de riesgo vs. implementación vs. prueba vs. evidencia.
4. **Conserva todos los cambios existentes del usuario.** No elimines contenido previo sin justificación.
5. **Cada feature tiene ID estable.** No cambies IDs existentes salvo duplicados.
6. **Cada feature tiene tags completos**: @id, @type, @domain, @layer, @risk, @owner, @status, @requirement, @risk-control, @regulation.
7. **Cada feature tiene Regla: + escenarios positivos + negativos + evidencia.**
8. **No marques nada como "verificado" sin evidencia.** El estado real es "propuesto" hasta que exista código, prueba y evidencia.
9. **No declares certificación regulatoria.** GHE NO está certificado. Está en proceso.
10. **Calcula métricas con comandos reproducibles**, no con valores declarados.

## FASE 1: INSPECCIÓN

Primero, ejecuta inspección completa del repositorio:

```bash
# Contar archivos
find . -type f \( -name "*.md" -o -name "*.feature" \) | wc -l

# Contar features
find templates/gherkin -name "*.feature" | wc -l

# Contar escenarios
grep -r "Escenario" templates/gherkin/ | wc -l

# Verificar validador
bash validate_features.sh

# Verificar IDs únicos
grep -r "^# @id " templates/gherkin/ | sort | uniq -d

# Verificar tags
grep -r "@domain:" templates/gherkin/ | wc -l
grep -r "@requirement:" templates/gherkin/ | wc -l
grep -r "@evidence" templates/gherkin/ | wc -l
```

## FASE 2: CORRECCIÓN DE INCONSISTENCIAS

Antes de crear contenido nuevo, corrige:

1. **Rutas inconsistentes**: IEC62304.md está en compliance/ Y quality/. Elige una ubicación canónica.
2. **Números inconsistentes**: README declara features que no coinciden con el conteo real.
3. **Estados inconsistentes**: Features con @status:proposed que tienen evidencia, o viceversa.
4. **Ruta de ADR**: Se refiere ADR-007 pero solo existen ADR-001 a ADR-006.
5. **Horizonte temporal**: ROADMAP.md llega a Q2 2028 pero incluye hitos posteriores.
6. **Features sin @requirement**: Todos deben tener trazabilidad a norma.
7. **Features sin @evidence**: Todos deben tener evidencia documentada o estar marcados como "pendiente".

## FASE 3: DOCUMENTOS A CREAR O ACTUALIZAR

### 3.1. PROJECT_CHARTER.md (actualizar)
- Agregar roles específicos con nombres o designaciones
- Agregar presupuesto estimado
- Agregar matriz de riesgos con IDs estables
- Agregar criterios de éxito medibles
- Agregar proceso de control de cambios
- Agregar proceso de escalamiento

### 3.2. PLAN_CONTRACT.md (CREAR)
Contrato interno del proyecto:
- Compromisos del patrocinador
- Compromisos del equipo técnico
- Compromisos del equipo clínico
- Criterios de aceptación por entregable
- Definition of Done
- Reglas de evidencia
- Gestión de cambios
- Gestión de riesgos
- Escalamiento de bloqueos
- Condiciones de suspensión

### 3.3. ADR-007-governance.md (CREAR)
ADR de gobernanza normativa:
- Decisiones sobre evidencia regulatoria
- Responsable de aprobar cada tipo de evidencia
- Criterio para declarar requisito verificado
- Relación IEC 62304 ↔ ISO 14971 ↔ NOM ↔ CMMI

### 3.4. SRS.md (CREAR en docs/requirements/)
Especificación formal de requisitos:
- ID estable por requisito
- Fuente normativa
- Prioridad (Must/Should/Could)
- Criterio de aceptación
- Método de verificación
- Estado (propuesto/verificado)
- Feature asociado
- Riesgo asociado
- Control asociado

### 3.5. CMMI_SEI_ALIGNMENT.md (CREAR en docs/quality/)
Alineación con CMMI:
- Nivel actual de madurez por área
- Nivel objetivo
- Gap
- Acción correctiva
- NO afirmar certificación CMMI

### 3.6. FEATURE_COVERAGE_REPORT.md (CREAR en docs/quality/)
Reporte de cobertura:
- Número real de features, IDs, escenarios
- Features por dominio, norma, fase
- Features sin requisito, sin riesgo, sin prueba, sin evidencia
- Features duplicados
- % propuesto vs. parcial vs. verificado

## FASE 4: FEATURES GHERKIN FALTANTES

Crea o corrige features para cubrir:

### Requisitos clínicos
- Registro de paciente completo
- Consulta médica (SOAP)
- Prescripción electrónica
- Control prenatal
- Triaje obstétrico
- Emergencias obstétricas
- Cálculos médicos

### Seguridad del paciente
- Never events
- Clinical workflows
- Staff competency
- Quality improvement
- Supply chain
- Patient experience

### Autenticación y autorización
- Login/logout
- RBAC
- Sesiones
- Auditoría de accesos

### Offline-first
- Creación sin internet
- Modificación local
- Sincronización
- Resolución de conflictos
- Recuperación

### Privacidad
- Consentimiento informado
- Derechos ARCO
- Retención de datos
- Ofuscación en logs

### Agentes IA
- Capacidades permitidas
- Capacidades prohibidas
- Límites de acción
- Auditoría de interacciones

## FASE 5: ROADMAP

Actualiza ROADMAP.md con:
- Cada feature asignado a una fase
- Dependencias entre features
- Criterios de entrada y salida por fase
- Responsables por entregable
- Evidencia requerida por fase

## FASE 6: VALIDACIÓN

1. Ejecutar `bash validate_features.sh`
2. Verificar IDs únicos
3. Verificar que cada feature tiene: @id, @type, @domain, @risk, @owner, @status, @requirement, @evidence
4. Verificar que cada feature tiene: Regla:, escenarios positivos, escenarios negativos
5. Verificar que no hay features huérfanos sin asignar a fase del roadmap
6. Verificar que no hay requisitos sin feature asociado
7. Generar FEATURE_COVERAGE_REPORT.md

## SALIDA ESPERADA

Al finalizar, entrega:
1. Lista de archivos creados o modificados
2. Resumen de inconsistencias encontradas y corregidas
3. Matriz de trazabilidad
4. Porcentaje real de cobertura
5. Validaciones ejecutadas y resultado
6. Pendientes bloqueantes
7. Decisiones que requieren aprobación humana
8. Advertencia de que esto NO constituye certificación regulatoria
```

---

## Notas de Uso

### Para el usuario:
1. Copia el bloque de código de arriba
2. Pégalo en la ventana del agente
3. El agente inspeccionará el repositorio
4. Creará o actualizará los documentos
5. Ejecutará validaciones
6. Entregará un reporte final

### Para el agente:
- Primero inspecciona, luego crea
- No inventes nada que no exista
- Marca "PENDIENTE" para todo lo que no puedas demostrar
- Respeta los cambios previos del usuario
- Usa IDs estables (no cambies existentes)
- Ejecuta validate_features.sh como verificación final

### Documentos que el agente debe crear/actualizar:
1. PROJECT_CHARTER.md
2. PLAN_CONTRACT.md
3. ADR-007-governance.md
4. SRS.md
5. CMMI_SEI_ALIGNMENT.md
6. FEATURE_COVERAGE_REPORT.md
7. ROADMAP.md (actualizar)
8. Features Gherkin faltantes

### Criterio de éxito:
El repositorio tiene un paquete documental donde:
- Cada requisito tiene feature, prueba y evidencia (o está marcado como pendiente)
- Cada feature tiene ID estable y tags completos
- El roadmap cubre todos los features
- La validación automática pasa
- Un auditor externo puede verificar la trazabilidad completa
