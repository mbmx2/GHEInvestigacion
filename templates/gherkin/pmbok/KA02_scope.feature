# language: es
# PMBOK KA-02: Project Scope Management
# ÁREA DE CONOCIMIENTO: Gestión del Alcance del Proyecto
Característica: Gestión del Alcance (PMBOK KA-02)
  Como director del proyecto GHE
  Quiero definir y controlar el alcance del proyecto
  Para entregar todo lo requerido y solo lo requerido

  # ─────────────────────────────────────────────────────────────
  # 1. PLANIFICACIÓN DEL ALCANCE
  # ─────────────────────────────────────────────────────────────

  Escenario: Definición del alcance del proyecto GHE
    Dado que se define el alcance
    Cuando se documenta
    Entonces se establece:
      | Dentro del alcance (IN)    | Fuera del alcance (OUT) |
      | Expediente clínico         | Facturación CFDI        |
      | Farmacia integrada         | Laboratorio externo     |
      | Receta electrónica         | Telemedicina            |
      | Triaje obstétrico          | Cirugía programada      |
      | Reportes SUIVE             | App móvil nativa        |
      | Offline-first              | Multi-tenant            |
      | 1 maternidad               | Red de hospitales       |
    Y todo cambio de alcance pasa por control de cambios

  Escenario: Estructura de Desglose del Trabajo (EDT/WBS)
    Dado que se crea la EDT del proyecto
    Cuando se desglosa el trabajo
    Entonces se estructura:
      | Nivel 1                    | Nivel 2                |
      | 1. Gestión del proyecto    | 1.1 Planificación      |
      |                            | 1.2 Ejecución          |
      |                            | 1.3 Monitoreo y control|
      | 2. Expediente Clínico      | 2.1 Registro pacientes |
      |                            | 2.2 Consulta médica    |
      |                            | 2.3 Notas SOAP         |
      | 3. Farmacia                | 3.1 Inventario         |
      |                            | 3.2 Dispensación       |
      |                            | 3.3 Alertas            |
      | 4. Receta Electrónica      | 4.1 Prescripción       |
      |                            | 4.2 CDS                |
      |                            | 4.3 Firma digital      |
      | 5. Obstetricia             | 5.1 Control prenatal   |
      |                            | 5.2 Triaje             |
      |                            | 5.3 Emergencias        |
      | 6. Reportes                | 6.1 SUIVE              |
      |                            | 6.2 Dashboard          |
      |                            | 6.3 Estadísticas       |
      | 7. Infraestructura         | 7.1 Offline-first      |
      |                            | 7.2 Seguridad          |
      |                            | 7.3 Sync               |

  Escenario: Definición de criterios de aceptación
    Dado que se definen criterios de aceptación por entregable
    Cuando se documenta
    Entonces cada entregable tiene:
      | Entregable                 | Criterio de aceptación |
      | Expediente clínico         | Cumple NOM-004, 95% campos obligatorios |
      | Farmacia                   | Inventario preciso 100%, 0 errores dispensación |
      | Receta electrónica         | Firma válida, sin errores CDS |
      | Triaje                     | Clasificación correcta 100% |
      | Reportes                   | Datos precisos vs. manual |

  # ─────────────────────────────────────────────────────────────
  # 2. CONTROL DE CAMBIOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Proceso de control de cambios
    Dado que se solicita cambio en alcance
    Cuando se evalúa
    Entonces se sigue proceso:
      | Paso                       |
      | 1. Solicitud formal de cambio |
      | 2. Análisis de impacto     |
      | 3. Revisión por comité de cambios |
      | 4. Decisión (aprobar/rechazar) |
      | 5. Actualizar EDT y documentos |
      | 6. Notificar a stakeholders|
    Y todo cambio se registra en bitácora
  