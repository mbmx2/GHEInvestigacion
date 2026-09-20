# language: es
# PMBOK KA-09: Project Procurement Management
@status:proposed
@type:acceptance
@domain:general
# ÁREA DE CONOCIMIENTO: Gestión de Adquisiciones del Proyecto
Característica: Gestión de Adquisiciones (PMBOK KA-09)
  Como director del proyecto GHE
  Quiero gestionar adquisiciones de forma eficiente
  Para obtener los mejores recursos al menor costo

  # ─────────────────────────────────────────────────────────────
  # 1. PLANIFICACIÓN DE ADQUISICIONES
  # ─────────────────────────────────────────────────────────────

  Escenario: Identificación de necesidades de adquisición
    Dado que se identifican recursos a adquirir
    Cuando se evalúa_make or buy
    Entonces se decide:
      | Elemento                    | Decisión   | Justificación |
      | Software de base (Clojure)  | Open source| Sin costo, comunidad activa |
      | Base de datos (SQLite)      | Open source| Sin costo, offline-first |
      | Server de desarrollo        | Open source| Linux, sin costo |
      | Herramienta de testing      | Open source| clojure.test, sin costo |
      | Certificación NOM-024       | Comprar    | Consultor externo especializado |
      | Servicio de hosting cloud   | Comprar    | Para sync cuando haya internet |
      | Hardware para maternidad    | Comprar    | Computadora + impresora |

  Escenario: Documento de adquisición
    Dado que se prepara documento de adquisición
    Cuando se solicita cotización
    Entonces se incluye:
      | Sección                    |
      | Descripción del servicio/producto |
      | Especificaciones técnicas  |
      | Requisitos de entrega      |
      | Criterios de evaluación    |
      | Condiciones de pago        |
      | Calendario de entrega      |
      | Garantías                  |

  # ─────────────────────────────────────────────────────────────
  # 2. CONDUCTA DE ADQUISICIONES
  # ─────────────────────────────────────────────────────────────

  Escenario: Evaluación de proveedores
    Dado que se reciben cotizaciones de proveedores
    Cuando se evalúan
    Entonces se usa matriz:
      | Proveedor                  | Precio | Calidad | Soporte | Puntaje |
      | Proveedor A (cert NOM)     | $50,000| Alta    | 24/7    | 9/10    |
      | Proveedor B (cert NOM)     | $35,000| Media   | horario | 7/10    |
      | Proveedor C (cert NOM)     | $60,000| Alta    | dedicado| 8/10    |
    Y se selecciona según ponderación de criterios

  # ─────────────────────────────────────────────────────────────
  # 3. CONTROL DE ADQUISICIONES
  # ─────────────────────────────────────────────────────────────

  Escenario: Seguimiento de contratos
    Dado que hay contratos activos
    Cuando se monitorea
    Entonces se verifica:
      | Contrato                   | Proveedor | Estado    | Vencimiento |
      | Certificación NOM-024     | Prov. A   | En proceso| 30/12/2024  |
      | Hosting cloud             | AWS       | Activo    | Renovación anual |
      | Hardware maternidad       | Prov. D   | Entregado | Garantía 1 año |
    Y se verifica cumplimiento de SLAs
  