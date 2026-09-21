# language: es
# @id GHE-SEC-OWASP-A05-001
# @type security
# @domain security
# @layer infrastructure
# @risk s2
# @owner security-lead
# @status proposed
# @requirement OWASP-A05
# @risk-control CTRL-OWASP-A05
# @regulation NOM-024
@domain:security @type:security @risk:s2 @status:proposed
Característica: OWASP A05 - Configuración Insegura
  Como responsable de seguridad del hospital
  Quiero configuración segura por defecto
  Para que no haya configuraciones que comprometan el sistema

  Regla: Seguridad por defecto al instalar

    Escenario: Configuración segura
      Dado que se instala GHE
      Cuando se configura
      Entonces:
        | Configuración             | Valor seguro |
        | Puerto                    | 3000 (no expuesto) |
        | Debug mode                | Off en producción |
        | Admin password            | Requiere cambio |
        | TLS                       | Habilitado |
        | CORS                      | Restrictivo |
      # @evidence EVID-ASVS-V13-001

  Regla: Se deshabilitan funcionalidades innecesarias

    Escenario: Attack surface reducido
      Dado que se evalúa attack surface
      Entonces NO se expone:
        | Información               |
        | Stack traces              |
        | Version del software      |
        | Rutas internas            |
        | Datos de debug            |
        | Default credentials       |

  Regla: Headers de seguridad HTTP configurados

    Escenario: Headers presentes
      Dado que se verifican headers
      Entonces:
        | Header                    | Valor |
        | Strict-Transport-Security | max-age=31536000 |
        | X-Content-Type-Options    | nosniff |
        | X-Frame-Options           | DENY |
        | Content-Security-Policy   | default-src 'self' |
        | X-XSS-Protection          | 1; mode=block |
      # @evidence EVID-ASVS-V13-002

  Regla: Dependencias actualizadas

    Escenario: Sin vulnerabilidades en dependencias
      Dado que se escanean dependencias
      Cuando se verifica
      Entonces no hay vulnerabilidades críticas
      Y lockfile está committeado
      # @evidence EVID-ASVS-V13-003
