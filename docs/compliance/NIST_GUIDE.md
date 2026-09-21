# Guía NIST para el Proyecto GHE

> *"NIST no es solo seguridad — es un marco integral para proteger lo que más importa: vidas humanas."*

---

## 1. Marcos NIST Cubiertos

| Marco | Alcance | Features | Escenarios |
|---|---|---|---|
| **SP 800-218 SSDF** | Desarrollo seguro de software | 4 | 16 |
| **SP 800-53** | Controles de seguridad y privacidad | 3 | 18 |
| **Cybersecurity Framework** | Marco integral de ciberseguridad | 1 | 12 |
| **SP 800-207** | Arquitectura Zero Trust | 1 | 6 |
| **TOTAL** | | **8** | **52** |

---

## 2. SSDF (Secure Software Development Framework)

| Práctica | Feature | Descripción |
|---|---|---|
| PO: Prepare the Organization | NIST_SSDF_01_prepare | Políticas, roles, capacitación |
| PS: Protect the Software | NIST_SSDF_02_protect | Herramientas, repositorios, dependencias |
| PW: Produce Well-Secured Software | NIST_SSDF_03_produce | Prácticas de desarrollo seguro |
| RV: Respond to Vulnerabilities | NIST_SSDF_04_respond | Detección, remediación, comunicación |

---

## 3. SP 800-53 (Controles de Seguridad)

| Familia | Feature | Descripción |
|---|---|---|
| AC (Access Control) | NIST_53_access_control | RBAC, mínimo privilegio |
| AU (Audit) | NIST_53_audit_accountability | Logging, retención, revisión |
| CM (Configuration) | NIST_53_configuration_management | Config baseline, control de cambios |
| RA (Risk Assessment) | NIST_53_risk_assessment | Evaluación, mitigación, monitoreo |

---

## 4. NIST Cybersecurity Framework

| Función | Feature | Descripción |
|---|---|---|
| Identify | NIST_CSF | Activos, riesgos |
| Protect | NIST_CSF | Acceso, datos, mantenimiento |
| Detect | NIST_CSF | Monitoreo, análisis |
| Respond | NIST_CSF | Respuesta a incidentes |
| Recover | NIST_CSF | Recuperación, lecciones |
| Govern | NIST_CSF | Gobernanza de seguridad |

---

## 5. NIST Zero Trust Architecture

| Principio | Feature | Descripción |
|---|---|---|
| Nunca confiar | NIST_ZTA | Autenticación en cada petición |
| Asumir brecha | NIST_ZTA | Defensa en profundidad |
| Verificar explícitamente | NIST_ZTA | Verificación en cada capa |
| Acceso mínimo | NIST_ZTA | Solo lo necesario |
| Microsegmentación | NIST_ZTA | Componentes aislados |

---

## 6. Relación con Otros Marcos

| NIST | OWASP | ISO | NOM |
|---|---|---|---|
| SSDF | Secure by Design | IEC 62304 | NOM-024 |
| SP 800-53 | ASVS | ISO 27001 | NOM-024 |
| CSF | SAMM | ISO 27001 | NOM-024 |
| SP 800-207 | — | — | NOM-024 |

---

## Referencias

- NIST SP 800-218: SSDF
- NIST SP 800-53 Rev. 5
- NIST Cybersecurity Framework v2.0
- NIST SP 800-207: Zero Trust Architecture
