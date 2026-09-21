# language: es
# @id GHE-SAMM-OPS-001
# @type compliance
# @domain security
# @layer operations
# @risk s1
# @owner ops-lead
# @status proposed
# @requirement SAMM-OPERATIONS
# @risk-control CTRL-SAMM-OPS
# @regulation NOM-024
@domain:security @type:compliance @risk:s1 @status:proposed
Característica: SAMM Operations - Penetration Testing, Environment y Configuration
  Como responsable de operaciones del hospital
  Quiero operaciones de seguridad continuas
  Para detectar y responder a amenazas en tiempo real

  Regla: Se ejecutan pruebas de penetración periódicas

    Escenario: Pentest semestral
      Dado que se ejecuta pentest
      Cuando se completa
      Entonces se genera reporte con hallazgos, severidad y remediación
      # @evidence EVID-SAMM-OPS-001

    Escenario: Pentest no realizado
      Dado que NO se ha ejecutado pentest en 6 meses
      Cuando se detecta
      Entonces se programa pentest inmediato
      Y se escala a dirección
      # @evidence EVID-SAMM-OPS-001-N

  # @invariante INV-OPS-001: Todo hallazgo de pentest tiene fecha de remediación
  Regla: Hallazgos de pentest tienen fecha de remediación

    Escenario: Hallazgo remediado a tiempo
      Dado que se recibe hallazgo de pentest
      Cuando se clasifica
      Entonces tiene fecha de remediación según severidad:
        | Severidad | Plazo |
        | Crítica | 24 horas |
        | Alta | 7 días |
        | Media | 30 días |
        | Baja | Siguiente release |
      # @evidence EVID-SAMM-OPS-002

    Escenario: Hallazgo sin remediación
      Dado que un hallazgo no se remedió a tiempo
      Cuando se detecta
      Entonces se escala a dirección
      Y se documenta el retraso
      # @evidence EVID-SAMM-OPS-002-N

  Regla: El entorno de producción es seguro

    Escenario: Hardening verificado
      Dado que se verifica entorno
      Cuando se audita
      Entonces: SO actualizado, servicios innecesarios off, firewall, monitoreo, backup
      # @evidence EVID-SAMM-OPS-003

    Escenario: Entorno inseguro detectado
      Dado que se detecta configuración insegura
      Cuando se audita
      Entonces se genera alerta y se remedia inmediatamente
      # @evidence EVID-SAMM-OPS-003-N

  # @invariante INV-OPS-002: Los entornos están segregados
  Regla: Entornos segregados

    Escenario: Segregación verificada
      Dado que se verifican entornos
      Cuando se audita
      Entonces: producción, staging y desarrollo están separados sin acceso cruzado
      # @evidence EVID-SAMM-OPS-004

    Escenario: Acceso cruzado detectado
      Dado que un usuario de desarrollo accede a producción
      Cuando se detecta
      Entonces se bloquea acceso y se investiga
      # @evidence EVID-SAMM-OPS-004-N

  Regla: La configuración se gestiona como código

    Escenario: Configuración versionada
      Dado que se modifica configuración
      Cuando se aplica
      Entonces se versiona en Git, se hace review, se testea
      # @evidence EVID-SAMM-OPS-005

    Escenario: Configuración sin versionar
      Dado que se detecta cambio sin versionar
      Cuando se audita
      Entonces se genera alerta y se versiona retroactivamente
      # @evidence EVID-SAMM-OPS-005-N

  Regla: Vulnerabilidades se gestionan activamente

    Escenario: Vulnerabilidad remediada a tiempo
      Dado que se detecta vulnerabilidad
      Cuando se gestiona
      Entonces tiene fecha de remediación según severidad
      # @evidence EVID-SAMM-OPS-006

    Escenario: Vulnerabilidad sin remediación
      Dado que vulnerabilidad no se remedió a tiempo
      Cuando se detecta
      Entonces se escala a dirección
      # @evidence EVID-SAMM-OPS-006-N

  Regla: Monitoreo continuo de seguridad

    Escenario: Alertas activas
      Dado que se monitorea seguridad
      Cuando se verifica
      Entonces alertas de: login fallido >5, acceso fuera horario, vulnerabilidad nueva
      # @evidence EVID-SAMM-OPS-007

    Escenario: Monitoreo inactivo
      Dado que el monitoreo está deshabilitado
      Cuando se detecta
      Entonces se reactiva inmediatamente
      # @evidence EVID-SAMM-OPS-007-N

  # @invariante INV-OPS-003: Todo incidente de seguridad tiene post-mortem
  Regla: Todo incidente tiene análisis post-mortem

    Escenario: Post-mortem completado
      Dado que ocurre incidente de seguridad
      Cuando se resuelve
      Entonces se ejecuta post-mortem con: causa raíz, acciones correctivas, lecciones
      # @evidence EVID-SAMM-OPS-008

    Escenario: Incidente sin post-mortem
      Dado que un incidente no tiene post-mortem
      Cuando se detecta
      Entonces se programa post-mortem urgente
      # @evidence EVID-SAMM-OPS-008-N
