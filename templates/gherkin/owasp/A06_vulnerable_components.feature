# language: es
# OWASP Top 10 - A06: Vulnerable and Outdated Components
@status:proposed
@type:acceptance
@domain:general
# Uso de componentes con vulnerabilidades conocidas
Característica: A06 - Componentes Vulnerables (OWASP Top 10)
  Como responsable de seguridad del proyecto GHE
  Quiero mantener componentes actualizados y sin vulnerabilidades
  Para prevenir explotación de fallos conocidos

  # ─────────────────────────────────────────────────────────────
  # 1. GESTIÓN DE DEPENDENCIAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Inventario de componentes
    Dado que se mantiene inventario de dependencias
    Cuando se consulta
    Entonces se documentan:
      | Componente                 | Versión | Última versión | Vulnerabilidades |
      | Clojure                    | 1.11.x  | 1.12.x        | Ninguna conocida |
      | ClojureScript              | Latest  | Latest         | Ninguna conocida |
      | Java (OpenJDK)             | 17      | 21             | Ninguna en 17    |
      | SQLite                     | 3.40    | 3.45           | Ninguna crítica  |
      | Jetty (web server)         | 11.x    | 12.x           | Ninguna crítica  |
      | Bcrypt library             | Latest  | Latest         | Ninguna conocida |

  Escenario: Escaneo de vulnerabilidades
    Dado que se ejecuta escaneo de dependencias
    Cuando se busca vulnerabilidades
    Entonces:
      | Herramienta                | Frecuencia | Acción     |
      | lein ancient               | Semanal    | Actualizar |
      | OWASP Dependency-Check     | Mensual    | Reportar   |
      | GitHub Dependabot          | Continua   | Alertar    |
    Y vulnerabilidades críticas se corrigen en 24 horas

  Escenario: Actualización de dependencias
    Dado que se detecta vulnerabilidad en dependencia
    Cuando se actualiza
    Entonces se sigue proceso:
      | Paso                       |
      | 1. Identificar versión afectada |
      | 2. Buscar versión parcheada |
      | 3. Evaluar compatibilidad  |
      | 4. Actualizar en desarrollo|
      | 5. Ejecutar todos los tests|
      | 6. Code review             |
      | 7. Desplegar a producción  |
    Y se documenta en changelog

  # ─────────────────────────────────────────────────────────────
  # 2. ANÁLISIS DE DEPENDENCIAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Verificación de licencias
    Dado que se verifican licencias de dependencias
    Cuando se analiza
    Entonces:
      | Dependencia                | Licencia  | Compatible? |
      | Clojure                    | EPL 1.0   | ✅          |
      | SQLite                     | Public Domain | ✅       |
      | OpenJDK                    | GPL 2.0   | ✅          |
      | All dependencies           | Open Source| ✅         |
    Y no hay dependencias con licencias restrictivas

  Escenario: Análisis de cadena de dependencias
    Dado que se analizan dependencias transitivas
    Cuando se verifica profundidad
    Entonces:
      | Nivel                      | Dependencias | Vulnerabilidades |
      | Directas                   | 15           | 0               |
      | Transitivas (nivel 1)      | 45           | 0               |
      | Transitivas (nivel 2)      | 120          | 0               |
      | **Total**                  | **180**      | **0**           |
  