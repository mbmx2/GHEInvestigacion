# language: es
# OWASP Top 10 - A01: Broken Access Control
# El riesgo #1 en seguridad de aplicaciones web
Característica: A01 - Control de Acceso Roto (OWASP Top 10)
  Como responsable de seguridad del proyecto GHE
  Quiero implementar controles de acceso robustos
  Para prevenir acceso no autorizado a datos de pacientes

  # ─────────────────────────────────────────────────────────────
  # 1. AUTORIZACIÓN POR ROLES (RBAC)
  # ─────────────────────────────────────────────────────────────

  Escenario: Verificación de RBAC por módulo
    Dado que el sistema tiene roles definidos
    Cuando se verifica acceso por módulo
    Entonces la matriz de acceso es:
      | Módulo                     | Admin | Doctor | Nurse | Pharmacy | Reception |
      | Ver expediente completo    | ✅    | ✅     | ⚠️    | ❌       | ❌        |
      | Ver datos demográficos     | ✅    | ✅     | ✅    | ✅       | ✅        |
      | Crear consulta             | ❌    | ✅     | ❌    | ❌       | ❌        |
      | Registrar signos vitales   | ❌    | ✅     | ✅    | ❌       | ❌        |
      | Prescribir medicamentos    | ❌    | ✅     | ❌    | ❌       | ❌        |
      | Sur medicamentos           | ❌    | ❌     | ❌    | ✅       | ❌        |
      | Manejar inventario         | ❌    | ❌     | ❌    | ✅       | ❌        |
      | Ver reportes               | ✅    | ⚠️     | ⚠️    | ⚠️       | ❌        |
      | Configurar sistema         | ✅    | ❌     | ❌    | ❌       | ❌        |
      | Ver auditoría              | ✅    | ❌     | ❌    | ❌       | ❌        |

  Escenario: Denegación de acceso no autorizado
    Dado que un usuario con rol "reception" intenta acceder
    Cuando intenta ver expediente completo de paciente
    Entonces el sistema:
      | Acción                     | Resultado            |
      | Verifica rol del usuario   | reception            |
      | Compara con permisos requeridos | doctor needed  |
      | Deniega acceso             | 403 Forbidden        |
      | Registra intento           | Audit log            |

  Escenario: Control de acceso a nivel de registro
    Dado que dos doctores atienden pacientes diferentes
    Cuando el Dr. A intenta ver expediente del paciente del Dr. B
    Entonces el sistema verifica:
      | Verificación               | Estado    |
      | ¿El paciente pertenece al Dr. A? | No  |
      | ¿El Dr. A tiene permiso especial? | No |
      | Acceso denegado            | ✅         |
    Y se registra el intento en auditoría

  # ─────────────────────────────────────────────────────────────
  # 2. PREVENCIÓN DE FORBIDDEN DIRECT OBJECT REFERENCES
  # ─────────────────────────────────────────────────────────────

  Escenario: Protección contra IDOR
    Dado que un paciente tiene ID "patient-123"
    Cuando un usuario no autorizado intenta acceder a /api/patients/patient-456
    Entonces el sistema:
      | Verificación               | Estado    |
      | Valida token del usuario   | ✅         |
      | Verifica permiso sobre patient-456 | ❌ |
      | Retorna 403 Forbidden     | ✅         |
      | No retorna datos del paciente | ✅      |

  Escenario: Protección contra manipulación de IDs
    Dado que un usuario modifica el ID en la URL
    Cuando intenta acceder a otro expediente
    Entonces el sistema:
      | Verificación               | Estado    |
      | Detecta ID modificado      | ✅         |
      | Valida autorización        | ✅         |
      | Deniega acceso             | ✅         |
      | Registra intento sospechoso| ✅         |

  # ─────────────────────────────────────────────────────────────
  # 3. GESTIÓN DE SESIONES
  # ─────────────────────────────────────────────────────────────

  Escenario: Expiración de sesión
    Dado que un usuario tiene sesión activa
    Cuando pasan 30 minutos de inactividad
    Entonces el sistema:
      | Acción                     |
      | Detecta inactividad        |
      | Expira la sesión           |
      | Redirige a login           |
      | Registra logout automático |

  Escenario: Logout seguro
    Dado que un usuario cierra sesión
    Cuando ejecuta logout
    Entonces el sistema:
      | Acción                     |
      | Invalida token            |
      | Elimina sesión            |
      | Limpia cookies            |
      | Registra evento           |
    