# language: es
# CI/CD Pipeline
Característica: Pipeline de Integración Continua y Despliegue Continuo (GHE)
  Como responsable de DevOps del proyecto GHE
  Quiero automatizar build, test y deploy
  Para entregar cambios de forma rápida y segura

  # ─────────────────────────────────────────────────────────────
  # 1. PIPELINE DE CI
  # ─────────────────────────────────────────────────────────────

  Escenario: Pipeline en cada commit
    Dado que se ejecuta pipeline en cada commit
    Cuando se ejecuta
    Entonces las etapas son:
      | Etapa                       | Herramienta        | Tiempo max |
      | 1. Checkout                 | Git                | <10s       |
      | 2. Install dependencies     | Leiningen          | <60s       |
      | 3. Linting                  | clj-kondo          | <30s       |
      | 4. Unit tests               | clojure.test       | <3min      |
      | 5. Integration tests        | clojure.test + DB  | <5min      |
      | 6. Coverage check           | cloverage          | <2min      |
      | 7. Security scan            | Dependency check   | <2min      |
      | 8. Build                    | Leiningen          | <2min      |
      | **Total**                   |                    | **<15min** |

  Escenario: Criterios de paso
    Dado que se evalúa si el pipeline pasa
    Cuando se verifica
    Entonces:
      | Criterio                   | Umbral             |
      | Tests pasan                | 100%               |
      | Linting                    | 0 errores críticos |
      | Coverage                   | >85%               |
      | Security scan              | 0 vulnerabilidades críticas |
      | Build exitoso              | 0 errores          |

  # ─────────────────────────────────────────────────────────────
  # 2. PIPELINE DE CD
  # ─────────────────────────────────────────────────────────────

  Escenario: Deploy automático a staging
    Dado que se completa CI exitosamente
    Cuando se despliega a staging
    Entonces:
      | Paso                       |
      | 1. Build de producción     |
      | 2. Ejecutar tests de smoke |
      | 3. Desplegar a staging     |
      | 4. Ejecutar sanity checks  |
      | 5. Notificar al equipo     |

  Escenario: Deploy manual a producción
    Dado que staging está verificado
    Cuando se aprueba deploy
    Entonces:
      | Paso                       |
      | 1. Aprobación manual       |
      | 2. Crear backup            |
      | 3. Desplegar a producción  |
      | 4. Verificar health check  |
      | 5. Monitorear 30 minutos   |
      | 6. Rollback si falla       |

  # ─────────────────────────────────────────────────────────────
  # 3. ROLLBACK
  # ─────────────────────────────────────────────────────────────

  Escenario: Rollback automático
    Dado que falla el health check post-deploy
    Cuando se activa rollback
    Entonces:
      | Paso                       |
      | 1. Detectar fallo          |
      | 2. Activar versión anterior|
      | 3. Verificar restauración  |
      | 4. Notificar al equipo     |
      | 5. Investigar causa        |

  # ─────────────────────────────────────────────────────────────
  # 4. MONITOREO POST-DEPLOY
  # ─────────────────────────────────────────────────────────────

  Escenario: Verificación post-deploy
    Dado que se completa deploy
    Cuando se verifica
    Entonces:
      | Verificación               | Tiempo después     |
      | Health check               | Inmediato          |
      | Error rate                 | 5 minutos          |
      | Response time              | 15 minutos         |
      | Uptime                     | 30 minutos         |
      | User feedback              | 1 hora             |
  