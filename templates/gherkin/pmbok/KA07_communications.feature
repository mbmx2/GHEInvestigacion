# language: es
# PMBOK KA-07: Project Communications Management
@status:proposed
@type:acceptance
@domain:general
# ÁREA DE CONOCIMIENTO: Gestión de Comunicaciones del Proyecto
Característica: Gestión de Comunicaciones (PMBOK KA-07)
  Como director del proyecto GHE
  Quiero gestionar comunicaciones de forma efectiva
  Para que todos los stakeholders estén informados

  # ─────────────────────────────────────────────────────────────
  # 1. PLANIFICACIÓN DE COMUNICACIONES
  # ─────────────────────────────────────────────────────────────

  Escenario: Matriz de comunicaciones
    Dado que se define matriz de comunicaciones
    Cuando se documenta
    Entonces se establece:
      | Comunicación               | Audiencia           | Frecuencia | Canal       | Responsable |
      | Daily standup              | Equipo técnico      | Diaria     | Reunión/Virtual | Scrum Master |
      | Sprint review              | Stakeholders        | Quincenal  | Demo        | Director    |
      | Retrospectiva              | Equipo técnico      | Quincenal  | Reunión     | Scrum Master |
      | Reporte de avance          | Patrocinador        | Mensual    | Documento   | Director    |
      | Reporte de calidad         | Director proyecto   | Semanal    | Dashboard   | QA Lead     |
      | Actualización normativa    | Equipo + stakeholders| Trimestral| Documento   | Compliance  |
      | Estado de bugs             | Equipo técnico      | Continua   | Issue tracker | Dev Lead  |

  Escenario: Comunicación con stakeholders clínicos
    Dado que se necesita comunicar con equipo clínico
    Cuando se prepara comunicación
    Entonces se adapta formato:
      | Audiencia                  | Formato              | Contenido |
      | Médicos                    | Demo + papel         | Beneficios clínicos, flujos |
      | Enfermeras                 | Capacitación hands-on| Cómo usar sistema día a día |
      | Farmacéuticos              | Reunión + guía       | Inventario, dispensación    |
      | Administración             | Dashboard ejecutivo  | KPIs, ROI, cumplimiento    |
    