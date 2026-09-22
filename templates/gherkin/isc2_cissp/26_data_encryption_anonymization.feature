# language: es
# @id GHE-CISSP-026
# @type business-rule
# @domain security
# @layer encryption-data
# @risk s1
# @owner data-protection-officer
# @status proposed
# @requirement REQ-CISSP-026
# @risk-control CTRL-CISSP-026
# @regulation CISSP-D2 ISC2 LFPDPPP
@domain:isc2_cissp @type:business-rule @risk:s1 @status:proposed
Característica: CISSP — Gestión de Datos Cifrados y Anonimización
  Como oficial de protección de datos
  Quiero gestión de datos cifrados y anonimización conforme CISSP
  Para que los datos se protejan según su sensibilidad y uso

  Regla: Datos se cifran según clasificación

    Escenario: Estrategia de cifrado por clase
      Dado que datos tienen diferentes niveles de sensibilidad
      Cuando se define estrategia de cifrado
      Entonces se verifica:
        | Clase de dato              | Cifrado                     |
        | Expedientes clínicos       | AES-256 en reposo + tránsito|
        | Datos financieros          | AES-256 + firma digital     |
        | Datos de identidad         | AES-256 + acceso restringido|
        | Datos de contacto          | Cifrado en tránsito         |
        | Logs de auditoría          | Cifrado en reposo           |
        | Datos de prueba            | Anonimización               |

  Regla: Anonimización se implementa

    Escenario: Datos para investigación
      Dado que datos se usan para investigación
      Cuando se anonimizan
      Entonces se verifica:
        | Elemento                    |
        | Supresión de identificadores|
        | Generalización de datos     |
        | Ruido agregado              |
        | Verificación de re-identificación|
        | Documentación del proceso   |

    Escenario: Pseudonimización
      Dado que datos requieren pseudonimización
      Cuando se implementa
      Entonces se verifica:
        | Elemento                    |
        | Mapping seguro              |
        | Separación de identidad     |
        | Acceso solo autorizado      |
        | Registro de acceso          |

  Regla: Datos sensibles se enmascaran

    Escenario: Enmascaramiento en UI
      Dado que datos sensibles se muestran en interfaz
      Cuando se visualizan
      Entonces se verifica:
        | Elemento                    |
        | CURP parcialmente oculto    |
        | Teléfono parcialmente oculto|
        | Correo parcialmente oculto  |
        | Acceso completo solo con autorización|

  Regla: Retención y eliminación se gestionan

    Escenario: Eliminación segura de datos
      Dado que datos alcanzan fin de retención
      Cuando se eliminan
      Entonces se verifica:
        | Elemento                    |
        | Método de eliminación seguro|
        | Verificación de eliminación |
        | Registro de eliminación     |
        | Certificación si aplica     |
