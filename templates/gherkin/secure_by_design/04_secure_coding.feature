# language: es
# Secure by Design - Secure Coding Practices
@status:proposed
@type:acceptance
@domain:general
# PRÁCTICAS DE CÓDIGO SEGURO: Codificar de forma segura desde el inicio
Característica: Prácticas de Código Seguro (Secure by Design - GHE)
  Como desarrollador del proyecto GHE
  Quiero seguir prácticas de código seguro
  Para prevenir vulnerabilidades en el código

  # ─────────────────────────────────────────────────────────────
  # 1. VALIDACIÓN DE ENTRADA
  # ─────────────────────────────────────────────────────────────

  Escenario: Validación de entrada en todas las capas
    Dado que se valida entrada en cada capa
    Cuando se procesa input
    Entonces:
      | Capa                      | Qué valida            |
      | UI (Frontend)             | Formato, longitud     |
      | API (REST)                | Content-Type, schema  |
      | Application               | Reglas de negocio     |
      | Domain                    | Integridad de datos   |
    Y la validación más estricta es en el dominio

  Escenario: Whitelist vs Blacklist
    Dado que se elige estrategia de validación
    Cuando se implementa
    Entonces:
      | Estrategia                 | Estado    |
      | Whitelist (permitir solo conocido) | ✅ |
      | Blacklist (bloquear conocido) | ❌    |
    Y whitelist es siempre más seguro

  Escenario: Tipos de validación
    Dado que se implementan múltiples validaciones
    Cuando se procesa input
    Entonces:
      | Tipo                       | Ejemplo              |
      | Tipo de dato               | String, Integer      |
      | Longitud                   | 1-100 caracteres     |
      | Rango                      | 0-200 PA sistólica   |
      | Formato (regex)            | CURP, email          |
      | Valores permitidos         | Sexo: M/F/O         |
      | No vacío                   | Nombre requerido     |
      | Sin caracteres especiales  | Nombre: solo letras  |

  # ─────────────────────────────────────────────────────────────
  # 2. OUTPUT ENCODING
  # ─────────────────────────────────────────────────────────────

  Escenario: Codificación de salida
    Dado que se muestra output al usuario
    Cuando se renderiza
    Entonces:
      | Contexto                   | Codificación         |
      | HTML                       | HTML entity encoding |
      | JavaScript                 | JavaScript encoding  |
      | URL                        | URL encoding         |
      | CSS                        | CSS encoding         |
      | SQL                        | Parameterized queries|
      | LDAP                       | LDAP encoding        |

  Escenario: Content Security Policy
    Dado que se configura CSP
    Cuando se envía header
    Entonces:
      | Directiva                  | Valor                |
      | default-src                | 'self'               |
      | script-src                 | 'self'               |
      | style-src                  | 'self' 'unsafe-inline' |
      | img-src                    | 'self' data:         |
      | font-src                   | 'self'               |
      | connect-src               | 'self'               |
      | frame-ancestors            | 'none'               |

  # ─────────────────────────────────────────────────────────────
  # 3. MANEJO DE ERRORES
  # ─────────────────────────────────────────────────────────────

  Escenario: Manejo seguro de errores
    Dado que ocurre un error
    Cuando se maneja
    Entonces:
      | Criterio                   | Estado    |
      | No se muestra stack trace  | ✅         |
      | No se muestra versión      | ✅         |
      | No se muestra query SQL    | ✅         |
      | No se muestra ruta interna | ✅         |
      | Mensaje genérico al usuario| ✅         |
      | Error detallado en log     | ✅         |

  Escenario: Excepciones de dominio
    Dado que se lanzan excepciones del dominio
    Cuando se manejan
    Entonces:
      | Excepción                   | Información expuesta |
      | InvalidCURPException        | "CURP inválida"      |
      | PatientNotFoundException   | "Paciente no encontrado" |
      | UnauthorizedAccessException| "Acceso denegado"    |
    Y NO se expone:
      | Información                 | Estado    |
      | Stack trace                 | ❌         |
      | Query SQL                   | ❌         |
      | Ruta del servidor           | ❌         |
      | Versión del software        | ❌         |

  # ─────────────────────────────────────────────────────────────
  # 4. SEGURIDAD EN DEPENDENCIAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Gestión segura de dependencias
    Dado que se usan dependencias externas
    Cuando se verifica seguridad
    Entonces:
      | Criterio                   | Estado    |
      | Solo dependencias necesarias | ✅       |
      | Versiones锁定 (lockfile)   | ✅         |
      | Escaneo de vulnerabilidades| Semanal   |
      | Actualización de parches   | Inmediata |
      | Sin dependencias abandonadas| ✅        |
  