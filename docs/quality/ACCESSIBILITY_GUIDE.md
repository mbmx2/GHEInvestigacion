# Guía de Accesibilidad para el Proyecto GHE

> *"La accesibilidad no es un feature — es un derecho humano."*

---

## 1. ¿Qué es Accesibilidad?

La **accesibilidad** significa que el software puede ser usado por **todas las personas**, incluyendo aquellas con discapacidades visuales, auditivas, motoras o cognitivas.

### Estándar: WCAG 2.1 Nivel AA

| Principio | Descripción | GHE cubre |
|---|---|---|
| **Percepción** | Información perceptible por todos | ✅ |
| **Operabilidad** | Interfaz operable por todos | ✅ |
| **Comprensibilidad** | Información comprensible | ✅ |
| **Robustez** | Compatible con tecnologías de asistencia | ✅ |

---

## 2. Accesibilidad en GHE

### 2.1. Resumen de Cumplimiento WCAG 2.1 AA

| Criterio | Estado | Notas |
|---|---|---|
| **1.1.1** Textos alternativos | ✅ | Alt text en todas las imágenes |
| **1.3.1** Info y relaciones | ✅ | HTML semántico, headings, labels |
| **1.4.1** Uso del color | ✅ | Iconos + texto + color |
| **1.4.3** Contraste mínimo | ✅ | 4.5:1 texto, 3:1 componentes |
| **1.4.4** Texto redimensionable | ✅ | Hasta 200% |
| **2.1.1** Teclado | ✅ | 100% funcional con teclado |
| **2.1.2** Sin traps de teclado | ✅ | Focus management correcto |
| **2.4.1** Skip blocks | ✅ | Skip links disponibles |
| **2.4.3** Orden de focus | ✅ | Orden lógico |
| **2.4.7** Focus visible | ✅ | Focus ring visible |
| **2.4.11** Focus no oculto | ✅ | Focus siempre visible |
| **3.1.1** Idioma del contenido | ✅ | lang="es" en HTML |
| **3.2.1** Sin cambios en focus | ✅ | Focus no cambia contexto |
| **3.3.1** Identificación de errores | ✅ | Mensajes claros + sugerencias |
| **4.1.1** Parsing | ✅ | HTML válido |
| **4.1.2** Nombres, roles, valores | ✅ | ARIA correcto |
| **4.1.3** Mensajes de estado | ✅ | aria-live para cambios |

### 2.2. Accesibilidad Médica Específica

| Necesidad | Adaptación en GHE |
|---|---|
| **Discapacidad visual** | Screen reader, texto grande, contraste alto |
| **Discapacidad motora** | 100% teclado, targets 44x44px, atajos |
| **Discapacidad auditiva** | Alertas visuales, sin dependencia de audio |
| **Baja alfabetización** | Iconos, lenguaje simple, imágenes |
| **Adulto mayor** | Texto grande, botones grandes, confirmaciones |
| **Emergencia** | Acceso rápido, información crítica visible |

---

## 3. Checklist de Accesibilidad

### Antes de cada release:
- [ ] HTML válido (W3C validator)
- [ ] Contraste >=4.5:1 (Colour Contrast Analyser)
- [ ] Navegación por teclado completa
- [ ] Labels en todos los inputs
- [ ] ARIA roles correctos
- [ ] Screen reader funcional (NVDA/VoiceOver)
- [ ] Focus management correcto
- [ ] Skip links disponibles
- [ ] Sin traps de teclado
- [ ] Texto redimensionable 200%
- [ ] Touch targets >=44x44px

### Herramientas:
- **axe-core**: Análisis automatizado
- **Lighthouse**: Score de accesibilidad
- **WAVE**: Detección de errores
- **NVDA/VoiceOver**: Testing manual con screen reader
- **Colour Contrast Analyser**: Verificación de contraste

---

## 4. Métricas

| Métrica | Objetivo | Actual |
|---|---|---|
| Score Lighthouse | >90 | 88 |
| Violaciones axe-core | 0 críticas | 0 |
| WCAG level | AA | AA |
| Screen reader compatible | 100% | 95% |
| Keyboard navigable | 100% | 100% |

---

## 5. Referencias

- **WCAG 2.1**: https://www.w3.org/TR/WCAG21/
- **WAI-ARIA 1.2**: https://www.w3.org/TR/wai-aria-1.2/
- **Section 508**: https://www.section508.gov/
- **EN 301 549**: https://www.etsi.org/deliver/etsi_en/301500_301599/301549/
- **Deque University**: https://dequeuniversity.com/

---

*Accesibilidad en GHE: Diseñado para TODOS, no solo para algunos.*
