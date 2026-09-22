# language: es
# @id GHE-ISACA-CRISC-003
# @type business-rule
# @domain risk
# @layer identification
# @risk s1
# @owner risk-director
# @status proposed
# @requirement REQ-CRISC-003
# @risk-control CTRL-CRISC-003
# @regulation CRISC ISACA
@domain:isaca @type:business-rule @risk:s1 @status:proposed
Característica: CRISC — Identificación de Riesgos de TI
  Como analista de riesgos
  Quiero identificar riesgos de TI sistemáticamente conforme CRISC
  Para que todos los riesgos relevantes se capturen antes de evaluarlos

  Regla: Fuentes de riesgo se identifican

    Escenario: Análisis de fuentes de riesgo
      Dado que se inicia proceso de identificación
      Cuando se revisan fuentes
      Entonces se consideran:
        | Fuente                       | Tipo de riesgo           |
        | Cambios en el negocio       | Estratégico              |
        | Tecnologías emergentes      | Operacional              |
        | Regulación                  | Legal/cumplimiento       |
        | Proveedores                 | Terceros                 |
        | Personal                    | Recursos humanos         |
        | Infraestructura             | Tecnológico              |
        | Datos                       | Integridad/confidencialidad|

  Regla: Técnicas de identificación se aplican

    Escenario: Brainstorming de riesgos
      Dado que se facilita sesión de identificación
      Cuando se usa brainstorming
      Entonces se capturan riesgos de:
        | Participantes               |
        | Dirección clínica           |
        | Dirección de TI             |
        | Seguridad de la información |
        | Compliance                  |
        | Usuarios finales            |

    Escenario: Análisis de escenarios
      Dado que se analizan escenarios de riesgo
      Cuando se evalúan escenarios
      Entonces se consideran:
        | Escenario                   | Riesgos asociados        |
        | Pérdida de conectividad     | Datos no sincronizados   |
        | Fallo de base de datos      | Pérdida de expedientes   |
        | Ransomware                  | Datos inaccesibles       |
        | Error humano                | Datos incorrectos        |
        | Fallo de proveedor          | Servicio interrumpido    |
        | Cambio regulatorio          | No conformidad           |

  Regla: Riesgos se documentan en registro

    Escenario: Registro de riesgos
      Dado que riesgo es identificado
      Cuando se registra
      Entonces se documenta:
        | Campo                    |
        | ID único                 |
        | Descripción clara        |
        | Categoría                |
        | Fuente de identificación |
        | Activos afectados        |
        | Propietario asignado     |
        | Fecha de identificación  |

  Regla: Análisis de causa raíz se realiza

    Escenario: Identificación de causa raíz
      Dado que riesgo recurrente es identificado
      Cuando se analiza causa raíz
      Entonces se usa herramienta apropiada:
        | Herramienta         | Cuándo usarla     |
        | Ishikawa            | Múltiples causas  |
        | 5 Porqués           | Causa lineal       |
        | Árbol de fallos     | Sistemas complejos |

  Regla: Riesgos emergentes se monitorean

    Escenario: Vigilancia de amenazas
      Dado que se monitorea entorno de amenazas
      Cuando se detecta nueva amenaza
      Entonces se evalúa impacto potencial
      Y se registra en registro de riesgos si aplica
