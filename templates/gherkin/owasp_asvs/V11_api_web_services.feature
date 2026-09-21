# language: es
# @id GHE-ASVS-V11-001
# @type compliance
# @domain security
# @layer domain
# @risk s2
# @owner security-lead
# @status proposed
# @requirement ASVS-V11
# @risk-control CTRL-ASVS-V11
# @regulation NOM-024
@domain:security @type:compliance @risk:s2 @status:proposed
Característica: V11 - API y Servicios Web
  Como responsable de seguridad del proyecto GHE
  Quiero que las APIs sean seguras
  Para que no se expongan vulnerabilidades vía endpoints

  Regla: V11.1 - Autenticación de API

    Escenario: API requiere autenticación
      Dado que se accede a endpoint protegido
      Cuando se verifica
      Entonces:
        | Verificación              | Estado |
        | Token requerido           | ✅      |
        | Token válido              | ✅      |
        | Token no expirado         | ✅      |
        | Sin token → 401           | ✅      |

  Regla: V11.2 - Autorización de API

    Escenario: API valida permisos
      Dado que usuario accede a endpoint
      Cuando se verifica autorización
      Entonces:
        | Verificación              | Estado |
        | Rol autorizado            | ✅      |
        | Permisos suficientes      | ✅      |
        | Sin permiso → 403         | ✅      |

  Regla: V11.3 - Rate limiting

    Escenario: Límite de peticiones
      Dado que se envían múltiples peticiones
      Cuando se evalúa
      Entonces:
        | Endpoint                   | Límite    |
        | Login                      | 5/min     |
        | API general                | 100/min   |
        | Búsqueda                   | 30/min    |
        | Crear/modificar            | 50/min    |

  Regla: V11.4 - Validación de input en API

    Escenario: API valida entrada
      Dado que se recibe petición
      Cuando se procesa
      Entonces:
        | Verificación              | Estado |
        | Content-Type válido       | ✅      |
        | Body contra schema        | ✅      |
        | Campos requeridos         | ✅      |
        | Tipos de datos            | ✅      |
        | Longitudes                | ✅      |

  Regla: V11.5 - Respuestas de error seguras

    Escenario: Error no expone información
      Dado que API retorna error
      Cuando se verifica respuesta
      Entonces NO incluye:
        | Información que NO se expone |
        | Stack trace              |
        | Versión del software     |
        | Rutas internas           |
        | Query SQL                |
      Y sí incluye:
        | Información que SÍ se expone |
        | Mensaje genérico         |
        | Código de error          |
        | Request ID               |

  Regla: V11.6 - CORS

    Escenario: CORS restrictivo
      Dado que se configura CORS
      Cuando se verifica
      Entonces:
        | Configuración             |
        | Solo origins permitidos   |
        | No wildcard (*)           |
        | Headers permitidos definidos |
        | Métodos permitidos definidos |
