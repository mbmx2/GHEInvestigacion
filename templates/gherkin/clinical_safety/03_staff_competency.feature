# language: es
# Staff Competency & Training
@status:proposed
@type:acceptance
@domain:clinical_safety
Característica: Competencias y Capacitación del Personal (GHE)
  Como director de la maternidad
  Quiero evaluar y mejorar las competencias del equipo
  Para que cada miembro tenga las habilidades necesarias

  # ─────────────────────────────────────────────────────────────
  # 1. EVALUACIÓN DE COMPETENCIAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Matriz de competencias por rol
    Dado que se evalúa competencia del personal
    Cuando se usa matriz
    Entonces:
      | Rol                         | Competencias requeridas |
      | Médico general             | Triage, manejo emergencias, prescripción |
      | Enfermera                  | Signos vitales, medicación, triaje |
      | Farmacéutico               | Inventario, dispensación, interacciones |
      | Recepcionista             | Registro, agenda, trato al paciente |
      | Administrador             | Reportes, auditoría, compliance |

  Escenario: Evaluación de competencia
    Dado que se evalúa a cada miembro del equipo
    Cuando se realiza evaluación
    Entonces se mide:
      | Competencia                | Método evaluación |
      | Uso de GHE                | Práctica observada |
      | Triage obstétrico          | Caso simulado |
      | Manejo de emergencias      | Simulación |
      | Prescripción segura        | Caso clínico |
      | Documentación SOAP         | Revisión de expedientes |

  # ─────────────────────────────────────────────────────────────
  # 2. SEGUIMIENTO DE CERTIFICACIONES
  # ─────────────────────────────────────────────────────────────

  Escenario: Tracking de certificaciones
    Dado que se gestiona certificaciones del personal
    Cuando se verifica
    Entonces el sistema muestra:
      | Personal        | Certificación          | Vence     | Estado |
      | Dr. Pérez       | Cédula profesional     | Permanente| ✅     |
      | Dr. Pérez       | BLS (soporte vital básico)| 2025-06 | ✅     |
      | Enf. Ana López  | Cédula profesional     | Permanente| ✅     |
      | Enf. Ana López  | ACLS                    | 2025-12   | ✅     |
      | Farm. Carlos    | Cédula profesional     | Permanente| ✅     |

  Escenario: Alerta de certificación por vencer
    Dado que una certificación vence en 30 días
    Cuando se detecta
    Entonces el sistema alerta:
      | Alerta                      |
      | "Certificación BLS de Dr. Pérez vence en 30 días" |
      | "Renovar antes de la fecha" |

  # ─────────────────────────────────────────────────────────────
  # 3. CAPACITACIÓN EN USO DE GHE
  # ─────────────────────────────────────────────────────────────

  Escenario: Programa de capacitación en GHE
    Dado que se capacita al equipo en GHE
    Cuando se ejecuta
    Entonces incluye:
      | Módulo | Duración | Contenido |
      | 1. Navegación | 2h | Búsqueda, expediente, dashboard |
      | 2. Consulta | 4h | Crear consulta, nota SOAP, firmar |
      | 3. Prescripción | 2h | Seleccionar medicamento, dosis, validar |
      | 4. Farmacia | 2h | Inventario, dispensación, stock |
      | 5. Reportes | 1h | Generar reportes, exportar |
      | 6. Emergencias | 2h | Acceso rápido, protocolos |

  Escenario: Evaluación post-capacitación
    Dado que se completa capacitación
    Cuando se evalúa
    Entonces cada participante debe aprobar:
      | Evaluación                  | Nota mínima |
      | Práctica en GHE            | 8/10        |
      | Caso simulado              | 8/10        |
      | Examen teórico             | 7/10        |

  # ─────────────────────────────────────────────────────────────
  # 4. CAPACITACIÓN EN EMERGENCIAS
  # ─────────────────────────────────────────────────────────────

  Escenario: Simulación de emergencia obstétrica
    Dado que se realiza simulacro de emergencia
    Cuando se ejecuta
    Entonces se evalúa:
      | Criterio                   | Tiempo objetivo |
      | Tiempo de respuesta        | <5 minutos      |
      | Protocolo ejecutado        | 100%            |
      | Comunicación equipo        | Efectiva        |
      | Documentación completa     | Sí              |

  # ─────────────────────────────────────────────────────────────
  # 5. CULTURA DE REPORTE DE ERRORES
  # ─────────────────────────────────────────────────────────────

  Escenario: Sistema de reporte de errores
    Dado que un miembro del equipo detecta un error
    Cuando quiere reportarlo
    Entonces el sistema permite:
      | Acción                      | Garantía |
      | Reportar sin miedo a culpa | Just Culture |
      | Reporte anónimo            | Opcional  |
      | Seguimiento del reporte    | Visible   |
      | Acciones correctivas       | Documentadas|

  Escenario: Principios de Just Culture
    Dado que se evalúa un error
    Cuando se clasifica
    Entonces:
      | Tipo de error               | Tratamiento |
      | Error humano (slip/lapse) | Sistema, no persona |
      | Error por conocimiento    | Capacitación |
      | Error por riesgo (choice)| Disciplina |
      | Conducta atrevida         | Disciplina |
