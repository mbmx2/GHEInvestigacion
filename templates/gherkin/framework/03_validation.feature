# language: es
# @id GHE-FW-VALIDATION-001
# @type contract
# @domain framework
# @layer process
# @risk s1
# @owner qa-lead
# @status proposed
@domain:framework @type:contract @risk:s1 @status:proposed
Característica: Validación Automatizada de Cambios
  Como qa-lead del proyecto GHE
  Quiero que cada cambio se valide automáticamente
  Para que no se apruebe nada sin evidencia

  Contexto:
    Dado que se ha implementado un cambio
    Y que existe un script de validación

  Escenario: Validación exitosa
    Dado que se ejecuta validate_change.sh
    Cuando todos los checks pasan
    Entonces el resultado es "APROBADO"
    Y se genera evidencia reproducible

  Escenario: Validación con errores
    Dado que se ejecuta validate_change.sh
    Cuando hay errores
    Entonces el resultado es "REQUIERE CORRECCIÓN"
    Y se listan los errores específicos

  Escenario: Validación con warnings
    Dado que se ejecuta validate_change.sh
    Cuando hay warnings pero no errores
    Entonces el resultado es "APROBADO CON OBSERVACIONES"
    Y se documentan los warnings

  Escenario: Validación negativa
    Dado que se ejecuta validate_change.sh
    Cuando se verifica que algo NO funciona
    Entonces se demuestra:
      | Verificación              | Método |
      | Sin SQL injection         | Payload rechazado   |
      | Sin acceso no autorizado  | 403 retornado       |
      | Sin datos expuestos       | Sin CURP en logs    |
      | Sin errores de build      | Build exitoso       |

  Escenario: Cobertura de tests
    Dado que se ejecutan tests
    Cuando se verifica cobertura
    Entonces:
      | Métrica                    | Objetivo |
      | Cobertura total           | >85%     |
      | Cobertura de dominio      | >95%     |
      | Tests que pasan           | 100%     |
      | Tiempo de ejecución       | <5 min   |
