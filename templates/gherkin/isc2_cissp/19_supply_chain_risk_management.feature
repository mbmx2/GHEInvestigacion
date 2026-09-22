# language: es
# @id GHE-CISSP-019
# @type business-rule
# @domain security
# @layer supply-chain
# @risk s1
# @owner vendor-risk-manager
# @status proposed
# @requirement REQ-CISSP-019
# @risk-control CTRL-CISSP-019
# @regulation CISSP-D1 ISC2
@domain:isc2_cissp @type:business-rule @risk:s1 @status:proposed
Característica: CISSP — Gestión de Riesgos de Proveedores y Cadena de Suministro
  Como gerente de riesgos de proveedores
  Quiero gestión de riesgos de cadena de suministro conforme CISSP
  Para que los proveedores no introduzcan vulnerabilidades al hospital

  Regla: Evaluación de proveedores se realiza

    Escenario: Due diligence de proveedor
      Dado que hospital evalúa nuevo proveedor de TI
      Cuando se realiza due diligence
      Entonces se verifica:
        | Elemento                    |
        | Certificaciones de seguridad|
        | Historial de incidentes     |
        | Prácticas de desarrollo seguro|
        | Cláusulas de seguridad      |
        | Plan de continuidad         |
        | Seguro de responsabilidad   |

    Escenario: Evaluación post-selección
      Dado que proveedor fue seleccionado
      Cuando se evalúa implementations
      Entonces se verifica:
        | Elemento                    |
        | Configuración segura        |
        | Acceso mínimo necesario     |
        | Monitoreo de actividad      |
        | Acuerdos de nivel de servicio|
        | Plan de salida              |

  Regla: Cláusulas de seguridad se incluyen

    Escenario: Contrato con proveedor
      Dado que se firma contrato con proveedor TI
      Cuando se revisan cláusulas
      Entonces se incluyen:
        | Cláusula                    |
        | Confidencialidad            |
        | Seguridad de datos          |
        | Notificación de incidentes  |
        | Auditoría                   |
        | Cumplimiento normativo      |
        | Terminación y salida        |
        | Responsabilidad por brechas |

  Regla: Cadena de suministro de software se asegura

    Escenario: Software de terceros
      Dado que se usa software de terceros
      Cuando se evalúa
      Entonces se verifica:
        | Elemento                    |
        | Origen verificado           |
        | Integridad (hash)           |
        | CVEs conocidos              |
        | Actualizaciones disponibles |
        | Licencias compatibles       |
        | Alternativas documentadas   |

  Regla: Monitoreo de proveedores es continuo

    Escenario: Desempeño de proveedor
      Dado que proveedor está operando
      Cuando se monitorea desempeño
      Entonces se verifica:
        | Elemento                    |
        | SLA cumplidos               |
        | Incidentes reportados       |
        | Actualizaciones aplicadas   |
        | Resultados de auditoría     |
        | Satisfacción del hospital   |
