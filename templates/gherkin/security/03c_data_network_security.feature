# language: es
Característica: Seguridad de Datos y Red
  Como responsable de protección de datos del hospital
  Quiero proteger datos de pacientes y configuración de red
  Para cumplir LFPDPPP y prevenir acceso no autorizado

  Contexto:
    Dado que el sistema está activo
    Y que el usuario tiene rol de administrador

  Escenario: Protección de datos de pacientes
    Dado que se protegen datos sensibles
    Cuando se verifica
    Entonces cada capa tiene protección:
      | Capa                       | Medida    |
      | Reposo                     | AES-256   |
      | Tránsito                   | TLS 1.3   |
      | Passwords                  | bcrypt    |
      | Backups                    | AES-256   |
      | Logs                       | Sin datos sensibles |

  Escenario: Cumplimiento LFPDPPP
    Dado que se verifica cumplimiento LFPDPPP
    Cuando se evalúa
    Entonces se cumple:
      | Requisito                   | Estado |
      | Consentimiento informado   | ✅      |
      | Aviso de privacidad        | ✅      |
      | Derechos ARCO              | ✅      |
      | Minimización de datos      | ✅      |

  Escenario: Seguridad de red
    Dado que se configura red del hospital
    Cuando se verifica
    Entonces:
      | Medida                        |
      | Firewall habilitado         |
      | Puertos innecesarios cerrados|
      | Segmentación de red        |
      | VPN para acceso remoto     |

  Escenario: Seguridad WiFi
    Dado que se configura WiFi
    Cuando se verifica
    Entonces:
      | Medida                        |
      | WPA3 o WPA2-Enterprise     |
      | Password fuerte           |
      | Red de invitados separada |
      | Monitoreo de intrusos     |
