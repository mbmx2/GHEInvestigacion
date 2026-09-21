# language: es
# @id GHE-NIST-53-CM-001
# @type compliance
# @domain security
# @layer infrastructure
# @risk s2
# @owner dev-lead
# @status proposed
# @requirement NIST-53-CM
# @risk-control CTRL-NIST-53-CM
# @regulation NOM-024
@domain:security @type:compliance @risk:s2 @status:proposed
Característica: NIST 800-53 - Gestión de Configuración (CM)
  Como responsable de configuración del proyecto GHE
  Quiero gestión de configuración según NIST 800-53
  Para que cada cambio sea rastreable y controlado

  Regla: CM-2: Configuración base

    Escenario: Configuración baseline documentada
      Dado que se define configuración base
      Cuando se documenta
      Entonces: cada componente tiene configuración estándar

  Regla: CM-3: Control de cambios

    Escenario: Cambios controlados
      Dado que se modifica configuración
      Cuando se procesa
      Entonces: documentación, aprobación, verificación, rollback

  Regla: CM-5: Restricciones de acceso

    Escenario: Acceso restringido
      Dado que se gestiona acceso a configuración
      Cuando se verifica
      Entonces: solo usuarios autorizados modifican configuración

  Regla: CM-6: Configuración de seguridad

    Escenario: Configuración segura verificada
      Dado que se verifica configuración de seguridad
      Cuando se audita
      Entonces:
        | Verificación              |
        | Headers HTTP correctos    |
        | TLS habilitado            |
        | CORS configurado          |
        | Permisos restrictivos    |

  Regla: CM-7: Mínimo de funcionalidad

    Escenario: Ataque surface reducido
      Dado que se evalúa attack surface
      Cuando se verifica
      Entonces: solo servicios necesarios habilitados
