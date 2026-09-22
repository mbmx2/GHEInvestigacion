# language: es
# @id GHE-SBD-008
# @type business-rule
# @domain secure-by-design
# @layer invariants
# @risk s1
# @owner security-architect
# @status proposed
# @requirement REQ-SBD-008
# @risk-control CTRL-SBD-008
# @regulation NOM-024 OWASP
@domain:secure_by_design @type:business-rule @risk:s1 @status:proposed
Característica: Invariantes de Seguridad y Monitoreo
  Como arquitecto de seguridad
  Quiero invariantes de seguridad verificables automáticamente
  Para que la seguridad sea continua, no puntual

  Regla: Invariantes de datos sensibles

    Escenario: Datos PHI nunca en logs
      Dado que sistema genera logs
      Cuando se revisa contenido de log
      Entonces no contiene: nombre, CURP, expediente, diagnóstico
      Y solo contiene IDs internosseudónimos
      # @invariante INV-SBD-PHI-001

    Escenario: Datos PHI en tránsito encriptados
      Dado que se transfiere dato sensible
      Cuando se transmite por red
      Entonces usa TLS 1.3 mínimo
      Y certificado es válido y no expirado
      # @invariante INV-SBD-TLS-001

    Escenario: Datos PHI en reposo encriptados
      Dado que dato sensible se almacena
      Cuando se persiste en disco
      Entonces está encriptado con AES-256
      Y clave de encriptación no se almacena junto con datos
      # @invariante INV-SBD-ATREST-001

  Regla: Invariantes de autenticación

    Escenario: Sesiones expiran obligatoriamente
      Dado que usuario tiene sesión activa
      Cuando transcurren 30 minutos de inactividad
      Entonces sesión expira automáticamente
      Y requiere re-autenticación
      # @invariante INV-SBD-SESSION-001

    Escenario: Tokens de reset expiran
      Dado que usuario solicita reset de contraseña
      Cuando se genera token
      Entonces expira en 1 hora máximo
      Y es de uso único
      # @invariante INV-SBD-TOKEN-001

  Regla: Invariantes de autorización

    Escenario: Principio de menor privilegio
      Dado que usuario tiene rol asignado
      Cuando realiza acción
      Entonces solo accede a recursos de su rol
      Y no puede escalar privilegios
      # @invariante INV-SBD-PRIV-001

    Escenario: Separación de duties en prescripción
      Dado que médico prescribe medicamento
      Cuando farmacéutico dispensa
      Entonces son usuarios diferentes
      Y ninguno puede realizar ambas acciones
      # @invariante INV-SBD-SOD-001

  Regla: Monitoreo de seguridad continuo

    Escenario: Detección de anomalías
      Dado que sistema analiza patrones de acceso
      Cuando detecta anomalía
      Entonces clasifica:
        | Tipo de anomalía         | Acción              |
        | Acceso fuera de horario  | Alerta info         |
        | Acceso masivo            | Alerta alta         |
        | Acceso desde ubicación   | Alerta crítica      |
        | inusual                   |                     |
        | Patrón de lectura raro   | Alerta media        |

    Escenario: Dashboard de seguridad
      Dado que se consulta dashboard de seguridad
      Entonces muestra:
        | Métrica                     | Estado esperado    |
        | Alertas activas             | <5                 |
        | Incidentes este mes         | Monitoreo          |
        | Cobertura de WAF            | 100%               |
        | Certificados por expirar    | 0                  |
        | Dependencias con CVEs       | 0 críticos         |

  Regla: Seguridad se verifica automáticamente

    Escenario: SAST ejecutado en CI/CD
      Dado que desarrollador hace push de código
      Cuando se ejecuta pipeline
      Entonces SAST escanea código fuente
      Y bloquea merge si hay vulnerabilidades críticas

    Escenario: DAST ejecutado semanalmente
      Dado que sistema está desplegado en staging
      Cuando se ejecuta DAST
      Entonces se prueban top 10 OWASP
      Y se genera reporte con hallazgos y remediación
