# language: es
# @id GHE-CISSP-004
# @type business-rule
# @domain security
# @layer asset-security
# @risk s1
# @owner data-protection-officer
# @status proposed
# @requirement REQ-CISSP-004
# @risk-control CTRL-CISSP-004
# @regulation CISSP-D2 ISC2 LFPDPPP
@domain:isc2_cissp @type:business-rule @risk:s1 @status:proposed
Característica: CISSP Dominio 2 — Seguridad de Activos de Información
  Como oficial de protección de datos
  Quiero clasificar y proteger activos de información conforme CISSP Domain 2
  Para que cada activo tenga protección adecuada a su sensibilidad

  Regla: Clasificación de datos se define

    Escenario: Niveles de clasificación
      Dado que hospital clasifica datos
      Cuando se definen niveles
      Entonces se establecen:
        | Nivel        | Criterio                        | Ejemplo            |
        | Público      | Sin restricción                 | Horarios de atención|
        | Interno      | Solo empleados                  | Políticas internas |
        | Confidencial | Restringido                     | Datos financieros   |
        | Altamente confidencial| Máxima protección   | Expedientes clínicos|

    Escenario: Etiquetado de datos
      Dado que dato es clasificado
      Cuando se etiqueta
      Entonces se verifica:
        | Elemento                    |
        | Nivel de clasificación      |
        | Propietario del dato        |
        | Fecha de clasificación      |
        | Instrucciones de manejo     |
        | Período de retención        |

  Regla: Ciclo de vida de datos se gestiona

    Escenario: Retención de datos clínicos
      Dado que se define retención de datos
      Cuando se establece
      Entonces se verifica:
        | Tipo de dato               | Período mínimo  |
        | Expedientes clínicos       | 20 años (NOM-004)|
        | Imágenes diagnósticas      | 10 años         |
        | Registros de auditoría     | 5 años          |
        | Logs de seguridad          | 1 año           |
        | Datos de prueba            | 90 días         |

    Escenario: Eliminación segura de datos
      Dado que dato excede retención
      Cuando se elimina
      Entonces se verifica:
        | Método                      | Nivel          |
        | Electrónico                 | 3 pasadas      |
        | Físico                      | Degaussing+destrucción|
        | Cloud                       | Certificado    |
        | Registro de eliminación     | Documentado    |

  Regla: Propiedad de datos se establece

    Escenario: Asignación de propietarios
      Dado que datos requieren propietario
      Cuando se asigna
      Entonces se verifica:
        | Elemento                    |
        | Dueño del dato identificado |
        | Responsabilidades definidas |
        | Autoridad para clasificar   |
        | Aprobación de acceso        |
        | Revisión periódica          |

  Regla: Protección de datos en tránsito

    Escenario: Encriptación de datos en movimiento
      Dado que datos se transmiten
      Cuando se protegen
      Entonces se verifica:
        | Elemento                    |
        | TLS 1.3 mínimo              |
        | Certificados válidos        |
        | Certificate pinning         |
        | Perfect forward secrecy     |
        | Monitoreo de integridad     |
