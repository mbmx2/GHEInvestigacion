# language: es
# Seguridad de Datos y Privacidad
Característica: Protección de Datos (GHE Security)
  Como oficial de protección de datos del proyecto GHE
  Quiero garantizar la privacidad y seguridad de datos de pacientes
  Para cumplir con LFPDPPP y proteger la información sensible

  # ─────────────────────────────────────────────────────────────
  # 1. CLASIFICACIÓN DE DATOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Clasificación de datos de pacientes
    Dado que se clasifican datos
    Cuando se evalúa sensibilidad
    Entonces:
      | Dato                       | Clasificación | Protección |
      | CURP                       | Sensible      | Cifrado + RBAC |
      | Nombre completo            | Sensible      | Cifrado + RBAC |
      | Fecha de nacimiento        | Sensible      | Cifrado + RBAC |
      | Diagnósticos médicos       | Crítico       | Cifrado + RBAC + Audit |
      | Tratamientos               | Crítico       | Cifrado + RBAC + Audit |
      | Alergias                   | Crítico       | Cifrado + RBAC + Audit |
      | Signos vitales             | Sensible      | Cifrado + RBAC |
      | Recetas médicas            | Crítico       | Cifrado + RBAC + Firma |
      | Datos de contacto          | Sensible      | Cifrado + RBAC |
      | Historial de visitas       | Sensible      | Cifrado + RBAC |

  # ─────────────────────────────────────────────────────────────
  # 2. CONSENTIMIENTO INFORMADO
  # ─────────────────────────────────────────────────────────────

  Escenario: Consentimiento para tratamiento de datos
    Dado que se procesan datos sensibles
    Cuando se solicita consentimiento
    Entonces:
      | Requisito                  | Estado |
      | Consentimiento explícito   | ✅      |
      | Consentimiento por escrito | ✅ (digital) |
      | Propósito específico       | ✅      |
      | Derecho de oposición       | ✅      |
      | Derecho de acceso          | ✅      |
      | Derecho de rectificación   | ✅      |
      | Derecho de cancelación     | ✅ (soft delete) |
      | Derecho de oposición       | ✅      |

  Escenario: Aviso de privacidad
    Dado que se publica aviso de privacidad
    Cuando se accede al sistema
    Entonces incluye:
      | Sección                   |
      | Responsable del tratamiento |
      | Propósito del tratamiento |
      | Derechos ARCO             |
      | Canal para ejercer derechos |
      | Fecha de última actualización |

  # ─────────────────────────────────────────────────────────────
  # 3. DERECHOS ARCO
  # ─────────────────────────────────────────────────────────────

  Escenario: Derecho de acceso
    Dado que un paciente solicita acceso a sus datos
    Cuando se procesa solicitud
    Entonces el sistema:
      | Acción                     |
      | Verificar identidad       |
      | Generar reporte completo  |
      | Entregar en formato legible |
      | Registrar solicitud       |

  Escenario: Derecho de rectificación
    Dado que un paciente solicita corregir datos
    Cuando se procesa solicitud
    Entonces el sistema:
      | Acción                     |
      | Verificar identidad       |
      | Modificar datos           |
      | Registrar cambio          |
      | Notificar a afectados     |

  Escenario: Derecho de cancelación
    Dado que un paciente solicita eliminación
    Cuando se procesa solicitud
    Entonces el sistema:
      | Acción                     |
      | Verificar identidad       |
      | Soft delete               |
      | Registrar eliminación     |
      | Mantener por obligación legal si aplica |

  # ─────────────────────────────────────────────────────────────
  # 4. CIFRADO
  # ─────────────────────────────────────────────────────────────

  Escenario: Cifrado de datos en reposo
    Dado que se almacenan datos
    Cuando se verifica cifrado
    Entonces:
      | Capa                      | Método |
      | SQLite database           | SQLCipher AES-256 |
      | Backups                   | AES-256           |
      | Logs de auditoría         | Hash SHA-256      |
      | Archivos temporales       | Cifrado al eliminar |

  Escenario: Cifrado de datos en tránsito
    Dado que se transmiten datos
    Cuando se verifica
    Entonces:
      | Canal                      | Protocolo |
      | Cliente → Servidor        | HTTPS/TLS 1.3 |
      | Servidor → Cloud          | HTTPS/TLS 1.3 |
      | Sync                       | HTTPS/TLS 1.3 |

  # ─────────────────────────────────────────────────────────────
  # 5. GESTIÓN DE ACCESOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Control de acceso basado en roles
    Dado que se gestiona acceso
    Cuando se verifica
    Entonces:
      | Rol                        | Acceso |
      | Admin                      | Total (con auditoría) |
      | Doctor                     | Expedientes asignados |
      | Nurse                      | Signos vitales, triaje |
      | Pharmacy                   | Recetas, inventario |
      | Reception                  | Datos demográficos |
      | Auditor                    | Solo logs |

  Escenario: Auditoría de accesos
    Dado que se auditan accesos
    Cuando se registra
    Entonces cada acción incluye:
      | Campo                      |
      | User ID                    |
      | Acción                     |
      | Entidad accedida           |
      | Timestamp                  |
      | IP address                 |
      | Hash de integridad         |

  # ─────────────────────────────────────────────────────────────
  # 6. RETENCIÓN Y ELIMINACIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Política de retención
    Dado que se gestiona retención de datos
    Cuando se evalúa
    Entonces:
      | Tipo de dato              | Retención |
      | Expediente clínico        | 5 años    |
      | Audit log                 | 10 años   |
      | Consentimientos           | 5 años    |
      | Backups                   | 5 años    |

  Escenario: Eliminación segura
    Dado que se eliminan datos
    Cuando se ejecuta
    Entonces:
      | Paso                       |
      | Soft delete               |
      | Marca de tiempo           |
      | Usuario que elimina       |
      | Justificación             |
      | Auditoría de eliminación  |

  # ─────────────────────────────────────────────────────────────
  # 7. MONITOREO DE PRIVACIDAD
  # ─────────────────────────────────────────────────────────────

  Escenario: Monitoreo de accesos sospechosos
    Dado que se monitorean accesos
    Cuando se detecta anomalía
    Entonces:
      | Señal                      | Acción |
      | Acceso fuera de horario   | Notificar admin |
      | Múltiples accesos a diferentes pacientes | Investigar |
      | Descarga masiva de datos  | Bloquear + investigar |
      | Acceso desde IP nueva     | Verificar identidad |
  