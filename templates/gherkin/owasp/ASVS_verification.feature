# language: es
# OWASP ASVS - Application Security Verification Standard
@status:proposed
@type:acceptance
@domain:general
# Estándar de verificación de seguridad de aplicaciones
Característica: OWASP ASVS - Verificación de Seguridad (GHE)
  Como responsable de seguridad del proyecto GHE
  Quiero verificar seguridad según ASVS
  Para alcanzar nivel de seguridad verificable

  # ─────────────────────────────────────────────────────────────
  # 1. ARQUITECTURA DE SEGURIDAD (V1)
  # ─────────────────────────────────────────────────────────────

  Escenario: Verificación de arquitectura de seguridad
    Dado que se verifica arquitectura según ASVS V1
    Cuando se evalúa
    Entonces:
      | Requisito ASVS             | Estado    |
      | V1.1: Definir requisitos de seguridad | ✅ |
      | V1.2: Arquitectura de seguridad documentada | ✅ |
      | V1.3: Threat modeling      | ✅         |
      | V1.4: Control de seguridad en diseño | ✅ |
      | V1.5: Validación de diseño | ⚠️ Pendiente |

  # ─────────────────────────────────────────────────────────────
  # 2. GESTIÓN DE AUTENTICACIÓN (V2)
  # ─────────────────────────────────────────────────────────────

  Escenario: Verificación de autenticación
    Dado que se verifica autenticación según ASVS V2
    Cuando se evalúa
    Entonces:
      | Requisito ASVS             | Estado    |
      | V2.1: Controls de autenticación | ✅    |
      | V2.2: Autenticación general | ✅        |
      | V2.3: Autenticación de factor múltiple | ⚠️ Futuro |
      | V2.4: Gestión de credenciales | ✅      |
      | V2.5: Gestión de credenciales externas | N/A |
      | V2.6: Autenticación fuera de banda | N/A |

  # ─────────────────────────────────────────────────────────────
  # 3. GESTIÓN DE SESIONES (V3)
  # ─────────────────────────────────────────────────────────────

  Escenario: Verificación de sesiones
    Dado que se verifica gestión de sesiones según ASVS V3
    Cuando se evalúa
    Entonces:
      | Requisito ASVS             | Estado    |
      | V3.1: Gestión de sesiones   | ✅        |
      | V3.2: Eliminación de sesiones | ✅      |
      | V3.3: Tokens de sesión      | ✅        |

  # ─────────────────────────────────────────────────────────────
  # 4. CONTROLES DE ACCESO (V4)
  # ─────────────────────────────────────────────────────────────

  Escenario: Verificación de control de acceso
    Dado que se verifica control de acceso según ASVS V4
    Cuando se evalúa
    Entonces:
      | Requisito ASVS             | Estado    |
      | V4.1: Control de acceso principios | ✅ |
      | V4.2: Control de acceso basado en datos | ✅ |
      | V4.3: Control de acceso basado en procesos | ✅ |
      | V4.4: Control de acceso basado en funciones | ✅ |
      | V4.5: Control de acceso multi-tenancy | N/A |
      | V4.6: Otros controles de acceso | ⚠️ Pendiente |

  # ─────────────────────────────────────────────────────────────
  # 5. VALIDACIÓN, CODIFICACIÓN Y MANEJO DE DATOS (V5)
  # ─────────────────────────────────────────────────────────────

  Escenario: Verificación de validación de datos
    Dado que se verifica validación según ASVS V5
    Cuando se evalúa
    Entonces:
      | Requisito ASVS             | Estado    |
      | V5.1: Validación de input   | ✅        |
      | V5.2: Codificación de output| ✅        |
      | V5.3: Protección contra inyección | ✅ |
      | V5.4: Uso de mecanismos de protección | ✅ |
      | V5.5: Protección multi-tenant | N/A     |
      | V5.6: Uso de controles de integridad | ✅ |
      | V5.7: Uso de controles de procesamiento | ✅ |

  # ─────────────────────────────────────────────────────────────
  # 6. CRIPTOGRAFÍA (V6)
  # ─────────────────────────────────────────────────────────────

  Escenario: Verificación de criptografía
    Dado que se verifica criptografía según ASVS V6
    Cuando se evalúa
    Entonces:
      | Requisito ASVS             | Estado    |
      | V6.1: Uso de criptografía   | ✅        |
      | V6.2: Algoritmos            | ✅ (AES-256, bcrypt) |
      | V6.3: Gestión de claves     | ⚠️ Pendiente |

  # ─────────────────────────────────────────────────────────────
  # 7. ERRORES Y LOGGING (V7)
  # ─────────────────────────────────────────────────────────────

  Escenario: Verificación de logging
    Dado que se verifica logging según ASVS V7
    Cuando se evalúa
    Entonces:
      | Requisito ASVS             | Estado    |
      | V7.1: Manejo de errores     | ✅        |
      | V7.2: Logging               | ✅        |
      | V7.3: Protección de logs    | ✅        |
      | V7.4: Prevención de inyección en logs | ✅ |

  # ─────────────────────────────────────────────────────────────
  # 8. DATOS SENSIBLES (V8)
  # ─────────────────────────────────────────────────────────────

  Escenario: Verificación de datos sensibles
    Dado que se verifica protección de datos sensibles según ASVS V8
    Cuando se evalúa
    Entonces:
      | Requisito ASVS             | Estado    |
      | V8.1: Identificación de datos sensibles | ✅ |
      | V8.2: Procesamiento de datos sensibles | ✅ |
      | V8.3: Almacenamiento de datos sensibles | ✅ |
      | V8.4: Tránsito de datos sensibles | ✅ |
      | V8.5: Eliminación de datos sensibles | ⚠️ Pendiente |
      | V8.6: Prevención de pérdida de datos | ✅ |
      | V8.7: Datos en美方ового | N/A |

  # ─────────────────────────────────────────────────────────────
  # RESUMEN DE VERIFICACIÓN ASVS
  # ─────────────────────────────────────────────────────────────

  Escenario: Resumen de cumplimiento ASVS
    Dado que se genera resumen de ASVS
    Cuando se calcula progreso
    Entonces:
      | Categoría                  | Total | Cumplidos | %      |
      | V1: Arquitectura           | 5     | 4         | 80%    |
      | V2: Autenticación          | 6     | 4         | 67%    |
      | V3: Sesiones               | 3     | 3         | 100%   |
      | V4: Control de acceso      | 6     | 5         | 83%    |
      | V5: Validación datos       | 7     | 7         | 100%   |
      | V6: Criptografía           | 3     | 2         | 67%    |
      | V7: Errores y logging      | 4     | 4         | 100%   |
      | V8: Datos sensibles        | 7     | 5         | 71%    |
      | **TOTAL**                  | **41**| **34**    | **83%**|
    