# language: es
# Secure by Design - Principios Fundamentales
# FILOSOFÍA: La seguridad se integra desde el diseño, no se agrega después
Característica: Principios Fundamentales de Secure by Design (GHE)
  Como arquitecto de seguridad del proyecto GHE
  Quiero integrar seguridad desde el diseño del sistema
  Para prevenir vulnerabilidades antes de que existan

  # ─────────────────────────────────────────────────────────────
  # 1. PRINCIPIOS FUNDAMENTALES
  # ─────────────────────────────────────────────────────────────

  Escenario: Aplicación de principios Secure by Design
    Dado que se diseña el sistema GHE
    Cuando se aplican principios
    Entonces se verifican:
      | Principio                   | Aplicación en GHE    |
      | Seguridad por defecto      | Configuración más restrictiva al instalar |
      | Minimización de privilegios| RBAC con acceso mínimo necesario |
      | Defensa en profundidad     | Múltiples capas de protección |
      | Separación de responsabilidades | Bounded contexts aislados |
      | Fail securely              | En fallo, denegar acceso |
      | Economía de mecanismos     | Seguridad simple, no compleja |
      | Complete mediation         | Validar TODOS los accesos |
      | Open design                | Seguridad no depende de secreto del diseño |
      |的心理建设 | Seguridad no debe ser incómoda para el usuario |

  Escenario: Seguridad por defecto (Secure by Default)
    Dado que se instala GHE por primera vez
    Cuando se configura
    Entonces:
      | Configuración              | Valor por defecto    |
      | Puerto                     | 3000 (no expuesto)   |
      | Bind address               | 127.0.0.1            |
      | TLS                        | Habilitado           |
      | Debug mode                 | Deshabilitado        |
      | CORS                       | Restrictivo          |
      | Admin password             | Requiere cambio      |
      | Logging                    | Habilitado           |
      | Rate limiting              | Habilitado           |
    Y el sistema es seguro sin configuración adicional

  # ─────────────────────────────────────────────────────────────
  # 2. DEFENSA EN PROFUNDIDAD
  # ─────────────────────────────────────────────────────────────

  Escenario: Múltiples capas de protección
    Dado que se implementa defensa en profundidad
    Cuando se evalúa cada capa
    Entonces:
      | Capa                      | Protección           |
      | 1. Red                    | Firewall, segmentación |
      | 2. Servidor               | Hardening, headers   |
      | 3. Aplicación             | Autenticación, autorización |
      | 4. Datos                  | Cifrado, integridad  |
      | 5. Proceso                | Logging, monitoreo   |
    Y si una capa falla, las demás protegen

  Escenario: Fail securely
    Dado que el sistema falla
    Cuando ocurre un error
    Entonces:
      | Tipo de fallo              | Comportamiento       |
      | Error de base de datos     | Denegar acceso       |
      | Error de autenticación     | Denegar acceso       |
      | Error de autorización      | Denegar acceso       |
      | Error del sistema          | Denegar acceso       |
      | Timeout                   | Denegar acceso       |
    Y NUNCA se透露a información sensible en errores

  # ─────────────────────────────────────────────────────────────
  # 3. MINIMIZACIÓN DE PRIVILEGIOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Principio de mínimo privilegio
    Dado que se implementa acceso mínimo
    Cuando se verifica cada rol
    Entonces:
      | Rol                         | Acceso mínimo        |
      | Recepcionista              | Solo datos demográficos |
      | Enfermera                  | Signos vitales + triaje |
      | Médico                     | Expedientes asignados |
      | Farmacéutico               | Recetas + inventario |
      | Administrador              | Config + reportes    |
      | Auditor                    | Solo logs de auditoría |
    Y nadie tiene acceso total sin justificación

  Escenario: Separación de responsabilidades
    Dado que se separan funciones críticas
    Cuando se verifica
    Entonces:
      | Función                    | Separación           |
      | Crear usuario + asignar rol | Diferentes personas |
      | Aprobar receta + dispensar  | Médico ≠ Farmacéutico |
      | Configurar sistema + usarlo | Admin ≠ Usuarios    |
      | Generar reporte + revisarlo | Diferentes niveles  |
  