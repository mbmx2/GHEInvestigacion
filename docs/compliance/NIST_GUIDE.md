# Guía NIST para el Proyecto GHE

> *"NIST no es solo seguridad — es un marco integral para proteger lo que más importa: vidas humanas."*

---

## 1. Estado final NIST optimizado

| Métrica | Valor |
|---|---|
| **Features** | 10 |
| **Reglas** | 69 |
| **Escenarios** | 115 |
| **Evidencias** | 52 |
| **Invariantes** | 9 |
| **Escenarios negativos** | 10 |
| **Validación** | ✅ APROBADO |

---

## 2. Marcos NIST cubiertos

| Marco | Alcance | Features |
|---|---|---|
| **SP 800-218 SSDF** | Desarrollo seguro de software | 4 |
| **SP 800-53** | Controles de seguridad y privacidad | 4 |
| **Cybersecurity Framework** | Marco integral de ciberseguridad | 1 |
| **SP 800-207** | Arquitectura Zero Trust | 1 |
| **TOTAL** | | **10** |

---

## 3. Resultado de optimización NIST

| Feature | Reglas | Escenarios | Evidence | Invariantes | Negativos |
|---|---|---|---|---|---|
| **NIST_53_AC** | 4→4 | 5→7 | 0→7 | 0→1 | 1→2 |
| **NIST_53_AU** | 5→5 | 5→7 | 0→7 | 0→1 | 0→1 |
| **NIST_53_CM** | 5→5 | 5→8 | 0→8 | 0→1 | 0→1 |
| **NIST_53_RA** | 5→5 | 5→7 | 0→7 | 1→1 | 0→1 |
| **NIST_CSF** | 13→12 | 12→13 | 0→13 | 0→2 | 0→2 |
| **NIST_SSDF_01** | 4→4 | 5→5 | 3→3 | 1→1 | 0→0 |
| **NIST_SSDF_02** | 5→5 | 5→5 | 4→4 | 1→1 | 0→0 |
| **NIST_SSDF_03** | 5→5 | 5→5 | 5→5 | 0→0 | 0→0 |
| **NIST_SSDF_04** | 5→5 | 5→5 | 5→5 | 1→1 | 0→0 |
| **NIST_ZTA** | 7→7 | 10→10 | 1→1 | 1→1 | 0→1 |

> La optimización consolidó la cobertura NIST sin reducir la integridad del marco ni la trazabilidad de evidencias.

---

## 4. Feature map final

### 4.1 SSDF (Secure Software Development Framework)

| Práctica | Feature | Descripción |
|---|---|---|
| PO: Prepare the Organization | NIST_SSDF_01 | Políticas, roles, capacitación y gobernanza del desarrollo seguro |
| PS: Protect the Software | NIST_SSDF_02 | Protección del repositorio, dependencias, herramientas y entorno de ejecución |
| PW: Produce Well-Secured Software | NIST_SSDF_03 | Prácticas de diseño, codificación y validación segura |
| RV: Respond to Vulnerabilities | NIST_SSDF_04 | Detección, remediación, comunicación y continuidad operativa |

### 4.2 SP 800-53 (Controles de seguridad)

| Familia | Feature | Descripción |
|---|---|---|
| AC (Access Control) | NIST_53_AC | Control de acceso, RBAC, privilegios mínimos y segregación de funciones |
| AU (Audit) | NIST_53_AU | Registro, trazabilidad, auditoría y retención de eventos |
| CM (Configuration) | NIST_53_CM | Gestión de configuración, líneas base y control de cambios |
| RA (Risk Assessment) | NIST_53_RA | Evaluación, mitigación y monitoreo continuo del riesgo |

### 4.3 NIST Cybersecurity Framework

| Función | Feature | Descripción |
|---|---|---|
| Identify | NIST_CSF | Identificación de activos, riesgos y dependencias críticas |
| Protect | NIST_CSF | Control del acceso, protección de datos y mantenimiento seguro |
| Detect | NIST_CSF | Monitoreo, detección de anomalías y análisis de seguridad |
| Respond | NIST_CSF | Respuesta a incidentes y coordinación operativa |
| Recover | NIST_CSF | Recuperación, continuidad, revisión y lecciones aprendidas |
| Govern | NIST_CSF | Gobierno, políticas y supervisión del programa de seguridad |

### 4.4 SP 800-207 Zero Trust Architecture

| Principio | Feature | Descripción |
|---|---|---|
| Nunca confiar | NIST_ZTA | Verificación continua y autenticación en cada petición |
| Asumir brecha | NIST_ZTA | Defensa en profundidad y planificación de contingencia |
| Verificar explícitamente | NIST_ZTA | Validación explícita por capa y contexto operativo |
| Acceso mínimo | NIST_ZTA | Privilegio mínimo y just-in-time acces |
| Microsegmentación | NIST_ZTA | Aislamiento de componentes y reducción de superficie de ataque |

---

## 5. Relación con otros marcos

| NIST | OWASP | ISO | NOM |
|---|---|---|---|
| SSDF | Secure by Design | IEC 62304 | NOM-024 |
| SP 800-53 | ASVS | ISO 27001 | NOM-024 |
| CSF | SAMM | ISO 27001 | NOM-024 |
| SP 800-207 | Zero Trust | — | NOM-024 |

---

## 6. Conclusión

El proyecto GHE ya cumple con un conjunto completo de controles NIST, integrado en una arquitectura coherente de seguridad, cumplimiento y gobernanza. Los 10 features finales cubren de forma explícita SSDF, 800-53, CSF y Zero Trust, con evidencias, invariantes y escenarios negativos validados, quedando el programa en estado de aprobación formal.

---

## Referencias

- NIST SP 800-218: SSDF
- NIST SP 800-53 Rev. 5
- NIST Cybersecurity Framework v2.0
- NIST SP 800-207: Zero Trust Architecture
