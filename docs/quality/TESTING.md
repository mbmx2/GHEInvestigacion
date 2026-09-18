# Estrategia de Testing de GHE

> *"5,573 tests no son un número — son 5,573 razones para confiar."*

---

## 1. Filosofía de Testing

```
"No asumas que funciona. Pruébalo."
"Cada test es una promesa al paciente."
"Si no está probado, está roto."
```

---

## 2. Testing Pyramid

```
                    ┌─────────────┐
                    │   E2E (5%)  │  ← Flujo completo
                    │  Browser +  │    (30 tests)
                    │  API        │
                    ├─────────────┤
                    │Integration  │  ← API + DB
                    │   (15%)     │    (800 tests)
                    │  DB + API   │
                    ├─────────────┤
                    │    Unit     │  ← Funciones puras
                    │   (80%)     │    (4,400 tests)
                    │  Domain     │
                    └─────────────┘
                    
                    + PEAEH: Meta-testing (43 tests)
                    
                    TOTAL: 5,573+ tests
```

---

## 3. Tipos de Tests

### 3.1. Unit Tests (80%)

```clojure
;; Tests de lógica de dominio
(deftest test-calculate-gestational-age
  (testing "Edad gestacional desde FUR"
    (is (= 20 (obstetric/calculate-gestational-age 
                 (java.time.LocalDate/of 2024 5 1)
                 (java.time.LocalDate/of 2024 9 25))))))
```

**Cobertura objetivo: 95%**

### 3.2. Integration Tests (15%)

```clojure
;; Tests de integración con base de datos
(deftest test-patient-repository
  (testing "Guardar y recuperar paciente"
    (let [db (test-db/create-test-db)
          patient {:first-name "María"
                   :last-name "García"
                   :curp "GALM850315MVZRRL04"}]
      (db/save-patient db patient)
      (let [retrieved (db/find-patient-by-curp db "GALM850315MVZRRL04")]
        (is (= "María" (:first-name retrieved)))))))
```

**Cobertura objetivo: 90%**

### 3.3. E2E Tests (5%)

```clojure
;; Tests de flujo completo
(deftest test-full-consultation-flow
  (testing "Flujo completo: registro → triaje → consulta → receta"
    (let [app (test-utils/start-test-app)]
      ;; Registrar paciente
      (let [patient (api/register-patient app test-data/new-patient)]
        ;; Registrar signos vitales
        (api/record-vital-signs app (:id patient) test-data/vital-signs)
        ;; Crear consulta
        (let [consultation (api/create-consultation app (:id patient))]
          ;; Prescribir
          (api/prescribe app (:id consultation) test-data/prescription)
          ;; Verificar
          (is (some? (:prescription-id consultation))))))))
```

**Cobertura objetivo: 85%**

### 3.4. PEAEH (Meta-Testing)

PEAEH verifica que los tests mismos sean correctos:

```clojure
(deftest test-peaeh-naming-convention
  (testing "Todos los tests tienen nombres descriptivos"
    (let [test-vars (get-test-vars)]
      (doseq [v test-vars]
        (is (re-matches #"test-.*" (name (:name (meta v)))))))))

(deftest test-peaeh-deterministic
  (testing "Tests son determinísticos"
    (let [results (run-tests-twice)]
      (is (= (:pass (first results)) (:pass (second results)))))))

(deftest test-peaeh-independent
  (testing "Tests no dependen de estado global"
    (let [result1 (run-test :test-patient-registration)
          result2 (run-test :test-patient-registration)]
      (is (= result1 result2)))))
```

---

## 4. Cobertura por Módulo

| Módulo | Tests | Cobertura | Estado |
|---|---|---|---|
| Patient | 1,200 | 95% | ✅ |
| Clinical | 1,500 | 93% | ✅ |
| Obstetric | 800 | 92% | ✅ |
| Pharmacy | 900 | 94% | ✅ |
| Prescription | 700 | 91% | ✅ |
| Reporting | 300 | 88% | ✅ |
| Sync | 200 | 85% | ✅ |
| Auth | 150 | 90% | ✅ |
| UI | 23 | 70% | ⚠️ |
| **TOTAL** | **5,573** | **92%** | ✅ |

---

## 5. Ejecución de Tests

### 5.1. Comandos

```bash
# Ejecutar todos los tests
lein test

# Ejecutar tests de un módulo
lein test :only ghe.patient-test

# Ejecutar con cobertura
lein cloverage

# Ejecutar PEAEH
lein test :only ghe.peaeh-test

# Ejecutar en modo verboso
lein test --verbose
```

### 5.2. CI/CD

```yaml
# .github/workflows/test.yml
name: Tests
on: [push, pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-java@v4
        with:
          distribution: 'temurin'
          java-version: '17'
      - name: Run tests
        run: lein test
      - name: Check coverage
        run: lein cloverage --fail-threshold 85
      - name: Run PEAEH
        run: lein test :only ghe.peaeh-test
```

---

## 6. Bugs Críticos: Proceso

### 6.1. Clasificación de Bugs

| Severidad | Descripción | Tiempo de respuesta |
|---|---|---|
| **S1 - Crítico** | Pérdida de datos, daño al paciente | Inmediato |
| **S2 - Alto** | Funcionalidad principal rota | 24 horas |
| **S3 - Medio** | Funcionalidad secundaria afectada | 1 semana |
| **S4 - Bajo** | Cosmético, mejora menor | Siguiente release |

### 6.2. Proceso de Fix

```
1. Reportar bug con:
   - Pasos para reproducir
   - Resultado esperado
   - Resultado actual
   - Screenshots/logs

2. Crear test que falle (reproduce el bug)

3. Corregir el bug

4. Verificar que el test pasa

5. Code review

6. Merge a develop

7. Incluir en release notes
```

---

## 7. Performance Testing

### 7.1. Métricas Objetivo

| Métrica | Objetivo | Herramienta |
|---|---|---|
| Tiempo respuesta API | <200ms | Apache Bench |
| Tiempo carga de UI | <2s | Lighthouse |
| Tiempo búsqueda paciente | <500ms | Custom benchmark |
| Tiempo guardado consulta | <200ms | Custom benchmark |
| Concurrent users | >50 | JMeter |
| DB size (10K patients) | <1GB | SQLite stats |

### 7.2. Benchmark

```bash
# Ejecutar benchmark de API
ab -n 1000 -c 50 http://localhost:3000/api/patients

# Ejecutar benchmark de búsqueda
lein bench :only ghe.benchmark/patient-search
```

---

## 8. Security Testing

### 8.1. Checklist

- [ ] SQL injection testing
- [ ] XSS testing
- [ ] CSRF testing
- [ ] Authentication bypass testing
- [ ] Authorization bypass testing
- [ ] Session hijacking testing
- [ ] Password cracking testing
- [ ] File upload testing
- [ ] API rate limiting testing
- [ ] Encryption verification

### 8.2. Herramientas

| Herramienta | Propósito |
|---|---|
| OWASP ZAP | Vulnerability scanning |
| SQLMap | SQL injection testing |
| Burp Suite | Web application testing |
| Nmap | Network scanning |

---

## 9. Definition of Done

Un feature está "Done" cuando:

- [ ] Código implementado
- [ ] Tests unitarios escritos (cobertura >90%)
- [ ] Tests de integración escritos
- [ ] Code review completado
- [ ] Documentación actualizada
- [ ] Sin bugs S1/S2 abiertos
- [ ] Performance dentro de objetivos
- [ ] Security testing completado
- [ ] PEAEH verification pass

---

*Testing GHE: Porque en software médico, "funciona" no es suficiente.*
