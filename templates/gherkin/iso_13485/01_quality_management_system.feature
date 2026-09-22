# language: es
# @id GHE-ISO13485-001
# @type business-rule
# @domain quality
# @layer governance
# @risk s2
# @owner quality-director
# @status proposed
# @requirement REQ-ISO13485-001
# @risk-control CTRL-ISO13485-001
# @regulation ISO-13485
@domain:quality @type:business-rule @risk:s2 @status:proposed
Característica: Sistema de Gestión de Calidad — ISO 13485
  Como director de calidad
  Quiero implementar un SGQ conforme ISO 13485
  Para asegurar que el software médico cumple requisitos de calidad

  Regla: Documentación del SGQ está controlada

    Escenario: Control de documentos
      Dado que se crea o modifica documento del SGQ
      Cuando se somete a revisión
      Entonces se registra:
        | Campo            |
        | Número de documento |
        | Versión          |
        | Fecha de emisión |
        | Autor            |
        | Revisor          |
        | Estado           |
      Y solo documentos aprobados están disponibles

    Escenario: Distribución de documentos
      Dado que documento es aprobado
      Cuando se distribuye
      Entonces se verifica que personal relevante recibe versión vigente
      Y versiones anteriores se retiran de uso

  Regla: Responsabilidad de la dirección

    Escenario: Revisión por dirección
      Dado que es momento de revisión semestral
      Cuando la dirección ejecuta revisión del SGQ
      Entonces evalúa:
        | Entrada                         |
        | Resultados de auditorías       |
        | Retroalimentación de clientes  |
        | Estado de acciones correctivas |
        | Cambios en requisitos normativos|
        | Recomendaciones de mejora       |
      Y genera decisiones documentadas

  Regla: Gestión de recursos

    Escenario: Recursos para desarrollo
      Dado que se inicia proyecto de desarrollo
      Cuando se planifican recursos
      Entonces se identifican: personal competente, infraestructura, ambiente de trabajo
      Y se documentan requisitos de competencia

    Escenario: Capacitación obligatoria
      Dado que personal nuevo ingresa al proyecto
      Cuando se asigna al equipo
      Entonces recibe capacitación en:
        | Tema                     |
        | Requisitos del SGQ       |
        | Procedimientos operativos|
        | Seguridad del paciente   |
        | Protección de datos      |
      Y se registra evidencia de capacitación

  Regla: Planificación del producto

    Escenario: Plan de desarrollo
      Dado que se inicia desarrollo de componente
      Cuando se crea plan
      Entonces incluye:
        | Elemento                    |
        | Fases del proyecto          |
        | Actividades de verificación|
        | Hitos de revisión          |
        | Asignación de responsables |
        | Recursos necesarios        |

  Regla: Medición y mejora continua

    Escenario: Métricas de calidad del SGQ
      Dado que se consulta dashboard del SGQ
      Entonces muestra:
        | Métrica                     | Meta      |
        | Acciones correctivas cerradas| >90%     |
        | Auditorías internas al año  | ≥2        |
        | No conformidades abiertas   | <5        |
        | Satisfacción del cliente    | >85%      |
