# language: es
# @id GHE-SANS-004
# @type business-rule
# @domain security
# @layer forensics
# @risk s1
# @owner forensic-analyst
# @status proposed
# @requirement REQ-SANS-004
# @risk-control CTRL-SANS-004
# @regulation SANS-FORENSICS NIST-800-86
@domain:sans_giac @type:business-rule @risk:s1 @status:proposed
Característica: SANS — Metodología de Forense Digital
  Como analista forense
  Quiero metodología SANS de forense digital
  Para que el análisis forense sea riguroso y legalmente admisible

  Regla: Recopilación de evidencia

    Escenario: Adquisición forense
      Dado que se recopila evidencia digital
      Cuando se ejecuta adquisición
      Entonces se verifica:
        | Elemento                    |
        | Orden judicial o autorización|
        | Cadena de custodia          |
        | Imagen bit-a-bit            |
        | Hash de integridad (MD5+SHA256)|
        | Herramientas validadas      |
        | Documentación completa      |

    Escenario: Evidencia volátil
      Dado que se recopila evidencia volátil
      Cuando se ejecuta
      Entonces se verifica:
        | Elemento                    |
        | Memoria RAM                 |
        | Procesos activos            |
        | Conexiones de red           |
        | Estado del sistema          |
        | Timestamp correcto          |

  Regla: Análisis forense se ejecuta

    Escenario: Análisis de disco
      Dado que imagen forense está lista
      Cuando se analiza
      Entonces se verifica:
        | Elemento                    |
        | Sistema de archivos         |
        | Archivos eliminados         |
        | Metadatos analizados        |
        | Registro de Windows/Linux   |
        | Logs de aplicación          |

    Escenario: Análisis de malware
      Dado que se sospecha de malware
      Cuando se analiza
      Entonces se verifica:
        | Elemento                    |
        | Análisis estático           |
        | Análisis dinámico           |
        | Ingeniería inversa          |
        | Indicadores de compromiso   |
        | Clasificación de amenaza    |

  Regla: Reporte forense se genera

    Escenario: Informe forense
      Dado que análisis está completo
      Cuando se genera informe
      Entonces incluye:
        | Sección                    |
        | Metodología usada          |
        | Evidencia recopilada       |
        | Hallazgos detallados       |
        | Cadena de custodia         |
        | Conclusiones               |
        | Recomendaciones            |

  Regla: Preservación de evidencia

    Escenario: Almacenamiento seguro
      Dado que evidencia requiere preservación
      Cuando se almacena
      Entonces se verifica:
        | Elemento                    |
        | Almacenamiento seguro       |
        | Acceso restringido          |
        | Cadena de custodia continua |
        | Documentación de acceso     |
        | Retención según política    |
