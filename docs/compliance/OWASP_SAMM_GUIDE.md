# Guía OWASP SAMM para GHE

> *"SAMM es un framework de madurez de seguridad de software. No es un checkbox — es un camino de mejora continua."*

---

## 1. Estructura de SAMM

### 5 Funciones de Negocio × 4 Prácticas = 20 Prácticas

| Función | Práctica 1 | Práctica 2 | Práctica 3 | Práctica 4 |
|---|---|---|---|---|
| **Governance** | Strategy & Metrics | Policy & Compliance | Education & Guidance | — |
| **Design** | Security Requirements | Security Architecture | — | — |
| **Implementation** | Secure Build | Secure Deployment | — | — |
| **Verification** | Architecture Assessment | Requirements-driven Testing | Security Testing | — |
| **Operations** | Penetration Testing | Software Environment | Configuration & Vuln Mgmt | — |

### 3 Niveles de Madurez por Práctica

| Nivel | Descripción |
|---|---|
| 1 | Básico: proceso definido |
| 2 | Intermedio: proceso medido y controlado |
| 3 | Avanzado: proceso optimizado y mejorado continuamente |

---

## 2. Features GHE SAMM

| Feature | Función | Prácticas | Escenarios |
|---|---|---|---|
| SAMM_01_governance | Governance | Strategy, Policy, Education | 6 |
| SAMM_02_design | Design | Requirements, Architecture | 4 |
| SAMM_03_implementation | Implementation | Build, Deployment | 4 |
| SAMM_04_verification | Verification | Assessment, Testing, PenTest | 4 |
| SAMM_05_operations | Operations | PenTest, Environment, Config Mgmt | 4 |
| **TOTAL** | **5 funciones** | **13 prácticas** | **22 escenarios** |

---

## 3. Nivel de Madurez Actual de GHE

| Función | Práctica | Nivel actual | Nivel objetivo |
|---|---|---|---|
| Governance | Strategy & Metrics | 1 | 2 |
| Governance | Policy & Compliance | 1 | 3 |
| Governance | Education & Guidance | 1 | 2 |
| Design | Security Requirements | 2 | 3 |
| Design | Security Architecture | 2 | 3 |
| Implementation | Secure Build | 2 | 3 |
| Implementation | Secure Deployment | 1 | 2 |
| Verification | Architecture Assessment | 1 | 2 |
| Verification | Requirements-driven Testing | 2 | 3 |
| Verification | Security Testing | 1 | 2 |
| Operations | Penetration Testing | 0 | 2 |
| Operations | Software Environment | 1 | 2 |
| Operations | Config & Vuln Mgmt | 1 | 2 |

**Nivel promedio actual: 1.2**
**Nivel objetivo: 2.5**

---

## 4. Roadmap SAMM

| Fase | Prácticas a mejorar | Nivel objetivo | Plazo |
|---|---|---|---|
| Fase 1 | Governance + Design | Nivel 2 | Q4 2026 |
| Fase 2 | Implementation + Verification | Nivel 2 | Q1 2027 |
| Fase 3 | Operations + todo a Nivel 2 | Nivel 2 | Q2 2027 |
| Fase 4 | Todo a Nivel 3 | Nivel 3 | Q4 2027 |

---

## Referencias

- OWASP SAMM: https://owasp.org/www-project-samm/
- SAMM 2.0: https://owasp.org/www-project-samm/v2/
