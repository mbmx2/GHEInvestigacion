# language: es
# @id GHE-GIAC-011
# @type business-rule
# @domain security
# @layer forensics
# @risk s1
# @owner forensic-examiner
# @status proposed
# @requirement REQ-GIAC-011
# @risk-control CTRL-GIAC-011
# @regulation GIAC-GCFA SANS
@domain:sans_giac @type:business-rule @risk:s1 @status:proposed
Característica: GIAC GCFA — Análisis Forense Avanzado
  Como examinador forense certificado GCFA
  Quiero metodología GCFA de análisis forense
  Para que el análisis forense sea completo y legalmente sólido

  Regla: Adquisición forense avanzada

    Escenario: Adquisición de evidencia volátil
      Dado que se recopila evidencia volátil
      Cuando se ejecuta adquisición
      Entonces se verifica:
        | Elemento                    |
        | Orden de adquisición        |
        | Cadena de custodia          |
        | Herramientas forenses certificadas|
        | Hash dual (MD5+SHA256)      |
        | Documentación completa      |

  Regla: Análisis de sistemas de archivos

    Escenario: Análisis de NTFS/ext4
      Dado que se analiza sistema de archivos
      Cuando se ejecuta análisis
      Entonces se verifica:
        | Elemento                    |
        | MFT analizada               |
        | Archivos eliminados         |
        | Metadatos examinados        |
        | Timestamps verificados      |
        | Evidencia residual          |

  Regla: Análisis de memoria

    Escenario: Análisis de volcado de memoria
      Dado que se tiene volcado de memoria
      Cuando se analiza
      Entonces se verifica:
        | Elemento                    |
        | Procesos en memoria         |
        | DLLs cargadas               |
        | Conexiones de red           |
        | Credenciales en memoria     |
        | Malware residente           |

  Regla: Análisis de registro

    Escenario: Análisis de Windows Registry
      Dado que se analiza registro de Windows
      Cuando se ejecuta análisis
      Entonces se verifica:
        | Elemento                    |
        | Claves de autostart         |
        | Historial de programas      |
        | USB conectados              |
        | Usuarios recientes          |
        | Configuraciones modificadas |

  Regla: Reporte forense avanzado

    Escenario: Informe forense GCFA
      Dado que análisis está completo
      Cuando se genera informe
      Entonces incluye:
        | Sección                    |
        | Metodología detallada      |
        | Evidencia chain of custody |
        | Hallazgos técnicos         |
        | Timeline forense           |
        | Conclusiones               |
        | Recomendaciones            |
