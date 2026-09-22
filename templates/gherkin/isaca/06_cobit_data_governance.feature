# language: es
# @id GHE-ISACA-COBIT-006
# @type business-rule
# @domain governance
# @layer data
# @risk s1
# @owner data-governor
# @status proposed
# @requirement REQ-COBIT-006
# @risk-control CTRL-COBIT-006
# @regulation COBIT-2019
@domain:isaca @type:business-rule @risk:s1 @status:proposed
Característica: COBIT 2019 — Gobernanza de Datos (AED12 / GOV03)
  Como gobernador de datos
  Quiero gobernanza de datos conforme COBIT 2019
  Para que los datos del hospital sean un activo gestionado con calidad e integridad

  Regla: Política de datos se define

    Escenario: Marco de gobernanza de datos
      Dado que se establece gobernanza de datos
      Cuando se define marco
      Entonces se incluye:
        | Componente                  |
        | Política de gestión de datos|
        | Roles de gobernanza de datos|
        | Estándares de calidad       |
        | Ciclo de vida de datos      |
        | Clasificación de datos      |
        | Propiedad de datos          |

    Escenario: Definición de roles de datos
      Dado que se definen roles de datos
      Cuando se asignan responsabilidades
      Entonces se establecen:
        | Rol                   | Responsabilidad         |
        | Dueño del dato        | Calidad y acceso        |
        | Steward del dato      | Operación y procesamiento|
        | Custodio del dato     | Seguridad y protección  |
        | Consumidor del dato   | Uso adecuado           |

  Regla: Calidad de datos se mide

    Escenario: Dimensiones de calidad de datos
      Dado que se evalúa calidad de datos clínicos
      Cuando se miden dimensiones
      Entonces se verifica:
        | Dimensión             | Criterio                        |
        | Completitud           | Campos obligatorios >98%        |
        | Exactitud             | Sin errores de captura >99%     |
        | Consistencia         | Sin duplicados contradictorios  |
        | Oportunidad          | Datos actualizados en <24h      |
        | Validez              | Dentro de rangos fisiológicos  |
        | Unicidad             | Un registro por paciente        |

    Escenario: Perfil de calidad de datos
      Dado que se genera perfil de calidad
      Cuando se analiza
      Entonces se identifican:
        | Hallazgo                    | Acción              |
        | Campos vacíos críticos     | Regla de completitud|
        | Valores fuera de rango     | Validación          |
        | Registros duplicados       | Fusión/deduplicación|
        | Formatos inconsistentes    | Estandarización     |

  Regla: Ciclo de vida de datos se gestiona

    Escenario: Retención de datos
      Dado que se define política de retención
      Cuando se establece
      Entonces se clasifica:
        | Tipo de dato               | Período de retención |
        | Expedientes clínicos       | 20 años (NOM-004)   |
        | Imágenes diagnósticas      | 10 años             |
        | Registros de auditoría     | 5 años              |
        | Datos administrativos      | 5 años              |
        | Logs de seguridad          | 1 año               |

    Escenario: Purga de datos
      Dado que datos exceden período de retención
      Cuando se ejecuta purga
      Entonces se verifica:
        | Elemento                    |
        | Aprobación de retención     |
        | Método de eliminación seguro|
        | Registro de eliminación     |
        | Preservación de evidencia  |

  Regla: Integridad referencial se mantiene

    Escenario: Verificación de integridad
      Dado que se verifican relaciones entre datos
      Cuando se ejecutan reglas de integridad
      Entonces se verifica:
        | Regla                       |
        | Todo paciente tiene expediente|
        | Toda prescripción vincula a paciente|
        | Todo resultado vincula a solicitud|
        | Todo inventario vincula a medicamento|
