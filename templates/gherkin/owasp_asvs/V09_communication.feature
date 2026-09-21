# language: es
# @id GHE-ASVS-V9-001
# @type compliance
# @domain security
# @layer infrastructure
# @risk s2
# @owner security-lead
# @status proposed
# @requirement ASVS-V9
# @risk-control CTRL-ASVS-V9
# @regulation NOM-024
@domain:security @type:compliance @risk:s2 @status:proposed
Característica: V9 - Comunicación
  Como responsable de seguridad del proyecto GHE
  Quiero que todas las comunicaciones sean seguras
  Para que los datos no se intercepten ni manipulen

  Regla: V9.1 - Comunicaciones cifradas

    Escenario: TLS en todas las comunicaciones
      Dado que se transmiten datos
      Cuando se verifica
      Entonces:
        | Canal                      | Protocolo |
        | Cliente-Servidor          | TLS 1.3   |
        | Servidor-Cloud            | TLS 1.3   |
        | Sync                       | HTTPS     |
      Y se rechaza TLS 1.2 y versiones anteriores

    Escenario: Certificados válidos
      Dado que se verifican certificados TLS
      Cuando se inspeccionan
      Entonces:
        | Verificación              | Estado |
        | Certificado válido        | ✅      |
        | No expirado               | ✅      |
        | Firma SHA-256+            | ✅      |
        | HSTS habilitado           | ✅      |

  Regla: V9.2 - Autenticación de servicios externos

    Escenario: Comunicación con servicios externos
      Dado que se conecta con servicio externo (aseguradora, laboratorio)
      Cuando se autentica
      Entonces:
        | Medida                     |
        | Autenticación mutua       |
        | Certificados válidos      |
        | API keys en variables     |

  Regla: V9.3 - Protección contra intercepción

    Escenario: Datos cifrados en tránsito
      Dado que se transmiten datos de pacientes
      Cuando se envían
      Entonces NO se transmiten en texto plano
      Y se verifica integridad con hash
