# Guía OWASP ASVS para GHE

> *"ASVS es el estándar de verificación de seguridad de aplicaciones. Cumplirlo es la diferencia entre 'creemos que somos seguros' y 'sabemos que somos seguros'."*

---

## 1. Resumen de ASVS aplicado a GHE

| Capítulo | Nombre | Features | Estado |
|---|---|---|---|
| V1 | Arquitectura y Diseño | V01_architecture_design.feature | Propuesto |
| V2 | Autenticación | V02_authentication.feature | Propuesto |
| V3 | Gestión de Sesiones | V03_session_management.feature | Propuesto |
| V4 | Control de Acceso | V04_access_control.feature | Propuesto |
| V5 | Validación y Sanitización | V05_validation_encoding.feature | Propuesto |
| V6 | Criptografía | V06_cryptography.feature | Propuesto |
| V7 | Errores y Logging | V07_error_handling_logging.feature | Propuesto |
| V8 | Protección de Datos | V08_data_protection.feature | Propuesto |
| V9 | Comunicación | V09_communication.feature | Propuesto |
| V10 | Archivos y Recursos | V10_files_resources.feature | Propuesto |
| V11 | API y Servicios Web | V11_api_web_services.feature | Propuesto |
| V13 | Configuración | V13_application_configuration.feature | Propuesto |
| V14 | Resiliencia | V14_resilience.feature | Propuesto |

**Total: 13 features, ~70 escenarios, ~50 requisitos ASVS**

---

## 2. Nivel de Verificación: Nivel 2

GHE apunta a **ASVS Nivel 2** (aplicaciones que manejan datos sensibles de salud).

| Categoría | Nivel 2 requiere | GHE estado |
|---|---|---|
| V1: Arquitectura | Threat modeling documentado | ✅ ADR-001 a ADR-006 |
| V2: Autenticación | Rate limiting, account lockout | ✅ Features de seguridad |
| V3: Sesiones | Tokens seguros, invalidación | ✅ Features de seguridad |
| V4: Control de acceso | RBAC, validación por registro | ✅ Features de seguridad |
| V5: Validación | Parameterized queries, encoding | ✅ Features de seguridad |
| V6: Criptografía | Algoritmos modernos, gestión claves | ✅ ADR-004 |
| V7: Logging | Audit trail inmutable | ✅ Features de observability |
| V8: Datos sensibles | Cifrado en reposo y tránsito | ✅ ADR-004 + ADR-002 |
| V9: Comunicación | TLS 1.3 | ✅ Infrastructure |
| V10: Archivos | Permisos restrictivos | ✅ Infrastructure |
| V11: API | Autenticación, rate limiting | ✅ Features de seguridad |
| V13: Configuración | Seguridad por defecto | ✅ ADR-001 |
| V14: Resiliencia | Backup, restauración, degradación | ✅ Offline-first |

---

## 3. Cómo usar estos features

Cada feature define:
- **Reglas** de negocio verificables
- **Escenarios** positivos y negativos
- **Invariantes** que nunca deben romperse
- **Evidencias** que deben generarse
- **Trazabilidad** a requisitos ASVS

Para implementar, cada feature se convierte en:
1. Requisito en SRS
2. Test automatizado
3. Validación en CI/CD
4. Evidencia para auditoría

---

## 4. Mapping ASVS → Feature

| Requisito ASVS | Feature | Escenarios |
|---|---|---|
| V1.1 Diseño seguridad | V01 | 5 |
| V2.1 Autenticación | V02 | 4 |
| V3.1 Sesiones | V03 | 3 |
| V4.1 Control acceso | V04 | 5 |
| V5.1 Validación entrada | V05 | 4 |
| V6.1 Criptografía | V06 | 4 |
| V7.1 Errores/logging | V07 | 4 |
| V8.1 Datos sensibles | V08 | 5 |
| V9.1 Comunicación | V09 | 3 |
| V10.1 Archivos | V10 | 3 |
| V11.1 API | V11 | 6 |
| V13.1 Configuración | V13 | 5 |
| V14.1 Resiliencia | V14 | 5 |

---

## Referencias

- OWASP ASVS 4.0: https://owasp.org/www-project-application-security-verification-standard/
- OWASP Proactive Controls: https://owasp.org/www-project-proactive-controls/
