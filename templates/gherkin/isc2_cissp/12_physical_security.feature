# language: es
# @id GHE-CISSP-012
# @type business-rule
# @domain security
# @layer physical
# @risk s2
# @owner facilities-manager
# @status proposed
# @requirement REQ-CISSP-012
# @risk-control CTRL-CISSP-012
# @regulation CISSP-D3 ISC2
@domain:isc2_cissp @type:business-rule @risk:s2 @status:proposed
Característica: CISSP — Seguridad Física y del Sitio
  Como gerente de instalaciones
  Quiero controles de seguridad física conforme CISSP
  Para que las instalaciones del hospital estén protegidas físicamente

  Regla: Acceso físico se controla

    Escenario: Control de acceso por zonas
      Dado que hospital tiene múltiples zonas
      Cuando se controla acceso
      Entonces se verifica:
        | Zona                   | Control                    |
        | Reception/público      | Sin restricción            |
        | Áreas clínicas         | Badge + pin                |
        | Data center            | Badge biométrico + registro|
        | Farmacia               | Badge + registro + cámara  |
        | Quirófanos             | Badge + EPP + registro     |
        | Áreas de servidores    | Solo TI autorizado         |

    Escenario: Visitantes se registran
      Dado que visitante ingresa a zona restringida
      Cuando se registra
      Entonces se verifica:
        | Elemento                    |
        | Identificación verificada   |
        | Propósito documentado       |
        | Acompañante asignado        |
        | Duración limitada           |
        | Salida registrada           |

  Regla: Monitoreo físico se implementa

    Escenario: CCTV opera continuamente
      Dado que hospital tiene cámaras de vigilancia
      Cuando se monitorea
      Entonces se verifica:
        | Elemento                    |
        | Cobertura de áreas críticas |
        | Grabación 24/7              |
        | Retención de 90 días        |
        | Acceso restringido a grabaciones|
        | Mantenimiento de equipos    |

  Regla: Protección ambiental se implementa

    Escenario: Control ambiental
      Dado que sala de servidores requiere ambiente controlado
      Cuando se verifica
      Entonces se verifica:
        | Elemento                    |
        | Temperatura: 18-24°C       |
        | Humedad: 40-60%            |
        | Detección de humo          |
        | Sistema de extinción       |
        | UPS y generador            |
        | Monitoreo ambiental        |

  Regla: Seguridad de medios se gestiona

    Escenario: Protección de medios de almacenamiento
      Dado que se transportan medios de almacenamiento
      Cuando se mueven
      Entonces se verifica:
        | Elemento                    |
        | Cifrado de medios           |
        | Transporte seguro           |
        | Registro de cadena de custodia|
        | Eliminación segura al final de vida|
