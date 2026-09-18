# language: es
# OWASP Top 10 - A08: Software and Data Integrity Failures
# Fallos de integridad de software y datos
Característica: A08 - Fallos de Integridad (OWASP Top 10)
  Como responsable de seguridad del proyecto GHE
  Quiero garantizar integridad de software y datos
  Para prevenir manipulación y corrupción

  # ─────────────────────────────────────────────────────────────
  # 1. INTEGRIDAD DE CÓDIGO
  # ─────────────────────────────────────────────────────────────

  Escenario: Verificación de integridad de código
    Dado que se verifica integridad del código fuente
    Cuando se ejecuta verificación
    Entonces:
      | Verificación               | Estado    |
      | Código en control de versiones | ✅     |
      | Commits firmados           | ⚠️ Pendiente |
      | Branch protegido (main)    | ✅         |
      | Code review requerido      | ✅         |
      | CI/CD pipeline             | ✅         |
      | Tests pasan antes de merge | ✅         |

  Escenario: Verificación de integridad de builds
    Dado que se genera build de producción
    Cuando se verifica build
    Entonces:
      | Verificación               | Estado    |
      | Build determinista         | ✅         |
      | Dependencies lockfile      | ✅         |
      | Build reproducible         | ✅         |
      | Checksum del build         | ⚠️ Pendiente |
      | Artefacto firmado          | ⚠️ Pendiente |

  # ─────────────────────────────────────────────────────────────
  # 2. INTEGRIDAD DE DATOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Integridad de expedientes clínicos
    Dado que se almacenan expedientes clínicos
    Cuando se guarda un registro
    Entonces:
      | Verificación               | Estado    |
      | Hash SHA-256 por registro  | ✅         |
      | Timestamp inmutable        | ✅         |
      | Registro no modificable después de firma | ✅ |
      | Audit trail de cambios     | ✅         |

  Escenario: Verificación de integridad de audit log
    Dado que se genera log de auditoría
    Cuando se registra una acción
    Entonces:
      | Verificación               | Estado    |
      | Hash SHA-256 del registro  | ✅         |
      | Hash encadenado (chain)    | ⚠️ Pendiente |
      | Registro inmutable         | ✅         |
      | Verificación periódica     | ⚠️ Pendiente |

  Escenario: Integridad de recetas médicas
    Dado que se firman recetas médicas
    Cuando se genera receta
    Entonces:
      | Verificación               | Estado    |
      | Firma electrónica del médico | ✅      |
      | Timestamp de firma         | ✅         |
      | Hash de integridad         | ✅         |
      | No modificable después de firma | ✅   |

  # ─────────────────────────────────────────────────────────────
  # 3. INTEGRIDAD DE UPDATES
  # ─────────────────────────────────────────────────────────────

  Escenario: Integridad en actualizaciones
    Dado que se distribuye una actualización
    Cuando se instala
    Entonces:
      | Verificación               | Estado    |
      | Checksum verificado        | ⚠️ Pendiente |
      | Firma digital verificada   | ⚠️ Pendiente |
      | Descarga por HTTPS         | ✅         |
      | Origen verificado          | ⚠️ Pendiente |
  