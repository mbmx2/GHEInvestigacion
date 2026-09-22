# Contributing a GHEInvestigacion

Gracias por tu interés en contribuir al proyecto GHE. Este repositorio es una **especificación** (no una implementación funcional) del Sistema de Gestión Hospitalaria Electrónica para la Maternidad de Altotonga, Veracruz.

---

## Propósito del Repositorio

GHEInvestigacion contiene:
- **334 feature files Gherkin** con 2,157 escenarios
- **49 categorías de dominio** con 2+ features cada una
- Documentación de arquitectura, compliance, calidad y estrategia

El objetivo es servir como **base de especificación** para el desarrollo de GHE-v1. No contiene código de aplicación funcional.

---

## Tipos de Contribución

### 1. Nuevos escenarios Gherkin
- Agregar escenarios a categorías existentes
- Crear nuevas categorías de dominio
- Mejorar cobertura de edge cases y escenarios negativos

### 2. Documentación
- Corregir typos y errores
- Mejorar explicaciones existentes
- Agregar evidencia de cumplimiento normativo

### 3. Hardening
- Identificar gaps de cobertura
- Agregar invariantes de seguridad
- Documentar escenarios de falla

### 4. Investigación
- Analizar casos de uso clínicos
- Proponer mejoras arquitectónicas
- Documentar mejores prácticas

---

## Qué NO se debe hacer

- **No escribir código Clojure** o cualquier lógica de implementación
- **No crear tests funcionales** (este repositorio es especificación)
- **No modificar la arquitectura** del sistema sin discusión previa
- **No agregar features sin escenarios** que los documenten

---

## Estructura de un Feature File

```gherkin
# language: es
# @id GHE-CATEGORIA-NNN
# @type business-rule
# @domain dominio
# @layer capa
# @risk s1|s2|s3
# @owner responsable
# @status proposed
# @requirement REQ-XXX-NNN
# @risk-control CTRL-XXX-NNN
# @regulation NORMA
@domain:categoria @type:business-rule @risk:s2 @status:proposed
Característica: Nombre Descriptivo
  Como [rol del usuario]
  Quiero [funcionalidad]
  Para [beneficio/clínico]

  Regla: Nombre de la regla

    Escenario: Descripción del escenario
      Dado que [contexto inicial]
      Cuando [acción del usuario]
      Entonces [resultado esperado]
      # @evidence EVID-XXX-NNN
      # @invariante INV-XXX-NNN
```

### Convenciones de naming

| Elemento | Formato | Ejemplo |
|---|---|---|
| Archivo feature | `NN_nombre_descriptivo.feature` | `02_radiation_safety_dosimetry.feature` |
| ID de feature | `GHE-CATEGORIA-NNN` | `GHE-IMAGING-002` |
| Escenario | Oración descriptiva | `"Registro de dosis por paciente"` |
| Evidencia | `EVID-XXX-NNN` | `EVID-IMG-DOSIMETRY-001` |
| Invariante | `INV-XXX-NNN` | `INV-IMG-DOSIMETRY-001` |

### Convenciones de contenido

- Usar **`# language: es`** en la primera línea
- Incluir **metadatos** en comentarios YAML (`# @field value`)
- Usar **tablas Gherkin** para datos estructurados
- Incluir **evidencia** (`@evidence`) para cada escenario clave
- Incluir **invariantes** (`@invariante`) para reglas de seguridad
- Referenciar **normativa** aplicable (`@regulation`)

---

## Flujo de Contribución

### 1. Fork y Clone
```bash
git clone https://github.com/TU_USUARIO/GHEInvestigacion.git
cd GHEInvestigacion
```

### 2. Crear Branch
```bash
git checkout -b feature/nombre-descriptivo
```

Nombres de branch:
- `feature/nueva-categoria` — nueva categoría de dominio
- `feature/hardening-X` — hardening de categoría existente
- `fix/correccion-Descripcion` — corrección de contenido
- `docs/mejora-Descripcion` — mejora de documentación

### 3. Hacer Cambios
- Seguir la estructura de feature files mostrada arriba
- Mantener consistencia con categorías existentes
- Incluir al menos 2 escenarios por feature (positivo + negativo)

### 4. Commit
```bash
git add .
git commit -m "feat: descripción clara del cambio"
```

Convenciones de commit:
- `feat:` nueva funcionalidad o feature
- `fix:` corrección de error
- `docs:` documentación
- `refactor:` mejoras de estructura
- `test:` tests (no aplica a este repo)

### 5. Push y PR
```bash
git push origin feature/nombre-descriptivo
```

Y crear Pull Request en GitHub con:
- Descripción del cambio
- Categorías afectadas
- Número de escenarios añadidos

---

## Checklist de Revisión

Antes de merge, verificar:

- [ ] Archivo feature tiene `# language: es`
- [ ] Metadatos YAML están completos (`@id`, `@type`, `@domain`, `@risk`, etc.)
- [ ] Al menos 2 escenarios por feature
- [ ] Escenarios incluyen caso positivo Y negativo
- [ ] Evidencia documentada (`@evidence`)
- [ ] Invariantes documentadas (`@invariante`) para reglas de seguridad
- [ ] Normativa referenciada (`@regulation`)
- [ ] Naming de archivo sigue convención `NN_nombre.feature`
- [ ] Contenido es relevante para el dominio del hospital

---

## Categorías Activas

Consultar `templates/gherkin/` para la lista completa de 49 categorías. Cada categoría debe tener mínimo 2 features.

---

## Reportar Gaps

Si identificas un gap de cobertura:
1. Abrir issue con etiqueta `gap`
2. Describir dominio faltante
3. Proponer features mínimas necesarias
4. Referenciar normativa aplicable si aplica

---

## Código de Conducta

- Respeto por todos los contribuidores
- Comunicación constructiva
- Enfoque en el impacto clínico del paciente
- Transparencia en decisiones técnicas
- Cumplimiento de normativas de salud

---

## Preguntas?

Abrir un issue en GitHub con la etiqueta `question`.
