# language: es
# @id GHE-CISSP-031
# @type business-rule
# @domain security
# @layer data-lifecycle
# @risk s1
# @owner data-governor
# @status proposed
# @requirement REQ-CISSP-031
# @risk-control CTRL-CISSP-031
# @regulation CISSP-D2 ISC2 LFPDPPP
@domain:isc2_cissp @type:business-rule @risk:s1 @status:proposed
Característica: CISSP — Gestión del Ciclo de Vida de Datos
  Como gobernador de datos
  Quiero gestión del ciclo de vida de datos conforme CISSP
  Para que los datos se gestionen de creación a eliminación de forma segura

  Regla: Datos se clasifican al crearse

    Escenario: Clasificación automática
      Dado que se capturan nuevos datos
      Cuando se clasifican
      Entonces se verifica:
        | Elemento                    |
        | Nivel de clasificación      |
        | Propietario asignado        |
        | Categoría de datos          |
        | Requisitos de protección    |
        | Período de retención        |

  Regla: Datos se almacenan seguramente

    Escenario: Almacenamiento seguro
      Dado que datos persisten en sistema
      Cuando se almacenan
      Entonces se verifica:
        | Elemento                    |
        | Cifrado según clasificación |
        | Acceso controlado           |
        | Integridad verificada       |
        | Backup seguro               |
        | Ubicación permitida         |

  Regla: Datos se procesan con control

    Escenario: Procesamiento de datos sensibles
      Dado que datos sensibles se procesan
      Cuando se ejecutan operaciones
      Entonces se verifica:
        | Elemento                    |
        | Acceso solo autorizado      |
        | Logging de operaciones      |
        | Datos en memoria protegidos |
        | Temp files eliminados       |
        | Resultados protegidos       |

  Regla: Datos se transmiten seguramente

    Escenario: Transferencia de datos
      Dado que datos se transfieren
      Cuando se mueven
      Entonces se verifica:
        | Elemento                    |
        | Cifrado en tránsito         |
        | Autenticación del canal     |
        | Integridad verificada       |
        | Registro de transferencia   |
        | Destino autorizado          |

  Regla: Datos se archivan

    Escenario: Archivo de datos
      Dado que datos alcanzan fin de uso activo
      Cuando se archivan
      Entonces se verifica:
        | Elemento                    |
        | Ubicación de archivo        |
        | Cifrado mantenido           |
        | Acceso restringido          |
        | Índice de archivo           |
        | Retención documentada       |

  Regla: Datos se eliminan seguramente

    Escenario: Eliminación de datos
      Dado que datos alcanzan fin de retención
      Cuando se eliminan
      Entonces se verifica:
        | Método                      | Nivel          |
        | Electrónico                 | 3 pasadas      |
        | Físico                      | Degaussing     |
        | Cloud                       | Certificado    |
        | Registro de eliminación     | Documentado    |
        | Verificación post-eliminación| Confirmada    |
