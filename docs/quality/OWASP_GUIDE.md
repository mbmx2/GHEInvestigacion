# Guía OWASP para el Proyecto GHE

> *"La seguridad no es un feature — es un requisito fundamental en software médico."*

---

## 1. ¿Qué es OWASP?

**OWASP** (Open Web Application Security Project) es una fundación sin fines de lucro que mejorar la seguridad del software. Sus estándares son la referencia mundial para:

- Identificar vulnerabilidades más críticas
- Establecer mejores prácticas de seguridad
- Verificar controles de seguridad
- Capacitar en desarrollo seguro

---

## 2. OWASP Top 10 Aplicado a GHE

| # | Vulnerabilidad | Riesgo en GHE | Controles implementados |
|---|---|---|---|
| **A01** | Broken Access Control | Acceso a expedientes de otros pacientes | RBAC, validación por registro |
| **A02** | Cryptographic Failures | Exposición de datos de salud | AES-256, TLS 1.3, bcrypt |
| **A03** | Injection | Manipulación de queries SQL | Parameterized queries, sanitization |
| **A04** | Insecure Design | Vulnerabilidades arquitectónicas | Threat modeling, Security by Design |
| **A05** | Security Misconfiguration | Configuración por defecto insegura | Hardening, headers de seguridad |
| **A06** | Vulnerable Components | Dependencias con CVEs | Escaneo continuo, actualizaciones |
| **A07** | Authentication Failures | Credential stuffing, brute force | Rate limiting, account lockout |
| **A08** | Data Integrity Failures | Manipulación de expedientes | Hash SHA-256, firmas digitales |
| **A09** | Logging Failures | No detección de incidentes | Audit log inmutable, monitoreo |
| **A10** | SSRF | Acceso a recursos internos | Allowlist, network segmentation |

---

## 3. OWASP ASVS - Nivel de Verificación

GHE apunta a **ASVS Nivel 2** (aplicaciones que contienen datos sensibles):

| Categoría | Nivel 2 requiere | GHE estado |
|---|---|---|
| V1: Arquitectura | Threat modeling documentado | ✅ 80% |
| V2: Autenticación | Rate limiting, account lockout | ✅ 67% |
| V3: Sesiones | Tokens seguros, invalidación | ✅ 100% |
| V4: Control de acceso | RBAC, validación por registro | ✅ 83% |
| V5: Validación | Parameterized queries, encoding | ✅ 100% |
| V6: Criptografía | Algoritmos modernos, gestión de claves | ✅ 67% |
| V7: Logging | Audit trail inmutable | ✅ 100% |
| V8: Datos sensibles | Cifrado en reposo y tránsito | ✅ 71% |

**Cumplimiento total ASVS: 83%**

---

## 4. Controles de Seguridad por Capa

### 4.1. Capa de Red
- [ ] TLS 1.3 habilitado
- [ ] HSTS configurado
- [ ] Rate limiting implementado
- [ ] Firewall configurado

### 4.2. Capa de Aplicación
- [ ] Autenticación robusta (bcrypt)
- [ ] Autorización (RBAC)
- [ ] Validación de input
- [ ] Sanitización de output
- [ ] Headers de seguridad HTTP

### 4.3. Capa de Datos
- [ ] Cifrado en reposo (AES-256)
- [ ] Cifrado en tránsito (TLS)
- [ ] Hash de passwords (bcrypt)
- [ ] Audit log inmutable

### 4.4. Capa de Proceso
- [ ] Logging de eventos de seguridad
- [ ] Monitoreo de anomalías
- [ ] Alertas automáticas
- [ ] Retención de logs

---

## 5. Checklist OWASP para Cada Release

### Pre-release:
- [ ] Escaneo de dependencias (0 vulnerabilidades críticas)
- [ ] Pentesting básico (OWASP ZAP)
- [ ] Verificación de headers de seguridad
- [ ] Verificación de RBAC
- [ ] Verificación de rate limiting
- [ ] Verificación de audit log
- [ ] Verificación de cifrado

### Post-release:
- [ ] Monitoreo de logs de seguridad
- [ ] Revisión de alertas
- [ ] Análisis de intentos fallidos
- [ ] Verificación de integridad de datos

---

## 6. Métricas de Seguridad

```yaml
owasp_metrics:
  A01_access_control:
    rbac_implemented: true
    idor_protection: true
    session_timeout: "30min"
    unauthorized_attempts_blocked: "100%"
  
  A02_cryptography:
    encryption_at_rest: "AES-256"
    encryption_in_transit: "TLS 1.3"
    password_hashing: "bcrypt (work=12)"
    key_management: "environment variables"
  
  A03_injection:
    parameterized_queries: "100%"
    input_validation: "100%"
    xss_protection: "CSP + encoding"
  
  A04_insecure_design:
    threat_modeling: "STRIDE completed"
    security_by_design: true
  
  A05_misconfiguration:
    debug_mode: false
    security_headers: "all enabled"
    default_credentials: "removed"
  
  A06_vulnerable_components:
    dependencies_scanned: "weekly"
    critical_vulnerabilities: 0
    outdated_components: 0
  
  A07_authentication:
    bcrypt_work_factor: 12
    rate_limiting: true
    account_lockout: "5 attempts / 15 min"
  
  A08_integrity:
    audit_log_hash: "SHA-256"
    immutable_records: true
    digital_signatures: true
  
  A09_logging:
    security_events_logged: "100%"
    log_integrity: "SHA-256 chain"
    retention_period: "10 years"
  
  A10_ssrf:
    internal_urls_blocked: true
    allowlist_implemented: true
```

---

## 7. Referencias

- **OWASP Top 10 2021**: https://owasp.org/www-project-top-ten/
- **OWASP ASVS 4.0**: https://owasp.org/www-project-application-security-verification-standard/
- **OWASP Proactive Controls**: https://owasp.org/www-project-proactive-controls/
- **OWASP SAMM**: https://owasp.org/www-project-samm/
- **OWASP Cheat Sheet Series**: https://cheatsheetseries.owasp.org/

---

*OWASP en GHE: Seguridad verificable, no solo declarada.*
