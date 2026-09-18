# Guía TDD para el Proyecto GHE

> *"TDD no es sobre tests — es sobre diseño. Los tests son el subproducto de un buen diseño."*

---

## 1. ¿Qué es TDD?

**TDD** (Test-Driven Development) es una técnica de desarrollo de software donde:

1. **Primero se escribe un test** que falla (RED)
2. **Se escribe código mínimo** para que pase (GREEN)
3. **Se refactoriza** el código para mejorarlo (REFACTOR)

```
    ┌─────────────────────────────────────────────┐
    │                                             │
    │    ┌─────────┐                              │
    │    │   RED   │ ← Test que falla             │
    │    └────┬────┘                              │
    │         │                                   │
    │    ┌────▼────┐                              │
    │    │  GREEN  │ ← Código que pasa            │
    │    └────┬────┘                              │
    │         │                                   │
    │    ┌────▼────┐                              │
    │    │ REFACTOR│ ← Mejorar código             │
    │    └────┬────┘                              │
    │         │                                   │
    │         └──────→ Volver a RED               │
    │                                             │
    └─────────────────────────────────────────────┘
```

---

## 2. TDD en GHE - Aplicación Práctica

### 2.1. Ejemplo: Calcular Edad Gestacional

**Paso 1: RED** - Escribir test que falla

```clojure
(deftest test-calculate-gestational-age
  (testing "Calcula edad gestacional desde FUR"
    (is (= 17 (obstetric/calculate-gestational-age
                 (java.time.LocalDate/of 2024 1 1)
                 (java.time.LocalDate/of 2024 5 1))))))
```

**Resultado:** FALLA - `Function calculate-gestational-age not found`

**Paso 2: GREEN** - Código mínimo

```clojure
(defn calculate-gestational-age [lmp-date current-date]
  (let [days (java.time/temporal ChronoUnit/DAYS lmp-date current-date)]
    (quot days 7)))
```

**Resultado:** PASA

**Paso 3: REFACTOR** - Mejorar código

```clojure
(defn calculate-gestational-age
  "Calcula edad gestacional en semanas a partir de la FUR."
  [lmp-date current-date]
  {:pre [(some? lmp-date) (some? current-date)]}
  (let [days (java.time/temporal ChronoUnit/DAYS lmp-date current-date)]
    (quot days 7)))
```

---

## 3. Niveles de Testing en GHE

| Nivel | Qué se testea | Herramienta | Tiempo |
|---|---|---|---|
| **Unit** | Funciones puras del dominio | clojure.test | <10ms |
| **Integration** | Use Cases + Repositorios | clojure.test + test-db | <100ms |
| **Acceptance** | Requisitos de usuario | Gherkin + steps | <30min |
| **E2E** | Flujo completo | API + UI tests | <5min |
| **PEAEH** | Meta-testing (calidad de tests) | clojure.test | <1min |

---

## 4. Convenciones de Tests en GHE

### 4.1. Naming

```clojure
;; ✅ Bueno: describe QUÉ se testea
(deftest test-calculate-bmi-with-valid-input)
(deftest test-calculate-bmi-throws-on-zero-weight)
(deftest test-patient-validation-rejects-invalid-curp)

;; ❌ Malo: describe CÓMO se testea
(deftest test-1)
(deftest test-bmi)
(deftest test-function)
```

### 4.2. Estructura AAA

```clojure
(deftest test-register-patient
  (testing "Registra paciente con datos válidos"
    ;; Arrange (Preparar)
    (let [repo (in-memory/create-repo)
          patient {:first-name "María"
                   :last-name "García"
                   :curp "GOGC531015MVZRRL04"
                   :birth-date "1985-03-15"
                   :gender :F}]
      ;; Act (Actuar)
      (let [result (patient/register repo patient)]
        ;; Assert (Afirmar)
        (is (some? (:id result)))
        (is (= "María" (:first-name result)))
        (is (= "García" (:last-name result)))))))
```

### 4.3. Independencia

```clojure
;; ✅ Cada test es independiente
(deftest test-patient-1
  (let [repo (in-memory/create-repo)]
    ;; ...test 1...
    ))

(deftest test-patient-2
  (let [repo (in-memory/create-repo)]  ;; Nuevo repo
    ;; ...test 2...
    ))

;; ❌ Tests dependen de orden
(deftest test-patient-1
  (reset! shared-repo patient-1))  ;; Estado compartido

(deftest test-patient-2
  @shared-repo)  ;; Depende del test 1
```

---

## 5. Ciclo TDD en GHE

### 5.1. Para Nueva Funcionalidad

```
1. Escribir test de aceptación (Gherkin)
2. Ejecutar → FALLA (RED)
3. Escribir unit test más específico
4. Ejecutar → FALLA (RED)
5. Implementar función mínima
6. Ejecutar → PASA (GREEN)
7. Refactorizar
8. Ejecutar → SIGUE PASANDO
9. Repetir para siguiente aspecto
```

### 5.2. Para Corrección de Bug

```
1. Escribir test que reproduzca el bug
2. Ejecutar → FALLA (RED)
3. Corregir el bug
4. Ejecutar → PASA (GREEN)
5. Agregar tests de regresión
6. Refactor si es necesario
```

---

## 6. Métricas de TDD

| Métrica | Objetivo | GHE Actual |
|---|---|---|
| Cobertura de código | >95% | 92% |
| Tests unitarios | 80% del total | 80% |
| Tests de integración | 15% del total | 15% |
| Tests E2E | 5% del total | 5% |
| Tiempo de ejecución | <5 min | 3 min |
| Bugs en producción | <1/mes | 0 |
| Mutations survived | <5% | 3% |

---

## 7. Beneficios de TDD en GHE

| Beneficio | Impacto en GHE |
|---|---|
| **Diseño emergente** | Código más limpio y mantenible |
| **Regresión instantánea** | Bugs detectados inmediatamente |
| **Documentación viva** | Tests documentan comportamiento |
| **Refactor seguro** | Se puede mejorar código sin miedo |
| **Confianza** | El equipo sabe que el código funciona |
| **Velocidad** | Menos tiempo debugging en producción |

---

## 8. Referencias

- **"Test-Driven Development: By Example"**: Kent Beck
- **"Clean Code"**: Robert C. Martin
- **"Growing Object-Oriented Software, Guided by Tests"**: Freeman & Pryce
- **"The Art of Unit Testing"**: Roy Osherove
- **PEAEH**: Meta-testing aplicado en GHE

---

*TDD en GHE: Cada línea de código tiene un test que la respalda.*
