# Contrato Interno del Proyecto GHE

**Versión:** 1.0.0
**Fecha:** 2026-09-21
**Referencia:** PROJECT_CHARTER.md, ADR-001 a ADR-007

---

## 1. Propósito

Este documento establece los compromisos mutuos entre todas las partes involucradas en el proyecto GHE. Es un contrato interno de gobernanza que vincula a director médico, director de TI, equipo técnico, equipo clínico y patrocinador.

---

## 2. Compromisos del Patrocinador (Maternidad de Altotonga)

| # | Compromiso | Criterio de verificación |
|---|---|---|
| 1 | Proveer espacio físico para operación del sistema | Espacio asignado |
| 2 | Designar personal clave (director médico, administrador) | Nombres documentados |
| 3 | Participar en revisiones trimestrales | Actas de reunión |
| 4 | Aprobar cambios de alcance significativos | Firmas en actas |
| 5 | Proveer acceso a datos históricos | Acceso otorgado |
| 6 | Facilitar capacitación del equipo | Horas de capacitación |

---

## 3. Compromisos del Equipo Técnico

| # | Compromiso | Criterio de verificación |
|---|---|---|
| 1 | Cumplir IEC 62304 Clase C | Paquete documental completo |
| 2 | Cumplir NOM-024 | Expediente ante DGIS |
| 3 | 100% offline-first | Prueba sin internet |
| 4 | >85% cobertura de tests | Reporte de cobertura |
| 5 | Seguridad OWASP ASVS Nivel 2 | Pentest aprobado |
| 6 | Documentar cada decisión (ADR) | ADRs actualizados |
| 7 | Responder incidencias S1 en <1 hora | Log de respuesta |
| 8 | Mantener changelog completo | CHANGELOG actualizado |

---

## 4. Compromisos del Equipo Clínico

| # | Compromiso | Criterio de verificación |
|---|---|---|
| 1 | Validar workflows clínicos | Firma de validación |
| 2 | Revisar cálculos médicos | Verificación matemática |
| 3 | Definir protocolos de emergencia | Protocolos documentados |
| 4 | Validar vademécum obstétrico | Medicamentos verificados |
| 5 | Participar en piloto | Horas de participación |
| 6 | Reportar problemas clínicos | Tickets registrados |

---

## 5. Compromisos de QA y Compliance

| # | Compromiso | Criterio de verificación |
|---|---|---|
| 1 | Ejecutar validaciones automáticas | validate_features.sh pasa |
| 2 | Mantener matriz de trazabilidad | Trazabilidad completa |
| 3 | Ejecutar pentest semestral | Reporte de pentest |
| 4 | Mantener documentación normativa | Docs actualizados |
| 5 | Reportar métricas mensuales | Dashboard actualizado |

---

## 6. Criterios de Aceptación por Entregable

| Entregable | Criterio de aceptación |
|---|---|
| Feature Gherkin | Tags completos, Regla:, escenarios pos+neg, @evidence |
| Documento de compliance | Referencia a norma, checklist, evidencia |
| ADR | Contexto, decisión, consecuencias, alternativas |
| Código | Tests >85%, code review, análisis estático |
| Roadmap | Cada feature asignado a fase, responsables definidos |

---

## 7. Definition of Done

Una feature está "Done" cuando:
- [ ] Tiene ID estable
- [ ] Tiene tags completos (@id, @type, @domain, @risk, @owner, @status)
- [ ] Tiene Regla: con escenarios positivos y negativos
- [ ] Tiene @evidence en cada escenario
- [ ] Tiene @requirement asociado a norma
- [ ] Está asignada a fase del roadmap
- [ ] No tiene decisiones pendientes
- [ ] Pasa validación automática (validate_features.sh)

---

## 8. Reglas de Evidencia

| Tipo de evidencia | Formato | Conservación |
|---|---|---|
| Código fuente | Git | Indefinido |
| Tests | Git + CI/CD | Indefinido |
| Features Gherkin | Git | Indefinido |
| Documentos | Git | Indefinido |
| Pentest | PDF + Git | 5 años |
| Auditoría | Actas + Git | 10 años |
| Aprobaciones | Firmas + Git | Indefinido |

---

## 9. Gestión de Cambios

| Tipo de cambio | Proceso |
|---|---|
| Feature nuevo | Ticket → Revisión → Aprobación → Implementación |
| Cambio de alcance | Solicitud → Análisis impacto → Aprobación del patrocinador |
| Cambio normativo | Evaluación → Impacto → Adaptación |
| Bug crítico | Inmediato → Hotfix → Verificación |

---

## 10. Escalamiento de Bloqueos

| Nivel | Bloqueo | Acción |
|---|---|---|
| 1 | Duda técnica | Tech lead resuelve |
| 2 | Decisión clínica | Director médico decide |
| 3 | Decisión presupuestal | Patrocinador decide |
| 4 | Conflictos interpersonales | Mediación directiva |

---

## 11. Condiciones de Suspensión

El proyecto se suspende si:
- El patrocinador retira soporte
- Se detecta un incidente de seguridad grave no remediado
- Los recursos humanos clave no están disponibles por >1 mes
- El presupuesto se agota sin posibilidad de reposición

---

## 12. Aprobación

| Rol | Nombre | Firma | Fecha |
|---|---|---|---|
| Director del proyecto | | | |
| Director médico | | | |
| Director de TI | | | |
| Patrocinador | | | |

---

## Referencias

- PROJECT_CHARTER.md
- ADR-001 a ADR-007
- docs/compliance/IEC62304_CLASS_C.md
- docs/PLAN/ROADMAP.md
