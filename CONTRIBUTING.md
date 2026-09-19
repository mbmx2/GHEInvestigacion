# Contributing a GHEInvestigacion

Gracias por tu interés en contribuir al proyecto GHE. Este documento explica cómo participar.

---

## Tipos de Contribución

### 1. Documentación
- Corregir typos
- Mejorar explicaciones
- Agregar ejemplos
- Traducir contenido

### 2. Templates Gherkin
- Agregar escenarios nuevos
- Mejorar escenarios existentes
- Agregar cobertura de nuevas áreas

### 3. Código
- Corregir bugs
- Agregar funcionalidades
- Mejorar rendimiento
- Agregar tests

### 4. Investigación
- Documentar mejores prácticas
- Analizar casos de uso
- Proponer mejoras arquitectónicas

---

## Flujo de Trabajo

### 1. Fork y Clone
```bash
git clone https://github.com/TU_USUARIO/GHEInvestigacion.git
cd GHEInvestigacion
```

### 2. Crear Branch
```bash
git checkout -b feature/nombre-descriptivo
```

### 3. Hacer Cambios
- Seguir convenciones del proyecto
- Agregar tests si es código
- Actualizar documentación

### 4. Commit
```bash
git add .
git commit -m "feat: descripción clara del cambio"
```

### 5. Push y PR
```bash
git push origin feature/nombre-descriptivo
```
Y crear Pull Request en GitHub.

---

## Convenciones

### Commits
```
<type>(<scope>): <descripción>

Types:
- feat: Nueva funcionalidad
- fix: Corrección de bug
- docs: Documentación
- test: Tests
- refactor: Refactorización
```

### Archivos .feature (Gherkin)
```gherkin
# language: es
Característica: [Nombre descriptivo]
  Como [rol]
  Quiero [funcionalidad]
  Para [beneficio]

  Escenario: [nombre del escenario]
    Dado que [contexto]
    Cuando [acción]
    Entonces [resultado esperado]
```

### Archivos .md
- Usar headings claros
- Incluir ejemplos
- Mantener formato consistente

---

## Revisión de Calidad

Antes de merge, debe pasar:
- [ ] Formato correcto de archivos
- [ ] Contenido relevante y preciso
- [ ] Sin duplicados con contenido existente
- [ ] Referencias correctas
- [ ] Revisión por al menos 1 persona

---

## Código de Conducta

- Respeto por todos los contribuidores
- Comunicación constructiva
- Enfoque en el impacto del paciente
- Transparencia en decisiones técnicas

---

## Preguntas?

Abrir un issue en GitHub con la etiqueta `question`.
