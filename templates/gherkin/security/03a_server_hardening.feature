# language: es
Característica: Hardening de Infraestructura
@status:proposed
@type:acceptance
@domain:security
  Como administrador de sistemas del hospital
  Quiero configurar servidores y bases de datos de forma segura
  Para que la infraestructura sea resistente a ataques

  Contexto:
    Dado que el sistema está activo
    Y que el usuario tiene rol de administrador

  Escenario: Hardening de servidor
    Dado que se configura servidor de producción
    Cuando se aplica hardening
    Entonces se verifica:
      | Medida                          | Estado |
      | Actualizaciones de seguridad   | ✅      |
      | Servicios innecesarios off    | ✅      |
      | Puertos innecesarios cerrados | ✅      |
      | Permisos de archivos restrictivos | ✅   |
      | SSH hardening + Fail2ban    | ✅      |
      | Firewall configurado        | ✅      |

  Escenario: Hardening de base de datos
    Dado que se configura SQLite
    Cuando se aplica hardening
    Entonces se verifica:
      | Medida                          | Estado |
      | Cifrado SQLCipher AES-256   | ✅      |
      | Foreign keys habilitadas    | ✅      |
      | WAL mode habilitado         | ✅      |
      | Permisos de archivo 600    | ✅      |
      | Fuera de web root          | ✅      |
      | Sin acceso remoto directo  | ✅      |
      | Backup cifrado automático  | ✅      |
