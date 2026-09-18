# Guía GUIX User First para el Proyecto GHE

> *"Diseñar para el usuario más exigente es la única forma de diseñar bien."*

---

## 1. ¿Qué es GUIX User First?

**GUIX User First** es una filosofía de diseño de interfaces que prioriza las necesidades del usuario por encima de todo lo demás. En el contexto de GHE, significa:

- **El usuario es el centro** de cada decisión de diseño
- **La simplicidad** es más importante que la funcionalidad
- **La accesibilidad** es un requisito, no un lujo
- **El contexto rural** define las restricciones de diseño

---

## 2. Principios GUIX User First en GHE

| Principio | Aplicación en GHE |
|---|---|
| **Simplicidad extrema** | Máximo 5 clicks para tareas core |
| **Consistencia** | Mismos patrones en toda la app |
| **Feedback inmediato** | Confirmación de cada acción |
| **Tolerancia al error** | Undo, confirmaciones, auto-save |
| **Visibilidad de estado** | Siempre saber qué pasa (online/offline/sync) |
| **Reconocimiento vs. memoriza** | Botones visibles, no atajos |
| **Flexibilidad** | Múltiples formas de hacer lo mismo |
| **Estética minimalista** | Sin distracciones, enfoque en datos |
| **Accesibilidad** | WCAG 2.1 nivel AA |
| **Responsive** | Funciona en cualquier dispositivo |

---

## 3. Perfiles de Usuario

| Perfil | Experiencia tech | Necesidad principal | Restricción |
|---|---|---|---|
| **Médico rural** | Básica-Intermedia | Rápido, sin complicaciones | 5-10 min/consulta |
| **Enfermera obstétrica** | Básica | Triage eficiente | Walk-in |
| **Farmacéutico** | Intermedia | Dispensación ágil | Inventario |
| **Recepcionista** | Básica | Registro mínimo | Velocidad |
| **Administrador** | Intermedia | Reportes claros | Datos |

---

## 4. Flujos Core

### 4.1. Consulta Rápida (5 pasos, <5 min)

```
1. Buscar paciente (Ctrl+K o botón)
2. Abrir expediente (click en resultado)
3. Nueva consulta (botón)
4. Llenar nota SOAP (formularios rápidos)
5. Guardar y firmar (Ctrl+S)
```

### 4.2. Prescripción (4 pasos, <2 min)

```
1. Seleccionar medicamento (búsqueda)
2. Dosis (autocompletado)
3. Cantidad (calculadora)
4. Firmar (botón)
```

### 4.3. Triaje Obstétrico (3 pasos, <3 min)

```
1. Buscar paciente (walk-in)
2. Signos vitales (campos rápidos)
3. Clasificar riesgo (select)
```

---

## 5. Componentes UI

### 5.1. Layout

| Dispositivo | Sidebar | Contenido | Tablas |
|---|---|---|---|
| Desktop (>1024px) | Visible | Expandido | Todas columnas |
| Tablet (640-1024px) | Colapsable | Semi-expandido | Columnas esenciales |
| Mobile (<640px) | Oculto | Full width | Cards apiladas |

### 5.2. Colores

| Elemento | Color | Uso |
|---|---|---|
| Primario | #2563EB | Acciones principales |
| Éxito | #16A34A | Confirmaciones |
| Advertencia | #F59E0B | Warnings |
| Error | #DC2626 | Errores, alertas críticas |
| Offline | #6B7280 | Modo sin conexión |
| Background | #F9FAFB | Fondo general |
| Texto | #111827 | Texto principal |

### 5.3. Tipografía

| Elemento | Tamaño | Peso |
|---|---|---|
| H1 | 24px | Bold |
| H2 | 20px | Semibold |
| H3 | 16px | Semibold |
| Body | 14px | Regular |
| Small | 12px | Regular |
| Label | 14px | Medium |

### 5.4. Espaciado

| Nivel | Valor | Uso |
|---|---|---|
| xs | 4px | Entre elementos cercanos |
| sm | 8px | Entre campos de formulario |
| md | 16px | Entre secciones |
| lg | 24px | Entre bloques |
| xl | 32px | Entre pantallas |

---

## 6. Accesibilidad (WCAG 2.1 AA)

| Criterio | Implementación |
|---|---|
| **Contraste** | Texto 4.5:1, componentes 3:1 |
| **Navegación teclado** | Tab, Enter, Escape funcionan |
| **Screen readers** | ARIA labels, roles, landmarks |
| **Tamaño de toque** | Mínimo 44x44px |
| **Texto redimensionable** | Hasta 200% |
| **Color no único** | Icono + texto para estados |

---

## 7. Métricas UX

```yaml
ux_metrics:
  usability:
    task_completion_rate: ">95%"
    time_on_task: "<5 min (consulta)"
    error_rate: "<5%"
    learnability: "<2 horas"
  
  satisfaction:
    sus_score: ">80/100"
    nps: ">50"
    user_feedback: "positivo"
  
  accessibility:
    wcag_level: "AA"
    screen_reader_compatible: true
    keyboard_navigable: true
  
  performance:
    first_contentful_paint: "<1s"
    time_to_interactive: "<2s"
    response_time: "<200ms"
```

---

## 8. Checklist de Diseño

### Antes de diseñar pantalla:
- [ ] ¿Quién la usa? (perfil)
- [ ] ¿Cuándo la usa? (contexto)
- [ ] ¿Qué necesita hacer? (tarea)
- [ ] ¿Cuánto tiempo tiene? (velocidad)
- [ ] ¿Qué dispositivo usa? (responsive)

### Después de diseñar:
- [ ] ¿Se puede hacer en ≤5 clicks?
- [ ] ¿Es consistente con el resto?
- [ ] ¿Tiene feedback claro?
- [ ] ¿Es accesible (WCAG)?
- [ ] ¿Funciona en mobile?

---

## 9. Referencias

- **"Don't Make Me Think"**: Steve Krug
- **"The Design of Everyday Things"**: Don Norman
- **"About Face: The Essentials of Interaction Design"**: Alan Cooper
- **"WCAG 2.1"**: https://www.w3.org/WAI/WCAG21/quickref/
- **"Material Design"**: https://m3.material.io/
- **"Apple Human Interface Guidelines"**: https://developer.apple.com/design/

---

*GUIX User First en GHE: Diseñado para quien más lo necesita.*
