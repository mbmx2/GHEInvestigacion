# language: es
# SWEBOK KA-03: Software Construction
@status:proposed
# @requirement:PRACTICE-GHE-001
@type:acceptance
@domain:general
# ÁREA DE CONOCIMIENTO: Construcción de Software
Característica: Construcción de Software (SWEBOK KA-03)
  Como desarrollador del proyecto GHE
  Quiero construir código de alta calidad
  Para garantizar confiabilidad y mantenibilidad

  # ─────────────────────────────────────────────────────────────
  # 1. GESTIÓN DE LA CONSTRUCCIÓN
  # ─────────────────────────────────────────────────────────────

  Escenario: Configuración del entorno de construcción
    Dado que se configura el entorno de desarrollo
    Cuando se establece el entorno
    Entonces se documenta:
      | Herramienta               | Versión / Configuración |
      | Clojure                   | 1.11.x               |
      | ClojureScript             | Latest               |
      | Java (JDK)                | OpenJDK 17+          |
      | Leiningen                 | 2.x                  |
      | Shadow CLJS               | Latest               |
      | SQLite                    | 3.40+                |
      | Git                       | Latest               |
      | CI/CD                     | GitHub Actions       |
    Y el entorno es reproducible con `lein deps`
  