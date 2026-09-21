# language: es
# @id GHE-FW-TRACE-001
# @type contract
# @domain framework
# @layer process
# @risk s1
# @owner tech-lead
# @status proposed
@domain:framework @type:contract @risk:s1 @status:proposed
Característica: Trazabilidad Obligatoria de Extremo a Extremo
  Como tech lead del proyecto GHE
  Quiero que cada cambio sea trazable desde el requisito hasta la evidencia
  Para que no exista código sin origen ni tests sin propósito

  Contexto:
    Dado que se procesa un cambio en el sistema

  Escenario: Trazabilidad completa
    Dado que se implementa un cambio
    Cuando se verifica trazabilidad
    Entonces la cadena debe ser:
      | Paso                       | Evidencia |
      | 1. Requisito origen        | REQ-XXX documentado |
      | 2. Diseño derivado         | DES-XXX con ADR     |
      | 3. Código implementado     | Archivos modificados|
      | 4. Test que verifica       | TEST-XXX ejecutado  |
      | 5. Evidencia generada      | Resultado del test  |
    Y NO puede haber eslabón roto en la cadena

  Escenario: Detección de código sin requisito
    Dado que se revisa código nuevo
    Cuando no tiene requisito asociado
    Entonces el sistema:
      | Acción                          |
      | Señala: "Código sin requisito" |
      | Clasifica como deuda técnica |
      | Solicita documentar requisito |

  Escenario: Detección de test sin propósito
    Dado que se revisa un test
    Cuando no tiene requisito asociado
    Entonces el sistema:
      | Acción                          |
      | Señala: "Test sin requisito" |
      | Evalúa si es test de regresión |
      | Si no lo es → eliminar o asociar |

  Escenario: Detección de requisito sin implementación
    Dado que se revisa un requisito aprobado
    Cuando no tiene código asociado
    Entonces el sistema:
      | Acción                          |
      | Señala: "Requisito sin implementar" |
      | Clasifica como pendiente   |
      | Incluye en roadmap         |

  Escenario: Auditoría de trazabilidad
    Dado que se ejecuta auditoría de trazabilidad
    Cuando se verifica cobertura
    Entonces el sistema reporta:
      | Métrica                    |
      | % requisitos con código    |
      | % código con tests         |
      | % tests con evidencia     |
      | % requisitos sin implementar |
      | Eslabones rotos            |
