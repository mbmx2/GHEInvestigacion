# language: es
# @id GHE-ISACA-CISM-001
# @type business-rule
# @domain security
# @layer governance
# @risk s1
# @owner security-director
# @status proposed
# @requirement REQ-CISM-001
# @risk-control CTRL-CISM-001
# @regulation CISM ISACA
@domain:isaca @type:business-rule @risk:s1 @status:proposed
Característica: CISM — Gobernanza de Seguridad de la Información
  Como director de seguridad
  Quiero gobernanza de seguridad conforme CISM/ISACA
  Para que la seguridad de la información esté alineada con objetivos del hospital

  Regla: Estrategia de seguridad se alinea con negocio

    Escenario: Desarrollo de estrategia de seguridad
      Dado que se desarrolla estrategia de seguridad
      Cuando se alinea con objetivos del hospital
      Entonces se verifica:
        | Objetivo hospitalario       | Estrategia de seguridad        |
        | Proteger expedientes        | Cifrado en reposo y tránsito   |
        | Continuidad clínica         | Disponibilidad >99.5%          |
        | Cumplimiento NOM-024        | Controles de acceso y auditoría|
        | Protección de menores       | Controles reforzados para datos pediátricos|

    Escenario: Marco de referencia de seguridad
      Dado que se define marco de referencia
      Cuando se establece
      Entonces incluye:
        | Componente                  |
        | Política de seguridad de la información |
        | Estándares de seguridad     |
        | Procedimientos operativos   |
        | Directrices técnicas        |
        | Lineamientos de cumplimiento|

  Regla: Programa de seguridad se gestiona

    Escenario: Programa anual de seguridad
      Dado que se planifica programa de seguridad
      Cuando se define calendario
      Entonces incluye:
        | Actividad                  | Frecuencia    |
        | Evaluación de riesgos      | Semestral     |
        | Prueba de penetración      | Trimestral    |
        | Capacitación de personal   | Mensual       |
        | Revisión de políticas      | Anual         |
        | Auditoría de seguridad     | Semestral     |
        | Simulacro de incidentes    | Trimestral    |

  Regla: Métricas de seguridad se miden

    Escenario: Dashboard de seguridad
      Dado que se consulta dashboard CISM
      Entonces muestra:
        | Métrica                     | Meta          |
        | Tiempo medio de detección   | <1 hora       |
        | Tiempo medio de respuesta   | <4 horas      |
        | Incidentes este trimestre   | <3            |
        | Capacitación completada     | 100%          |
        | Vulnerabilidades críticas   | 0 abiertas    |
        | Cobertura de controles      | >95%          |

  Regla: Seguridad de datos sensibles es prioritaria

    Escenario: Clasificación de datos
      Dado que se clasifican datos del hospital
      Cuando se define clasificación
      Entonces se establecen niveles:
        | Nivel     | Ejemplos                     | Controles        |
        | Crítico   | Expedientes, diagnósticos    | Cifrado + acceso restringido |
        | Sensible  | Datos administrativos        | Cifrado + auditoría |
        | Interno   | Procedimientos operativos    | Control de acceso |
        | Público   | Información general          | Sin restricción   |

  Regla: Gestión de identidades y accesos

    Escenario: Provisioning de accesos
      Dado que nuevo personal ingresa al hospital
      Cuando se le asigna acceso al sistema
      Entonces se verifica:
        | Control                      |
        | Aprobación del supervisor    |
        | Principio de menor privilegio|
        | Segregación de funciones     |
        | Revisión trimestral de accesos|
        | Baja automática por inactividad|

  Regla: Seguridad se verifica continuamente

    Escenario: Monitoreo de seguridad 24/7
      Dado que sistema opera 24/7
      Cuando se monitorean eventos de seguridad
      Entonces se detectan y clasifican:
        | Tipo de evento               | Acción          |
        | Acceso no autorizado         | Alerta inmediata|
        | Patrón anómalo               | Investigación   |
        | Fallo de control             | Escalamiento    |
        | Actividad de malware         | Contención      |
