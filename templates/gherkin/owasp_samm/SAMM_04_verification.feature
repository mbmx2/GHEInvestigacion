# language: es
# @id GHE-SAMM-VERIF-001
# @type compliance
# @domain security
# @layer development
# @risk s1
# @owner qa-lead
# @status proposed
# @requirement SAMM-VERIFICATION
# @risk-control CTRL-SAMM-VERIF
# @regulation NOM-024
@domain:security @type:compliance @risk:s1 @status:proposed
Característica: SAMM Verification - Assessments, Testing y Penetration Testing
  Como responsable de QA del proyecto GHE
  Quiero verificación completa de seguridad
  Para que cada release sea seguro antes de producir

  # ─────────────────────────────────────────────────────────────
  # PRÁCTICA 1: Evaluación de Arquitectura
  # ─────────────────────────────────────────────────────────────

  Regla: La arquitectura se evalúa contra requisitos de seguridad

    Escenario: Evaluación periódica de arquitectura
      Dado que se evalúa arquitectura
      Cuando se verifica
      Entonces:
        | Verificación              | Frecuencia |
        | ADRs actualizados         | Trimestral |
        | Segregación de componentes| Trimestral |
        | Dependencias de seguridad | Mensual    |
      # @evidence EVID-SAMM-VERIF-001

  # ─────────────────────────────────────────────────────────────
  # PRÁCTICA 2: Testing guiado por requisitos
  # ─────────────────────────────────────────────────────────────

  Regla: Cada requisito de seguridad tiene test asociado

    Escenario: Trazabilidad requisito-test
      Dado que se tiene un requisito de seguridad
      Cuando se verifica
      Entonces tiene al menos 1 test asociado
      Y el test es ejecutado en CI/CD
      # @evidence EVID-SAMM-VERIF-002

    Escenario: Cobertura de testing de seguridad
      Dado que se evalúa cobertura
      Cuando se mide
      Entonces:
        | Requisito de seguridad    | Test asociado | Cobertura |
        | Autenticación             | Sí            | 100%     |
        | Cifrado                   | Sí            | 100%     |
        | Validación                | Sí            | 100%     |
        | Logging                   | Sí            | 100%     |
        | RBAC                      | Sí            | 100%     |

  # ─────────────────────────────────────────────────────────────
  # PRÁCTICA 3: Security Testing
  # ─────────────────────────────────────────────────────────────

  Regla: Se ejecutan pruebas de seguridad automatizadas

    Escenario: SAST en CI/CD
      Dado que se ejecuta pipeline
      Cuando se ejecuta SAST
      Entonces se verifica:
        | Herramienta               | Resultado |
        | Análisis estático         | 0 vulnerabilidades críticas |
        | Dependency check          | 0 CVEs críticos |
      # @evidence EVID-SAMM-VERIF-003

    Escenario: DAST periódico
      Dado que se ejecuta DAST
      Cuando se completa
      Entonces:
        | Herramienta               | Resultado |
        | OWASP ZAP                 | 0 High, 0 Critical |
        | Burp Suite (si aplica)    | Sin hallazgos críticos |

    Escenario: Pentest semestral
      Dado que se ejecuta penetración
      Cuando se completa
      Entonces se genera reporte con:
        | Sección                   |
        | Vulnerabilidades encontradas |
        | Severidad de cada una     |
        | Remediación aplicada      |
        | Estado actual             |

  # ─────────────────────────────────────────────────────────────
  # PRÁCTICA 4: Revisión de código
  # ─────────────────────────────────────────────────────────────

  Regla: Todo código de seguridad pasa por review

    Escenario: Code review de seguridad
      Dado que se modifica componente de seguridad
      Cuando se revisa
      Entonces:
        | Criterio                   | Estado |
        | Review por security-lead  | ✅      |
        | Análisis de impacto       | ✅      |
        | Tests de regresión       | ✅      |
        | Documentación actualizada| ✅      |
