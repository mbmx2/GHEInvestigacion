# language: es
# @id GHE-ASVS-V5-001
# @type compliance
# @domain security
# @layer domain
# @risk s1
# @owner security-lead
# @status proposed
# @requirement ASVS-V5
# @risk-control CTRL-ASVS-V5
# @regulation NOM-024
@domain:security @type:compliance @risk:s1 @status:proposed
Característica: V5 - Validación, Sanitización y Codificación
  Como responsable de seguridad del proyecto GHE
  Quiero que toda entrada sea validada y toda salida codificada
  Para prevenir inyecciones y manipulación

  Regla: V5.1 - Validación de entrada

    Escenario: Validación de input en todas las capas
      Dado que se procesa input del usuario
      Cuando se valida
      Entonces se verifica en:
        | Capa                        | Qué valida |
        | UI (ClojureScript)          | Formato, longitud |
        | API                         | Schema del request |
        | Application                 | Reglas de negocio |
        | Domain                      | Integridad de datos |
      Y la validación más estricta es en el dominio

    Escenario: Validación de datos médicos
      Dado que se registra presión arterial
      Cuando se valida
      Entonces:
        | Campo                      | Validación |
        | PA sistólica               | 60-300 (int) |
        | PA diastólica              | 30-200 (int) |
        | PA diastólica < sistólica  | Verificación cruzada |

  Regla: V5.2 - Sanitización de salida

    Escenario: Sanitización de output
      Dado que se renderiza contenido
      Cuando se muestra al usuario
      Entonces:
        | Contexto                   | Sanitización |
        | HTML                       | Entity encoding |
        | JavaScript                 | Escape de caracteres |
        | URL                        | Percent encoding |

  Regla: V5.3 - Protección contra inyección

    Escenario: Prevención de SQL injection
      Dado que se ejecuta consulta SQL
      Cuando se procesa
      Entonces se usa parameterized queries 100% del tiempo
      Y NO se concatena input del usuario en queries

    Escenario: Prevención de XSS
      Dado que se muestra contenido del usuario
      Cuando se renderiza
      Entonces se sanitiza output
      Y se usa Content Security Policy

    Escenario: Prevención de CSRF
      Dado que se procesa petición POST
      Cuando se verifica
      Entonces se requiere token CSRF
      Y se valida SameSite cookie
