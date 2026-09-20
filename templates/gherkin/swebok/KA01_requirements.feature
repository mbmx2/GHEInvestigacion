# language: es
# SWEBOK KA-01: Software Requirements
@status:proposed
@type:acceptance
@domain:general
# ÁREA DE CONOCIMIENTO: Requisitos de Software
Característica: Gestión de Requisitos de Software (SWEBOK KA-01)
  Como ingeniero de software del proyecto GHE
  Quiero gestionar requisitos de forma estructurada
  Para garantizar que el software cumple necesidades clínicas y normativas

  # ─────────────────────────────────────────────────────────────
  # 1. DESARROLLO DE REQUISITOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Captura de requisitos desde stakeholders clínicos
    Dado que se identifican stakeholders del proyecto:
      | Stakeholder                | Rol                    |
      | Médico general             | Usuario primario       |
      | Enfermera de obstetricia   | Usuario secundario     |
      | Farmacéutico               | Usuario del módulo farmacia |
      | Administrador de la maternidad | Decisor            |
      | Paciente                   | Beneficiario final     |
      | COFEPRIS                   | Regulador              |
      | Secretaría de Salud        | Normativo              |
    Cuando se realiza sesión de captura de requisitos
    Entonces se documenta cada requisito con:
      | Campo                     |
      | ID único                  |
      | Descripción clara         |
      | Tipo (funcional/no funcional) |
      | Prioridad (Must/Should/Could/Won't) |
      | Fuente (stakeholder)      |
      | Criterio de aceptación    |
      | Estado (Propuesto/Aprobado/Implementado/Verificado) |

  Escenario: Clasificación de requisitos
    Dado que existen requisitos capturados
    Cuando se clasifican
    Entonces el sistema categoriza:
      | Categoría                  | Ejemplo GHE                              |
      | Requisitos funcionales    | Registrar paciente, Generar receta        |
      | Requisitos no funcionales| Offline-first, <200ms respuesta           |
      | Requisitos de interfaz    | UI responsive, Formularios SOAP           |
      | Requisitos de datos       | CIE-10 integrado, CURP válida            |
      | Requisitos de seguridad   | Cifrado AES-256, RBAC                    |
      | Requisitos de rendimiento| Búsqueda <500ms, 50 usuarios concurrentes|
      | Requisitos normativos     | NOM-004, NOM-024, IEC 62304              |

  Escenario: Priorización de requisitos (MoSCoW)
    Dado que existen 50 requisitos para GHE
    Cuando se priorizan con MoSCoW
    Entonces se clasifican:
      | Requisito                  | Prioridad | Justificación                    |
      | Expediente clínico         | Must      | NOM-004 obligatoria              |
      | Receta electrónica         | Must      | Continuidad de atención          |
      | Offline-first              | Must      | Conectividad intermitente        |
      | Interoperabilidad FHIR     | Should    | Integración futura               |
      | IA para diagnóstico        | Could     | Diferenciador futuro             |
      | App móvil nativa           | Won't     | Web responsive es suficiente     |
    Y se genera roadmap de implementación por prioridad

  # ─────────────────────────────────────────────────────────────
  # 2. ANÁLISIS DE REQUISITOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Validación de requisitos
    Dado que los requisitos están documentados
    Cuando se validan con stakeholders
    Entonces cada requisito pasa pruebas de calidad:
      | Criterio                   | Evaluación          |
      | Consistencia              | Sin contradicciones |
      | Completitud               | Todos los campos    |
      | Claridad                  | Sin ambigüedades    |
      | Trazabilidad              | Origen identificable|
      | Verificabilidad           | Criterio de aceptación definido |
      | No redundancia            | Único              |
    Y se registra estado de cada requisito

  Escenario: Gestión de cambios en requisitos
    Dado que un requisito aprobado requiere cambio
    Cuando se solicita modificación
    Entonces se sigue proceso:
      | Paso                       | Detalle             |
      | 1. Solicitud de cambio    | Formulario con justificación |
      | 2. Análisis de impacto    | Evaluar costos, tiempo, riesgos |
      | 3. Revisión por comité    | Aprobar/rechazar    |
      | 4. Actualización documentos| Actualizar req, diseño, tests |
      | 5. Notificación           | Informar a equipo   |
    Y se actualiza la matriz de trazabilidad
    Y se registra en bitácora de cambios

  # ─────────────────────────────────────────────────────────────
  # 3. ESPECIFICACIÓN DE REQUISITOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Documento de especificación de requisitos (SRS)
    Dado que los requisitos están aprobados
    Cuando se genera el SRS
    Entonces el documento incluye:
      | Sección                   |
      | Introducción              |
      | Descripción general       |
      | Requisitos funcionales    |
      | Requisitos no funcionales |
      | Requisitos de interfaz    |
      | Restricciones             |
      | Glosario                 |
      | Apéndices                 |
    Y cada requisito tiene ID único y trazabilidad
    Y el documento está en control de versiones

  Escenario: Requisitos non-funcionales de GHE
    Dado que se definen requisitos no funcionales
    Entonces se documentan específicamente:
      | Requisito                 | Métrica            | Meta        |
      | Disponibilidad            | Uptime             | >99% offline|
      | Rendimiento               | Tiempo respuesta   | <200ms      |
      | Escalabilidad             | Usuarios           | >50 concurrentes|
      | Seguridad                 | Cifrado            | AES-256     |
      | Portabilidad              | SO                 | Linux, Windows|
      | Mantenibilidad            | Cobertura tests    | >85%        |
      | Usabilidad                | Tiempo de aprendizaje| <2 horas  |
      | Cumplimiento normativo    | NOM-004/NOM-024    | 100%        |

  # ─────────────────────────────────────────────────────────────
  # 4. VERIFICACIÓN DE REQUISITOS
  # ─────────────────────────────────────────────────────────────

  Escenario: Trazabilidad de requisitos a implementación
    Dado que existe matriz de trazabilidad
    Cuando se consulta un requisito
    Entonces se muestra cadena completa:
      | Requisito REQ-001: "Registrar paciente con CURP" |
      | Diseño DES-001: Domain model Patient            |
      | Código COD-001: patient/domain.clj              |
      | Test TST-001: patient_test.clj                  |
      | Validación VAL-001: Prueba clínica现场           |
    Y se verifica que cada requisito tiene al menos un test asociado
  