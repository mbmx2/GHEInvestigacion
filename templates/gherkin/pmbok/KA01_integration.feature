# language: es
# PMBOK KA-01: Project Integration Management
# ÁREA DE CONOCIMIENTO: Gestión Integrada de Proyectos
Característica: Gestión Integrada de Proyectos (PMBOK KA-01)
  Como director del proyecto GHE
  Quiero integrar todas las áreas de gestión del proyecto
  Para garantizar coherencia y unidad de propósito

  # ─────────────────────────────────────────────────────────────
  # 1. DESARROLLO DEL CHARTER DEL PROYECTO
  # ─────────────────────────────────────────────────────────────

  Escenario: Creación del Charter del proyecto GHE
    Dado que se inicia el proyecto GHE
    Cuando se elabora el Charter
    Entonces el documento incluye:
      | Sección                    |
      | Nombre del proyecto        |
      | Justificación del proyecto |
      | Objetivos medibles         |
      | Alcance de alto nivel      |
      | Riesgos principales        |
      | Stakeholders clave         |
      | Presupuesto de alto nivel  |
      | Cronograma de alto nivel   |
      | Patrocinador del proyecto  |
      | Director del proyecto      |
      | Fecha de aprobación        |
    Y el Charter es aprobado por el patrocinador
  