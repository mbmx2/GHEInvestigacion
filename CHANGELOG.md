# Changelog - GHEInvestigacion

## v1.8.0 (2024-09-22) — Profundización SANS/GIAC

### Profundización de categoría SANS/GIAC (28 → 40 features)

**Nuevos features (12):**

**SANS Core:**
- `29_sans_network_monitoring_analysis.feature` — Monitoreo de red, IDS/IPS, NetFlow, segmentos críticos
- `30_sans_endpoint_detection_response.feature` — EDR, detección de comportamiento, respuesta automatizada, threat hunting
- `31_sans_cloud_security_framework.feature` — Shared responsibility, controles cloud, multi-cloud

**GIAC Foundational:**
- `32_giac_gcih_recovery_communication.feature` — Recuperación post-incidente, comunicación a stakeholders, lecciones
- `33_giac_gcia_encrypted_traffic_analysis.feature` — Análisis de tráfico encriptado, JA3/JA3S, detección de C2
- `34_giac_gcfa_mobile_forensics.feature` — Forense de dispositivos móviles, análisis de apps de mensajería

**GIAC Advanced:**
- `35_giac_gwapt_api_security_testing.feature` — Pruebas de APIs, BOLA, JWT, GraphQL, OWASP API Top 10
- `36_giac_gsec_cloud_security.feature` — Seguridad IaaS/PaaS/SaaS, protección de datos en cloud

**GIAC Specialized:**
- `37_giac_gpen_social_engineering.feature` — Ingeniería social, phishing, vishing, physical social engineering
- `38_giac_gcti_mitre_attack_integration.feature` — Mapeo ATT&CK, cobertura por táctica, threat hunting
- `39_giac_gsoc_automation_metrics.feature` — SOAR, playbooks, métricas avanzadas, enrichment automatizado
- `40_giac_gcih_healthcare_incident_response.feature` — IR específica para salud, impacto clínico, procedimientos manuales, notificación regulatoria

### Estado final SANS/GIAC: 40 features

| Categoría | Features | Cobertura |
|---|---|---|
| SANS Core | 9 | CIS Controls, IR, pentesting, forense, threat intel, secure dev, network monitoring, EDR, cloud |
| GIAC Foundational | 10 | GSEC, GPEN, GCIH, GCIA, GCFA, GWAPT, GSLC, recovery, encrypted traffic, social eng |
| GIAC Advanced | 10 | GREM, GNFA, GOSINT, GICSP, GCSA, GWEB, GCLE, GWSP, API security, cloud |
| GIAC Specialized | 11 | GCWN, GUNN, GAPT, GCTI, GXPN, GClD, GSOC, MITRE, automation, healthcare IR |

### Impacto en métricas
- Feature files: 430 → 442 (+12)
- Escenarios: 2,672 → 2,721 (+49)
- SANS/GIAC features: 28 → 40

---

## v1.7.0 (2024-09-22) — Integración SANS/GIAC

### Nueva categoría: SANS/GIAC — 28 features

**SANS Core Frameworks (6 features):**
- `01_sans_cis_critical_controls.feature` — CIS Controls Top 18: inventario, control de acceso, auditoría, gestión de vulnerabilidades
- `02_sans_incident_response_framework.feature` — Framework SANS de IR: preparación, detección, contención, lecciones
- `03_sans_penetration_testing.feature` — Metodología SANS de pentesting: reconocimiento, explotación, post-explotación, reporte
- `04_sans_digital_forensics.feature` — Metodología SANS de forense: adquisición, análisis, reporte, preservación
- `05_sans_threat_intelligence_lifecycle.feature` — Ciclo de vida de inteligencia: recopilación, análisis, distribución, métricas
- `06_sans_secure_software_development.feature` — Desarrollo seguro: requisitos, diseño, coding, pruebas, despliegue

**GIAC Foundational (7 features):**
- `07_giac_gsec_security_essentials.feature` — GSEC: fundamentos CIA, redes, SO, controles esenciales
- `08_giac_gpen_penetration_testing.feature` — GPEN: reconocimiento avanzado, explotación, post-explotación
- `09_giac_gcih_incident_handling.feature` — GCIH: preparación, detección, contención, recuperación
- `10_giac_gcia_intrusion_analysis.feature` — GCIA: análisis de tráfico, logs, malware, reporte
- `11_giac_gcfa_forensic_analysis.feature` — GCFA: adquisición, sistemas de archivos, memoria, registro
- `12_giac_gwapt_web_application_pentesting.feature` — GWAPT: reconocimiento web, inyección, lógica, reporte
- `13_giac_gslc_security_leadership.feature` — GSLC: estrategia, programa, comunicación, cultura

**GIAC Advanced (8 features):**
- `14_giac_grem_reverse_engineering_malware.feature` — GREM: análisis estático/dinámico, ingeniería inversa, clasificación
- `15_giac_gnfa_network_forensics.feature` — GNFA: captura, análisis de protocolos, exfiltración, reporte
- `16_giac_gosint_open_source_intelligence.feature` — GOSINT: técnicas OSINT, correlación, OSINT defensivo
- `17_giac_gicsp_industrial_cyber_security.feature` — GICSP: dispositivos IoT médico, sistemas de control, protocolos ICS
- `18_giac_gcsa_cloud_security_automation.feature` — GCSA: IaC, Kubernetes, SOAR, automatización
- `19_giac_gweb_web_application_defense.feature` — GWEB: WAF, defensa contra inyección, monitoreo
- `20_giac_gcle_cyber_law_essentials.feature` — GCLE: marco legal mexicano, responsabilidades, investigación
- `21_giac_gwsp_wireless_security.feature` — GWSP: auditoría WiFi, WPA3, detección de ataques

**GIAC Specialized Healthcare (7 features):**
- `22_giac_gcwn_windows_security.feature` — GCWN: Active Directory, hardening Windows, herramientas nativas
- `23_giac_gunn_unix_security.feature` — GUNN: hardening Linux, control de acceso, monitoreo
- `24_giac_gapt_advanced_pentesting.feature` — GAPT: explotación 0-days, pivoting avanzado, exfiltración
- `25_giac_gcti_cyber_threat_intelligence.feature` — GCTI: fuentes avanzadas, actores de amenaza, inteligencia accionable
- `26_giac_gxpn_exploit_development.feature` — GXPN: fuzzing, desarrollo de exploits, bypass de defensas
- `27_giac_gcid_cloud_security_design.feature` — GClD: arquitectura zero trust cloud, controles nativos, compliance
- `28_giac_gsoc_security_operations_center.feature` — GSOC: diseño SOC, procesos 24/7, métricas, mejora continua

### Impacto en métricas
- Feature files: 402 → 430 (+28)
- Escenarios: 2,555 → 2,672 (+117)
- Categorías: 51 → 52 (+1)
- SANS/GIAC: nueva categoría con 28 features

---

## v1.6.0 (2024-09-22) — Profundización ISC2/CISSP

### Profundización de categoría ISC2/CISSP (28 → 40 features)

**Nuevos features (12):**

**Domain 1 - Security & Risk Management:**
- `29_risk_assessment_methodology.feature` — ALE, costo-beneficio, factor de exposición, evaluación cualitativa
- `30_security_policy_lifecycle.feature` — Ciclo de vida de políticas, excepciones, cumplimiento medido

**Domain 2 - Asset Security:**
- `31_data_lifecycle_management.feature` — Clasificación, almacenamiento, procesamiento, transferencia, archivo, eliminación
- `32_data_masking_tokenization_dlp.feature` — Enmascaramiento UI/BD, tokenización, DLP endpoint/red, watermarking

**Domain 3 - Security Architecture:**
- `33_hsm_certificate_management.feature` — HSM para operaciones críticas, PKI, cadenas de confianza, ciclos de certificados

**Domain 4 - Communication & Network:**
- `34_secure_communications.feature` — Email cifrado (S/MIME, SPF/DKIM/DMARC), VoIP seguro, mTLS entre servicios

**Domain 5 - IAM:**
- `35_privileged_access_management.feature` — Inventario cuentas privilegiadas, grabación de sesiones, JIT access
- `36_federation_sso_directory.feature` — SSO (SAML/OIDC), federación, seguridad de directorios, mTLS

**Domain 6 - Security Assessment:**
- `37_log_review_monitoring.feature` — Fuentes de log, protección, revisión manual/automatizada, retención

**Domain 7 - Security Operations:**
- `38_configuration_change_management.feature` — Baselines, control de cambios, gestión de parches, auditoría
- `39_media_protection_storage.feature` — Clasificación de medios, transporte seguro, eliminación, USB, cloud
- `40_access_review_certification.feature` — Revisiones trimestrales, certificación, accesos fantasma, SOD

### Estado final ISC2/CISSP: 40 features

| Dominio | Features | Cobertura |
|---|---|---|
| D1: Security & Risk Mgmt | 5 | Gobernanza, cumplimiento, ética, evaluación riesgos, políticas |
| D2: Asset Security | 4 | Clasificación, privacidad, ciclo vida datos, enmascaramiento/tokenización/DLP |
| D3: Security Architecture | 5 | Modelos, criptografía, física, implementación cripto, HSM/certificados |
| D4: Communication & Network | 4 | Red, app/web, Zero Trust, comunicaciones seguras |
| D5: IAM | 4 | Identidades, cifrado/anonimización, PAM, federación/SSO |
| D6: Security Assessment | 3 | Evaluación, vulnerabilidades, logs |
| D7: Security Operations | 8 | Operaciones, BC/DR, incidentes, endpoints, monitoreo, config, medios, accesos |
| D8: Software Dev Security | 7 | SDLC, cloud, capacitación, supply chain, mobile, BD, métricas |

### Impacto en métricas
- Feature files: 390 → 402 (+12)
- Escenarios: 2,485 → 2,555 (+70)
- ISC2/CISSP features: 28 → 40

---

## v1.5.0 (2024-09-22) — Integración ISC2/CISSP

### Nueva categoría: ISC2/CISSP — 28 features

**Dominio 1: Security and Risk Management (3 features):**
- `01_security_governance_risk_management.feature` — Políticas, gestión de riesgos, controles, métricas
- `02_compliance_legal_regulatory.feature` — Marco regulatorio mexicano (LFPDPPP, NOM-004, NOM-024), privacidad, ARCO
- `03_professional_ethics.feature` — Código de ética ISC2, dilemas éticos, conflictos de interés

**Dominio 2: Asset Security (2 features):**
- `04_asset_security.feature` — Clasificación de datos, ciclo de vida, propiedad, protección en tránsito
- `15_data_protection_privacy.feature` — Datos sensibles, consentimiento, transferencias, brechas

**Dominio 3: Security Architecture and Engineering (4 features):**
- `05_security_architecture_engineering.feature` — Modelos de seguridad, principios de diseño, defensa en profundidad
- `06_cryptography_key_management.feature` — Cifrado simétrico/asimétrico, hash, gestión de claves, firmas digitales
- `12_physical_security.feature` — Control de acceso físico, CCTV, ambiental, medios
- `22_cryptography_implementation.feature` — SQLite cifrado, TLS, sync offline, firma de recetas

**Dominio 4: Communication and Network Security (3 features):**
- `07_network_security.feature` — Segmentación, firewalls, protocolos seguros, IDS/IPS, WiFi, VPN
- `23_application_web_security.feature` — Validación de entrada, sesiones, XSS, CSRF, seguridad de APIs
- `27_zero_trust_architecture.feature` — Microsegmentación, verificación continua, acceso basado en contexto

**Dominio 5: Identity and Access Management (2 features):**
- `08_identity_access_management.feature` — Ciclo de vida de identidades, MFA, RBAC, segregación, monitoreo
- `26_data_encryption_anonymization.feature` — Cifrado por clase, anonimización, pseudonimización, enmascaramiento

**Dominio 6: Security Assessment and Testing (2 features):**
- `09_security_assessment_testing.feature` — Vulnerabilidades, pentest, auditorías, SAST/DAST
- `24_vulnerability_management.feature` — Escaneo automatizado, priorización, remediación, métricas

**Dominio 7: Security Operations (5 features):**
- `10_security_operations.feature` — SIEM, parches, hardening, respuesta a incidentes, forense
- `13_business_continuity_disaster_recovery.feature` — BIA, BCP, DR, pruebas, sitio alternativo
- `14_incident_response.feature` — CSIRT, clasificación, contención, forense, post-mortem
- `17_endpoint_security.feature` — Hardening, parches, BYOD, IoT médico
- `20_security_monitoring_analytics.feature` — SIEM, threat hunting, métricas SOC, herramientas forenses

**Dominio 8: Software Development Security (5 features):**
- `11_software_development_security.feature` — SDLC seguro, coding, OWASP Top 10, DevSecOps
- `16_cloud_security.feature` — Shared responsibility, cifrado cloud, IAM cloud, contenedores
- `18_security_awareness_training.feature` — Capacitación inicial/anual, concienciación, phishing simulado
- `19_supply_chain_risk_management.feature` — Due diligence proveedores, cláusulas, cadena de suministro
- `21_mobile_application_security.feature` — Desarrollo móvil seguro, MDM, TLS, publicación
- `25_database_security.feature` — Acceso a BD, cifrado, integridad, backups seguros
- `28_security_program_metrics.feature` — Scorecard de seguridad, benchmarking, madurez, ROI

### Impacto en métricas
- Feature files: 362 → 390 (+28)
- Escenarios: 2,331 → 2,485 (+154)
- Categorías: 50 → 51 (+1)
- ISC2/CISSP: nueva categoría con 28 features

---

## v1.4.0 (2024-09-22) — Completación ISACA

### Completación de categoría ISACA (22 → 28 features)

**Nuevos features (6):**
- `06_cobit_data_governance.feature` — GOV03/AED12: gobernanza de datos, calidad, ciclo de vida, integridad
- `07_cobit_investment_management.feature` — GOV06: ROI, VAN, portafolio, seguimiento financiero
- `10_cisa_operations_resilience.feature` — Dominio 4: monitoreo operativo, resiliencia, BIA, capacidad
- `12_crisc_risk_assessment.feature` — Dominio 2: ALE, costo-beneficio de controles, riesgos de terceros
- `13_crisc_monitoring_reporting.feature` — Dominio 4: KRIs, dashboard real-time, alertas, reportes automáticos
- `11_cgeit_it_resources.feature` — Dominio 2: recursos humanos, infraestructura, licencias, datos, capacidad

### Estado final ISACA: 28 features

| Framework | Features | Cobertura |
|---|---|---|
| COBIT 2019 | 7 | Gobierno, riesgos, desempeño, diseño, AED, datos, inversiones |
| CISA | 5 | Auditoría, adquisición/desarrollo, activos, procesos negocio, resiliencia |
| CISM | 5 | Gobernanza seguridad, riesgos, programa dev/gestión, incidentes |
| CRISC | 6 | Gestión, identificación, respuesta, controles, evaluación, monitoreo/reportes |
| CGEIT | 5 | Gobierno, benefits, riesgos, recursos (optimización + gestión) |

### Impacto en métricas
- Feature files: 356 → 362 (+6)
- Escenarios: 2,295 → 2,331 (+36)
- ISACA features: 22 → 28

---

## v1.3.0 (2024-09-22) — Profundización ISACA

### Profundización de categoría ISACA (10 → 22 features)

**COBIT 2019 (5 features):**
- `01_cobit_governance_framework.feature` — 5 objetivos, 40 procesos, alineación TI-negocio
- `02_cobit_risk_management.feature` — Identificación, evaluación, respuesta y monitoreo
- `03_cobit_performance_management.feature` — Niveles de capacidad, KPIs de procesos, benchmarking
- `04_cobit_design_factors.feature` — Factores de diseño, personalización para hospital rural
- `05_cobit_aed_processes.feature` — Procesos AED críticos: seguridad, operaciones, continuidad, cambio, configuración

**CISA (4 features):**
- `06_cisa_audit_methodology.feature` — Planificación, ITGC, controles de aplicación, hallazgos, informes
- `07_cisa_is_acquisition_development.feature` — Adquisición, desarrollo, pruebas, implementación, post-implementación
- `08_cisa_asset_protection_continuity.feature` — Clasificación de activos, protección, continuidad, DR
- `09_cisa_business_processes_it.feature` — Mapa de procesos, alineación TI-procesos, controles por proceso

**CISM (5 features):**
- `04_cism_security_governance.feature` — Estrategia, programa, métricas, clasificación de datos, IAM
- `05_cism_risk_management.feature` — Evaluación de riesgos, amenazas del sector salud, respuesta
- `08_cism_security_program_development.feature` — Desarrollo del programa, roadmap, controles, presupuesto
- `09_cism_security_program_management.feature` — Gestión con métricas, reportes, optimización, mejora continua
- `09_cism_incident_management.feature` — Detección (IoCs), respuesta (P1-P4), forense, post-mortem

**CRISC (4 features):**
- `06_crisc_risk_management.feature` — Evaluación cuantitativa/cualitativa, tratamiento, monitoreo
- `07_crisc_risk_identification.feature` — Fuentes de riesgo, técnicas de identificación, registro, causa raíz
- `08_crisc_risk_response_mitigation.feature` — Estrategias de respuesta, planes de mitigación, riesgo residual
- `10_crisc_controls_monitoring.feature` — Inventario de controles, evidencia, efectividad, monitoreo

**CGEIT (4 features):**
- `07_cgeit_it_governance.feature` — Marco de gobernanza, portafolio, BSC
- `08_cgeit_benefits_realization.feature` — Definición de beneficios, tracking, realización parcial
- `09_cgeit_risk_optimization.feature` — Apetito de riesgo, optimización de portafolio
- `10_cgeit_resource_optimization.feature` — Inventario de recursos, priorización, talento, costos, proveedores

### Impacto en métricas
- Feature files: 344 → 356 (+12)
- Escenarios: 2,231 → 2,295 (+64)
- ISACA features: 10 → 22

---

## v1.2.0 (2024-09-22) — Integración ISACA

---

## v1.1.0-rc.1 (2024-09-21) — Release Candidate

### Cierre de Release Candidate

**Estado:** Repositorio listo para revisión como base de especificación de GHE-v1.

**Métricas verificadas (comandos de sistema):**
- 334 feature files Gherkin (`find ... | wc -l`)
- 2,157 escenarios (`grep -c "Escenario" ... | awk`)
- 28,968 líneas en features (`wc -l`)
- 49 categorías de dominio (100% con 2+ features)
- 72 commits (`git log --oneline | wc -l`)

**Cambios en esta versión:**
- README.md actualizado con métricas verificadas y estructura de 49 categorías
- CHANGELOG.md actualizado con cierre de milestones 1, 2 y 3
- CONTRIBUTING.md completado con guías de contribución, convenciones y checklist de revisión
- Licencia MIT verificada con excepción para salud pública
- 18 features nuevos (7 profundización + 11 hardening)
- 0 gaps de cobertura restantes

**Alcance:**
- Este repositorio es una **especificación**, no una implementación funcional
- No contiene código Clojure ni lógica de negocio
- Sirve como base de requisitos y validación para GHE-v1

---

## v1.1.0 (2024-09-21)

### Profundización de Categorías — Milestone 1+2

**7 archivos nuevos en Phase 1 (cierro de gaps):**
- `imaging_workflows/02_radiation_safety_dosimetry.feature` — Seguridad radiológica, dosimetría, protección de embarazadas
- `imaging_workflows/03_quality_assurance_imaging.feature` — QA por modalidad (RX, US, TAC), reacción a contraste
- `quality_compliance/02_audit_trail_integrity.feature` — Trazabilidad inmutable, retención de logs, detección de anomalías
- `quality_compliance/03_regulatory_submission.feature` — SUIVE, NOM-007, COFEPRIS, CFDI fiscal
- `iso_13485/01_quality_management_system.feature` — SGQ: control de documentos, revisión por dirección, recursos
- `iso_13485/02_design_controls.feature` — Entradas/salidas de diseño, verificación, validación, design transfer
- `iso_13485/03_CAPA_corrective_preventive.feature` — CAPA: causa raíz, efectividad, ciclo de vida, escalamiento

**11 archivos nuevos en Phase 2 (hardening de calidad):**
- `surgery/04_surgical_checklist_by_type.feature` — Checklists por tipo: cesárea, histerectomía, cardíaca, count quirúrgico
- `security/05_penetration_testing_advanced.feature` — Pentesting avanzado: BOLA, SSRF, deserialización, phishing, replay attacks
- `medical_calculations/06_edge_cases_boundary.feature` — Edge cases: IMC extremo, TFG pediátrica, GCS incompleto, APACHE incompleto
- `secure_by_design/08_invariants_monitoring.feature` — Invariantes PHI, TLS, sesiones, privilegios, SAST/DAST en CI/CD
- `emergency_response/03_disaster_protocols.feature` — Protocolos por tipo: sismo, inundación, incendio, epidemia, emergencia dual
- `resilience/03_circuit_breaker_patterns.feature` — Circuit breaker, bulkhead, retry con backoff, degradación graceful, health checks
- `financial_management/03_inventory_accounting.feature` — Costo por paciente, valoración de inventario, facturación a aseguradoras
- `integration/03_legacy_adt_hl7v2.feature` — ADT A01/A03/A08, validación HL7v2, ORU, catálogos, tolerancia a fallos
- `disaster_recovery/03_ransomware_scenarios.feature` — Detección de ransomware, contención, recuperación desde backup, RTO
- `incident_response/03_post_mortem_playbooks.feature` — Post-mortem obligatorio, playbooks de fallo DB/auth/conectividad, lecciones
- `performance/03_offline_sync_benchmarks.feature` — Benchmarks sync 2G/WiFi, cola prioritaria, compresión, métricas

### Categorías ahora con 3+ features (antes tenían 1)
- imaging_workflows: 1 → 3
- quality_compliance: 1 → 3
- iso_13485: 0 → 3 (nueva)

### Categorías con hardening (antes 2-3, ahora 3-4)
- surgery: 3 → 4
- security: 12 → 13
- medical_calculations: 5 → 6
- secure_by_design: 7 → 8
- emergency_response: 2 → 3
- resilience: 2 → 3
- financial_management: 2 → 3
- integration: 2 → 3
- disaster_recovery: 2 → 3
- incident_response: 2 → 3
- performance: 2 → 3

---

## v1.0.0 (2024-09-19)

### Documentación de Estandarización
- Documentación completa del proyecto GHE
- Misión y responsabilidad social
- Análisis competitivo

### Templates de Ingeniería de Software
- SWEBOK (12 áreas de conocimiento)
- PMBOK (10 áreas de gestión)
- SOLID (5 principios de diseño)
- Arquitectura Hexagonal (6 componentes)
- OWASP Top 10 + ASVS (11 workflows)
- TDD (7 prácticas)
- Secure by Design (7 componentes)
- Offline-First (7 componentes)
- GUIX User First (8 componentes)
- Spec Driven Design (7 componentes)
- Deuda Técnica (6 componentes)
- Anti-Patrones (4 workflows incluyendo CRAP Index)
- Cap Theorem (3 componentes)
- HL7 FHIR R4 (1 workflow)
- CI/CD Pipeline (1 workflow)
- Code Review (1 workflow)
- Disaster Recovery (1 workflow)
- Domain Events (1 workflow)
- Performance Engineering (1 workflow)
- Incident Response (1 workflow)
- ISO 13485 (1 workflow)
- ISO 14971 (1 workflow)

### Especialidades Médicas (20 workflows)
- Urgencias, Cirugía, Pediatría, Medicina Interna
- Cardiología, Neurología, Ginecología, Psiquiatría
- Laboratorio, Imagenología, Nutrición, Rehabilitación
- Odontología, Referencia, Enfermedades Crónicas
- Obstetricia, Farmacia, Triaje, Receta, Registro

### Módulo de Maternidad (34 workflows)
- 5 Capas de Valor: Validación, Guías, Patrones, Predicción, Aprendizaje
- 10 Propuestas de Valor con flujos Gherkin
- Ciclo completo: Pre-embarazo → Embarazo → Parto → Posparto → Neonato → 5 años
- Emergencia Dual (madre + feto)
- Vademécum obstétrico completo

### Hospital Completo (24 workflows)
- Ginecología, Cirugía, Hospitalización
- Anestesiología, Laboratorio, Imagenología
- Cocina/Dieta, Limpieza, Lavandería
- Administración, RRHH, Contabilidad
- Farmacia completa, Mantenimiento, Almacén

### Clinical Safety (6 workflows)
- Never Events, Sentinel Events, RCA
- Clinical Workflows (triaje, SBAR, 5 correctos)
- Staff Competency, Quality Improvement
- Supply Chain, Patient Experience

### Propuestas de Valor
- 25+ propuestas transformadoras
- 7 dimensiones de valor
- Roadmap de expansión

### Análisis
- Análisis de alcance completo
- Análisis de vacíos
- GAP analysis de ciclo materno-infantil

### Estándares
- Coding Standards
- Security Standards
- Data Standards
