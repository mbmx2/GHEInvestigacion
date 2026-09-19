# Guía de Anti-Patrones para el Proyecto GHE

> *"Conocer los anti-patrones es tan importante como conocer los patrones. Los patrones te dicen qué hacer. Los anti-patrones te dicen qué NO hacer."*

---

## 1. ¿Qué son Anti-Patrones?

Un **anti-patrón** es una solución común a un problema que es **ineficiente, contraproducente o peligrosa**. En software médico, los anti-patrones pueden costar vidas.

### Diferencia entre Patrón y Anti-Patrón

| Patrón | Anti-Patrón |
|---|---|
| Solución probada a un problema común | Solución aparentemente buena pero dañina |
| Mejora la calidad | Degrada la calidad |
| Es mantenible | Es frágil |
| Es testeable | Es difícil de testear |
| Es escalable | Es un cuello de botella |

---

## 2. Anti-Patrones por Categoría

### 2.1. Arquitectura (10 anti-patrones)

| # | Anti-Patrón | Problema | Corrección en GHE |
|---|---|---|---|
| 1 | **God Object** | Clase con demasiadas responsabilidades | Separar en bounded contexts |
| 2 | **Spaghetti Code** | Flujo de control incomprensible | Arquitectura hexagonal |
| 3 | **Big Ball of Mud** | Sin arquitectura clara | Separación de capas |
| 4 | **Lava Flow** | Código que nadie toca | Tests + documentación |
| 5 | **Copy-Paste** | Código duplicado | Extraer a funciones compartidas |
| 6 | **Premature Optimization** | Optimizar sin medir | Medir primero, optimizar después |
| 7 | **Magic Numbers** | Números hardcodeados | Constantes descriptivas |
| 8 | **Feature Envy** | Clase que usa mucho otra | Mover método a la clase correcta |
| 9 | **Shotgun Surgery** | Un cambio afecta muchos archivos | Consolidar en módulos cohesivos |
| 10 | **Spoof** | Código que simula funcionalidad | Implementar funcionalidad real |

### 2.2. Software Médico (10 anti-patrones)

| # | Anti-Patrón | Consecuencia | Corrección en GHE |
|---|---|---|---|
| 1 | Sin validación clínica | Datos incorrectos | Specs por trimestre |
| 2 | Sin verificación de medicamentos | Malformaciones | Vademécum obstétrico |
| 3 | Sin alertas de escalamiento | Eclampsia no detectada | Sistema de alertas 4 niveles |
| 4 | Sin contexto obstétrico | Diagnóstico erróneo | Valores por trimestre |
| 5 | Sin doble verificación | Errores críticos | Doble check en prescripciones |
| 6 | Sin auditoría clínica | Sin trazabilidad | Audit log inmutable |
| 7 | Sin consentimiento | Violación legal | Consentimiento informado |
| 8 | Sin plan de contingencia | Pérdida de datos | Backup + plan de emergencia |
| 9 | Sin capacitación | Sistema no usado | Programa de capacitación |
| 10 | Sin validación clínica | Errores no detectados | Revisión + piloto |

### 2.3. Código Clojure (10 anti-patrones)

| # | Anti-Patrón | Problema | Corrección |
|---|---|---|---|
| 1 | Mutación excesiva | Difícil de testear | Inmutabilidad |
| 2 | Macros excesivas | Difícil de debug | Funciones cuando sea posible |
| 3 | Namespace sickness | Difícil de navegar | Bounded contexts |
| 4 | Threading anidado | Ilegible | Funciones nombradas |
| 5 | Doom balls | Ilegible | Extraer a funciones |
| 6 | Side effects en dominio | No testeable | IO en adapters |
| 7 | Re-definición excesiva | Flaky tests | with-redefs |
| 8 | Nil punting | Errores tardíos | Validación explícita |
| 9 | String keywords | No idiomático | Usar :keywords |
| 10 | Falta de specs | Sin contratos | Definir specs |

### 2.4. UX/Usabilidad (8 anti-patrones)

| # | Anti-Patrón | Problema | Corrección |
|---|---|---|---|
| 1 | **Password masking innecesario** | Errores de输入 | Mostrar password toggle |
| 2 | **Confirmación innecesaria** | Fluir interrumpido | Solo para acciones destructivas |
| 3 | **Labels flotantes confusos** | Usuario no sabe qué escribir | Labels siempre visibles |
| 4 | **Botones sin feedback** | Usuario no sabe si funcionó | Toast/Spinner |
| 5 | **Paginación innecesaria** | Datos dispersos | Infinite scroll |
| 6 | **Búsqueda sin resultados** | Usuario frustrado | Sugerencias |
| 7 | **Modales excesivos** | Fatiga de modales | Inline editing |
| 8 | **Loading excesivo** | Percepción de lentitud | Skeleton screens |

---

## 3. Checklist de Anti-Patrones

### Arquitectura:
- [ ] No hay God Objects
- [ ] No hay Spaghetti Code
- [ ] No hay Big Ball of Mud
- [ ] No hay código duplicado >3%
- [ ] No hay magic numbers
- [ ] No hay side effects en dominio

### Software Médico:
- [ ] Validación clínica en cada campo
- [ ] Verificación de medicamentos automatizada
- [ ] Alertas de escalamiento implementadas
- [ ] Contexto obstétrico en cada cálculo
- [ ] Doble verificación en prescripciones
- [ ] Audit log inmutable
- [ ] Consentimiento informado
- [ ] Plan de contingencia documentado

### Código Clojure:
- [ ] Mutación mínima
- [ ] Funciones sobre macros
- [ ] Namespaces cohesivos
- [ ] Threading legible
- [ ] Side effects en adapters
- [ ] Specs definidos

---

## 4. Métricas de Anti-Patrones

```yaml
antipattern_metrics:
  architecture:
    god_objects: 0
    code_duplication: "2.1%"
    magic_numbers: 0
    side_effects_in_domain: 0
  
  medical:
    validation_coverage: "100%"
    medication_verification: "100%"
    escalation_alerts: "active"
    audit_log: "complete"
    informed_consent: "implemented"
  
  clojure:
    atoms_in_domain: 0
    macros_used: 3  # solo las necesarias
    namespaces: 15
    threading_max_steps: 5
    specs_coverage: "100%"
```

---

## 5. Referencias

- **"AntiPatterns"**: William J. Brown et al.
- **"Refactoring"**: Martin Fowler
- **"Clean Code"**: Robert C. Martin
- **"Clojure for the Brave and True"**: Daniel Higginbotham
- **"The Joy of Clojure"**: Michael Fogus

---

*Anti-Patrones en GHE: Conocerlos es el primer paso para evitarlos.*
