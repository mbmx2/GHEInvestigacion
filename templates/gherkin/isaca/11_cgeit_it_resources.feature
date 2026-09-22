# language: es
# @id GHE-ISACA-CGEIT-011
# @type business-rule
# @domain governance
# @layer resources
# @risk s2
# @owner governance-director
# @status proposed
# @requirement REQ-CGEIT-011
# @risk-control CTRL-CGEIT-011
# @regulation CGEIT ISACA
@domain:isaca @type:business-rule @risk:s2 @status:proposed
Característica: CGEIT — Gestión de Recursos de TI (Dominio 2)
  Como director de TI
  Quiero gestionar recursos de TI conforme CGEIT
  Para que los recursos de TI (personas, tecnología, datos) se optimicen

  Regla: Recursos humanos de TI se gestionan

    Escenario: Plan de recursos humanos TI
      Dado que se planifica equipo de TI
      Cuando se define plan
      Entonces se incluye:
        | Elemento                    |
        | Estructura organizacional   |
        | Roles y responsabilidades   |
        | Perfiles de competencia     |
        | Plan de reclutamiento       |
        | Plan de capacitación        |
        | Evaluación de desempeño     |
        | Plan de retención           |

    Escenario: Gestión de conocimiento TI
      Dado que equipo TI tiene conocimiento especializado
      Cuando se gestiona conocimiento
      Entonces se verifica:
        | Elemento                    |
        | Documentación de procesos   |
        | Base de conocimiento        |
        | Transferencia de conocimiento|
        | Cross-training              |
        | Sucesión en roles clave     |

  Regla: Infraestructura de TI se optimiza

    Escenario: Gestión de infraestructura
      Dado que se gestiona infraestructura TI
      Cuando se optimiza
      Entonces se verifica:
        | Elemento                    |
        | Inventario actualizado      |
        | Ciclo de vida de activos    |
        | Plan de renovación          |
        | Consolidación               |
        | Virtualización              |
        | Energía y enfriamiento      |

    Escenario: Gestión de licencias
      Dado que se gestionan licencias de software
      Cuando se optimiza
      Entonces se verifica:
        | Elemento                    |
        | Inventario de licencias     |
        | Uso vs asignación           |
        | Renovaciones próximas       |
        | Ahorro por consolidación    |
        | Compliance de licencias     |

  Regla: Datos se gestionan como recurso

    Escenario: Gestión del ciclo de vida de datos
      Dado que datos son recurso crítico
      Cuando se gestiona ciclo de vida
      Entonces se verifica:
        | Elemento                    |
        | Creación y captura          |
        | Almacenamiento              |
        | Procesamiento               |
        | Distribución                |
        | Archivo                     |
        | Eliminación segura          |

  Regla: Recursos se planifican

    Escenario: Planificación de capacidad
      Dado que se planifica capacidad de recursos
      Cuando se evalúa demanda futura
      Entonces se verifica:
        | Elemento                    |
        | Proyección de crecimiento   |
        | Capacidad disponible        |
        | Plan de adquisición         |
        | Restricciones presupuestales|
        | Timeline de implementación  |
