# language: es
# API Design Patterns
@status:proposed
@type:acceptance
@domain:general
Característica: Patrones de Diseño de API (GHE)
  Como desarrollador de API del proyecto GHE
  Quiero seguir patrones estándar de diseño de API
  Para que la API sea consistente, predecible y mantenible

  # ─────────────────────────────────────────────────────────────
  # 1. REST API CONVENCIONES
  # ─────────────────────────────────────────────────────────────

  Escenario: Convenciones REST
    Dado que se diseña API REST
    Cuando se definen endpoints
    Entonces:
      | Convención                  | Ejemplo              |
      | Recursos en plural          | /api/patients       |
      | IDs en URLs                 | /api/patients/{id}  |
      | Filtros como query params   | /api/patients?name=x|
      | Paginación                  | ?page=1&limit=20    |
      | Versionado                  | /api/v1/patients    |

  Escenario: Métodos HTTP
    Dado que se usan métodos HTTP
    Cuando se asignan
    Entonces:
      | Método   | Uso                    |
      | GET      | Leer                   |
      | POST     | Crear                  |
      | PUT      | Actualizar completo    |
      | PATCH    | Actualizar parcial     |
      | DELETE   | Eliminar               |

  # ─────────────────────────────────────────────────────────────
  # 2. RESPONSE FORMAT
  # ─────────────────────────────────────────────────────────────

  Escenario: Formato de respuesta exitosa
    Dado que la API retorna éxito
    Entonces:
      | Campo                      | Contenido           |
      | status                     | 200/201/204         |
      | body.success               | true                |
      | body.data                  | Datos               |
      | body.timestamp             | ISO 8601            |

  Escenario: Formato de respuesta de error
    Dado que la API retorna error
    Entonces:
      | Campo                      | Contenido           |
      | status                     | 4xx/5xx             |
      | body.success               | false               |
      | body.error                 | Mensaje legible     |
      | body.request_id            | UUID para tracing   |

  Escenario: Códigos de respuesta
    Dado que se asignan códigos HTTP
    Entonces:
      | Código  | Uso                                         |
      | 200     | OK - Operación exitosa                       |
      | 201     | Created - Recurso creado                     |
      | 400     | Bad Request - Input inválido                 |
      | 401     | Unauthorized - No autenticado                |
      | 403     | Forbidden - Sin permisos                     |
      | 404     | Not Found - Recurso no existe                |
      | 409     | Conflict - Conflicto                         |
      | 422     | Unprocessable - Validación fallida           |
      | 429     | Too Many Requests - Rate limit               |
      | 500     | Internal Server Error                        |

  # ─────────────────────────────────────────────────────────────
  # 3. PAGINACIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Paginación
    Dado que se pide lista paginada
    Entonces:
      | Campo                      | Contenido           |
      | pagination.total           | Total de registros  |
      | pagination.page            | Página actual       |
      | pagination.limit           | Registros por página|
      | pagination.pages           | Total de páginas    |

  # ─────────────────────────────────────────────────────────────
  # 4. VERSIONADO
  # ─────────────────────────────────────────────────────────────

  Escenario: Versionado de API
    Dado que se versiona la API
    Entonces:
      | Criterio                   | Acción              |
      | Cambio compatible          | Misma versión       |
      | Cambio breaking            | Nueva versión       |
      | Deprecación                | Marcar deprecated   |

  # ─────────────────────────────────────────────────────────────
  # 5. AUTENTICACIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Autenticación con tokens
    Dado que se usa token-based auth
    Entonces:
      | Paso                       |
      | 1. Login → obtener token   |
      | 2. Enviar token en header  |
      | 3. Server valida token     |
      | 4. Si inválido → 401       |
