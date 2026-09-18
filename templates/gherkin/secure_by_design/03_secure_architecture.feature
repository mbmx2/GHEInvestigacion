# language: es
# Secure by Design - Secure Architecture
# ARQUITECTURA SEGURA: Diseñar seguridad en la estructura del sistema
Característica: Arquitectura Segura (Secure by Design - GHE)
  Como arquitecto del proyecto GHE
  Quiero diseñar una arquitectura segura desde el inicio
  Para que la seguridad sea parte fundamental del diseño

  # ─────────────────────────────────────────────────────────────
  # 1. SEGREGACIÓN DE CAPAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Segregación de capas de seguridad
    Dado que se diseña arquitectura con segregación
    Cuando se verifica
    Entonces:
      | Capa                      | Responsabilidad      | Acceso |
      | Presentation (UI)         | Mostrar datos        | Solo lectura |
      | Application (Use Cases)   | Lógica de negocio    | Controlado |
      | Domain (Business Rules)   | Reglas clínicas      | Aislado |
      | Infrastructure (DB, etc.) | Persistencia         | Solo domain |
    Y las capas se comunican solo a través de interfaces

  Escenario: Segregación de datos por sensibilidad
    Dado que se clasifican datos por sensibilidad
    Cuando se implementa
    Entonces:
      | Clasificación              | Datos                | Protección |
      | Crítico                    | Diagnósticos, tratamiento | AES-256 + RBAC + Audit |
      | Sensible                   | Nombre, CURP         | AES-256 + RBAC |
      | Confidencial               | Signos vitales       | Cifrado + RBAC |
      | Interno                    | Logs, configuración  | Control de acceso |
      | Público                    | Catálogos médicos    | Ninguna especial |

  # ─────────────────────────────────────────────────────────────
  # 2. SEGURIDAD EN COMUNICACIONES
  # ─────────────────────────────────────────────────────────────

  Escenario: Comunicaciones seguras
    Dado que se configuran comunicaciones
    Cuando se verifica seguridad
    Entonces:
      | Canal                      | Protocolo            | Certificado |
      | Cliente → Servidor         | HTTPS (TLS 1.3)      | ✅          |
      | Servidor → Sync Cloud      | HTTPS (TLS 1.3)      | ✅          |
      | Servidor → SQLite          | Local (encriptado)   | N/A         |
      | Servidor → WhatsApp        | HTTPS (TLS 1.3)      | ✅          |

  Escenario: Certificate pinning (futuro)
    Dado que se considera certificate pinning
    Cuando se evalúa
    Entonces:
      | Criterio                   | Estado    |
      | Pin para sync server       | ⚠️ Futuro |
      | Pin para WhatsApp API      | ⚠️ Futuro |
      | Fallback a CA pública      | ⚠️ Futuro |

  # ─────────────────────────────────────────────────────────────
  # 3. SEGURIDAD EN PERSISTENCIA
  # ─────────────────────────────────────────────────────────────

  Escenario: Seguridad de base de datos
    Dado que se configura SQLite
    Cuando se establece seguridad
    Entonces:
      | Medida                      | Estado    |
      | Cifrado SQLCipher AES-256  | ✅         |
      | Foreign keys habilitadas   | ✅         |
      | Permisos de archivo        | 600 (solo owner) |
      | Directorio fuera de web root | ✅        |
      | Backup cifrado             | ✅         |
      | WAL mode habilitado        | ✅         |

  # ─────────────────────────────────────────────────────────────
  # 4. SEGURIDAD EN SYNC
  # ─────────────────────────────────────────────────────────────

  Escenario: Seguridad de sincronización
    Dado que se sincronizan datos entre local y nube
    Cuando se verifica seguridad
    Entonces:
      | Medida                      | Estado    |
      | Datos cifrados en tránsito | ✅ (TLS)  |
      | Datos cifrados en reposo   | ✅ (AES-256) |
      | Autenticación de sync      | ✅ (token)|
      | Integridad de datos        | ✅ (hash) |
      | Resolución de conflictos   | Última escritura |
      | Retry con backoff          | ✅         |
  