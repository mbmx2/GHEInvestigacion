# language: es
# @id GHE-CISSP-002
# @type business-rule
# @domain security
# @layer compliance
# @risk s1
# @owner ciso
# @status proposed
# @requirement REQ-CISSP-002
# @risk-control CTRL-CISSP-002
# @regulation CISSP-D1 ISC2 NOM-024 LFPDPPP
@domain:isc2_cissp @type:business-rule @risk:s1 @status:proposed
Característica: CISSP Dominio 1 — Cumplimiento Legal y Regulatorio
  Como oficial de cumplimiento
  Quiero que GHE cumpla requisitos legales y regulatorios de seguridad
  Para que el hospital evite sanciones y proteja datos de pacientes

  Regla: Marco regulatorio se identifica

    Escenario: Identificación de requisitos legales
      Dado que hospital opera en México
      Cuando se identifican requisitos legales
      Entonces se incluyen:
        | Requisito                  | Fuente        |
        | Protección de datos personales| LFPDPPP     |
        | Expediente clínico         | NOM-004       |
        | Sistemas de información    | NOM-024       |
        | Datos de salud             | NOM-023       |
        | Contraseñas y autenticación| NOM-151       |
        | Software médico            | IEC 62304     |

    Escenario: Evaluación de cumplimiento
      Dado que se evalúa cumplimiento regulatorio
      Cuando se revisa
      Entonces se verifica:
        | Requisito                  | Estado        |
        | LFPDPPP                    | Cumple/parcial|
        | NOM-004                    | Cumple        |
        | NOM-024                    | En proceso    |
        | NOM-151                    | Pendiente     |
        | IEC 62304                  | En proceso    |

  Regla: Privacidad de datos se protege

    Escenario: Principios de privacidad
      Dado que se procesan datos personales sensibles
      Cuando se aplican principios
      Entonces se verifica:
        | Principio                  | Implementación|
        | Consentimiento informado   | Formulario    |
        | Limitación de finalidad    | Documentada   |
        | Minimización               | Solo lo necesario|
        | Calidad de datos           | Exactitud     |
        | Seguridad                  | Cifrado/controles|
        | Responsabilidad            | Accountable   |

    Escenario: Derechos ARCO
      Dado que titular solicita derecho ARCO
      Cuando se procesa solicitud
      Entonces se verifica:
        | Derecho                    | Acción        |
        | Acceso                     | Proporcionar información|
        | Rectificación              | Corregir datos|
        | Cancelación                | Eliminar datos|
        | Oposición                  | Dejar de procesar|

  Regla: Contratos y acuerdos se documentan

    Escenario: Acuerdos de confidencialidad
      Dado que personal accede a datos sensibles
      Cuando ingresa
      Entonces firma:
        | Elemento                    |
        | Acuerdo de confidencialidad |
        | Política de uso aceptable   |
        | Consecuencias de violación  |
        | Duración de obligación      |

  Regla: Auditorías legales se preparan

    Escenario: Preparación para auditoría
      Dado que se anticipa auditoría regulatoria
      Cuando se prepara
      Entonces se verifica:
        | Elemento                    |
        | Documentación completa      |
        | Evidencia de controles      |
        | Registros de incidentes     |
        | Capacitación documentada    |
        | Plan de respuesta a auditoría|
