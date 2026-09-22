# language: es
# @id GHE-CISSP-039
# @type business-rule
# @domain security
# @layer media-protection
# @risk s2
# @owner media-security-officer
# @status proposed
# @requirement REQ-CISSP-039
# @risk-control CTRL-CISSP-039
# @regulation CISSP-D7 ISC2
@domain:isc2_cissp @type:business-rule @risk:s2 @status:proposed
Característica: CISSP — Protección de Medios y Almacenamiento
  Como oficial de seguridad de medios
  Quiero protección de medios conforme CISSP
  Para que los medios de almacenamiento estén protegidos durante su ciclo de vida

  Regla: Medios se clasifican

    Escenario: Tipos de medios
      Dado que hospital usa diferentes medios
      Cuando se clasifican
      Entonces se verifica:
        | Medio        | Sensibilidad | Protección            |
        | Discos duros | Crítico      | Cifrado + acceso restringido|
        | USB          | Alto         | Cifrado + control      |
        | Cintas       | Crítico      | Almacenamiento seguro  |
        | Ópticos      | Medio        | Control de acceso      |
        | Móviles      | Alto         | MDM + cifrado          |

  Regla: Medios se transportan seguramente

    Escenario: Transporte de medios
      Dado que medios se mueven físicamente
      Cuando se transportan
      Entonces se verifica:
        | Elemento                    |
        | Cifrado del medio           |
        | Embalaje seguro             |
        | Registro de cadena de custodia|
        | Transporte autorizado       |
        | Confirmación de entrega     |

  Regla: Medios se eliminan seguramente

    Escenario: Eliminación de medios
      Dado que medio alcanza fin de vida
      Cuando se elimina
      Entonces se verifica:
        | Método                      | Nivel          |
        | Electrónico                 | 3 pasadas DoD  |
        | Degaussing                  | Para discos    |
        | Destrucción física          | Para SSD       |
        | Certificado de destrucción  | Documentado    |
        | Registro de eliminación     | Archivado      |

  Regla: Medios removibles se controlan

    Escenario: Control de USB
      Dado que USB es vector de malware
      Cuando se controla acceso
      Entonces se verifica:
        | Elemento                    |
        | USB deshabilitado por defecto|
        | Excepciones documentadas    |
        | USB cifrado obligatorio     |
        | Escaneo antes de uso        |
        | Registro de uso             |

  Regla: Almacenamiento en la nube se gestiona

    Escenario: Cloud storage
      Dado que datos se almacenan en cloud
      Cuando se gestiona
      Entonces se verifica:
        | Elemento                    |
        | Cifrado en reposo           |
        | Acceso restringido          |
        | Versionado                  |
        | Backup local                |
        | Monitoreo de acceso         |
