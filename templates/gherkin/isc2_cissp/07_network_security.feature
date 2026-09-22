# language: es
# @id GHE-CISSP-007
# @type business-rule
# @domain security
# @layer network
# @risk s1
# @owner network-engineer
# @status proposed
# @requirement REQ-CISSP-007
# @risk-control CTRL-CISSP-007
# @regulation CISSP-D4 ISC2
@domain:isc2_cissp @type:business-rule @risk:s1 @status:proposed
Característica: CISSP Dominio 4 — Seguridad de Comunicaciones y Red
  Como ingeniero de red
  Quiero seguridad de red conforme CISSP Domain 4
  Para que la infraestructura de red del hospital sea segura y resiliente

  Regla: Arquitectura de red se segmenta

    Escenario: Segmentación de red
      Dado que hospital tiene múltiples tipos de tráfico
      Cuando se diseña segmentación
      Entonces se establecen zonas:
        | Zona                   | Tráfico permitido           |
        | Clínica                | Expedientes, prescripciones |
        | Administrativa         | Facturación, RRHH           |
        | Investigación          | Datos anonimizados          |
        | DMZ                    | Servicios públicos          |
        | IoT médico             | Dispositivos conectados     |
        | Gestión                | Administración de sistemas  |

    Escenario: Reglas de firewall
      Dado que se configuran reglas de firewall
      Cuando se definen
      Entonces se verifica:
        | Principio                  |
        | Default deny all           |
        | Solo tráfico necesario     |
        | Logging de conexiones      |
        | Revisión periódica         |
        | Cambio controlado          |

  Regla: Seguridad de protocolos se asegura

    Escenario: Protocolos seguros obligatorios
      Dado que se transmiten datos por red
      Cuando se selecciona protocolo
      Entonces se verifica:
        | Uso               | Protocolo seguro   | Prohibido        |
        | Web               | HTTPS/TLS 1.3      | HTTP             |
        | Correo            | SMTPS/TLS           | SMTP sin TLS     |
        | Acceso remoto     | SSH                 | Telnet           |
        | Transferencia     | SFTP/SCP            | FTP              |
        | Directorio        | LDAPS               | LDAP sin TLS     |

  Regla: Monitoreo de red es continuo

    Escenario: Detección de intrusiones
      Dado que red del hospital tiene IDS/IPS
      Cuando se monitorea tráfico
      Entonces se detectan:
        | Tipo de anomalía             | Acción          |
        | Escaneo de puertos           | Bloqueo IP      |
        | Tráfico anómalo              | Alerta          |
        | Intento de explotación       | Bloqueo + alerta|
        | Exfiltración de datos        | Contención      |
        | DDoS                         | Mitigación      |

  Regla: Seguridad inalámbrica se implementa

    Escenario: WiFi hospital protegido
      Dado que hospital tiene red inalámbrica
      Cuando se configura
      Entonces se verifica:
        | Elemento                    |
        | WPA3 Enterprise             |
        | Certificados EAP-TLS       |
        | Segregación por VLAN        |
        | Guest network separada      |
        | Monitoreo de accesos        |
        | WIDS para detección de rogue AP|

  Regla: VPN se configura correctamente

    Escenario: Acceso remoto seguro
      Dado que personal accede remotamente
      Cuando usa VPN
      Entonces se verifica:
        | Elemento                    |
        | IPSec o WireGuard           |
        | Autenticación multifactor   |
        | Split tunneling desactivado |
        | Logs de conexión            |
        | Sesiones con timeout        |
