# language: es
# OWASP Top 10 - A10: Server-Side Request Forgery (SSRF)
@status:proposed
@type:acceptance
@domain:general
# Falsificación de peticiones del lado del servidor
Característica: A10 - SSRF (OWASP Top 10)
  Como responsable de seguridad del proyecto GHE
  Quiero prevenir SSRF
  Para que el sistema no haga peticiones a recursos internos no deseados

  # ─────────────────────────────────────────────────────────────
  # 1. PREVENCIÓN DE SSRF
  # ─────────────────────────────────────────────────────────────

  Escenario: Validación de URLs en inputs
    Dado que el sistema procesa URLs proporcionadas por usuarios
    Cuando se valida URL
    Entonces:
      | Verificación               | Estado    |
      | URLs internas bloqueadas   | ✅         |
      | localhost bloqueado        | ✅         |
      | 127.0.0.1 bloqueado        | ✅         |
      | 10.x.x.x bloqueado        | ✅         |
      | 192.168.x.x bloqueado     | ✅         |
      | 172.16-31.x.x bloqueado  | ✅         |
      | file:// bloqueado          | ✅         |
      | gopher:// bloqueado        | ✅         |
      | dict:// bloqueado          | ✅         |

  Escenario: Allowlist de dominios permitidos
    Dado que se usa allowlist para peticiones externas
    Cuando el sistema hace petición
    Entonces:
      | Dominio                    | Permitido? |
      | api.fda.gov                | ✅ (futuro)|
      | api.humanitarianresponse.info | ⚠️ Pendiente |
      | localhost                  | ❌         |
      | 169.254.169.254           | ❌ (metadata AWS) |
      | internal.company.com       | ❌         |

  Escenario: Network segmentation
    Dado que se segmenta la red
    Cuando se configura
    Entonces:
      | Segmento                   | Acceso    |
      | Aplicación (GHE)           | Solo DB local |
      | Base de datos              | Solo desde app |
      | Internet                   | Solo HTTPS saliente |
      | Red interna                | No accesible desde app |
  