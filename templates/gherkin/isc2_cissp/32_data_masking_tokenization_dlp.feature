# language: es
# @id GHE-CISSP-032
# @type business-rule
# @domain security
# @layer data-protection-tech
# @risk s1
# @owner data-protection-engineer
# @status proposed
# @requirement REQ-CISSP-032
# @risk-control CTRL-CISSP-032
# @regulation CISSP-D2 ISC2
@domain:isc2_cissp @type:business-rule @risk:s1 @status:proposed
Característica: CISSP — Enmascaramiento, Tokenización y DLP
  Como ingeniero de protección de datos
  Quiero enmascaramiento, tokenización y DLP conforme CISSP
  Para que los datos sensibles se protejan técnicamente

  Regla: Enmascaramiento de datos se aplica

    Escenario: Enmascaramiento en UI
      Dado que datos sensibles se muestran en interfaz
      Cuando se visualizan
      Entonces se verifica:
        | Tipo de dato               | Enmascaramiento           |
        | CURP                       | XXXX123456XXXXXX         |
        | Teléfono                   | (XXX) XXX-XX12           |
        | Correo                      | ju***@hospital.com       |
        | Número de seguro           | ****-1234                |
        | Tarjeta de crédito         | ****-****-****-1234      |

    Escenario: Enmascaramiento en BD
      Dado que datos sensibles están en BD
      Cuando se consultan para reportes
      Entonces se verifica:
        | Elemento                    |
        | Datos reales solo para acceso autorizado|
        | Vistas anonimizadas para reportes|
        | Funciones de enmascaramiento|
        | Sin datos en logs           |

  Regla: Tokenización se implementa

    Escenario: Tokenización de datos sensibles
      Dado que dato sensible requiere tokenización
      Cuando se tokeniza
      Entonces se verifica:
        | Elemento                    |
        | Token único y aleatorio     |
        | Mapping seguro              |
        | Vault de tokens separado    |
        | Acceso restringido          |
        | Des-tokenización controlada |

    Escenario: Uso de tokens
      Dado que sistema usa tokens en lugar de datos reales
      Cuando procesa transacciones
      Entonces se verifica:
        | Elemento                    |
        | Datos reales no expuestos   |
        | Tokens no reversibles       |
        | Logging sin datos sensibles |
        | Auditoría de des-tokenización|

  Regla: DLP se implementa

    Escenario: DLP en endpoint
      Dado que DLP monitorea endpoints
      Cuando detecta datos sensibles
      Entonces se verifica:
        | Acción                      | Criterio                  |
        | Bloqueo de envío            | Datos clasificados        |
        | Alerta                      | Patrón de datos           |
        | Log                         | Intento detectado         |
        | Escalamiento                | Múltiples intentos        |

    Escenario: DLP en red
      Dado que DLP monitorea tráfico de red
      Cuando detecta exfiltración
      Entonces se verifica:
        | Elemento                    |
        | Inspección de contenido     |
        | Detección de patrones       |
        | Bloqueo de transferencia    |
        | Notificación al usuario     |
        | Registro del evento         |

  Regla: Watermarking se aplica

    Escenario: Marcas de agua digitales
      Dado que documentos sensibles se distribuyen
      Cuando se protegen
      Entonces se verifica:
        | Elemento                    |
        | Marca de agua visible       |
        | Marca de agua invisible     |
        | Metadatos de distribución   |
        | Rastreo de fuente           |
