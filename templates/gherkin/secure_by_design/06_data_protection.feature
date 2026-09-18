# language: es
# Secure by Design - Data Protection
# PROTECCIÓN DE DATOS: Cifrar, proteger y gestionar datos sensibles
Característica: Protección de Datos (Secure by Design - GHE)
  Como responsable de seguridad del proyecto GHE
  Quiero proteger datos sensibles de pacientes
  Para cumplir LFPDPPP y proteger la privacidad

  # ─────────────────────────────────────────────────────────────
  # 1. CLASIFICACIÓN DE DATOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Clasificación de datos de pacientes
    Dado que se clasifican datos de pacientes
    Cuando se evalúa sensibilidad
    Entonces:
      | Dato                        | Clasificación | Protección |
      | CURP                        | Sensible      | Cifrado + RBAC |
      | Nombre completo             | Sensible      | Cifrado + RBAC |
      | Fecha de nacimiento         | Sensible      | Cifrado + RBAC |
      | Diagnósticos médicos        | Crítico       | Cifrado + RBAC + Audit |
      | Tratamientos                | Crítico       | Cifrado + RBAC + Audit |
      | Alergias                    | Crítico       | Cifrado + RBAC + Audit |
      | Signos vitales              | Sensible      | Cifrado + RBAC |
      | Recetas médicas             | Crítico       | Cifrado + RBAC + Firma |
      | Contacto de emergencia      | Sensible      | Cifrado + RBAC |

  # ─────────────────────────────────────────────────────────────
  # 2. CIFRADO
  # ─────────────────────────────────────────────────────────────

  Escenario: Cifrado en reposo
    Dado que se almacenan datos sensibles
    Cuando se guarda
    Entonces:
      | Capa                       | Método              |
      | SQLite database            | SQLCipher AES-256   |
      | Backups                    | AES-256             |
      | Logs de auditoría          | SHA-256 hash chain  |
      | Archivos temporales        | Cifrado al eliminar |

  Escenario: Cifrado en tránsito
    Dado que se transmiten datos
    Cuando se envían
    Entonces:
      | Canal                      | Protocolo           |
      | Todas las comunicaciones   | TLS 1.3             |
      | Sync con cloud             | HTTPS + certificate pinning |
      | WhatsApp messages          | End-to-end encryption |

  Escenario: Gestión de claves
    Dado que se gestionan claves de cifrado
    Cuando se implementa
    Entonces:
      | Criterio                   | Estado    |
      | Claves no hardcodeadas     | ✅         |
      | Claves en environment vars | ✅         |
      | Claves diferentes por entorno | ✅       |
      | Claves rotadas periódicamente | ⚠️ Futuro |
      | Backup de claves seguro    | ✅         |

  # ─────────────────────────────────────────────────────────────
  # 3. PRIVACIDAD (LFPDPPP)
  # ─────────────────────────────────────────────────────────────

  Escenario: Consentimiento para tratamiento de datos
    Dado que se procesan datos sensibles
    Cuando se solicita consentimiento
    Entonces:
      | Criterio                   | Estado    |
      | Consentimiento explícito   | ✅         |
      | Consentimiento por escrito | ✅ (digital)|
      | Propósito específico       | ✅         |
      | Derecho de oposición       | ✅         |
      | Derecho de acceso          | ✅         |
      | Derecho de rectificación   | ✅         |
      | Derecho de cancelación     | ✅ (soft delete) |
      | Derecho de oposición       | ✅         |

  Escenario: Aviso de privacidad
    Dado que se publica aviso de privacidad
    Cuando se accede al sistema
    Entonces:
      | Contenido                   | Estado    |
      | Responsable del tratamiento| ✅         |
      | Propósito del tratamiento  | ✅         |
      | Derechos ARCO              | ✅         |
      | Canal para ejercer derechos| ✅         |
      | Fecha de última actualización| ✅       |

  # ─────────────────────────────────────────────────────────────
  # 4. RETENCIÓN Y ELIMINACIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Política de retención de datos
    Dado que se define política de retención
    Cuando se gestiona ciclo de vida
    Entonces:
      | Tipo de dato               | Retención | Eliminación |
      | Expediente clínico         | 5 años    | Soft delete |
      | Audit log                  | 10 años   | Nunca       |
      | Consentimientos            | 5 años    | Soft delete |
      | Backups                    | 5 años    | Rotación    |
      | Datos de prueba            | 0 años    | Inmediata   |

  Escenario: Eliminación segura
    Dado que se eliminan datos
    Cuando se ejecuta eliminación
    Entonces:
      | Criterio                   | Estado    |
      | Soft delete (no físico)    | ✅         |
      | Marca de tiempo            | ✅         |
      | Usuario que elimina        | ✅         |
      | Justificación              | ✅         |
      | Auditoría de eliminación   | ✅         |
  