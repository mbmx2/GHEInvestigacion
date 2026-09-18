# Estándares Técnicos de GHE

---

## 1. Estándares de Código

### 1.1. Convenciones Clojure

```clojure
;; Nombres
;; - kebab-case para funciones y variables
;; - PascalCase para records y protocolos
;; - SCREAMING_SNAKE_CASE para constantes

;; Ejemplo:
(def max-patients-per-page 50)

(defrecord Patient [id first-name last-name birth-date])

(defn calculate-gestational-age
  "Calcula la edad gestacional en semanas a partir de FUR"
  [lmp-date]
  ...)
```

### 1.2. Reglas de Estilo

| Regla | Ejemplo |
|---|---|
| Funciones puras cuando sea posible | `(defn calculate-bmi [weight height] ...)` |
| Destructuring para mapas | `(let [{:keys [name age]} patient] ...)` |
| threading macros para pipelines | `(->> patients (filter active?) (map :name))` |
| Docstrings en todas las funciones públicas | Ver ejemplo arriba |
| `defn-` para funciones privadas | `(defn- validate-curp [curp] ...)` |

### 1.3. Manejo de Errores

```clojure
;; Usar ex-info para errores con contexto
(throw (ex-info "Paciente no encontrado"
                {:type :patient-not-found
                 :patient-id patient-id
                 :component :patient-domain}))

;; Catch con contexto
(try
  (save-consultation consultation)
  (catch clojure.lang.ExceptionInfo e
    (let [{:keys [type]} (ex-data e)]
      (case type
        :validation-error (handle-validation e)
        :conflict (handle-conflict e)
        (throw e)))))
```

---

## 2. Estándares de Testing

### 2.2. Estrategia de Testing

```
┌─────────────────────────────────────────┐
│            Testing Pyramid              │
├─────────────────────────────────────────┤
│                                         │
│  ┌─────────────────────────┐            │
│  │    E2E Tests (5%)       │  ← UI +   │
│  │    Flujo completo       │    API     │
│  └───────────┬─────────────┘            │
│              │                          │
│  ┌───────────┴─────────────┐            │
│  │  Integration (15%)      │  ← DB +   │
│  │  API + DB               │    Domain  │
│  └───────────┬─────────────┘            │
│              │                          │
│  ┌───────────┴─────────────┐            │
│  │  Unit Tests (80%)       │  ← Domain  │
│  │  Pure functions         │    puro    │
│  └─────────────────────────┘            │
│                                         │
│  + PEAEH: Meta-testing de todos        │
│    los tests (verificación)             │
└─────────────────────────────────────────┘
```

### 2.2. Convenciones de Tests

```clojure
;; Archivo: patient_test.clj
(ns ghe.patient-test
  (:require [clojure.test :refer :all]
            [ghe.patient :as patient]))

(deftest test-calculate-age
  (testing "Calcula edad correctamente"
    (is (= 25 (patient/calculate-age "1999-03-15" "2024-03-15"))))
  
  (testing "Edge case: cumpleaños hoy"
    (is (= 30 (patient/calculate-age "1994-09-18" "2024-09-18")))))

(deftest test-validate-curp
  (testing "CURP válida"
    (is (true? (patient/validate-curp "GOGC531015MVZRRL04"))))
  
  (testing "CURP inválida"
    (is (false? (patient/validate-curp "ABC123")))))

(deftest test-calculate-bmi
  (testing "BMI normal"
    (is (= 22.5 (patient/calculate-bmi 70 1.77) 0.1)))
  
  (testing "BMI obesidad"
    (is (> (patient/calculate-bmi 120 1.65) 40))))
```

### 2.3. Cobertura Mínima

| Categoría | Cobertura mínima |
|---|---|
| Domain logic | 95% |
| Use cases | 90% |
| API endpoints | 85% |
| UI components | 70% |
| Total proyecto | 85% |

### 2.4. PEAEH (Meta-Testing)

PEAEH verifica que los tests mismos sean correctos:

```
1. Cada test debe tener nombre descriptivo
2. Cada test debe probar UNA cosa
3. Cada test debe ser independiente
4. Cada test debe ser determinístico
5. Cada test debe ser rápido (<100ms)
6. Los tests no deben depender de estado global
7. Los tests no deben depender de orden de ejecución
```

---

## 3. Estándares de Seguridad

### 3.1. OWASP Top 10

| Riesgo | Mitigación en GHE |
|---|---|
| A01: Broken Access Control | RBAC estricto, validación en backend |
| A02: Cryptographic Failures | AES-256, TLS 1.3, bcrypt |
| A03: Injection | Parameterized queries, input validation |
| A04: Insecure Design | Threat modeling, security by design |
| A05: Security Misconfiguration | Defaults seguros, hardening guide |
| A06: Vulnerable Components | Dependency scanning, updates |
| A07: Auth Failures | Rate limiting, MFA (future) |
| A08: Data Integrity Failures | SHA-256 audit logs |
| A09: Logging Failures | Audit trail completo |
| A10: SSRF | Input validation, allowlist |

### 3.2. Datos Sensibles (LFPDPPP)

```clojure
;; Datos clasificados como sensibles
(def sensitive-data-types
  #{:health-data        ;; Datos de salud
    :biometric-data     ;; Datos biométricos
    :genetic-data       ;; Datos genéticos
    :sexual-health      ;; Salud sexual
    :mental-health      ;; Salud mental
    :substance-use})    ;; Uso de sustancias

;; Consentimiento requerido
(defn requires-consent? [data-type]
  (contains? sensitive-data-types data-type))
```

### 3.3. Retención de Datos

| Tipo de dato | Retención | Base legal |
|---|---|---|
| Expediente clínico | 5 años mínimo | NOM-004 |
| Registro de auditoría | 10 años | LFPDPPP |
| Consentimientos | 5 años | NOM-004 |
| Backups | 5 años | NOM-024 |

---

## 4. Estándares de Documentación

### 4.1. Tipos de Documento

| Documento | Audiencia | Frecuencia |
|---|---|---|
| Architecture Decision Records | Desarrolladores | Por decisión |
| API Documentation | Desarrolladores | Automática |
| Clinical Workflows | Clínicos | Trimestral |
| Compliance Matrix | Compliance | Anual |
| Runbook | Operaciones | Por cambio |
| User Guide | Usuarios finales | Por release |

### 4.2. ADR (Architecture Decision Records)

```markdown
# ADR-001: Offline-First con SQLite

## Estado: Aceptado

## Contexto
La maternidad de Altotonga tiene conectividad intermitente (2G/EDGE).
El sistema debe funcionar sin internet.

## Decisión
Usar SQLite como almacenamiento local primario,
con sincronización diferida cuando haya conectividad.

## Consecuencias
- [+] Funciona 100% offline
- [+] Zero-config (no necesita servidor de BD)
- [+] Portabilidad (archivo único)
- [-] Sin concurrencia multi-escritura
- [-] Sin replicación automática

## Alternativas consideradas
- PostgreSQL: Requiere servidor, no offline-first
- CouchDB: Más complejo, no nativo en Clojure
- Datascript: In-memory, no persiste
```

---

## 5. Estándares de Git

### 5.1. Branching Model

```
main (producción)
├── develop (desarrollo)
│   ├── feature/PATIENT-001-registro
│   ├── feature/OBST-002-triaje
│   ├── fix/PHARM-003-inventario
│   └── release/1.0.0
└── hotfix/CVE-001-seguridad
```

### 5.2. Commit Messages

```
<type>(<scope>): <description>

Types:
- feat: Nueva funcionalidad
- fix: Corrección de bug
- docs: Documentación
- style: Formato (no afecta código)
- refactor: Refactorización
- test: Tests
- chore: Configuración, dependencias

Examples:
feat(obstetric): add prenatal visit recording
fix(pharmacy): correct stock calculation
docs(compliance): update NOM-004 checklist
test(patient): add CURP validation tests
```

### 5.3. Pull Requests

- **Título claro**: Qué hace el cambio
- **Descripción**: Por qué se hace
- **Tests**: Todos los tests deben pasar
- **Revisión**: Al menos 1 review antes de merge
- **Docs**: Actualizar documentación si aplica

---

## 6. Estándares de Deployment

### 6.1. Versionado Semántico

```
MAJOR.MINOR.PATCH

MAJOR: Cambios que rompen compatibilidad
MINOR: Nuevas funcionalidades (backward compatible)
PATCH: Correcciones de bugs

Ejemplo: 1.2.3
- 1: Primera versión estable
- 2: Segunda funcionalidad menor
- 3: Tercera corrección
```

### 6.2. Checklist de Release

- [ ] Todos los tests pasan (5,573+)
- [ ] PEAEH verification pass
- [ ] Cobertura >= 85%
- [ ] Documentación actualizada
- [ ] Changelog escrito
- [ ] Backup de base de datos
- [ ] Rollback plan documentado
- [ ] Comunicado a usuarios

---

*Estándares GHE: Porque la calidad se mide, no se asume.*
