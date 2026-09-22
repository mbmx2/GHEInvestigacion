# language: es
# @id GHE-ISACA-CISM-007
# @type business-rule
# @domain security
# @layer management
# @risk s1
# @owner security-director
# @status proposed
# @requirement REQ-CISM-007
# @risk-control CTRL-CISM-007
# @regulation CISM ISACA
@domain:isaca @type:business-rule @risk:s1 @status:proposed
Característica: CISM — Gestión del Programa de Seguridad
  Como gerente de seguridad
  Quiero gestionar el programa de seguridad con métricas
  Para que la seguridad demuestre valor y se mejore continuamente

  Regla: Métricas de seguridad se definen

    Escenario: Framework de métricas CISM
      Dado que se definen métricas de seguridad
      Cuando se establece framework
      Entonces se incluyen:
        | Tipo de métrica             | Ejemplos                     |
        | Efectividad                 | % controles operativos       |
        | Eficiencia                  | Costo por incidente          |
        | Conformidad                 | % cumplimiento normativo     |
        | Madurez                     | Nivel de capacidad           |
        | Valor                       | Ahorro por incidentes evitados|

  Regla: Reporte a dirección es periódico

    Escenario: Reporte mensual de seguridad
      Dado que dirección necesita visibilidad
      Cuando se genera reporte mensual
      Entonces incluye:
        | Sección                    |
        | Resumen ejecutivo          |
        | Estado de controles        |
        | Incidentes del período     |
        | Métricas clave             |
        | Riesgos emergentes         |
        | Acciones correctivas       |
        | Recomendaciones            |

    Escenario: Reporte trimestral estratégico
      Dado que comité necesita visión estratégica
      Cuando se genera reporte trimestral
      Entonces incluye:
        | Sección                    |
        | Tendencias de amenazas     |
        | Estado del programa        |
        | Inversión vs resultados    |
        | Benchmarking               |
        | Roadmap actualizado        |

  Regla: Recursos de seguridad se optimizan

    Escenario: Asignación de recursos
      Dado que se gestionan recursos de seguridad
      Cuando se optimizan
      Entonces se verifica:
        | Elemento                    |
        | Roles y responsabilidades   |
        | Capacitación continua       |
        | Herramientas actualizadas   |
        | Proveedores evaluados       |
        | Automatización de procesos  |

  Regla: Mejora continua se implementa

    Escenario: Ciclo de mejora continua
      Dado que programa está en operación
      Cuando se identifican mejoras
      Entonces se ejecuta ciclo:
        | Fase       | Acciones                          |
        | Planificar  | Definir mejoras                  |
        | Hacer       | Implementar cambios              |
        | Verificar   | Medir efectividad                |
        | Actuar      | Estandarizar o ajustar           |
