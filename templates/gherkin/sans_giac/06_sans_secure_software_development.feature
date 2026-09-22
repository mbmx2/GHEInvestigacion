# language: es
# @id GHE-SANS-006
# @type business-rule
# @domain security
# @layer secure-dev
# @risk s1
# @owner secure-dev-lead
# @status proposed
# @requirement REQ-SANS-006
# @risk-control CTRL-SANS-006
# @regulation SANS-SSD
@domain:sans_giac @type:business-rule @risk:s1 @status:proposed
Característica: SANS — Desarrollo de Software Seguro
  Como líder de desarrollo seguro
  Quiero prácticas SANS de desarrollo seguro
  Para que el software médico sea seguro desde el diseño

  Regla: Requisitos de seguridad se definen

    Escenario: Threat modeling en requisitos
      Dado que se inicia proyecto de software
      Cuando se definen requisitos
      Entonces se incluyen:
        | Elemento                    |
        | Requisitos de seguridad     |
        | Modelado de amenazas        |
        | Casos de uso de abuso       |
        | Criterios de aceptación     |
        | Verificación de seguridad   |

  Regla: Diseño seguro se aplica

    Escenario: Principios de diseño seguro
      Dado que se diseña sistema
      Cuando se aplican principios
      Entonces se verifica:
        | Principio                  |
        | Defensa en profundidad     |
        | Mínimo privilegio          |
        | Fail secure                |
        | Separación de funciones    |
        | Economía de mecanismos     |
        | Diseño abierto             |

  Regla: Coding seguro se ejecuta

    Escenario: Prácticas de coding
      Dado que desarrollador escribe código
      Cuando se aplican prácticas
      Entonces se verifica:
        | Práctica                    |
        | Validación de entrada        |
        | Codificación de salida       |
        | Parameterized queries       |
        | Gestión de errores           |
        | Logging seguro               |
        | Autenticación robusta        |

  Regla: Pruebas de seguridad se ejecutan

    Escenario: SAST y DAST
      Dado que software está en pruebas
      Cuando se ejecutan pruebas de seguridad
      Entonces se verifica:
        | Herramienta | Qué detecta                |
        | SAST       | Vulnerabilidades de diseño  |
        | DAST       | Vulnerabilidades de runtime |
        | SCA        | Dependencias vulnerables    |
        | IAST       | Combinación estática/dinámica|

  Regla: Despliegue seguro se ejecuta

    Escenario: Despliegue seguro
      Dado que software está listo para desplegar
      Cuando se ejecuta despliegue
      Entonces se verifica:
        | Elemento                    |
        | Configuración segura        |
        | Sin credenciales hardcodeadas|
        | Headers de seguridad        |
        | TLS configurado             |
        | Logging habilitado          |
